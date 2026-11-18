# CIVOLINK Ecosystem Completion, Product Delivery and Production Go-Live Plan

- **Milestone:** U-003.2
- **Date:** 2026-11-12
- **Type:** Planning/documentation milestone. **No production deployment, domain purchase, DNS change, payment activation, router change, external-project modification, desktop-app implementation, API-gateway deployment or commit occurs under this milestone.**
- **Status: U-003.2 — COMPLETED — ECOSYSTEM EXECUTION PLAN DELIVERED (PLANNING ONLY)**

---

## 1. Purpose and scope

CIVOLINK is moving from prototypes and parallel product development towards a
coordinated, operational technology business. This plan converts the existing
repository evidence into a prioritized, dependency-aware execution roadmap for:

- CIVOLINK public corporate website (the U-003.0/U-003.1 prototype).
- CIVOLINK WIFI (managed Wi-Fi hotspot product).
- Biashara Flow (business/enterprise management platform).
- Future customer portals, administrative dashboards, desktop tools, API
  gateway/integration services and future digital products.

This is **not** a general readiness audit; it is an actionable plan. Every
recommendation below is anchored to verified repository evidence, and the
distinction between *verified evidence*, *previous completion reports* and
*assumption* is stated where it matters.

## 2. Method and evidence classification

Inspection performed (read-only):

