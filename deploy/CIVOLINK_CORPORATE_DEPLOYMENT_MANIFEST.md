# CIVOLINK_CORPORATE_DEPLOYMENT_MANIFEST.md

**Project:** CIVOLINK Corporate static website (`CIVOLINK-CORPORATE\website\`)
**Status:** **PREPARED 2026-11-16 — NOT DEPLOYED.** Deployment requires (1) owner-resolved D23, (2) origin provisioned per U-005 architecture, (3) explicit owner authorization for the release.
**Manifest version:** 1.0 · **Companion docs:** `deploy\release-inventory.txt`, `deploy\healthcheck.sh`, `CIVOLINK-WORKSPACE-AUDIT\CIVOLINK_U005_DEPLOYMENT_READINESS_ASSESSMENT.md` (authoritative U-005 record), `..\docs\website\CIVOLINK_WEBSITE_SECURITY_AND_DEPLOYMENT_SPECIFICATION.md`, `..\docs\website\CIVOLINK_WEBSITE_SEO_SPECIFICATION.md`.
**Encoding correction update (2026-11-18, local):** website HTML source/pages normalized to UTF-8 without BOM with `<meta charset="UTF-8">` and confirmed mojibake repaired; `deploy/release-inventory.txt` refreshed to match corrected payload hashes/sizes. **Still NOT DEPLOYED** (see audit report `docs\website\CIVOLINK_UTF8_ENCODING_AUDIT_AND_CORRECTION_REPORT_2026-11-18.md`).

---

## 1. Release identity and layout

| Element | Rule |
|---|---|
| Release ID | `YYYYMMDD-HHMMSS-site-<short-rev>` e.g. `20261116-203000-site-a1b2c3` (git rev when the corporate repo exists; timestamp-only until then) |
| Git | Tag `site-vX.Y.Z` per §E of the U-005 assessment; **no** auto-deploy on `main` |
| Server layout | `/var/www/civolink.co.ke/releases/<release-id>/` (new dir per release; owned by `civolink-www`); `current` → latest good release via atomic symlink swap (`ln -sfn` + `mv`); `shared/` optional (none required — no runtime state) |
| Nginx | One `server {}` block: `civolink.co.ke` + `www.civolink.co.ke` (canonical decision pending; see §6), TLS via Cloudflare origin certificate + **Full (strict)**; serving the static root only; **no PHP** in the corporate vhost |
| Retention | Keep last 3 releases; older releases removed by owner-approved cleanup only |

## 2. Deployable payload (10 files, 199,463 bytes)

Complete list with truncated SHA-256: `deploy/release-inventory.txt`. Nothing else ships:

**Excluded from every release** (QA/verification artifacts, never user-facing):
- `evidence/` (53 QA screenshots + 2 contact-form evidence PNGs) — verification evidence, not production.
- `review/` (27 review PNGs + `accessibility-audit.json` + `qa-run-details.json` + README).
- `about.html.orig` (0-byte historical recovery artifact).
- `README.md` (documentation).

**Old risk guard (verified 2026-11-16):** zero external `<script>/<link>/img` references (system assets only); zero hostnames in `href` targets (all hostnames render as styled text per SEO spec); all internal links resolve (checked programmatically: six pages, zero broken targets); no third-party/CDN/font references.

## 3. Release procedure (owner-authorized SSH/session; not performed here)

```bash
# 1. local: tag + verify (requires the corporate git repo — see §8)
git tag site-v1.0.0 <release-commit>
sha256sum $(cat deploy/release-inventory.txt | awk 'NF{print $NF}')   # sanity, matches manifest

# 2. rsync payload to a NEW release dir on the VPS
rsync -az --delete \
  --include='index.html' --include='about.html' --include='services.html' \
  --include='our-platforms.html' --include='technology.html' --include='contact.html' \
  --include='assets/' --include='assets/**' \
  --exclude='*' \
  ./website/ <deploy-user>@162.35.37.121:/var/www/civolink.co.ke/releases/<release-id>/

# 3. on the VPS: verify release content hash before activation
cd /var/www/civolink.co.ke/releases/<release-id> && sha256sum -c <(awk '{print $1"  "$3"\n"}' < /path/to/release-inventory.txt)

# 4. atomic activation (zero-downtime)
ln -sfn /var/www/civolink.co.ke/releases/<release-id> /var/www/civolink.co.ke/current.tmp && mv /var/www/civolink.co.ke/current.tmp /var/www/civolink.co.ke/current
sudo nginx -t && sudo systemctl reload nginx
```

5. Run `deploy/healthcheck.sh` (output recorded as deployment audit evidence).
6. Verify Cloudflare cache/edge behaviour; purge only if content policies demand it.

## 4. Health check

`deploy/healthcheck.sh <base-url>` asserts, with retries, for each of the six pages (`/`, `/about.html`, `/services.html`, `/our-platforms.html`, `/technology.html`, `/contact.html`):

- HTTP 200 + `Content-Type: text/html`.
- Contains expected page marker (e.g. tagline or `<title>CIVOLINK`).
- **Zero** external `src=`/`href=` occurrences (no third-party calls).
- `assets/css/styles.css` and `assets/js/main.js` reachable, HTTP 200, correct MIME.
- Contact page contains the approved public contact email (`info@civolink.co.ke`).
- TLS: `curl --cacert <origin-ca>` succeeds **after** Cloudflare Full (strict) is enabled — before that, smoke test through Cloudflare HTTP edge (521→200 transition is the signal).
- Security headers (once live): `Strict-Transport-Security` only **after** canonical hostname + HTTPS are verified — not before HSTS decision; `X-Frame-Options`, `X-Content-Type-Options: nosniff`, `Referrer-Policy: strict-origin-when-cross-origin` per specification §4.

## 5. Monitoring & logging

- Nginx access/error logs per release vhost (`/var/log/nginx/civolink.co.ke.*.log`), `logrotate` (weekly, 8 rotations).
- Cloudflare Analytics (owner's dashboard) — no app-side tracker (D24: no analytics by default).
- Uptime probe: external HTTP(S) monitor (owner's choice; must hit `/` and `/contact.html`).

## 6. Open decisions affecting this manifest (owner)

1. Canonical hostname: `civolink.co.ke` vs `www.civolink.co.ke` (301 one way; spec requires HTTPS + canonical verification before HSTS/redirects).
2. D23 confirmation of `162.35.37.121` and the truehost/cloudflare account access.
3. Corporate git remote (currently the folder is **not a git repository**) — required for tag-gated release pipeline; owner authorization.
4. Whether Cloudflare edge rule/redirect rules needed for www→apex.
5. Analytics defaults (D24: none; already honoured).

## 7. Rollback

1. Identify previous good release (`releases/<id>` dir timestamped).
2. `ln -sfn /var/www/civolink.co.ke/releases/<previous> /var/www/civolink.co.ke/current.tmp && mv ...current` + nginx reload.
3. Re-run `healthcheck.sh`. If failure persists: revert to the oldest retained release; if all fail, serve the last-known-good verification payload deliberately (never a half-switched state).
4. Record rollback evidence (release id, actor, time, health output).

## 8. Git status / pipeline (this directory)

- `CIVOLINK-CORPORATE` is **not a git repository** — verified 2026-11-16 (no `.git`). Initializing one, or adopting an existing hosted remote, is the owner's decision (U-005 §I items 5–6).
- Release pipeline: `deploy\ci-corporate-release.yml.disabled` — manual `workflow_dispatch` + tag-trigger only; disabled until the repo exists, the remote is authorised, and the deploy key/CI secrets are set by the owner.
- No commit, tag, push or remote action was performed by this task.
