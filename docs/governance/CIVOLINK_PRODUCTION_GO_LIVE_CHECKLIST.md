# CIVOLINK Production Go-Live Checklist

- **Milestone:** U-003.2 (companion deliverable C)
- **Date:** 2026-11-12
- **Type:** Actionable operational checklist for the next deployment milestones. Nothing is deployed by U-003.2; every box below is unchecked until its milestone executes it.
- **Companion to:** `docs/CIVOLINK_ECOSYSTEM_COMPLETION_AND_GO_LIVE_PLAN.md`

Usage: each product has its own section. A box is checked only when the
evidence named in it exists and is recorded in `docs/PROJECT_PROGRESS_REGISTER.md`
(or the owning product's records). Sections are independent — the website does
not wait for WIFI/Biashara.

---

## A. Corporate website (civolink.co.ke — adopted primary domain, D17 adoption addendum 2026-11-16) — Phase 1

### A1. Pre-launch (build)
- [ ] Owner review of `docs/umbrella-prototype/` recorded; direction ACCEPTED
- [ ] D20 confirmed: six-page set + filenames + `/privacy` + `/terms` added to launch set
- [ ] D14 About wording (mission/vision/values) confirmed; draft tags removed
- [ ] D21 confirmed or declined: Biashara Flow listing finalized; reversibility notice kept or removed accordingly
- [ ] G1 executed: approved SVGs copied into repo; SHA-256 verified against guidelines §11.2; favicon behaviour decided (D16 residual)
- [ ] All copy matched to approved content package; no invented claims (scan: no "Ltd", no invented stats/contacts)
- [ ] Registration particulars verified against the official certificate (rule 11) before any identity block is published
- [ ] D18 respected: no address published unless approved
- [ ] `/privacy` and `/terms` drafted and owner-approved (Kenya Data Protection Act, 2019 requirements; data-handling matches D19 answer)
- [ ] D19 answered: contact channels chosen; form endpoint only if data handling approved — else static details
- [ ] SEO: unique title/description per page, Open Graph tags, `sitemap.xml`, `robots.txt`, canonical URLs
- [ ] Accessibility pass: WCAG 2.2 AA spot-audit (contrast already per guidelines §21; keyboard nav, focus order, alt text, landmarks, form labels)
- [ ] Assets: images optimized; no external fonts/scripts/trackers; zero external requests verified

### A2. Deployment
- [ ] D22 confirmed (static hand-authored + hosting topology) and D23 details recorded (TLS authority, DNS host)
- [ ] VPS provisioned (D8); documented provisioning runbook executed
- [ ] Nginx: server block(s) for the site; TLS 443 only; HTTP→HTTPS redirect
- [ ] TLS certificate issued (Let's Encrypt/provider) with auto-renewal verified
- [ ] Security headers verified: HSTS, CSP (no unsafe-inline where avoidable), X-Content-Type-Options, X-Frame-Options, Referrer-Policy, Permissions-Policy
- [ ] Deployment artifact = exact approved files (manifest discipline); hash manifest recorded
- [ ] DNS records set only for existing services (D17 domains live)
- [ ] Deployment recorded with date, commit/artifact hash, operator

### A3. Post-deployment smoke test
- [ ] All six (or confirmed-set) pages return 200 over HTTPS
- [ ] All internal links/anchors resolve; no 404s; 404 page branded (if built)
- [ ] Navigation, mobile menu, contact form behaviour verified live
- [ ] Zero external requests confirmed in browser devtools
- [ ] Headers + TLS grade verified (external checker or openssl)
- [ ] Lighthouse/perf sanity run recorded

### A4. Operations handover
- [ ] Content-update procedure documented (edit → review → deploy → verify) with rollback (artifact retention)
- [ ] Backup: git repo + artifact archive + TLS renewal state; restore drill recorded
- [ ] Expiry watch: domain registration (D17), TLS renewal, VPS billing
- [ ] Form submissions (if live) reach the agreed destination; privacy policy reachable from the form

---

## B. CIVOLINK WIFI — Phase 2

### B1. Pre-launch (build/verify)
- [ ] D6 unblocked: official PayHero contract evidence recorded in `docs/PAYHERO_CONTRACT.md` (endpoint, auth, request/response schema, callback signature format/header, amount representation, status literals, retry semantics)
- [ ] Channel ID confirmed (resolves 133 vs 4419 discrepancy)
- [ ] Portal implements token handoff: `access_token` received from `pay.php` 202, retained, submitted on every `check_status.php` poll; status page and auto-login verified
- [ ] D1–D5, D7 launch parameters confirmed (pricing, durations, trial policy, device binding, credential release, rate-limit matrix)
- [ ] D10 retention policy recorded
- [ ] Local full-loop test executed and recorded (initiate → webhook → provision → status release) per review §5 topology
- [ ] Router-side verification: API-SSL 8729 over WireGuard only; CA deployed and pinned; hotspot profiles = confirmed matrix; provisioning of a test user succeeded; retry and stale-claim paths exercised
- [ ] Reconciliation job for missed webhooks implemented and tested (`callback_inbox` processing; `pending` retry)
- [ ] Admin dashboard v1 live (authenticated; transactions, manual provisioning, retry trigger); no demo data
- [ ] PHPUnit suite green at deployment time; all 25 backend PHP files lint-clean
- [ ] Voucher/manual provisioning path (if D3 retains vouchers) tested including abuse controls (X15)

### B2. Controlled live testing
- [ ] Owner authorization recorded for first real-money test
- [ ] Flags enabled deliberately (`CIVOLINK_PAYMENTS_ENABLED`, `CIVOLINK_WEBHOOK_ENABLED`) with rollback = set `false`
- [ ] One real STK push at minimum viable amount → callback verified → provisioning verified → credentials released → session validated on the hotspot
- [ ] Webhook audit log reviewed; `callback_inbox` shows the receipt
- [ ] Failure-path test: wrong amount, duplicate callback, stale token, router offline during callback
- [ ] Rollback exercised (flags off, refund/handling procedure for the test transaction)

### B3. Production deployment (per manifest)
- [ ] VPS: PHP 8.1+ with pdo_sqlite/curl/sodium/openssl; composer not required
- [ ] All 12 env vars set per manifest §7; flags correct; secrets not in git; file perms 0600 env
- [ ] Data dir outside repo and document root, 0700 (common.php guard verified)
- [ ] HTTPS-only endpoints; exact-origin CORS verified live
- [ ] Router reachable only over WireGuard; router credentials least-privilege; credential rotation procedure recorded
- [ ] Backups: SQLite scheduled snapshots off-VPS; restore drill recorded
- [ ] Monitoring: D9 parameters live (uptime probe, systemd failure alert, disk/memory, `callback_inbox` depth)
- [ ] Checklist S1–S14, P1–P8, R1–R7 items from `docs/PRODUCTION_READINESS_CHECKLIST.md` all checked with evidence links

### B4. Launch
- [ ] Live pricing confirmed on portal; honesty text verified
- [ ] Support/escalation path (D19 for WIFI support channels or product-local arrangement)
- [ ] Incident runbook: payment stuck → reconciliation; router down → recovery procedure; credentials lost → rotation
- [ ] Launch recorded in the register with evidence

---

## C. Biashara Flow — Phase 3 (external project; owned by its session)

- [ ] Working tree committed and pushed; CI green on the pushed tree
- [ ] HTTPS/443 enabled in nginx/compose; TLS certs automated
- [ ] `.env` key mismatch fixed; root-level `.env` matches Settings/compose expectations
- [ ] Seed script gated away from production (no `is_system_admin` minting in prod)
- [ ] Debug prints removed from request path
- [ ] SEC-001 remainder: imperative role checks in `payments`, `shop_admin`, `venture` converted to fail-closed dependencies
- [ ] PostgreSQL production validation executed (incl. the two concurrency tests) and recorded
- [ ] Backups: `pg_dump` scheduled off-host; restore drill recorded
- [ ] M-Pesa Daraja live credentials validated through its provider gate (analogous evidence discipline to D6); sandbox-only status lifted deliberately
- [ ] Deploy/rollback via `scripts/deploy.sh` + image tags rehearsed
- [ ] Pilot enterprise onboarded; first full savings/loan cycle completed and recorded

---

## D. Shared infrastructure (Phase 4 consolidation)

- [ ] D9 monitoring parameters live and alert delivery demonstrated (test alert received)
- [ ] Secrets inventory reviewed; per-product secret rotation procedure documented
- [ ] Firewall audit: only 22/80/443 public (+WireGuard path); recorded with a port-scan evidence run
- [ ] DR: rebuild-from-scratch runbook executed once in a test environment; RPO/RTO recorded
- [ ] Backup verification: automated restore check or manual monthly drill scheduled
- [ ] API-gateway reassessment executed **with evidence**: if no cross-product integration demand emerged, record "still not needed"; else follow deliverable B §9 design rules and create the owner decision first
- [ ] Consolidated operations runbook covering all live services published internally

---

## E. Standing prohibitions (apply to every launch)

- No live service publishes unverified registration particulars, invented
  contacts, or unapproved addresses.
- No contact/form goes live before its privacy policy exists.
- No payment flag is enabled without its provider-evidence gate and owner
  authorization.
- No router is exposed publicly; API-SSL stays behind the private path.
- No shared database, shared privileged auth or unversioned integration is
  introduced (deliverable B §10).
- Nothing is deployed, registered or purchased without an explicit owner
  decision recorded in the register.

**End of checklist.**
