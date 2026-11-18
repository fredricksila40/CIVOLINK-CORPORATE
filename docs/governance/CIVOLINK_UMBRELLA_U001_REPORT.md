# CIVOLINK ENTERPRISES — U-001: Umbrella Production Architecture and Readiness Definition

| Item | Value |
|---|---|
| **Date** | 2026-11-09 |
| **Repository** | `E:\Documents\VS\WIFI` (branch `main`, HEAD `1bf0b2fe717ae916afd23a4dd3bb3d92c974fa1b`) |
| **Task type** | Architecture definition, business identity alignment and production-readiness assessment |
| **Scope** | CIVOLINK umbrella corporate website only |
| **Authorization** | OWNER-AUTHORIZED PLANNING AND DOCUMENTATION TASK |
| **Production implementation** | NOT AUTHORIZED |
| **Hosting / DNS / domain / deployment** | NOT AUTHORIZED |
| **Reference-suite modification** | NOT AUTHORIZED (suite left byte-identical) |
| **Final status** | **VERIFIED (documentation task)** — architecture and readiness definition delivered; the umbrella production website remains **NOT IMPLEMENTED** |

---

## 1. Repository inspection and state

### 1.1 Root, branch, HEAD

| Item | Value | Evidence |
|---|---|---|
| Repository root | `E:\Documents\VS\WIFI` | `git rev-parse --show-toplevel` |
| Branch | `main` (tracks `origin/main`) | `git status -sb` |
| HEAD | `1bf0b2fe717ae916afd23a4dd3bb3d92c974fa1b` | `git rev-parse HEAD` |
| HEAD subject | `feat(provisioning): implement secure RouterOS v7 TLS provisioning and retry engine` | `git log -1 --format=%s` |
| Remote | `origin` → `https://github.com/fredricksila40/CIVOLINK_WIFI.git` | `git remote -v` |
| Commit / push during U-001 | **none** | `git log` unchanged; no push issued |

### 1.2 Initial Git status (at U-001 start — recorded, not cleaned)

| Class | Count | Items |
|---|---|---|
| Staged changes | 0 | — |
| Unstaged modified | **9** | `.gitignore`, `README.md`, `backend/check_status.php`, `backend/common.php`, `backend/db.php`, `backend/pay.php`, `backend/provision.php`, `backend/schema.sql`, `backend/webhook.php` |
| Untracked | **10** | `docs/`, `PHASE_1B_AUDIT_REPORT.md`, `PHASE_1B_FINAL_REPORT.md`, `backend/Payment/`, `backend/tests/`, `composer.json`, `composer.lock`, `phpunit.xml`, `.phpunit.result.cache` |

**The working tree was NOT clean and remains NOT clean.** All of the above is pre-existing uncommitted work belonging to other sessions. U-001 did not read, characterize, revert, stage or claim any of it, and did not run `git add`, `git commit`, `git checkout`, `git restore`, `git reset` or any other history-altering command.

### 1.3 Reference-suite baseline

| Item | Value |
|---|---|
| Location | `docs/umbrella-reference/` |
| Contents | 6 HTML pages + `assets/css/styles.css` + `assets/js/main.js` + `assets/icons/civolink-mark.svg` + `README.md` + `evidence/` (21 PNG + `verification-report.json`) — 33 files |
| Prior verification | 255/255 local checks passed (T-016) |
| Integrity during U-001 | aggregate SHA-256 over all 33 files captured before and after work: `76D60A8F21125B39BB80421C826F984C3F2503D0FB5DD98979B8ADC4D30A30F5` — **identical** |
| Last content write before U-001 | 2026-11-09 11:16 (suite build window) |

---

## 2. Files inspected

**Read-only inspection:** repository root, branch/HEAD/status/log/remote; `docs/umbrella-reference/` full inventory (file names, sizes, mtimes); the six pages `index.html`, `products.html`, `control-center.html`, `developers.html`, `about.html`; `assets/css/styles.css` (design tokens); `assets/js/main.js`; `docs/umbrella-reference/README.md`; `evidence/verification-report.json`.

**Governance documents read to match structure and preserve consistency:** `docs/OWNER_DECISIONS_REGISTER.md` (D1–D13), `docs/IMPLEMENTATION_ROADMAP.md` (Phases 0–4, §T, §T.1, §L, §S, §U), `docs/PROJECT_PROGRESS_REGISTER.md` (status vocabulary, task register T-001…T-016, current state, change history), `docs/PRODUCTION_BUILD_MANIFEST.md` (§6 deployment boundaries), `docs/CLI_AGENT_RULES.md`, root `README.md`.

**Not inspected, not modified:** `backend/**`, root `login.html`, `docs/url-reference/**`, `cert.pem`, `Documentation/**`, any credential or secret file. No file was opened for writing outside the deliverables listed in §16.

---

## 3. Business identity alignment

### 3.1 Registered business identity — `OWNER-SUPPLIED`, not independently verified

| Field | Value |
|---|---|
| Registered business name | **CIVOLINK ENTERPRISES** |
| Registration number | **BN-55SLLRED** |
| Registered address | Kenyatta Avenue, Nairobi, Starehe District, CBD |
| Postal address | P.O. Box 30470, 00100 – G.P.O Nairobi, Kenya |

No certificate or registry extract was examined. Verification against the original registration certificate is a **U-002 exit gate**, not a U-001 activity.

### 3.2 Three distinct identities (never conflated)

| Layer | Name | Where it appears |
|---|---|---|
| Legal entity | CIVOLINK ENTERPRISES | footer identity block, `/about`, privacy/terms, `/contact`, JSON-LD `legalName` |
| Public brand | CIVOLINK | logo, navigation, headings, marketing copy |
| Proposed website | `civolink.com` | planned-domain table only, rendered as styled non-clickable text |

### 3.3 Registered vs operating address

Kenyatta Avenue is recorded as the **registered** address. Whether the business also operates from it is unknown → decision **D18**. Until answered, the site publishes only the registered address (labelled as registered) plus the postal address. No operating address is invented.

### 3.4 Language rules (binding)

- Never describe CIVOLINK ENTERPRISES as a limited company, incorporated company, or `CIVOLINK ENTERPRISES LTD`.
- Never invent an incorporation date, directors, shareholders, licences, awards, customer counts, uptime, coverage or revenue.
- Never present owner-supplied identity details as independently verified.
- Never present a registered address as an operating address.

---

## 4. Corporate positioning — `PROPOSED` (D14, D15)

