# CIVOLINK Corporate Website — Security and Deployment Specification
Task ID: U-003.3 (completed by T-026)
Date: 2026-11-12
Status: COMPLETED — SPECIFICATION ONLY

- **Authority inputs:** `docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md` §11 (technology, §11.3 isolation), §12 (security baseline), `docs/CIVOLINK_PRODUCTION_GO_LIVE_CHECKLIST.md` §A2–A4 (deployment, smoke test, operations), `docs/PRODUCTION_BUILD_MANIFEST.md` (artifact discipline), owner decisions D22/D23/D17 (open — defaults recorded).
- **Class:** Specification/preparation. Authorizes **no** VPS purchase, no DNS change, no domain registration, no deployment, no certificate issuance. Every execution step below is gated by the owner decisions it names.
- **Provenance note:** the parallel U-003.3 session was truncated mid-write before this file landed (12:05–12:10 window); it did not survive in the repository. Re-authored in full by **T-026** from the authorities above. No decision status changed.

## 1. System model (what is being secured)

Static six-page website (`index`, `our-platforms`, `services`, `technology`, `about`, `contact` — set itself pending D20), shared CSS/JS, two provisional logo PNGs, **no database, no accounts, no sessions, no CMS, no analytics** (D24 default) and at most **one dynamic endpoint**: the contact-form processor (own specification: `docs/CIVOLINK_CONTACT_FORM_PRODUCTION_SPECIFICATION.md`). No product backends on this host surface; no shared database, session directory, `.env` or credentials with CIVOLINK WIFI (architecture §11.3, §D13).

## 2. Host and topology (gated by D22/D23 — defaults recorded)

| Item | Specification | Decision gate |
|---|---|---|
| Web server | Nginx (owner-approved) on the already-approved VPS (§D8), Ubuntu LTS | D22/D23 confirm provider + topology; defaults: static hand-authored, same VPS with §11.3 isolation |
| Document root | Dedicated directory containing **only** static content + the single contact endpoint — never `backend/`, never `docs/`, never prototype review/evidence dirs | Architecture §11.3 (binding) |
| Site/system user | Dedicated system user for the site; site files writable only by the deploy path; web server runs read-only against content | §11.3 |
| PHP-FPM (endpoint only) | Separate pool, separate user, separate logs — never a shared `wwwdata`-style pool with the WIFI backend | §11.3 (binding) |
| Logs | Separate access/error log files for this site | §11.3 |

**Isolation checklist (must all be true before anything else is configured):** separate `server` block; separate root; separate pool/user; no shared DB file; no shared session dir; no shared `.env`; separate deploy credentials; least-privilege permissions; WIFI `backend/` and router portal files absent from the site root.

## 3. TLS (gated by D17/D23)

1. Certificate from Let's Encrypt or the D23-selected authority; **HTTP→HTTPS 301 redirect** on; port 80 serves only the redirect (and ACME challenges).
2. TLS 1.2 minimum; modern cipher list; OCSP stapling optional.
3. **HSTS enabled only after the hostname is confirmed stable** (architecture §11.1) — add `Strict-Transport-Security` post-confirmation, `max-age` raised gradually.
4. Auto-renewal configured and **verified** (dry-run renewal + reload hook); renewal state included in backups (checklist A4).
5. No certificate for a domain that does not exist (D17 default: no DNS/registration action).

## 4. Security headers (target configuration at build)

| Header | Value direction | Note |
|---|---|---|
| `Content-Security-Policy` | `default-src 'none'; style-src 'self'; script-src 'self'; img-src 'self'; font-src 'self'; form-action 'self'; frame-ancestors 'none'; base-uri 'none'` | Site uses one external stylesheet, one JS file, local images only. **Known caveat F-3:** pages currently carry inline `style="..."` attributes (34 occurrences across six pages, T-026 count) — `style-src 'self'` blocks style **attributes** (`style-src-attr`). Resolution at build: either (a) move the inline styles into CSS classes (preferred — clean CSP, no weakening), or (b) add `'unsafe-inline'` under `style-src-attr` only, recorded as a deliberate, limited exception. Do not ship a silently weakened CSP. |
| `X-Frame-Options` | `DENY` | No framing use case |
| `X-Content-Type-Options` | `nosniff` | — |
| `Referrer-Policy` | `strict-origin-when-cross-origin` (or `no-referrer`) | Site sends users nowhere external |
| `Permissions-Policy` | empty allowlist (no camera/mic/geolocation) | No features used |

