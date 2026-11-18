# Deployment assets — do not activate without owner authorization

Each `*.yml.disabled` is a prepared, tag- and manual-dispatch-only release pipeline. Inert until renamed to `.github/workflows/*.yml` per its header. It does not trigger on ordinary `main` pushes. Activation additionally requires: governed remote, least-privilege deploy key, CI secrets, and owner authorization (see `CIVOLINK-WORKSPACE-AUDIT\CIVOLINK_U005_OWNER_VPS_INSPECTION_PACKET.md` for the precondition gate).

Contents:

| File | Purpose | Prerequisites |
|---|---|---|
| ci-corporate-release.yml.disabled | Validate payload (six pages + assets, zero external requests) → rsync to new release dir → atomic symlink `current` → run health check | CIVOLINK-CORPORATE as governed git repo + owner authorization + U-005 execution complete (VPS origin live, TLS live) |
| CIVOLINK_CORPORATE_DEPLOYMENT_MANIFEST.md | Release identity, layout, payload list (10 files / 199,463 bytes), release procedure, healthcheck, rollback, monitoring | D23 resolved; U-005 execution authorized |
| release-inventory.txt | Exact production payload with truncated SHA-256 (199,463 bytes, 10 files) | regenerate on every content change |
| healthcheck.sh | Post-activation assertion (6 pages 200 + marker + complete-document guard, 2 assets 200 + non-empty + content type, zero external refs on ALL six pages, non-zero exit on failure) | ship with the release; locally validated 2026-11-17 (U-007A) |
| deploy-corporate.sh | Release script: strict-mode, payload integrity validation against `release-inventory.txt`, `--dry-run` (no host contact), `--yes` confirmation gate, host-side full-hash gate, atomic switch, health gate with AUTO-ROLLBACK, retention (last 3), release-id pattern guard, rollback subcommand | rsync/ssh/sha256sum/curl on the operator host; owner authorization (U-005 gate); dry-run needs nothing |

## deploy-corporate.sh usage (U-007A)

```bash
deploy-corporate.sh --dry-run [label]   # validate prerequisites + payload integrity; NO host contact, NO mutations
deploy-corporate.sh --yes [label]       # real release (confirmation gate; auto-rollback on health-gate failure)
deploy-corporate.sh rollback --yes [id] # repoint `current` (default: second-newest release) + reload + health gate
```

Environment overrides: `CORP_DEPLOY_HOST`, `CORP_WWW_ROOT`, `CORP_BASE_URL`, `CONFIRM=YES`, `DEPLOY_ACTOR`. Exit codes: 0 success, 1 validation/check failure, 2 usage. Dry-run guarantees: it never contacts the host (connectivity is only proven by a real run), never mutates anything, fails safely on missing tools/tampered payload, and prints no secrets. Sandbox-validated 2026-11-17 (U-007A): 18/18 checks incl. dry-run, refusal-without-confirmation, full simulated release, auto-rollback on health-gate failure, explicit rollback, missing-tool, and tampered-payload rejection.

Rollback: repoint `current` to the previous release directory and reload Nginx; no database is involved on the corporate side. The DB-side rollback for the Control Center documented in `..\CIVOLINK-CONTROL-CENTER\docs\CIVOLINK_CONTROL_CENTER_BACKUP_AND_RECOVERY.md`.