| Element | Proposed wording |
|---|---|
| Corporate description | CIVOLINK ENTERPRISES is a Kenyan-registered technology business providing an umbrella ecosystem of independently engineered digital products and services. |
| Mission | To deliver practical, independently engineered digital solutions that support connectivity, business operations and digital platforms — each standing on its own engineering while presenting one coherent market face. |
| Vision | To be a credible Kenyan technology business with potential international reach, recognised for independently built products, transparent architecture and customer-focused service — without inflated claims or unverified achievements. |
| Brand promise | Independent technology solutions presented as one coherent market face, where each product stands on its own engineering and states its own value — no cross-product dependencies, no inflated capabilities, no unverified achievements. |
| Target customers | SMEs in Kenya seeking connectivity and business-management solutions; developers and integrators evaluating independently built, API-compatible systems; regional businesses needing hotspot or business-management capability; international evaluators assessing independently built digital products. |
| Service categories | 1. CIVOLINK WIFI — managed hotspot connectivity · 2. Biashara Flow — business and enterprise management platform · 3. CIVOLINK corporate website — umbrella brand, product discovery, contact routing. |

All wording is draft. **Blocked by D14 (positioning) and D15 (tagline/voice).**

---

## 5. Product and platform architecture

| Platform | Role | Engineering boundary | State |
|---|---|---|---|
| CIVOLINK corporate website | Umbrella brand, product discovery, contact routing | Static content only at launch; no backend, database, auth, analytics | `NOT IMPLEMENTED` |
| CIVOLINK WIFI | Managed hotspot connectivity | Own backend, own SQLite database, own security boundaries, own release cycle | code `VERIFIED` in repo; production `NOT IMPLEMENTED` |
| Biashara Flow | Business and enterprise management platform | Same independence as CIVOLINK WIFI | `PLANNED` |
| Future products | Separate approval required | Same independence framework | `PLANNED` |

**Independence principles (non-negotiable):** shared branding, navigation and corporate ownership do **not** create shared authentication, databases or privileged access. Each product retains independent deployment, database, backend services, security boundaries, release cycles and operational responsibilities.

Concretely: the umbrella site carries no WIFI payment/webhook/provisioning code and links no customer into those flows; it shares no database, PHP-FPM pool, system user or session store with the WIFI backend even on one VPS; there is no central account service (`accounts.civolink.com` remains a future concept requiring its own identity architecture); website content management never grants access to application administration, customer records, payment systems or router infrastructure; no CMS is a dependency of any product. **Do not merge CIVOLINK WIFI or Biashara Flow into the corporate website backend.**

---

## 6. Domain and subdomain architecture — `PLANNED` (§D13)

| Domain | Intended role | Evidence state |
|---|---|---|
| `civolink.com` | Corporate website / umbrella platform | `PLANNED` — no registration, DNS or deployment evidence |
| `wifi.civolink.com` | CIVOLINK WIFI | `PLANNED` |
| `biashara.civolink.com` | Biashara Flow | `PLANNED` |
| `docs.civolink.com` | Documentation and support | `PLANNED` (future) |
| `accounts.civolink.com` | Potential central identity service | `PLANNED` (future concept; separate decision required) |

No domain may be described as registered, controlled or live without evidence (D17). Planned domains stay rendered as styled text, never clickable links, until each one resolves. No DNS, registrar or certificate action was taken (`NOT AUTHORIZED`).

---

## 7. Reference-suite page recommendations (retain / rename / defer / replace)

| # | Current file | Decision | Rationale | Required change before publication |
|---|---|---|---|---|
| 1 | `index.html` | **Retain with modifications** → `/` | Sound homepage structure | Add registered-identity block; retagline only if D15 approved; keep planned-domain table non-clickable |
| 2 | `products.html` | **Retain with modifications** → `/products` | Correct product-discovery page with explicit status labels | Copy subject to D21; no invented pricing/dates/coverage; badges only where the status is true |
| 3 | `control-center.html` | **Defer from initial launch**; if revived **rename → `platforms.html`, "Our Platforms"** | Built almost entirely on demonstration content (directory statuses, health presentation *model*, `stat-strip` counts, central-account concept) — none publishable today; "Control Center" wrongly implies a usable customer dashboard | Remove health model, all status/health labels, all counts and the central-account concept; keep only architecture-intent and independence narrative; retitle, rename, re-verify |
| 4 | `developers.html` | **Rename → `technology.html` ("Technology")**, retain with modifications | Architecture, security and independence narrative is genuine credibility content that is true without an API; the illustrative payload examples imply an API that does not exist | Remove the illustrative payload block and all `example.invalid` samples from public view (defer to future `docs.civolink.com`); retitle; re-verify |
| 5 | `about.html` | **Retain with modifications** → `/about` | Correct identity/vision page | Add registered identity, registration number, postal address; remove the defensive "no awards claimed" hedging; mission/vision/values subject to D14 |
| 6 | `contact.html` | **Retain with modifications** → `/contact` | Correct contact-routing structure | Add registered + postal address; publish only D19-approved channels; keep explicit placeholders otherwise; replace the static demonstration form with a real server-side endpoint in U-003 **or remove it** — it must never be presented as sending mail |

**Naming answers requested by the brief:** `control-center` → deferred; if revived, **"Our Platforms"** (chosen over "Platform Ecosystem" as plainer and over "Technology Overview" because `/technology` takes that name). `developers` → **renamed, not deferred**, because its core content is an engineering-principles narrative rather than an API claim.

---

## 8. Recommended production sitemap — `PROPOSED` (D20)

### Launch set (7 pages)

| URL | Page | Source |
|---|---|---|
| `/` | Home | `index.html` (modified) |
| `/about` | About CIVOLINK | `about.html` (modified) |
| `/products` | Products and services | `products.html` (modified) |
| `/technology` | Technology | `developers.html` (renamed + modified) |
| `/contact` | Contact | `contact.html` (modified) |
| `/privacy` | Privacy policy | **new** — required before any form is live |
| `/terms` | Terms of use | **new** — required before any form is live |

### Deferred

| Page | Source | Reason | Revisit trigger |
|---|---|---|---|
| Our Platforms | `control-center.html` | Demonstration content only (§7) | Two products live with real status to describe |
| Developers / docs | payload section, future `docs.civolink.com` | No public API exists | First real public API contract |
| Per-product sites | `wifi.`, `biashara.` | Products not launched; domains unregistered | Product launch + D17 |
| Accounts / SSO | `accounts.civolink.com` | Requires separate identity architecture (§D13) | Separate architecture decision |

`sitemap.xml` and `robots.txt` ship only on the final hostname, and only with URLs that resolve. Canonical URLs, per-page title/description, single `<h1>`, Open Graph tags and JSON-LD `Organization` (`legalName` = CIVOLINK ENTERPRISES) are build requirements.

---

## 9. Brand identity and design governance — `PROPOSED` (D16)

