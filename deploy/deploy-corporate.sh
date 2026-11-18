#!/usr/bin/env bash
# CIVOLINK corporate website — release deployment (tag-gated; CI or authorized operator)
#
# Working directory: irrelevant — the script resolves its own location.
#
# usage:
#   deploy-corporate.sh --dry-run [release-label]      validate prerequisites + payload integrity; NO host contact, NO mutations
#   deploy-corporate.sh --yes [release-label]          perform the release (explicit confirmation required)
#   deploy-corporate.sh rollback [--yes] [release-id]  repoint `current` to a previous release + reload + health check
#     (rollback with no release-id re-points to the second-newest release)
#
# Mutations require --yes (or CONFIRM=YES) so the site can never be flipped by
# accident. Dry-run never contacts the host; connectivity is only proven by a
# real run.
#
# exit codes: 0 success; 1 validation/check failure; 2 usage error
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
PAYLOAD_DIR="$REPO_ROOT/website"
INVENTORY="$SCRIPT_DIR/release-inventory.txt"
HEALTHCHECK="$SCRIPT_DIR/healthcheck.sh"
LOG_FILE="$SCRIPT_DIR/deploy-log.txt"

HOST="${CORP_DEPLOY_HOST:-deploy@162.35.37.121}"
ROOT="${CORP_WWW_ROOT:-/var/www/civolink.co.ke}"
RELEASES_ROOT="$ROOT/releases"
BASE_URL="${CORP_BASE_URL:-https://civolink.co.ke}"
KEEP_RELEASES=3

now_utc() { date -u +%Y-%m-%dT%H:%M:%SZ; }
die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "[$(now_utc)] $*"; }

usage() { sed -n '2,15p' "$0" | sed 's/^# \{0,1\}//'; exit 2; }

require_tools() {
  local t
  for t in rsync ssh sha256sum curl date; do
    command -v "$t" >/dev/null 2>&1 || die "required tool not found: $t"
  done
  [ -f "$HEALTHCHECK" ] || die "health check script missing: $HEALTHCHECK"
}

# Recompute sha256 for every inventory entry and compare the recorded
# (truncated, first-16) hash. Inventory format: "<size>  <16-hex>  <path>",
# headers/comments/blank lines ignored. The authoritative full-hash
# verification file is generated from the verified file list at deploy time.
inventory_files() {
  grep -E '^ *[0-9]+ +[0-9A-F]{16}  .+$' "$INVENTORY" | awk '{print $3}'
}

validate_payload() {
  [ -d "$PAYLOAD_DIR" ] || die "payload directory missing: $PAYLOAD_DIR"
  [ -s "$INVENTORY" ] || die "release inventory missing or empty: $INVENTORY"
  local bad=0 file expected actual n=0
  while IFS= read -r file; do
    n=$((n + 1))
    expected="$(grep -E "^ *[0-9]+ +[0-9A-F]{16}  ${file//./\\.}$" "$INVENTORY" | awk '{print $2}')"
    if [ ! -f "$PAYLOAD_DIR/$file" ]; then
      echo "ERROR: inventory entry missing from payload: $file" >&2; bad=1; continue
    fi
    actual="$(sha256sum "$PAYLOAD_DIR/$file" | cut -c1-${#expected})"
    expected="$(printf '%s' "$expected" | tr '[:upper:]' '[:lower:]')"
    [ "$actual" = "$expected" ] || { echo "ERROR: hash mismatch: $file (inventory ${expected}, payload ${actual})" >&2; bad=1; }
  done < <(inventory_files)
  [ "$n" -gt 0 ] || die "no parsable inventory entries found in $INVENTORY"
  [ "$bad" -eq 0 ] || die "payload integrity validation FAILED"
  info "payload integrity: all $n inventory entries verified"
}

# full-hash checksum list over exactly the inventoried files (used for the
# host-side sha256sum -c gate)
full_checksum_file() {
  local files=()
  mapfile -t files < <(inventory_files)
  ( cd "$PAYLOAD_DIR" && sha256sum "${files[@]}" )
}

# remote release-id guard: strictly dated CIVOLINK release names only
valid_release_id() {
  case "$1" in
    [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9]-site-*|manual-site-*) return 0 ;;
    *) return 1 ;;
  esac
}

prune_old_releases() { # remote; deletes ONLY directories matching the release-id pattern
  ssh "$HOST" "set -eu; cd '$RELEASES_ROOT' 2>/dev/null || exit 0; ls -1t | tail -n +$((KEEP_RELEASES + 1)) | while IFS= read -r d; do
    case \"\$d\" in
      [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9]-site-*) rm -rf -- \"\$d\"; echo \"pruned old release: \$d\" ;;
      *) echo \"kept non-release directory: \$d\" ;;
    esac
  done"
}

switch_current() { # <release-id>  — verify full hashes on the host, then atomic switch + reload
  local rel="$1"
  ssh "$HOST" "set -eu; cd '$RELEASES_ROOT/$rel'; sha256sum -c .inventory.sha256 >/dev/null; \
    ln -sfn '$RELEASES_ROOT/$rel' '$ROOT/current.tmp'; mv -T '$ROOT/current.tmp' '$ROOT/current'; \
    nginx -t; systemctl reload nginx"
}