| Source | Used for |
|---|---|
| `docs/OWNER_DECISIONS_REGISTER.md` | Authoritative decision IDs D1–D25 and statuses (§11) |
| `docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md` | Umbrella phases U-001…U-006, isolation rules, page decisions |
| `docs/IMPLEMENTATION_ROADMAP.md`, `docs/PRODUCTION_BUILD_MANIFEST.md`, `docs/PROJECT_PROGRESS_REGISTER.md`, `docs/PRODUCTION_READINESS_CHECKLIST.md` | WIFI Phase 0–4 state, artifact/exclusion rules, checklist state |
| `docs/CIVOLINK_BRAND_GUIDELINES.md`, `docs/CIVOLINK_U002_3_CORPORATE_WEBSITE_CONTENT.md`, `docs/CIVOLINK_U002_3_SITEMAP.md` | Content/brand authority for website launch |
| `docs/CIVOLINK_U003_0_PROTOTYPE_IMPLEMENTATION_REPORT.md`, `docs/CIVOLINK_U003_1_VISUAL_QA_AND_OWNER_REVIEW_REPORT.md` | Prototype state (note: the U-003.1 deliverable is the *visual QA and owner review package report*; the owner's task brief refers to it as the "technical quality and accessibility report" — same artifact, U-003.1) |
| `docs/umbrella-prototype/` (6 pages + assets) | Accepted initial website implementation direction |
| CIVOLINK WIFI backend/portal/router/payment docs (fresh inspection) | Workstream B |
| `E:\Documents\VS\Biashara Flow\REAL CODE\biashara_flow_app\biashara-flow-platform` (read-only) | Workstream C |
| `E:\Documents\VS\EDMOLT\EDMOLT_CORPORATE_DOCUMENT_SYSTEM` (read-only) | Workstream D precedent + brand-asset custody |

Evidence quality used throughout:

- **VERIFIED** — reproduced locally (tests, screenshots, checksums).
- **IMPLEMENTED — NOT VERIFIED** — code exists, never exercised against the real system (PayHero, live router).
- **REPORTED / ASSUMPTION** — found in prior completion reports; not re-verified here unless stated.
- **BLOCKED** — awaiting owner or provider input.

Baseline: `main` @ `1bf0b2f`, 29 modified/untracked entries preserved; external
projects untouched.

## 3. Ecosystem inventory and current state

| Component | Current state (evidence-based) |
|---|---|
| Corporate website | Six-page static prototype, locally verified, 0 defects (U-003.1); **not deployed, not ACCEPTED by owner** |
| CIVOLINK WIFI backend | `pay.php`/`webhook.php`/`check_status.php`/`provision.php`/`routeros.php` implemented with fail-closed flags; **36 tests / 128 assertions passing locally**; everything IMPLEMENTED — NOT VERIFIED; PayHero contract **BLOCKED (D6)**; portal token handoff **NOT VERIFIED** |
| CIVOLINK WIFI portal | Live router `login.html` is legacy (external payment link, no backend); new-flow prototype `docs/prototypes/upgraded_login.html` **omits the access token**; portal-backend integration NOT STARTED |
| WIFI admin dashboard | **NOT IMPLEMENTED** — static UI reference only (`docs/url-reference/admin-dashboard.html`) |
| Biashara Flow | FastAPI/SQLAlchemy/Alembic, 32 domain tables, full finance domain (savings/loans/dual-auth/ledger/ventures/shop/payments), **24 test files (README: 323 passed / 2 skipped)**, JWT+bcrypt, Fernet-encrypted gateway credentials, Docker/nginx/CI **all uncommitted at HEAD `4541ffb`**; no HTTPS; M-Pesa validated in sandbox only; seed-script prod-admin risk |
| Brand assets | 8 approved SVGs **outside repo** (gap G1, checksums in guidelines §11.2); T-020 PNG crops provisional pending owner approval |
| EDMOLT document system | Standalone Python quotation/document generator; relevant here only as (a) second owned copy of approved brand assets, (b) precedent that internal tooling in Python works well |
| Shared infrastructure | None yet: no VPS in use, no DNS, no TLS, no monitoring, no backups, no production hosting for anything |

**Guiding architecture principle (unchanged, from §D13 and the umbrella
architecture):** one brand, independent systems. Every product keeps its own
database, security boundary, release cycle and secrets. The corporate website
is static content only.

---

## 4. Workstream A — Corporate website completion and launch

### 4.1 Starting point

The six-page prototype (`docs/umbrella-prototype/`) is **accepted as the
initial implementation direction**. It is hand-authored semantic HTML5 + one
shared stylesheet + minimal vanilla JS — deliberately no framework. **Do not
migrate it to React**; that would add a build chain, dependencies and attack
surface for zero user benefit on a static six-page site.

### 4.2 Completion assessment

| Item | State | Needed for launch |
|---|---|---|
| Final content approval | Copy exists (U-002.3); owner has not ACCEPTED rendered prototype | Owner review of prototype → ACCEPTED decision |
| D20 page set/URLs | Six-page set implemented (`/platforms`, `/services` divergence from architecture `/products` recorded) | Owner confirms/amends six-page set + filenames + `/privacy` `/terms` addition (sitemap doc §9 recommendation) |
| Privacy & Terms | Not drafted as pages | **Mandatory before the contact form collects anything** (architecture §10.2; Kenya Data Protection Act, 2019). Draft in Phase 1, publish before form go-live |
| Contact channels & form | Prototype form is inert; channels are D19 placeholders | D19 answer → real channels; form endpoint only if D19 data-handling is approved, else static contact details |
| Legal identity | Registered name + BN-55SLLRED rules implemented; particulars marked owner-supplied/unverified | Verification against official certificate before publication (rule 11) |
| Product maturity/affiliation statements | Honest status badges (IN DEVELOPMENT/FUTURE CONCEPT) in place | D21 confirmation for Biashara Flow public listing |
| Logo/assets | Provisional T-020 PNG crops in prototype; approved SVGs outside repo | G1 owner-authorised copy of SVGs into repo + checksum verification; favicon behaviour (D16 residual) |
| Accessibility/responsive | Verified visually at 3 viewports (U-003.1); no full WCAG audit run | Formal accessibility pass in U-004-style verification |
| SEO metadata | Basic page titles present; description/OG/schema not audited | Add/verify metadata, sitemap.xml, robots.txt in Phase 1 build |
| Performance | System fonts, no external requests, one CSS file | Minor: minify/cache headers at deployment; no restructuring needed |
| Security headers/CSP | Not yet configured | Nginx: HSTS, CSP, X-Content-Type-Options, X-Frame-Options, Referrer-Policy |
| HTTPS/TLS | None (D23 open) | Let's Encrypt or provider-managed cert at deployment |
| Backup/recovery | None | Site is static: backup = git repo + deploy artifact archive |
| Hosting/deployment | D22/D23 open; Nginx owner-approved | Deploy plan in checklist deliverable (§12 C) |
| Smoke testing | None (nothing deployed) | Post-deploy checklist in go-live checklist |
| Maintenance/ownership | Undefined | Owner-confirmed content-update procedure (simple: edit → review → deploy) |

### 4.3 Recommendation

**Static-first production deployment on Nginx** (owner-approved web server):
hand-authored HTML/CSS/JS, no build step at launch, no database, no CMS,
contact endpoint only if D19 permits. This matches the prototype exactly and
the architecture document §11. Deploy the site on the planned VPS with strict
isolation from the WIFI backend (§8) — or, if the owner prefers a slower
start, on any static host that D23 lands on. Nothing in the website may
depend on WIFI or Biashara Flow being live.

### 4.4 Can proceed immediately vs needs decisions

- **Proceed immediately:** final-page HTML polish, `/privacy` + `/terms` drafts (with unresolved-particulars labels), SEO metadata, sitemap.xml/robots.txt, CSP/header plan, accessibility pass, favicon decision record.
- **Needs owner decision:** D20 (final page set/URLs incl. `/privacy`/`/terms`), D14 (About wording), D19 (channels + form data handling), D21 (Biashara Flow listing), G1 (SVG copy-in), D22/D23 (hosting/TLS) — D22/D23 gate deployment only, not the build.
- **Blocked work:** publishing registration particulars (rule 11 verification), enabling any form (D19 + privacy policy), publishing any address (D18).

---

## 5. Workstream B — CIVOLINK WIFI completion

Target: a **reliable commercial single-site hotspot**, not a multi-tenant SaaS.

### 5.1 Current state (verified by inspection)

- Backend chain implemented and locally tested (36/128 passing): payment initiation (`pay.php`, feature-flag frozen), webhook with HMAC verification (`webhook.php`), token-gated status/credential release (`check_status.php`), RouterOS API-SSL provisioning with retry (`provision.php`, `routeros.php`), SQLite storage with WAL/FULL sync and durable `callback_inbox`.
- **Everything is IMPLEMENTED — NOT VERIFIED**: no live PayHero call, no live router, no live webhook ever exercised.
- Provider contract **BLOCKED (D6)**: endpoint/auth/schema/callback-signature/amount-representation all require provider evidence; channel ID discrepancy **133 vs 4419** unresolved; independent transaction lookup unimplemented (`PayHeroGateway::checkStatus` returns `supported: false`).
- **Portal gap (the biggest single defect):** `docs/prototypes/upgraded_login.html` calls `pay.php` and polls `check_status.php` but **omits the `access_token`** the backend issues and requires. The live router `login.html` is the legacy external-payment-link flow. Customer token delivery/retention/submission is NOT VERIFIED.
- **No admin dashboard exists** (static reference only). Operations currently require CLI/db access.
- Production checklist: 0 of ~49 boxes checked; VPS service design is an ASSUMPTION.

### 5.2 Exact blockers to accepting the current implementation

| # | Blocker | Type |
|---|---|---|
| B1 | PayHero contract evidence (endpoint, auth, request/response schema, callback signature format+header, amount representation, status literals, retry semantics) | Provider evidence → **D6** |
| B2 | Channel ID confirmation (133 vs 4419) | Owner/operator confirmation |
| B3 | Portal implements token handoff: receive `access_token` from `pay.php` 202 response, persist it for the session, submit it on every `check_status.php` poll; status page rebuilt on the same contract; auto-login after `provisioned` | Implementation (Phase 2) |
| B4 | Sandbox/provider test-mode run of initiate → callback → status with a synthetic transaction | Requires B1+B2 + owner authorization for a live-mode test (never production data) |
| B5 | Router-side verification: API-SSL 8729 reachable over the management path, CA deployed, hotspot profiles = `plans.php` matrix (D7), provisioning against a test user | Owner authorization for router access (L2/D12 path) |
| B6 | Integration test of the full loop (initiate → webhook → provision → status release) in the local/dev environment per review §5 | Requires B3/B5 |
| B7 | Reconciliation job for missed webhooks (`callback_inbox` processing + `pending` retry) | Implementation (small, designed already) |
| B8 | Minimal admin dashboard (transactions, manual provisioning, retry trigger) — can start from `docs/url-reference/admin-dashboard.html` but must be a real authenticated app | Implementation (Phase 2, after core loop verified) |

### 5.3 Recommended execution path (Phase 2 detail in §10)

1. **Unblock D6/B1/B2** — owner/operator obtains official PayHero contract details (documented in `PAYHERO_CONTRACT.md`); until then flags stay `false`.
2. **Fix the portal token handoff (B3)** — small, well-specified; the single most valuable WIFI implementation task; verified by extending the existing PHPUnit/HTTP-level tests plus manual portal test.
3. **Local full-loop test (B6)** on the documented local topology (review §5) with `MockGateway`/test PayHero and a router simulator or the real hAP lite if the owner authorizes local router access (D12).
4. **Router verification (B5)** — API-SSL, CA, profiles, provisioning; then **controlled live testing**: real M-Pesa STK at minimum viable amount with the owner watching, rollback ready.
5. **Reconciliation + admin dashboard (B7/B8)** before public launch; voucher/manual provisioning path per D3/D5 decisions.
6. **Production deployment** per manifest (PHP 8.1+, pdo_sqlite/curl/sodium/openssl, 12 fail-closed env vars, data dir outside document root) after checklist S/P/R items pass.

**Respect all existing gates:** no real payments, webhooks, router provisioning or production services without the recorded authorizations. `CIVOLINK_PAYMENTS_ENABLED` / `CIVOLINK_WEBHOOK_ENABLED` remain `false` until D6 is answered **and** the owner authorizes the controlled test.

---

## 6. Workstream C — Biashara Flow

Assessed independently at `E:\Documents\VS\Biashara Flow\REAL CODE\biashara_flow_app\biashara-flow-platform` (read-only; nothing modified).

### 6.1 Maturity

**Functional but not release-ready** (matches the repo's own 2026-11-03 gap analysis; independently corroborated). It is roughly **one hardening + release-engineering phase** from a production candidate.

### 6.2 Actual architecture (confirmed — preserve it)

- FastAPI + SQLAlchemy 2.0 + Alembic (12-version clean chain, head `0012`); SQLite dev / **Postgres 16 prod target**; Pydantic v2; Jinja2 server-rendered templates + vanilla JS (`frontend/` dir is empty — no React anywhere). **Do not rewrite or migrate to React** — the server-rendered UI is consistent, tested through httpx TestClient, and the product's complexity lives in the domain logic, not the UI.
- 14 routers / 86 routes; services layer; `crud.py`; 32 domain tables.
- Auth: OAuth2 password → JWT (HS256) for API; `bf_jwt` cookie gate for HTML pages; bcrypt hashing; RBAC via enterprise `Membership.role` (owner/manager/member) + `is_system_admin`; per-group **dual authorization** governance with title-bearing signers and `ApprovalLog`.
- **No shared anything with other CIVOLINK products** — it already has its own DB, auth and deployment; keep it that way.

### 6.3 Feature completeness (verified by route inspection)

| Area | Status |
|---|---|
| Enterprises/memberships, users/roles, groups/members | COMPLETE |
| Transactions ledger (+CSV export/search/pagination) | COMPLETE |
| Savings (accounts/contributions/withdrawals, notice periods) | COMPLETE |
| Loans (apply/guarantors/decide/disburse/repayments/schedule/penalties) | COMPLETE |
| Dual authorization governance | COMPLETE |
| Venture batches/inventory (17 endpoints, movements, mortality-aware feed cost) | COMPLETE |
| Catalogue + public storefront + M-Pesa STK checkout + shop admin (refunds/returns/restock) | COMPLETE (backend) |
| Payments hub (Daraja STK/B2C sandbox default, Pesapal/Bank H2H adapters, webhooks, reconciliation service) | COMPLETE (backend), **sandbox-validated only** |
| Reporting dashboards | PARTIAL (no PDF module) |
| Notifications / settings screens | ABSENT (open items NOT-001, SET-001) |

### 6.4 Deployment readiness gaps (exact, from inspection)

1. **~95 files of core work uncommitted/unpushed** at HEAD `4541ffb` — including Dockerfile, docker-compose, nginx.conf, CI workflow, migrations 0007–0012, six routers, ~15 test files. **Release engineering step 1: commit/push the tree** (owner/external-project action — outside this milestone).
2. **No HTTPS** — nginx publishes only :80; TLS intentionally not yet enabled.
3. **Remaining imperative role checks** in `payments`, `shop_admin`, `venture` handlers (SEC-001 remainder) instead of fail-closed dependencies.
4. **CI never run** against this tree (workflow predates/untracked).
5. **`.env` key-name mismatch** (`backend/.env` uses keys the Settings class ignores; compose expects root-level `.env`).
6. **Seed script risk:** `backend/seed.py` would create a live `is_system_admin` (`admin@biasharaflow.com` / hardcoded) if run against a prod DB — gate it to non-production.
7. **M-Pesa only validated in sandbox**; live-provider + PostgreSQL validation pending.
8. **No backups** (only a `postgres_data` volume; no dump/restore tooling), no `pyproject.toml`/lockfile, debug `print()` statements in `main.py`, three overlapping venvs.

### 6.5 Recommended next milestones (Phase 3 in §10)

1. Commit/push + run CI on the full tree.
2. HTTPS/443 in nginx + compose (TLS termination), fix `.env` key mismatch, gate the seed script, remove debug prints.
3. Convert the remaining imperative role checks to fail-closed dependencies; add notifications (NOT-001) and settings screens (SET-001) only after that.
4. PostgreSQL production-mode validation (the two skipped concurrency tests) + backup/restore scripts.
5. Live M-Pesa Daraja credential validation (its own provider-evidence gate, analogous to D6 for PayHero) before real money flows.
6. Then a controlled pilot with one real enterprise.

### 6.6 Portal/interface question

A customer-facing portal **exists** (public storefront router + templates). An additional separate portal is **not** currently justified; the gap list above precedes any new interface work. The SQLAdmin `/admin` panel suffices for internal administration short-term; a dedicated staff-facing UI is a future option, not a launch requirement.

---

## 7. Workstream D — Desktop-installable tools

Full evaluation matrix in deliverable B (`CIVOLINK_DESKTOP_TOOLS_AND_API_GATEWAY_STRATEGY.md`). Summary:

| Candidate | Verdict |
|---|---|
| Owner administration console | **Not needed** — web dashboards (when built) + CLI cover it; a desktop shell would duplicate them |
| WIFI operator management/provisioning tool | **Deferred** — prerequisite is the WIFI admin web dashboard (Phase 2 B8); revisit only if field operation shows a real gap |
| Router monitoring/diagnostics utility | **Not needed as desktop app** — RouterOS tooling + small Python scripts (EDMOLT-style) suffice; monitor on the VPS instead |
| Offline voucher/customer-management utility | **Conditional** — only meaningful if D3 (trial/voucher policy) creates an offline voucher workflow; otherwise defer |
| Biashara Flow desktop companion | **Not needed** — the web app is the product; no offline workflow found in evidence |
| Internal deploy/backup/support utilities | **As scripts, not desktop apps** — Python/PowerShell scripts under version control (precedent: EDMOLT tooling) |

**Recommendation: build no desktop applications now.** Nothing in the
verified evidence shows a workflow that a web interface cannot serve. The
smallest genuinely useful future desktop tool would be a Wi-Fi operator
companion (Tauri or Python/PyInstaller — Electron explicitly rejected: it
bundles a full browser runtime for forms-and-tables UI), and that decision is
deferred to Phase 5 with an explicit evidence test ("name the workflow that
requires offline/local operation").

---

## 8. Workstream E — API gateway and integration architecture

Full analysis in deliverable B. Summary and ruling:

- **Distinguish (as mandated):** *API gateway* (auth enforcement, rate limiting, policy), *integration services* (point-to-point workflow/data exchange), *reverse proxy* (infrastructure routing), *shared identity* (separate future decision — **never** an automatic consequence).
- **Integrations genuinely necessary today: none.** The corporate website is static; WIFI is a self-contained hotspot loop; Biashara Flow is self-contained. Each provider (PayHero, M-Pesa Daraja) is integrated **inside** its own product, which is correct.
- **Future possibilities (only when justified):** a "central accounts" sign-in service is already labelled FUTURE CONCEPT on the platforms page — that is a *shared identity* decision requiring its own owner decision and design; potential aggregated operations dashboards; potential cross-product reporting. Each would be an **integration service with an explicit, versioned, least-privilege API contract** — not a shared database.
- **Should NOT be built:** a shared/central database; shared privileged authentication; a gateway "because multiple products exist"; any gateway before at least two products actually need cross-calling.
- **Recommendation:** **no API gateway now; none in Phase 4 either.** Nginx on the shared VPS acts as the reverse proxy with per-product routing and strict isolation (separate processes/containers, separate DBs, separate secrets, firewall rules). If integration ever becomes real, start with Nginx-level routing plus a small explicit service, and only adopt dedicated gateway software when policy needs (rate limiting per consumer, key management, quotas) actually appear.

---

## 9. Workstream F — Shared operational infrastructure

Plan (details executed inside Phases 1–3, formalized in Phase 4):

| Area | Plan |
|---|---|
| Domains | `civolink.co.ke` adopted as the primary domain (D17 adoption addendum, 2026-11-16) + per-product subdomain plan under the adopted base (`wifi.civolink.co.ke`, `biashara.civolink.co.ke`, `docs.civolink.co.ke`; `accounts.civolink.co.ke` future concept) — **D17**; acquisition/ownership recorded (D17 adoption addendum) and DNS/deployment verification owner action (**D23**) |
| DNS | Hosted wherever owner chooses (D23); A/CNAME records only when a service exists; no wildcard for unbuilt services |
| VPS/hosting | **D8 approved in principle**; one VPS initially (cost-efficient), sized for WIFI backend + Biashara + static site; details (D23) owner-confirmed |
| Nginx | Single entry point: TLS termination, per-product server blocks/virtual hosts, static site served directly, WIFI backend fastcgi/HTTP behind path or subdomain, Biashara proxied to its uvicorn container; security headers global |
| TLS | Let's Encrypt (certbot) or provider-managed per **D23**; auto-renewal; HSTS |
| Application isolation | WIFI PHP-FPM (its own pool/user), Biashara Docker compose stack (own network), static site (separate root); no shared filesystem beyond system logs |
| Database isolation | WIFI: SQLite (per manifest) with WAL; Biashara: Postgres 16 (its own container/volume); **never a shared database** |
| Firewall | ufw/nftables: 22 (SSH, key-only), 80/443 (Nginx) public; everything else closed; RouterOS API-SSL 8729 reachable **only** over WireGuard/private tunnel from the VPS, never public |
| Secrets | Per-product secret sets (WIFI env vars per manifest §7; Biashara Fernet-encrypted gateway creds + its own JWT secret); recommended: a simple root-owned secrets dir or low-cost vault later; no secret ever in git |
| Monitoring/alerting | **D9** owner decision (cadence, recipient, thresholds); minimal start: uptime probe (external), systemd failure alerts, disk/memory alerts, webhook `callback_inbox` depth alert |
| Centralized visibility | Single log host is overkill initially; keep per-product journald/container logs + rotated app logs; add a lightweight aggregation (e.g., Loki) only when >2 services generate alert-worthy volume |
| Backups | WIFI: SQLite file snapshots (e.g., litestream or scheduled `VACUUM INTO`) off-VPS daily; Biashara: `pg_dump` daily off-VPS; static site: git repo + artifact archive; **restore drills recorded** |
| DR/recovery | Rebuild-from-scratch runbook (IaC-lite: documented provisioning script), RPO 24h / RTO 1 day acceptable initially; documented in checklist |
| Deploy/rollback | Per-product: WIFI rsync/deploy script with previous-release retention; Biashara: its `deploy.sh` + image tags; static site: publish directory symlink flip; each with a one-command rollback |
| Logging/audit | WIFI webhook audit log (implemented) + access logs; Biashara `ApprovalLog` + app logs; retention per D10 (WIFI) and its own policy |

**Distinction maintained:** shared *infrastructure services* (proxy, TLS, backups, monitoring, WireGuard) — yes, centralized; shared *application data/auth* — never.

---

## 10. Prioritized execution roadmap

Dependencies drove the ordering; the website does **not** wait for products,
and WIFI does not wait for Biashara Flow.

### Phase 1 — Corporate website launch

- **Objective:** live, honest, secure public site for the brand.
- **Tasks:** owner reviews prototype → ACCEPTED direction; resolve D14/D20/D21 for content lock; G1 asset copy-in + favicon decision; draft `/privacy` + `/terms` (with unresolved-particulars labels); D19 channels + form decision; final SEO/metadata/sitemap/robots; accessibility pass; Nginx vhost + headers/CSP config; TLS per D23; deploy; smoke test; content-update procedure.
- **Deliverables:** production site; `/privacy` & `/terms`; deployment record; update runbook.
- **Dependencies:** owner decisions D14 (wording), D20 (page set incl. `/privacy`/`/terms`), D19 (form), D21 (Biashara listing), G1/D16 residuals (assets), D22/D23 (hosting/TLS — gate deployment only).
- **Security requirements:** CSP/HSTS/headers, no endpoints, no external scripts, certificate verification before publishing registration particulars.
- **Acceptance criteria:** all pages match approved content; zero external requests; headers verified; WCAG spot-audit pass; form live only with published privacy policy; registration particulars verified against certificate; owner sign-off.
- **Parallel:** everything; independent of Phases 2–3 entirely.
- **Deferred:** analytics (D24 default none), CMS (D25 default none), any product deep-links beyond planned-domain text.

### Phase 2 — CIVOLINK WIFI operational completion

- **Objective:** verified payment → provisioning → access loop, ready for controlled live testing.
- **Tasks:** D6 evidence collection (B1/B2); portal token handoff fix (B3); local full-loop test (B6); router-side verification (B5, owner-authorized); reconciliation job (B7); minimal authenticated admin dashboard (B8); rate-limit matrix confirmation (D7); voucher/manual path per D3/D5; checklist S/P/R items.
- **Deliverables:** verified portal; reconciliation worker; dashboard v1; router verification record; updated register.
- **Dependencies:** D6 (BLOCKED — provider evidence), D12/L2 (router/local access authorization), D1–D5/D7/D10 for launch parameters.
- **Security requirements:** flags remain `false` until D6 + owner test authorization; token enforcement; credential encryption at rest; webhook HMAC; least-privilege router credentials over WireGuard only.
- **Acceptance criteria:** PHPUnit suite green; full-loop local test recorded; one controlled live test transaction end-to-end with owner observation; checklist S1–S14/P1–P8/R1–R7 checked; zero forgeable-callback paths.
- **Parallel:** with Phase 1 and Phase 3 at all times (own VPS isolation).
- **Deferred:** multi-site/multi-tenant features, SSO, product cross-links.

### Phase 3 — Biashara Flow operational completion

- **Objective:** release-ready, hardened, backed-up pilot.
- **Tasks (per §6.5):** commit/push + CI green; HTTPS; `.env` key fix; seed gating; debug-print removal; fail-closed role checks (SEC-001); Postgres prod validation; backups + restore drill; live M-Pesa credential validation (its own provider gate); pilot onboarding of one enterprise.
- **Deliverables:** release candidate tag; deployment record; backup/restore runbook; pilot report.
- **Dependencies:** owner authorization to commit/push and operate externally; M-Pesa Daraja production credentials (provider gate, analogous to D6).
- **Security requirements:** HTTPS-only, fail-closed RBAC everywhere, prod-secret fail-fast (already present), Fernet credential encryption, seed disabled in prod.
- **Acceptance criteria:** CI green on pushed tree; Postgres concurrency tests pass; backup restore drill recorded; one pilot enterprise completes a full savings/loan cycle; zero imperative-only role checks.
- **Parallel:** with Phases 1–2.
- **Deferred:** notifications/settings screens (NOT-001/SET-001) until post-pilot; PDF reporting; public storefront launch marketing.

### Phase 4 — Shared infrastructure and controlled integrations

- **Objective:** consolidate the operational foundation; introduce integrations **only if real requirements emerged in Phases 2–3**.
- **Tasks:** finalize D9 monitoring/alerting; secrets-management upgrade if needed; DR drill; consolidated runbooks; ** reassess API-gateway necessity against actual cross-product traffic (expected answer: still none)**; document any justified point-to-point integration with versioned contracts.
- **Dependencies:** Phases 1–3 deployed; D23 hosting details; D9.
- **Security requirements:** firewall audit, TLS renewal automation, backup verification, per-product secret rotation procedures.
- **Acceptance criteria:** monitoring alerts demonstrably delivered; restore drills recorded for both databases; documented integration decision (build/do-not-build) with evidence.
- **Parallel:** partially with late Phases 1–3.
- **Deferred:** API gateway software; SSO/shared identity (needs its own future decision).

### Phase 5 — Desktop tools

- **Objective:** build only tools justified by operating evidence.
- **Tasks:** apply deliverable B's evidence test to each candidate; if any passes, implement the smallest useful version (Tauri or Python/PyInstaller preferred; Electron rejected unless a genuine full-web-embedding need appears).
- **Dependencies:** Phase 2 dashboard experience (operator workflow evidence); D3 voucher decision.
- **Acceptance criteria (per tool):** named offline/local workflow no web tool covers; measurable time/accuracy benefit; update path defined.
- **Deferred:** everything until evidence exists.

### Phase 6 — Ecosystem expansion

- **Objective:** add portals/products/services when each is justified.
- **Tasks:** central-accounts concept (future shared-identity decision); additional portals; product #4+ via the same independence rules; D25 editorial workflow if content volume grows.
- **Dependencies:** operating Phases 1–4; explicit owner decisions per addition.
- **Deferred:** all speculation; nothing built "for the ecosystem" without a named user and workflow.

### Immediate next tasks (concrete, can start now)

1. **U-003.3 (proposed):** corporate website productionization — privacy/terms drafts, SEO/metadata, headers/CSP plan, accessibility pass, asset governance (G1 request to owner). *No decisions required to start (drafting).*
2. **WIFI portal token handoff fix (B3)** — implementable immediately; unblocks the loop regardless of D6.
3. **Biashara Flow release-engineering task list** handed to that project's session (commit/push, HTTPS, seed gating, SEC-001) — external action.
4. **Owner request pack:** PayHero contract evidence (D6), channel ID confirmation, certificate sight for rule-11, D14/D20/D21/D19 answers, VPS/TLS choices (D22/D23), monitoring parameters (D9).

---

## 11. Owner decisions affecting this plan

From `docs/OWNER_DECISIONS_REGISTER.md` (authoritative; **no status changed here**):

| Decision | Subject | Status | Recommended answer | Consequence of accepting | Blocks | Proceeds without it |
|---|---|---|---|---|---|---|
| D1/D2 | Weekly price 150/200; daily 12/24h | OPEN | Confirm current `plans.php` (Weekly 150, Daily 40 — note D1 options were 150/200; `plans.php` uses 150; Daily 40/24h) | Locks pricing config before live testing | WIFI live launch | Development, testing with synthetic prices |
| D3 | Trial policy | OPEN | Recommend removing trial initially (abuse risk X15) | Removes X15 test scope | Trial feature only | Everything else |
| D4 | Device/MAC binding | OPEN | Confirm per architecture | Sets provisioning behaviour | — | — |
| D5 | Credential release policy | OPEN | Confirm release-on-provisioned (current check_status behaviour) | Locks customer UX | — | — |
| D6 | PayHero callback/signature contract | **BLOCKED** | Obtain official provider contract evidence | Unblocks flags + sandbox test | WIFI payments go-live (B1) | Portal fix, reconciliation, router work, all non-payment WIFI work |
| D7 | Profile rate-limit matrix | OPEN | Confirm `plans.php` matrix | Locks router profiles | Router provisioning config | Code work |
| D8 | VPS OS/provider details | OPEN (VPS approved) | Choose provider/OS (e.g. Ubuntu 24.04 LTS) | Enables concrete provisioning scripts | Deployment phases | All planning |
| D9 | Monitoring cadence/recipient | OPEN | Owner email, daily digest + immediate failure alerts | Enables Phase 4 monitoring | Monitoring go-live | Setup |
| D11 | Historical domains/tunnel | OPEN (history recorded) | Revoke unused tunnel credential after status check | Closes a security loose end | Nothing | — |
| D12 | Local webhook path + router-config authorization | OPEN | Authorize local loop testing + router access | Unblocks B5/B6 verification | Router verification, local integration test | All code work |
| D13 | WordPress/integration direction | APPROVED DIRECTION | N/A — stands | — | — | — |
| D14 | Corporate positioning wording | PARTIALLY RESOLVED | Confirm About wording | Content lock | Website About content | Everything else on the site |
| D15 | Tagline/brand voice | PARTIALLY RESOLVED | Confirm voice residual | Copy tone lock | Headings tone | Build/deploy |
| D16 | Logo/favicon/palette | PARTIALLY RESOLVED | Authorize G1 SVG copy-in + favicon behaviour | Production branding | Production asset adoption | Prototype/dev work |
| D17 | Domain acquisition | OPEN | Register planned domains | Enables DNS/TLS | All public hosting | All build work |
| D18 | Address publication | OPEN | Keep unpublished until confirmed | Honesty preserved | Contact page address fields | Everything else |
| D19 | Contact channels + form handling | OPEN | Supply approved channels; approve privacy-first form handling | Real contact page + form go-live | Form/contact go-live | Site build, other pages |
| D20 | Production sitemap/page set | OPEN | Confirm six pages + `/privacy` + `/terms` | Locks URL set | Production build scope | Prototype work |
| D21 | Product descriptions/status claims | OPEN | Confirm Biashara Flow public listing | Removes reversibility notice | Biashara listing on site | Other content |
| D22 | Stack/hosting topology | OPEN | Confirm static hand-authored + shared VPS with isolation | Locks deployment design | Deployment | Build |
| D23 | TLS/DNS operational details | OPEN | Let's Encrypt + chosen DNS host | Enables HTTPS | Deployment | Build |
| D24 | Analytics/cookies | OPEN | Keep none (default) | Simplest compliance | Only if wanted | Everything |
| D25 | CMS/editorial workflow | OPEN | Keep static-files default | Simplest operations | Only if volume demands | Everything |

**Work continuing despite open decisions** (per the roadmap's activity-specific
gating): website build polish, privacy/terms drafting, WIFI portal fix,
reconciliation, dashboard v1, Biashara hardening — none of these require an
open decision to *start*; decisions gate *publication/deployment/live*.

---

## 12. Companion deliverables

- **B:** `docs/CIVOLINK_DESKTOP_TOOLS_AND_API_GATEWAY_STRATEGY.md` — desktop-tool evaluation matrix, API-gateway necessity assessment, integration boundaries, technology choices.
- **C:** `docs/CIVOLINK_PRODUCTION_GO_LIVE_CHECKLIST.md` — actionable pre-launch/deployment/post-deployment/security/recovery/operations checks for the website, WIFI and Biashara Flow.
- **D:** `docs/CIVOLINK_U003_2_COMPLETION_REPORT.md` — files, evidence, validation, Git preservation.

## 13. Preservation statement

No file outside `docs/` and the four deliverables was created or modified;
external projects untouched; no commit/push; all decisions unchanged. Git
baseline `main` @ `1bf0b2f` with 29 pre-existing modified/untracked entries
preserved (see completion report §validation for the post-work comparison).

**End of master plan.**