| Role | Value |
|---|---|
| Foundation (deep navy) | `#071c33` / `#0b2747` / `#123a63` |
| Technology accent (teal) | `#0d9488` / `#12b5a5` |
| Secondary accent (cyan) | `#38c6d9` |
| Supporting blue | `#1f6fe0` |
| Status — positive | `#0f8f5f` on `#e6f6ef` |
| Status — planned / warning | `#9a5c05` on `#fdf2e0` |
| Neutral background | `#f4f7fb` |
| Text | `#0e1b2c` → `#5a6b80` |

**This palette is a proposed direction, not an approved brand standard.** The `civolink-mark.svg` mark is the working mark until D16 approves it as official.

Production rules carried forward: system font stack only (no web-font download, no third-party font CDN); one stylesheet with CSS custom properties for every token; reusable component classes; `prefers-reduced-motion` respected; visible focus indicator on every interactive element; skip link; single `<h1>`; semantic landmarks. **A status badge may only assert a status that is true** — a "Live" badge on a page with no live service is a defect, not a style choice.

Accessibility target: **WCAG 2.2 AA**, verified in U-004 (keyboard, focus order, contrast, reflow at 320 px, form labels, error identification).

---

## 10. Corporate contact and legal information

| Field | State | Source |
|---|---|---|
| Registered business name | available | §3.1 |
| Registration number | available | §3.1 |
| Registered address | available | §3.1 |
| Postal address | available | §3.1 |
| Public business email | **missing — D19** | owner to provide or decline |
| Business telephone | **missing — D19** | owner to provide or decline |
| WhatsApp | **missing — D19** | owner to decide include/exclude |
| Operating location | **missing — D18** | owner to confirm if different from the registered address |
| Social accounts | **missing — D19** | owner to confirm, decline or specify platforms |
| Support channels and hours | **missing — D19** | owner to define |

Nothing in this list may be invented or filled with a placeholder that looks real.

**Legal artifacts required before the contact form is live:** privacy policy (what is collected, why, legal basis, retention, contact point, data-subject rights); terms of use (site use, accuracy/no-warranty, IP, liability, governing law); contact-form data handling (server-side processing only, validated input, rate limiting, spam protection, explicit retention); cookie/analytics disclosure (only if D24 permits — default is none); incident-handling contact point.

**Kenya Data Protection Act, 2019:** applies to any personal data processed through the contact form. The existing static demonstration form must **not** be presented as a functioning enquiry service, and no form may go live before the privacy policy is published and the processing path is server-side.

---

## 11. Production technology recommendation — `PROPOSED` (D22, D23)

| Layer | Recommendation | Class |
|---|---|---|
| Content authoring | Hand-authored semantic HTML5 derived from the reference suite; no client-side framework | `PROPOSED` |
| Build step | None at launch; add minify/asset-hash only if it pays for itself | `PROPOSED` |
| Web server | **Nginx** — owner-approved production web server for the umbrella site | `OWNER-SUPPLIED` |
| Hosting | The already-approved VPS (§D8/§D13), Ubuntu LTS | `PROPOSED` |
| TLS | Let's Encrypt or equivalent, automated renewal, HTTP→HTTPS redirect, HSTS only after the hostname is stable | `PROPOSED` |
| Backend | **Only** a contact-form endpoint (PHP-FPM per §D8 direction, or a small isolated service): own pool, own user, own logs | `PROPOSED` |
| Database | **None at launch** — no accounts, no sessions, no CMS | `PROPOSED` |
| CMS | **None at launch**; §D13 permits an optional future content service that must never become a dependency | `PLANNED` |
| Analytics / cookies | **None by default**; only on D24, privacy-preserving and cookieless preferred | `BLOCKED` |
| CDN | Not required at launch; must never log, cache or intercept form POSTs | `PROPOSED` |
| CI/CD | Optional; verified copy + checksum is sufficient at this volume | `PROPOSED` |
| Search | `sitemap.xml`, `robots.txt`, canonicals, JSON-LD `Organization`, per-page metadata | `PROPOSED` |

**Why static-first:** seven content pages with low change frequency, no personalisation and no accounts need no application server. Static delivery gives the smallest attack surface, no runtime dependency for content, no build toolchain to maintain, fastest loads, cheapest hosting, and the **lowest coupling to CIVOLINK WIFI** — which is what §D13 requires. It is also exactly what has already been verified (255/255), so production starts from a proven baseline rather than a rewrite.

**Revisit triggers (not decisions now):** editorial workflow for non-technical publishers → D25; multi-language; personalisation; any account feature → separate identity architecture first.

**Isolation if the umbrella site shares the VPS with the WIFI backend** (all mandatory): separate Nginx `server` block and document root; separate PHP-FPM pool and system user; no shared database file, session directory or `.env`; separate logs and deploy credentials; least-privilege permissions; document root contains only static content plus the single contact endpoint — never `backend/`, never `docs/`. Recommended future state: split hosts when traffic, risk or availability requirements justify it.

**Deliberately not used:** React/Vue/Next SSR, WordPress as foundation (§D13), any shared auth (§D13), any shared database, any account system at launch.

---

## 12. Security and operational readiness

| Control | Requirement | State |
|---|---|---|
| HTTPS | Mandatory for production | `NOT IMPLEMENTED` |
| Security headers | HSTS (after hostname confirmation), CSP, `X-Frame-Options`, `Referrer-Policy`, `X-Content-Type-Options` | `NOT IMPLEMENTED` |
| Contact-form processing | Server-side only; no static form may claim to send mail | `NOT IMPLEMENTED` (current form is a demonstration) |
| Spam protection + rate limiting | Required before the form is live | `NOT IMPLEMENTED` |
| Input validation / output encoding | Endpoint validation; no `innerHTML` with untrusted data | `NOT IMPLEMENTED` |
| Secret management | No secrets in static content; endpoint secrets outside the web root, never committed | `VERIFIED` (suite contains none) |
| Least-privilege deployment | Dedicated deploy user; no root for web files; no credentials shared with the WIFI backend | `NOT IMPLEMENTED` |
| Backups and recovery | Content backup + rollback to previous release | `NOT IMPLEMENTED` |
| Logging and monitoring | Nginx access/error logs, endpoint error log, uptime check, alert recipient | `NOT IMPLEMENTED` |
| Dependency maintenance | Suite has zero runtime dependencies; endpoint dependencies pinned and reviewed | `VERIFIED` (suite) / `NOT IMPLEMENTED` (endpoint) |
| Error handling | Static 404/500; no stack traces or paths exposed | `NOT IMPLEMENTED` |
| Accessibility and compatibility | WCAG 2.2 AA; 375/768/1440 verified | suite `VERIFIED` (255/255); production `NOT IMPLEMENTED` |
| SEO and metadata | Title/description/canonical/OG/JSON-LD per page | suite basics `VERIFIED`; production `NOT IMPLEMENTED` |
| Rollback strategy | Previous release retained; documented revert step | `NOT IMPLEMENTED` |
| Separation from WIFI systems | No payment/webhook/provisioning/router code; no shared auth or DB | design constraint `VERIFIED` (§D13); production `NOT IMPLEMENTED` |