### argument parsing ###########################################################
COMMAND="deploy"
DRY_RUN=0
CONFIRMED=0
ARGS=()
while [ $# -gt 0 ]; do
  case "$1" in
    --dry-run|-n) DRY_RUN=1 ;;
    --yes) CONFIRMED=1 ;;
    rollback) COMMAND="rollback" ;;
    -h|--help|help) usage ;;
    -*) usage ;;
    *) ARGS+=("$1") ;;
  esac
  shift
done

require_tools

if [ "$COMMAND" = "rollback" ]; then
  TARGET="${ARGS[0]:-}"
  [ "$DRY_RUN" -eq 0 ] || die "rollback has no dry-run mode (it is itself the recovery action)"
  if [ "$CONFIRMED" -ne 1 ] && [ "${CONFIRM:-}" != "YES" ]; then
    die "confirmation required: rerun with --yes (or CONFIRM=YES)"
  fi
  if [ -z "$TARGET" ]; then
    TARGET="$(ssh "$HOST" "set -eu; ls -1t '$RELEASES_ROOT' | sed -n '2p'")" || die "could not list remote releases"
  fi
  valid_release_id "$TARGET" || die "refusing to roll back to non-release target: $TARGET"
  PREV_LINK="$(ssh "$HOST" "readlink '$ROOT/current' 2>/dev/null || true")"
  info "rolling back 'current' (currently ${PREV_LINK:-none}) to $TARGET"
  switch_current "$TARGET"
  info "switched; running health gate"
  if "$HEALTHCHECK" "$BASE_URL"; then
    echo "$(now_utc) ROLLBACK to $TARGET by ${DEPLOY_ACTOR:-owner} (host $HOST)" >> "$LOG_FILE"
    info "rollback to $TARGET complete and verified"
    exit 0
  else
    die "rollback health gate FAILED for $TARGET — manual investigation required"
  fi
fi

### deploy path ################################################################
LABEL="${ARGS[0]:-manual}"
validate_payload

REL="$(date -u +%Y%m%d-%H%M%S)-site-${LABEL}"
valid_release_id "$REL" || die "generated release id failed validation: $REL"

if [ "$DRY_RUN" -eq 1 ]; then
  echo "== DRY-RUN (no host contact, no mutations) =="
  echo "  source:        $PAYLOAD_DIR (integrity verified above)"
  echo "  target host:   $HOST (connectivity NOT tested in dry-run)"
  echo "  release dir:   $RELEASES_ROOT/$REL"
  echo "  transfer:      rsync -az --delete {6 pages + assets/} -> release dir"
  echo "  activation:    host-side sha256 -c .inventory.sha256 -> atomic current.tmp -> mv -T -> nginx -t -> systemctl reload nginx"
  echo "  health gate:   $HEALTHCHECK $BASE_URL (auto-rollback to previous release on failure)"
  echo "  retention:     keep newest $KEEP_RELEASES releases"
  echo "== DRY-RUN COMPLETE: prerequisites validated; nothing was sent, switched or reloaded =="
  exit 0
fi

if [ "$CONFIRMED" -ne 1 ] && [ "${CONFIRM:-}" != "YES" ]; then
  die "confirmation required: rerun with --yes (or CONFIRM=YES)"
fi

TMP_CSUM="$(mktemp)"
trap 'rm -f "$TMP_CSUM" 2>/dev/null || true' EXIT
full_checksum_file > "$TMP_CSUM"
PREV_CURRENT="$(ssh "$HOST" "readlink '$ROOT/current' 2>/dev/null || true")"
info "deploying release $REL to $HOST:$RELEASES_ROOT (previous current: ${PREV_CURRENT:-none})"

rsync -az --delete \
  --include='index.html' --include='about.html' --include='services.html' \
  --include='our-platforms.html' --include='technology.html' --include='contact.html' \
  --include='assets/' --include='assets/**' --exclude='*' \
  "$PAYLOAD_DIR/" "$HOST:$RELEASES_ROOT/$REL/"
rsync -az "$TMP_CSUM" "$HOST:$RELEASES_ROOT/$REL/.inventory.sha256"
info "rsync complete"

if switch_current "$REL"; then
  info "release $REL activated (symlink switched, nginx reloaded)"
else
  die "activation failed — symlink NOT switched; old release continues serving"
fi

if "$HEALTHCHECK" "$BASE_URL"; then
  info "health gate PASSED"
  prune_old_releases || info "retention pruning reported an error (release remains active)"
  echo "$(now_utc) RELEASE $REL ACTIVATED by ${DEPLOY_ACTOR:-owner} (host $HOST)" >> "$LOG_FILE"
  info "release $REL complete"
  exit 0
else
  echo "HEALTH GATE FAILED — rolling back to previous release: ${PREV_CURRENT:-<none>}" >&2
  if [ -n "$PREV_CURRENT" ] && valid_release_id "$(basename "$PREV_CURRENT")"; then
    switch_current "$(basename "$PREV_CURRENT")"
    "$HEALTHCHECK" "$BASE_URL" || echo "WARNING: rollback health check also failed — manual investigation required" >&2
    echo "$(now_utc) RELEASE $REL ROLLED BACK — failed the health gate" >> "$LOG_FILE"
  else
    echo "no valid previous release recorded; leaving $REL in place — MANUAL ACTION REQUIRED" >&2
  fi
  exit 1
fi