Headers verified in the A3 smoke test (external checker or `curl -I`) — architecture §12 blocking rule: nothing marked VERIFIED for production until independently checked (U-004).

## 5. Contact endpoint security (summary — full spec in the contact-form document)

Server-side only; validated input; CSRF protection; honeypot + rate limiting; explicit retention period (D19); no client-side-only "success"; no PII in logs; secrets outside the web root, never committed; endpoint never ships until `/privacy` + `/terms` are published (Kenya Data Protection Act, 2019; architecture §10.2).

## 6. Secrets and dependencies

- Static content contains no secrets (U-003.1 verified; re-check at U-004). Endpoint secrets (SMTP credentials if used) live in environment/config outside the web root, never in the repo.
- Zero runtime dependencies for the static site. Endpoint dependencies (if any) pinned, minimal, reviewed at U-004.
- No external requests: no fonts, scripts, trackers, CDN assets — verified continuously and in U-004.

## 7. Deployment procedure (gated by D22/D23 + owner authorization; runbook to be executed in U-005/U-006)

1. **Artifact = exact approved files** + SHA-256 hash manifest (manifest discipline). No build step by default (D22 default); if minification is ever added, the artifact is the minified output plus its manifest — the artifact is what is hashed and deployed.
2. Deploy by a dedicated deploy user; **no root** for web-file operations; no shared credentials with the WIFI backend.
3. Copy → verify hashes on the server → atomic switch (symlink or copy-rename) → reload Nginx (config-test first).
4. Record deployment: date, artifact hash set, operator (checklist A2).
5. DNS records only for existing services (D17 domains live); nothing invented.
6. **Rollback:** previous release retained on the server; documented one-step revert (switch symlink back + reload); revert drill recorded (checklist A3/A4). Rollback is part of the release, not an afterthought.

## 8. Error handling

- Static branded 404 page with nav links (U-003 build item; U-004 verification).
- Static/branded 500 handling; Nginx never emits stack traces or path disclosure.
- Endpoint returns generic error responses; details go to the endpoint's own log (no PII), never to the browser.

## 9. Backups, logging, monitoring, maintenance (checklist A4)

| Control | Specification |
|---|---|
| Backups | Git repo + deployed-artifact archive (with hash manifests) + TLS renewal state; restore drill recorded |
| Expiry watch | Domain (D17), TLS renewal, VPS billing |
| Logs | Site access/error logs; endpoint error log; retention defined at build; **no form PII in logs** |
| Monitoring | Uptime check + alert recipient (owner-defined at D19/A4 — not invented) |
| Updates | OS/Nginx patch cadence recorded; endpoint dependencies reviewed on each change |

## 10. Acceptance criteria for the security/deployment workstream (checked at U-004/U-005)

1. Isolation checklist (§2) all true.
2. TLS valid + auto-renew verified; redirect works; HSTS state matches §3.
3. Header set matches §4 exactly (or documented exceptions, none silent).
4. Artifact hash manifest matches the deployed files bit-for-bit.
5. Zero external requests in a browser session; zero secrets in the web root.
6. Rollback drill executed and recorded.
7. No WIFI backend, router portal or product code reachable from the site host path.

## 11. Standing prohibitions (unchanged)

No deployment without owner authorization; no DNS/D17 action; no analytics activation (D24 OPEN — default none); no CMS dependency (D25 OPEN — default none); no contact form live before `/privacy` + `/terms` + D19 answer; no product backend code under the site root; no shared credentials/pools/logs with CIVOLINK WIFI.

---

**End of security and deployment specification (U-003.3 / T-026).**