**Blocking rule:** no row may be marked `VERIFIED` for the production site until independently checked in U-004 with recorded evidence.

---

## 13. Delivery phases U-001 … U-006

| Phase | Purpose | Entry | Exit criteria | State |
|---|---|---|---|---|
| **U-001** | Architecture and readiness definition | Owner authorization | Architecture document published; D14–D25 registered; governance updated; suite unchanged | **COMPLETED by this task** |
| **U-002** | Identity, content and legal readiness | D14, D15, D18, D19, D20, D21 | Identity verified against the certificate; approved copy pack; identity blocks written; privacy + terms drafted; contact list final; product claims matched to reality | `NOT STARTED` |
| **U-003** | Production build | U-002 exit; D16, D22, D23 | Static site from approved content; renames/deferrals applied; no demonstration content; endpoint only if D19 approved; approved mark/palette | `NOT STARTED` |
| **U-004** | Security, accessibility and SEO verification | U-003 exit | Independent pass with recorded evidence (headers/TLS review, WCAG 2.2 AA, links/anchors/assets, metadata, no external requests, no demonstration content, no forbidden claims) | `NOT STARTED` |
| **U-005** | Domain, DNS and hosting preparation | D17, D23 | Domain under owner-controlled registrar; DNS plan; TLS plan; isolation configured; deploy + rollback runbook. **Deployment needs separate owner authorization** | `NOT STARTED` |
| **U-006** | Launch and post-launch operations | U-004 + U-005 exit **and** explicit owner launch authorization | Site live on approved hostname; monitoring active; rollback proven; privacy/terms published; register and manifest updated to real state | `NOT STARTED` |

**Recommended sequencing adjustments (proposals only, no authority change):** (1) run U-004 checks continuously during U-003 and keep U-004 as the independent formal gate — a contrast defect costs minutes to fix during the build and a release to fix after acceptance; (2) parallelize U-005 with U-003/U-004 once D17 and D23 are answered, since domain and hosting work does not depend on page content. Neither permits deployment without owner authorization.

---

## 14. Owner decisions required — D14 … D25 (all `BLOCKED`)

| ID | Decision | Blocks | Default if unanswered |
|---|---|---|---|
| **D14** | Corporate positioning: description, mission, vision, values, audience | U-002 home/about copy | §4 stays draft; no positioning claim published |
| **D15** | Tagline / hero line and brand voice; CIVOLINK vs CIVOLINK ENTERPRISES usage rules | U-002 copy tone; U-003 headings | Conservative usage (§3.2–§3.3) continues |
| **D16** | Logo/mark, favicon and colour palette approval | U-003 build | Suite mark and navy/teal palette stay a labelled working proposal, not official |
| **D17** | Domain acquisition: which domains, registrar, account owner | U-005 | No registration, no DNS action, no purchase |
| **D18** | Operating address: is Kenyatta Avenue also the operating location? | U-002 contact/legal copy | Publish only registered + postal address, labelled as registered |
| **D19** | Public contact channels, support hours and form data handling | U-002/U-003 contact page; privacy policy; form go-live | Contact page keeps placeholders; **no form goes live** |
| **D20** | Production sitemap: which pages launch and which defer (§8) | U-002/U-003 page set | §8 launch set stands as the plan; `control-center` stays deferred |
| **D21** | Product descriptions and status claims for CIVOLINK WIFI and Biashara Flow | U-002 products copy | Reference-suite wording with explicit status labels only |
| **D22** | Technology stack and hosting topology (static vs minimal generator; same-VPS isolation vs separate host) | U-003 build | Static hand-authored HTML; same VPS with the full §11 isolation set |
| **D23** | Hosting/TLS/DNS operational details (Nginx already approved) | U-005 | No deployment; Nginx remains the stated target |
| **D24** | Analytics, cookies and consent model | U-003/U-005 | No analytics, no non-essential cookies |
| **D25** | Future content management / editorial workflow | post-launch U-006+ | No CMS; content edited as static files |

D14–D25 do not reopen or replace §D13 (umbrella independence, planned domains, optional WordPress) or roadmap §U items U2–U6.

---

## 15. Risks, assumptions and dependencies

### Risks

| # | Risk | Impact | Mitigation |
|---|---|---|---|
| R-U1 | Owner-supplied identity published without verification | Legal and credibility exposure | U-002 certificate-verification gate; label as unverified until then |
| R-U2 | Parallel sessions producing conflicting/duplicate governance records (**observed during U-001**) | Corrupted registers, contradictory status | Single-writer rule per document; record provenance and hashes; stop and report on conflict |
| R-U3 | Demonstration content shipped as fact (metrics, statuses, health) | Loss of trust; misleading statements | D20 page set; §7 deferrals; explicit U-004 content-audit checklist |
| R-U4 | Target domain unavailable or third-party held | Launch blocked | Raise D17 in U-002; agree fallback naming before U-005 |
| R-U5 | Contact form live without legal basis or protection | Kenya Data Protection Act, 2019 exposure | No form before privacy policy + server-side processing + spam/rate limiting |
| R-U6 | Shared VPS couples site and backend availability | One host failure affects both | §11 isolation set; split hosts when risk justifies |
| R-U7 | Scope creep into auth, accounts, SSO or product backends | Breaches §D13 independence | §5.3 allow/deny list enforced as a U-003 acceptance criterion |
| R-U8 | Proposed palette/mark treated as approved brand | Rework after launch | D16 gate; label the palette as proposed everywhere |
| R-U9 | Reference suite modified during production work | Loss of verified baseline | Suite frozen; production derives from a copy; hash re-checked |
| R-U10 | Owner decisions unanswered | Phases stall | D14–D25 defaults recorded so planning continues without inventing answers |

### Assumptions

Nginx is the approved umbrella web server (`OWNER-SUPPLIED`) · VPS hosting is the approved target with only details open (§D8/§D13) · the launch set is seven pages in English for a Kenyan-first audience · no user accounts, personalisation or e-commerce at launch · static delivery is sufficient for the launch content volume.

### Dependencies

Owner answers to D14–D25 · verification of the registration certificate (U-002) · domain availability and registrar access (D17/U-005) · TLS authority and DNS access (D23/U-005) · approval of product status claims (D21) before any "live" badge.

---

## 16. Deliverables produced and files changed

