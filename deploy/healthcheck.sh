#!/usr/bin/env bash
# CIVOLINK corporate website — health check (run after every release activation + rollback)
#
# usage: ./healthcheck.sh [base_url]
#   base_url may also come from BASE_URL env. Default: https://civolink.co.ke
#   Local simulation example: ./healthcheck.sh http://127.0.0.1:8019
#
# Checks: 6 approved pages (marker + complete-document guard), 2 local assets
# (HTTP 200 + non-empty), and zero external subresource references across ALL
# six pages (script-src 'self' / style-src 'unsafe-inline' CSP compatibility).
#
# exit codes: 0 = all checks pass; 1 = any check failed
set -euo pipefail

BASE_URL="${1:-${BASE_URL:-https://civolink.co.ke}}"
BASE_URL="${BASE_URL%/}"
fail=0
# markers are matched case-insensitively as fixed strings; the completeness
# guard ('</html>') prevents a 200 error/interstitial page from counting as a
# pass merely because it contains the marker.
COMPLETE='</html>'

check() { # <path> <expected substring in body> [alternative marker]
  local path="$1" marker="$2" alt="${3:-}" body marker_hits alt_hits complete_hits
  body=$(curl -fsSL --max-time 15 "${BASE_URL}${path}") || { echo "FAIL  ${path} (curl error $? / non-2xx response)"; fail=1; return; }
  marker_hits=$(printf '%s' "$body" | grep -c -iF "$marker" || true)
  alt_hits=0
  if [ -n "$alt" ]; then
    alt_hits=$(printf '%s' "$body" | grep -c -iF "$alt" || true)
  fi
  complete_hits=$(printf '%s' "$body" | grep -c -iF "$COMPLETE" || true)
  if [ $((marker_hits + alt_hits)) -ge 1 ] && [ "$complete_hits" -ge 1 ]; then
    echo "PASS  ${path} (marker: ${marker:0:40})"
  else
    echo "FAIL  ${path} (marker or document-completeness check failed)"
    fail=1
  fi
}

check "/"                   "CIVOLINK"
check "/about.html"         "CIVOLINK"
check "/services.html"      "CIVOLINK"
check "/our-platforms.html" "CIVOLINK"
check "/technology.html"    "CIVOLINK"
# Cloudflare Email Address Obfuscation may rewrite info@civolink.co.ke into a
# data-cfemail protected link; accept that encoded form as equivalent.
check "/contact.html"       "info@civolink.co.ke" "data-cfemail"

# local assets: HTTP 200 + non-empty body + expected content type
asset() { # <asset path> <expected content-type substring>
  local path="$1" ctype="$2" out
  if out=$(curl -fsSL --max-time 15 -o /dev/null -w "%{http_code} %{size_download} %{content_type}" "${BASE_URL}/${path}"); then
    local code size served; read -r code size served <<< "$out"
    if [ "$size" -gt 0 ] && printf '%s' "$served" | grep -qiF "$ctype"; then
      echo "PASS  ${path} (${code}, ${size} bytes, ${served})"
    else
      echo "FAIL  ${path} (${code}, ${size} bytes, ${served})"; fail=1
    fi
  else
    echo "FAIL  ${path} (curl error $?)"; fail=1
  fi
}
asset "assets/css/styles.css" "text/css"
asset "assets/js/main.js"     "javascript"

# no external subresource references in ANY of the six shipped pages
# (local main.js <script> is required and allowed — CSP: script-src 'self')
ext_total=0
for page in index.html about.html services.html our-platforms.html technology.html contact.html; do
  body="$(curl -fsSL --max-time 15 "${BASE_URL}/${page}")" || { echo "FAIL  ${page} (curl error / non-2xx during external-ref scan)"; fail=1; continue; }
  ext_hits=$(printf '%s' "$body" \
    | grep -Eo '(src|href)="https?://[^"]+"' \
    | grep -v -E '^href="https://civolink' \
    | wc -l || true)
  if [ "$ext_hits" -eq 0 ]; then
    echo "PASS  ${page}: no external subresource references"
  else
    echo "FAIL  ${page}: ${ext_hits} external reference(s) detected"
    ext_total=$((ext_total + ext_hits))
    fail=1
  fi
done

echo "----"
if [ "$fail" -eq 0 ]; then
  echo "ALL CHECKS PASSED (${BASE_URL})"
else
  echo "ONE OR MORE CHECKS FAILED (${BASE_URL}); failed references: ${ext_total}"
fi
exit "$fail"