| File | Action | Purpose |
|---|---|---|
| `docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md` | **created** | Primary umbrella architecture reference (evidence classes, identity, positioning, product/platform architecture, domains, page decisions, sitemap, brand governance, contact/legal, technology, security, U-001–U-006, D14–D25, risks) |
| `docs/OWNER_DECISIONS_REGISTER.md` | updated (revision 2 → 3) | Added D14–D25; D1–D13 untouched |
| `docs/IMPLEMENTATION_ROADMAP.md` | updated | Added §U.1 delivery phases U-001–U-006; §U unresolved-decisions line extended to D1–D25 |
| `docs/PROJECT_PROGRESS_REGISTER.md` | updated | Current-state bullet, T-017 task row, change-history row |
| `docs/PRODUCTION_BUILD_MANIFEST.md` | updated | §6 cross-reference confirming `docs/` (incl. the architecture doc) stays excluded from every WIFI artifact |
| `docs/umbrella-reference/README.md` | updated | Production-architecture pointer + registered-identity block; §9 mapped to D14–D25 |
| `README.md` (root) | updated | Concise pointer to the architecture document and its NOT IMPLEMENTED status |
| `CIVOLINK_UMBRELLA_U001_REPORT.md` | **created** (this file) | Task report, evidence, preserved superseded draft |

**Not touched:** every reference-suite HTML/CSS/JS/SVG file (aggregate SHA-256 unchanged), `docs/url-reference/`, root `login.html`, `backend/**`, `cert.pem`, all credentials, and every pre-existing untracked/modified file listed in §1.2. No git commit, push, checkout, restore, reset or any other history-altering command was run.

---

## 17. Verification, limitations and final status

### Verification performed

| Check | Result |
|---|---|
| Reference-suite aggregate SHA-256 before/after | `76D60A8F21125B39BB80421C826F984C3F2503D0FB5DD98979B8ADC4D30A30F5` — **identical** (33 files) |
| `git status` before/after | same 9 modified + 10 untracked pre-existing entries; **no new unexpected changes** |
| Branch/HEAD re-check | `main` @ `1bf0b2fe717ae916afd23a4dd3bb3d92c974fa1b`, unchanged |
| Commit/push issued | none |
| Governance cross-references | D14–D25 present in decisions register; §U.1 present in roadmap; T-017 present in progress register; manifest §6 and both READMEs carry pointers |
| Forbidden-work scan | no production code, hosting, DNS, domain, TLS, CMS, analytics, endpoint or deployment performed; no reference-suite HTML/CSS/JS modified |

### Limitations (stated plainly)

1. **Nothing was implemented.** U-001 is a planning and documentation task. The umbrella production website does not exist; `civolink.com` is not registered, not hosted and not deployed by anything in this task.
2. **Business identity is unverified.** BN-55SLLRED and both addresses are `OWNER-SUPPLIED`; no certificate was examined.
3. **All positioning, brand, sitemap, product-claim and technology recommendations are `PROPOSED`** until D14–D25 are answered.
4. **No domain, DNS, TLS or hosting fact was verified** — none exists to verify.
5. **The reference suite remains a reference suite.** Its 255/255 result covers the static design only, not any production site.
6. **The pre-existing working-tree modifications were not reviewed, tested or claimed** by this task; they belong to other sessions.

### Conflict record (`docs/CLI_AGENT_RULES.md` §11)

An external session created and grew `CIVOLINK_UMBRELLA_U001_REPORT.md` (this path) during the U-001 window, producing an interleaved, internally contradictory draft that also asserted a clean working tree — contradicted by `git status` (9 modified + 10 untracked). The conflict was reported to the owner rather than clobbered. The owner directed U-001 to wait for that writer to go idle (2 minutes of no change confirmed) and then take over. The superseded draft is **preserved verbatim in Appendix A** below with its SHA-256; no unique information was lost, and its factual claims are corrected in §1.2.

### Final status

**U-001: VERIFIED (documentation task).** Architecture and readiness definition delivered; D14–D25 registered; governance updated; reference suite unchanged.

**Umbrella production website: NOT IMPLEMENTED.** Next phase U-002 is `BLOCKED` pending owner decisions (minimum: D14, D19, D20, D21).

**Production implementation, hosting, DNS, domain registration and deployment: NOT AUTHORIZED by this task.**

---

## Appendix A — preserved superseded parallel-session draft

The content below is the **verbatim, byte-preserved** output of the external session that previously held this file, retained so that nothing is lost. It is **not** the U-001 report and its factual claims are superseded by §1 and §17 of this document (notably: it asserted *"Working tree clean: Yes"* and *"Unstaged modified: None"*, both false; and its sections were interleaved with duplicate `## 3.`/`## 4.`/`## 7.` headings).

| Property | Value |
|---|---|
| SHA-256 | `2FFAD9B3750EA847793430FE560CAF4EB57C203068EA1D5B91A6EC6FF99A6736` |
| Size | 25,047 bytes / 431 lines |
| Last written | 2026-11-09 13:00:12 |
| Disposition | superseded by this document; preserved here in full |

````text
test line 2
Test content
# CIVOLINK ENTERPRISES — U-001: Umbrella Production Architecture and Readiness Definition
## 1. Repository Inspection and State

### 1.1 Repository root, branch and HEAD

| Item | Value |
|---|---|
| Repository root | `E:\Documents\VS\WIFI` |
| Branch | `main` (tracks `origin/main`) |
| HEAD | `1bf0b2fe717ae916afd23a4dd3bb3d92c974fa1b` |
| HEAD subject | `feat(provisioning): implement secure RouterOS v7 TLS provisioning and retry engine` |
| Remote | `origin` → `https://github.com/fredricksila40/CIVOLINK_WIFI.git` |
| Upstream | `origin/main` |
| Staged changes | None |
| Unstaged modified | None |
| Untracked files | 41 |
| Working tree clean | Yes (no modifications) |
| Commit/push performed | No |

### 1.2 Initial Git status

```
M .gitignore
M README.md
M backend/check_status.php
## 3. Business Identity Alignment

### 3.1 Registered business identity

- **Registered business name:** CIVOLINK ENTERPRISES
## 3.2 Recommended corporate positioning

| Element | Recommendation | Evidence/Rationale |
|---|---|---|
| **Corporate description** | CIVOLINK ENTERPRISES is a Kenyan-registered technology business providing an umbrella ecosystem of independently engineered digital products and services. | Owner-supplied registration details; suite confirms "independent digital products" |
| **Mission** | To deliver practical, independently engineered digital solutions that empower connectivity, business operations and digital platforms — each standing on their own engineering while presenting a coherent market face. | Aligns with suite hero text: "Practical technology, connected." |
| **Vision** | A credible Kenyan technology business with potential international reach, recognized for independently built products, transparent architecture, and customer-focused service — without inflated claims or unverified achievements. | Credible, achievable; avoids exaggeration |
| **Brand promise** | Independent technology solutions that present one coherent market face, where each product stands on its own engineering and presents its own value — no cross-product dependencies, no inflated capabilities, no unverified achievements. | Derived from suite's core principle: "each stand on their own engineering" |
| **Target customers and markets** | - SMEs in Kenya seeking connectivity and business management solutions<br>- Developers and integrators looking for independently built API-compatible systems<br>- Regional businesses requiring hotspot connectivity or business management<br>- International technology evaluators assessing independently built digital products | Based on product categories in suite (CIVOLINK WIFI, Biashara Flow) |
| **Business service categories** | 1. CIVOLINK WIFI — Managed hotspot connectivity<br>2. Biashara Flow — Business and enterprise management platform<br>3. Corporate website — umbrella brand platform, product discovery, contact routing | Directly from suite product structure |
| **Registered vs public identity** | - Registered: CIVOLINK ENTERPRISES (BN-55SLLRED), Kenyatta Avenue, Nairobi<br>- Public-facing: CIVOLINK<br>- Proposed website: `civolink.com` | Clear distinction per task requirements |

### 3.3 Key distinction

> **Registered business identity:** CIVOLINK ENTERPRISES (the legal entity, per BN-55SLLRED)  
> **Public-facing umbrella brand:** CIVOLINK  
> **Proposed corporate website:** `civolink.com`  

Do not describe CIVOLINK ENTERPRISES as a limited company, incorporated company, or `CIVOLINK ENTERPRISES LTD` unless separate incorporation evidence is provided.

---
- **Registration number:** BN-55SLLRED
- **Registered address:** Kenyatta Avenue, Nairobi, Starehe District, CBD
- **Postal address:** P.O. Box 30470, 00100 – G.P.O Nairobi, Kenya

**Distinction throughout:** CIVOLINK ENTERPRISES (legal entity) vs CIVOLINK (public-facing umbrella brand). Do not describe CIVOLINK ENTERPRISES as a limited company, incorporated company, or `CIVOLINK ENTERPRISES LTD` unless separate incorporation evidence is provided.

---
M backend/common.php
M backend/db.php
M backend/pay.php
M backend/provision.php
M backend/schema.sql
M backend/webhook.php
?? .phpunit.result.cache
?? PHASE_1B_FINAL_REPORT.md
?? backend/Payment/
?? backend/tests/
?? composer.json
?? composer.lock
?? phpunit.xml
?? docs/PAYHERO_CONTRACT.md
```

**Date:** 2026-11-09  
**Repository:** `E:\Documents\VS\WIFI`  
**Task type:** Architecture definition, business identity alignment and production readiness assessment  
**Scope:** CIVOLINK umbrella platform only  
**Authorization:** OWNER-AUTHORIZED PLANNING AND DOCUMENTATION TASK  
**Production implementation:** NOT AUTHORIZED  
**Deployment:** NOT AUTHORIZED

---
﻿## 4. CIVOLINK Corporate Positioning

### 4.1 Registered business identity

- **Registered business name:** CIVOLINK ENTERPRISES
- **Registration number:** BN-55SLLRED
- **Registered address:** Kenyatta Avenue, Nairobi, Starehe District, CBD
- **Postal address:** P.O. Box 30470, 00100 – G.P.O Nairobi, Kenya

**Distinction throughout:** CIVOLINK ENTERPRISES (legal entity) vs CIVOLINK (public-facing umbrella brand). Do not describe CIVOLINK ENTERPRISES as a limited company, incorporated company, or `CIVOLINK ENTERPRISES LTD` unless separate incorporation evidence is provided.

---

## 4. CIVOLINK Corporate Positioning

## 4.2 Recommended corporate positioning

| Element | Recommendation | Evidence/Rationale |
|---|---|---|
| **Corporate description** | CIVOLINK ENTERPRISES is a Kenyan-registered technology business providing an umbrella ecosystem of independently engineered digital products and services. | Owner-supplied registration details; suite confirms "independent digital products" |
| **Mission** | To deliver practical, independently engineered digital solutions that empower connectivity, business operations and digital platforms — each standing on their own engineering while presenting a coherent market face. | Aligns with suite hero text: "Practical technology, connected." |
| **Vision** | A credible Kenyan technology business with potential international reach, recognized for independently built products, transparent architecture, and customer-focused service — without inflated claims or unverified achievements. | Credible, achievable; avoids exaggeration |
| **Brand promise** | Independent technology solutions that present one coherent market face, where each product stands on its own engineering and presents its own value — no cross-product dependencies, no inflated capabilities, no unverified achievements. | Derived from suite's core principle: "each stand on their own engineering" |
| **Target customers and markets** | - SMEs in Kenya seeking connectivity and business management solutions<br>- Developers and integrators looking for independently built API-compatible systems<br>- Regional businesses requiring hotspot connectivity or business management<br>- International technology evaluators assessing independently built digital products | Based on product categories in suite (CIVOLINK WIFI, Biashara Flow) |
| **Business service categories** | 1. CIVOLINK WIFI — Managed hotspot connectivity<br>2. Biashara Flow — Business and enterprise management platform<br>3. Corporate website — umbrella brand platform, product discovery, contact routing | Directly from suite product structure |
| **Registered vs public identity** | - Registered: CIVOLINK ENTERPRISES (BN-55SLLRED), Kenyatta Avenue, Nairobi<br>- Public-facing: CIVOLINK<br>- Proposed website: `civolink.com` | Clear distinction per task requirements |

## 3. Product and Platform Architecture

### 3.1 Proposed umbrella structure

| Product | Role | Independence guarantees |
|---|---|---|
| **CIVOLINK** | Corporate website and umbrella brand | Independent deployment; no backend, database, auth, analytics; static HTML/CSS/JS |
| **CIVOLINK WIFI** | Connectivity and hotspot services | Independent application deployment, independent database, independent backend services, independent security boundaries, independent release cycle |
| **Biashara Flow** | Business and enterprise management platform | Same independence as CIVOLINK WIFI |
| **Future products** | To be developed under separate approval | Same independence framework |

### 3.2 Independence principles (critical)

> **Shared branding, navigation and corporate ownership must not automatically create shared authentication, databases or privileged access.**

Each product maintains independent:
- Application deployment
- Database
- Backend services
- Security boundaries
- Release cycles
- Operational responsibilities

**Do not merge CIVOLINK WIFI or Biashara Flow into the corporate website backend.**
### 4.3 Key distinction
## 5. Domain and Subdomain Architecture

| Domain | Intended purpose | Status (evidence-based) |
|---|---|---|
| `civolink.com` | Corporate website / umbrella platform | **Reference sample only** — suite explicitly states "No backend, database, auth, analytics or external service is connected. No claim of registration or deployment." |
| `wifi.civolink.com` | CIVOLINK WIFI | **Planned** — noted in suite footer as "planned"; separate reference suite exists at `docs/url-reference/` |
| `biashara.civolink.com` | Biashara Flow | **Planned** — noted in suite footer as "planned" |
| `docs.civolink.com` | Documentation and support | **Future** — noted as "future" in suite |
| `accounts.civolink.com` | Potential central identity service | **Future concept** — noted as "future concept" in suite |

**Critical restrictions:**
- Do **not** claim any domain is registered or controlled without evidence
- Do **not** modify DNS, hosting or certificates
- Do **not** implement centralized SSO or shared authentication
- `accounts.civolink.com` is a future option requiring a separate architecture decision
- The suite renders domains as styled text (`<span class="domain-ref">`), **never as clickable links** — no dead links

> **Registered business identity:** CIVOLINK ENTERPRISES (the legal entity, per BN-55SLLRED)  
> **Public-facing umbrella brand:** CIVOLINK  
> **Proposed corporate website:** `civolink.com`  

Do not describe CIVOLINK ENTERPRISES as a limited company, incorporated company, or `CIVOLINK ENTERPRISES LTD` unless separate incorporation evidence is provided.
## 7. Corporate Contact and Legal Information

**Owner-supplied information:**

| Field | Value |
|---|---|
| Registered business name | CIVOLINK ENTERPRISES |
| Registration number | BN-55SLLRED |
| Registered address | Kenyatta Avenue, Nairobi, Starehe District, CBD |
| Postal address | P.O. Box 30470, 00100 – G.P.O Nairobi, Kenya |

**Missing information requiring owner confirmation:**

| Field | Action required |
|---|---|
| Public business email | Owner to provide or decline |
| Business telephone number | Owner to provide or decline |
| WhatsApp contact | Owner to decide (include or exclude) |
| Actual operating location | Owner to confirm if different from registered address |
| Social media accounts | Owner to confirm, decline, or specify which platforms |
| Customer support channels | Owner to define |
| Business hours | Owner to define |

**Production contact page plan:**

- Use owner-supplied registered business name, registration number and postal address
- Identify all missing fields above as requiring owner confirmation
- Define requirements for:
  - Privacy policy (to be developed when contact form is operational)
  - Terms of use (to be developed when contact form is operational)
  - Contact form data handling (must use secure server-side processing; **existing static demonstration form must NOT be presented as functioning**)
  - Cookie and analytics disclosure (per Kenyan data protection obligations, where applicable)
  - Spam protection (required if contact form becomes operational)
  - Data retention (per owner policy and Kenyan Data Protection Act, 2019)
  - Security and incident handling (per owner policy)

**Kenyata Data Protection Act (2019):**  
Applies to any personal data processing. The production contact form must eventually use secure server-side processing. The existing static demonstration form must **not** be presented as a functioning enquiry service.

---
## 7. Corporate Contact and Legal Information
## 7. Corporate Contact and Legal Information

**Owner-supplied information:**

| Field | Value |
|---|---|
| Registered business name | CIVOLINK ENTERPRISES |
| Registration number | BN-55SLLRED |
| Registered address | Kenyatta Avenue, Nairobi, Starehe District, CBD |
| Postal address | P.O. Box 30470, 00100 – G.P.O Nairobi, Kenya |

**Missing information requiring owner confirmation:**

| Field | Action required |
|---|---|
| Public business email | Owner to provide or decline |
| Business telephone number | Owner to provide or decline |
| WhatsApp contact | Owner to decide (include or exclude) |
| Actual operating location | Owner to confirm if different from registered address |
| Social media accounts | Owner to confirm, decline, or specify which platforms |
| Customer support channels | Owner to define |
| Business hours | Owner to define |

**Production contact page plan:**

- Use owner-supplied registered business name, registration number and postal address
- Identify all missing fields above as requiring owner confirmation
- Define requirements for:
  - Privacy policy (to be developed when contact form is operational)
  - Terms of use (to be developed when contact form is operational)
  - Contact form data handling (must use secure server-side processing; **existing static demonstration form must NOT be presented as functioning**)
  - Cookie and analytics disclosure (per Kenyan data protection obligations, where applicable)
  - Spam protection (required if contact form becomes operational)
  - Data retention (per owner policy and Kenyan Data Protection Act, 2019)
  - Security and incident handling (per owner policy)

**Kenyata Data Protection Act (2019):**  
Applies to any personal data processing. The production contact form must eventually use secure server-side processing. The existing static demonstration form must **not** be presented as a functioning enquiry service.

---
## 7. Corporate Contact and Legal Information

**Owner-supplied information:**

| Field | Value |
|---|---|
| Registered business name | CIVOLINK ENTERPRISES |
| Registration number | BN-55SLLRED |
| Registered address | Kenyatta Avenue, Nairobi, Starehe District, CBD |
| Postal address | P.O. Box 30470, 00100 – G.P.O Nairobi, Kenya |
## 8. Security and Operational Readiness

**Production security baseline:**

| Control | Requirement | Status |
|---|---|---|
| HTTPS | Required for any production deployment | Not yet deployed |
| Security headers | Recommended: CSP, HSTS, X-Frame-Options | To be implemented on VPS |
| Contact-form processing | Must be secure server-side; **no static form may claim to send mail** | Existing form is demonstration only |
| Input validation and output encoding | Standard web security practices | To be implemented |
| Spam protection and rate limiting | Required if contact form becomes operational | To be implemented |
| Secret management | No secrets in the static suite; any backend must manage secrets | Suite has no secrets |
| Least-privilege deployment access | VPS user minimal privileges; no root operations for web files | To be configured |
| Backups and recovery | Required for any production deployment | To be configured |
| Logging and monitoring | Required for any production deployment | To be configured |
| Dependency maintenance | No external dependencies in static suite; any backend dependencies must be maintained | Suite has none |
| Error handling | Standard 404/500 pages; graceful degradation | To be implemented |
| Accessibility and browser compatibility | Suite verified: 255 tests passed, mobile+desktop, focus indicators, skip links | Reference standard — owner acceptance required |
| SEO and metadata | Suite includes appropriate meta tags | Reference standard — owner enhancement permitted |
| Deployment rollback strategy | Required for any production deployment | To be configured |

**Key restriction:** "Keep the umbrella website independent of CIVOLINK WIFI payment, webhook and router provisioning systems."

---
## 7. Security and Operational Readiness

**Production security baseline:**

| Control | Requirement | Status |
|---|---|---|
| HTTPS | Required for any production deployment | Not yet deployed |
| Security headers | Recommended: CSP, HSTS, X-Frame-Options | To be implemented on VPS |
| Contact-form processing | Must be secure server-side; **no static form may claim to send mail** | Existing form is demonstration only |
| Input validation and output encoding | Standard web security practices | To be implemented |
| Spam protection and rate limiting | Required if contact form becomes operational | To be implemented |
| Secret management | No secrets in the static suite; any backend must manage secrets | Suite has no secrets |
| Least-privilege deployment access | VPS user minimal privileges; no root operations for web files | To be configured |
| Backups and recovery | Required for any production deployment | To be configured |
| Logging and monitoring | Required for any production deployment | To be configured |
| Dependency maintenance | No external dependencies in static suite; any backend dependencies must be maintained | Suite has none |
| Error handling | Standard 404/500 pages; graceful degradation | To be implemented |
| Accessibility and browser compatibility | Suite verified: 255 tests passed, mobile+desktop, focus indicators, skip links | Reference standard — owner acceptance required |
| SEO and metadata | Suite includes appropriate meta tags | Reference standard — owner enhancement permitted |
| Deployment rollback strategy | Required for any production deployment | To be configured |

**Key restriction:** "Keep the umbrella website independent of CIVOLINK WIFI payment, webhook and router provisioning systems."

---

**Missing information requiring owner confirmation:**

| Field | Action required |
|---|---|
| Public business email | Owner to provide or decline |
| Business telephone number | Owner to provide or decline |
| WhatsApp contact | Owner to decide (include or exclude) |
| Actual operating location | Owner to confirm if different from registered address |
| Social media accounts | Owner to confirm, decline, or specify which platforms |
| Customer support channels | Owner to define |
| Business hours | Owner to define |

**Production contact page plan:**

- Use owner-supplied registered business name, registration number and postal address
- Identify all missing fields above as requiring owner confirmation
- Define requirements for:
  - Privacy policy (to be developed when contact form is operational)
  - Terms of use (to be developed when contact form is operational)
  - Contact form data handling (must use secure server-side processing; **existing static demonstration form must NOT be presented as functioning**)
  - Cookie and analytics disclosure (per Kenyan data protection obligations, where applicable)
  - Spam protection (required if contact form becomes operational)
  - Data retention (per owner policy and Kenyan Data Protection Act, 2019)
  - Security and incident handling (per owner policy)

**Kenyata Data Protection Act (2019):**  
Applies to any personal data processing. The production contact form must eventually use secure server-side processing. The existing static demonstration form must **not** be presented as a functioning enquiry service.

---
## 7. Corporate Contact and Legal Information

**Owner-supplied information:**

| Field | Value |
|---|---|
| Registered business name | CIVOLINK ENTERPRISES |
| Registration number | BN-55SLLRED |
| Registered address | Kenyatta Avenue, Nairobi, Starehe District, CBD |
| Postal address | P.O. Box 30470, 00100 – G.P.O Nairobi, Kenya |

**Missing information requiring owner confirmation:**

| Field | Action required |
|---|---|
| Public business email | Owner to provide or decline |
| Business telephone number | Owner to provide or decline |
| WhatsApp contact | Owner to decide (include or exclude) |
| Actual operating location | Owner to confirm if different from registered address |
| Social media accounts | Owner to confirm, decline, or specify which platforms |
| Customer support channels | Owner to define |
| Business hours | Owner to define |

**Production contact page plan:**

- Use owner-supplied registered business name, registration number and postal address
- Identify all missing fields above as requiring owner confirmation
- Define requirements for:
  - Privacy policy (to be developed when contact form is operational)
  - Terms of use (to be developed when contact form is operational)
  - Contact form data handling (must use secure server-side processing; **existing static demonstration form must NOT be presented as functioning**)
  - Cookie and analytics disclosure (per Kenyan data protection obligations, where applicable)
  - Spam protection (required if contact form becomes operational)
  - Data retention (per owner policy and Kenyan Data Protection Act, 2019)
  - Security and incident handling (per owner policy)

**Kenyata Data Protection Act (2019):**  
Applies to any personal data processing. The production contact form must eventually use secure server-side processing. The existing static demonstration form must **not** be presented as a functioning enquiry service.

---

**Owner-supplied information:**

| Field | Value |
|---|---|
| Registered business name | CIVOLINK ENTERPRISES |
| Registration number | BN-55SLLRED |
| Registered address | Kenyatta Avenue, Nairobi, Starehe District, CBD |
| Postal address | P.O. Box 30470, 00100 – G.P.O Nairobi, Kenya |

**Missing information requiring owner confirmation:**

| Field | Action required |
|---|---|
| Public business email | Owner to provide or decline |
| Business telephone number | Owner to provide or decline |
| WhatsApp contact | Owner to decide (include or exclude) |
| Actual operating location | Owner to confirm if different from registered address |
| Social media accounts | Owner to confirm, decline, or specify which platforms |
| Customer support channels | Owner to define |
| Business hours | Owner to define |

**Production contact page plan:**

- Use owner-supplied registered business name, registration number and postal address
- Identify all missing fields above as requiring owner confirmation
- Define requirements for:
  - Privacy policy (to be developed when contact form is operational)
  - Terms of use (to be developed when contact form is operational)
  - Contact form data handling (must use secure server-side processing; **existing static demonstration form must NOT be presented as functioning**)
  - Cookie and analytics disclosure (per Kenyan data protection obligations, where applicable)
  - Spam protection (required if contact form becomes operational)
  - Data retention (per owner policy and Kenyan Data Protection Act, 2019)
  - Security and incident handling (per owner policy)

**Kenyata Data Protection Act (2019):**  
Applies to any personal data processing. The production contact form must eventually use secure server-side processing. The existing static demonstration form must **not** be presented as a functioning enquiry service.

---
## 4. CIVOLINK Corporate Positioning

### 4.1 Registered business identity

- **Registered business name:** CIVOLINK ENTERPRISES
- **Registration number:** BN-55SLLRED
- **Registered address:** Kenyatta Avenue, Nairobi, Starehe District, CBD
- **Postal address:** P.O. Box 30470, 00100 – G.P.O Nairobi, Kenya

**Distinction throughout:** CIVOLINK ENTERPRISES (legal entity) vs CIVOLINK (public-facing umbrella brand). Do not describe CIVOLINK ENTERPRISES as a limited company, incorporated company, or `CIVOLINK ENTERPRISES LTD` unless separate incorporation evidence is provided.

---

---
### 4.1 Registered business identity

- **Registered business name:** CIVOLINK ENTERPRISES
- **Registration number:** BN-55SLLRED
- **Registered address:** Kenyatta Avenue, Nairobi, Starehe District, CBD
- **Postal address:** P.O. Box 30470, 00100 – G.P.O Nairobi, Kenya

**Distinction throughout:** CIVOLINK ENTERPRISES (legal entity) vs CIVOLINK (public-facing umbrella brand). Do not describe CIVOLINK ENTERPRISES as a limited company, incorporated company, or `CIVOLINK ENTERPRISES LTD` unless separate incorporation evidence is provided.

---
``

**End of Appendix A.**
