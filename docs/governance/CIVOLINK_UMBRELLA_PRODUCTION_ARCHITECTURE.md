# CIVOLINK — Umbrella Production Architecture and Readiness Definition

**Task:** U-001 · **Task type:** architecture definition, business identity alignment and production-readiness assessment
**Date:** 2026-11-09 · **Scope:** CIVOLINK umbrella corporate website only
**Authorization:** owner-authorized planning and documentation task
**Status of this document:** `PROPOSED / PLANNED` — it defines architecture and readiness. It implements nothing.

---

## 0. Document control

| Item | Value |
|---|---|
| Primary architecture reference for the umbrella website | `docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md` (this file) |
| **Authoritative branding source** | **`docs/CIVOLINK_BRAND_GUIDELINES.md`** (U-001B) — palette, logo assets, tagline, legal identity and disclosure rules. Where this document mentions branding, that document governs. |
| Design content source material | `docs/umbrella-reference/` (six-page reference suite, `IMPLEMENTED — LOCALLY VERIFIED HTML REFERENCE SUITE`) |
| Authority for ecosystem architecture boundary | `docs/OWNER_DECISIONS_REGISTER.md` §D13 |
| Authority for decision content and history | `docs/OWNER_DECISIONS_REGISTER.md` |
| Authority for execution status | `docs/PROJECT_PROGRESS_REGISTER.md` |
| Authority for the delivery sequence | `docs/IMPLEMENTATION_ROADMAP.md` §U |
| This document supersedes | nothing; it is the first umbrella production-architecture record |
| **Domain direction update (2026-11-16)** | **`civolink.co.ke` adopted as the primary CIVOLINK domain (D17 adoption addendum, `WIFI\docs\OWNER_DECISIONS_REGISTER.md`).** The §D13 `.com` set is retained verbatim as the historical design direction and a possible future alternative (e.g. if `civolink.com` is later acquired). §6 below records the adopted hostname family. Honesty controls unchanged: no hostname is claimed live; canonicals/sitemap.xml/HSTS stay gated on D23. |

**Relationship to the reference suite:** the suite is the *visual and structural source material* for the production site. This document decides what of it is published, what is renamed, what is deferred and what must never be published. Production work derives from a **copy** of the suite; the suite itself stays frozen as the verified baseline.

### 0.1 Evidence classification (used on every claim below)

| Class | Meaning |
|---|---|
| `VERIFIED` | Observed in this repository during U-001 by direct inspection or execution |
| `OWNER-SUPPLIED` | Stated by the owner; **not** independently verified from a certificate, registry or provider record |
| `PROPOSED` | Recommendation of this document; not approved until the owner records a decision |
| `PLANNED` | Design intent already recorded (§D13); no registration, build or deployment evidence exists |
| `BLOCKED` | Cannot progress until an owner decision is recorded |
| `NOT IMPLEMENTED` | No artifact exists |
| `NOT AUTHORIZED` | Explicitly outside this task; performing it would breach the brief |

---

## 1. Scope, authority and non-authorization

### 1.1 In scope for U-001

Architecture and readiness definition for a future CIVOLINK corporate website: business identity alignment, corporate positioning, product and platform architecture, domain architecture, reference-suite review and page-level recommendations, brand/design governance, contact and legal information model, production technology recommendation (including the owner-approved web server), security and operational readiness, phased delivery plan, owner decisions required, and risks.

### 1.2 Explicitly not authorized by U-001 (`NOT AUTHORIZED`)

No production code, no build of a production site, no hosting or server configuration, no domain registration, no DNS change, no TLS certificate, no CMS or WordPress installation, no analytics or cookie script, no contact endpoint, no deployment, no repository commit or push, and no modification of any file under `docs/umbrella-reference/` HTML/CSS/JS.

### 1.3 Separation rule (carried forward from §D13 and roadmap §U)

The umbrella website is a **presentation layer**. It must never modify, replace or link over the live MikroTik customer `login.html`, the customer hotspot login/payment flow, `backend/pay.php`, `backend/webhook.php`, `backend/check_status.php`, router provisioning, the Wi-Fi administration dashboard, or the CIVOLINK WIFI UI reference pack at `docs/url-reference/`. Conversely, no CIVOLINK WIFI product work may depend on the umbrella website existing or being reachable.

**Shared branding, navigation and corporate ownership do not create shared authentication, databases or privileged access.** That principle is architectural, not aspirational — see §5.2.

---

## 2. Baseline inspected for U-001

| Fact | Value | Class |
|---|---|---|
| Repository root | `E:\Documents\VS\WIFI` | `VERIFIED` |
| Branch / upstream | `main` → `origin/main` | `VERIFIED` |
| HEAD | `1bf0b2fe717ae916afd23a4dd3bb3d92c974fa1b` | `VERIFIED` |
| HEAD subject | `feat(provisioning): implement secure RouterOS v7 TLS provisioning and retry engine` | `VERIFIED` |
| Remote | `origin` → `https://github.com/fredricksila40/CIVOLINK_WIFI.git` | `VERIFIED` |
| Staged changes at U-001 start | none | `VERIFIED` |
| Unstaged modified at U-001 start | 9 files (`.gitignore`, `README.md`, `backend/check_status.php`, `backend/common.php`, `backend/db.php`, `backend/pay.php`, `backend/provision.php`, `backend/schema.sql`, `backend/webhook.php`) | `VERIFIED` |
| Untracked at U-001 start | 10 entries (incl. `docs/`, `PHASE_1B_AUDIT_REPORT.md`, `PHASE_1B_FINAL_REPORT.md`, `backend/Payment/`, `backend/tests/`, `composer.json`, `composer.lock`, `phpunit.xml`, `.phpunit.result.cache`) | `VERIFIED` |
| Reference suite | 6 pages + shared CSS/JS/SVG + README + `evidence/`; last content write before U-001 | `VERIFIED` |
| Suite verification | 255/255 local checks passed; screenshots at 375/768/1440 px | `VERIFIED` |
| Suite integrity during U-001 | byte-identical (aggregate SHA-256 `76D60A8F21125B39BB80421C826F984C3F2503D0FB5DD98979B8ADC4D30A30F5` over 33 files, re-checked at task end) | `VERIFIED` |
| Git commit/push during U-001 | none | `VERIFIED` |

**Working-tree note:** the tree was *not* clean at U-001 start and remains not clean. Pre-existing uncommitted work (backend modifications, PHP test scaffolding, `docs/`) belongs to other sessions and was not read, characterized, reverted or claimed by U-001. This document records the fact; it does not attribute ownership.

**Parallel-session discrepancy (recorded, per `docs/CLI_AGENT_RULES.md` §11):** an external session created `CIVOLINK_UMBRELLA_U001_REPORT.md` at the repository root during the U-001 window, producing an interleaved, internally contradictory draft that also asserted a clean working tree (contradicted by `git status` above). The owner directed U-001 to wait for that writer to go idle and then take over. The superseded draft is preserved verbatim in the U-001 report appendix with its SHA-256; no unique information was lost.

---

## 3. Business identity

### 3.1 Registered business identity — `OWNER-SUPPLIED`, not independently verified

| Field | Value | Public display |
|---|---|---|
| Registered business name | CIVOLINK ENTERPRISES | approved |
| Registration number | BN-55SLLRED | **approved for optional public disclosure** (always with the registered name) |
| Entity type | BUSINESS NAME (registered Business Name in Kenya) | approved — must be described accurately |
| Entity status | ACTIVE | **internal reference only** unless separately approved |
| Registration date | 26 June 2025 | **internal reference only** unless separately approved |
| Registered nature of business | Provision of Wireless Internet and ICT Support Services | factual; must not be extrapolated to other activities |
| Registered address | Kenyatta Avenue, Nairobi, Starehe District, CBD | **not automatically published** — registered-business information, not proof of a staffed operating location |
| Postal address | P.O. Box 30470, 00100 – G.P.O Nairobi, Kenya | internal; public disclosure requires separate owner approval |

**Verification status:** these details are `OWNER-SUPPLIED`. They have not been checked against the official registration certificate or current official record. **They must be verified before publication** — that verification is a U-002 exit gate, not a U-001 activity.

**Disclosure rules, the approved public wording, and the eleven legal-identity rules are documented authoritatively in `docs/CIVOLINK_BRAND_GUIDELINES.md` §3–§5.** CIVOLINK ENTERPRISES must never be described as a limited company, incorporated company or corporation, and **LTD**/**LIMITED** must never follow the registered name.

### 3.2 Three distinct identities (never conflated)

| Layer | Name | Where it may appear | Class |
|---|---|---|---|
| Legal entity | CIVOLINK ENTERPRISES | footer identity block, `about` page, privacy/terms, contact page, JSON-LD `Organization.legalName` | `OWNER-SUPPLIED` |
| Public brand | CIVOLINK | logo, navigation, headings, marketing copy | `PROPOSED` (usage rules → D15) |
| Corporate website domain | `civolink.co.ke` | **adopted** primary domain (D17 adoption addendum, 2026-11-16); planned hostnames rendered as styled text only | `ADOPTED (D17)` — deployment pending D23 |

**Registered address vs operating address:** §3.1 gives a *registered* address. Whether the business also operates from it, or from a separate location, is unknown and is decision **D18**. Until answered, the site publishes only the registered address, explicitly labelled as such, plus the postal address. No operating address is invented.

### 3.3 Language rules (binding on every page and every document)

Full rules: `docs/CIVOLINK_BRAND_GUIDELINES.md` §4.2. Summary:

- Do **not** describe CIVOLINK ENTERPRISES as a limited company, an incorporated company, or `CIVOLINK ENTERPRISES LTD`. No such evidence exists.
- Do **not** use **LTD** or **LIMITED** after the registered business name.
- Describe the entity accurately as a **registered Business Name in Kenya** (entity type: BUSINESS NAME) — never as a company or corporation.
- Keep entity status (**ACTIVE**) and registration date (**26 June 2025**) as **internal reference information** unless the owner separately approves public display.
- Do **not** publish the registered street address automatically; treat it as registered-business information, not proof of a staffed operating location. The postal address needs separate owner approval before public disclosure.
- Do **not** invent a date of incorporation, directors, shareholders, licences, tax status, awards, customer counts, uptime figures, coverage maps or revenue.
- Do **not** present owner-supplied identity details as independently verified.
- Do **not** present a registered address as an operating address.
- Use `CIVOLINK ENTERPRISES` in legal/identity contexts and `CIVOLINK` in brand contexts; never invent a third variant. The registration number appears only together with the registered business name.
- Verify registration particulars against the official certificate or current official record **before publication**.

---

## 4. Corporate positioning — partly owner-supplied (decision D14 partially answered)

**Owner-supplied and approved (U-001B):** the brand name **CIVOLINK**, the official tagline **CONNECTING IDEAS · BUILDING SOLUTIONS**, and the positioning areas — ICT services · wireless internet and connectivity · business software · construction technology · business management systems · future digital products and services. These are authoritative; see `docs/CIVOLINK_BRAND_GUIDELINES.md` §6–§7.

**Still `PROPOSED` and awaiting D14:** the mission, vision, values and audience wording below is drafting material for U-002. Nothing in the table is approved.

| Element | Proposed wording | Rationale |
|---|---|---|
| Corporate description | CIVOLINK ENTERPRISES is a Kenyan-registered technology business providing an umbrella ecosystem of independently engineered digital products and services. | Matches the suite's "independent digital products" framing and the §D13 independence model |
| Mission | To deliver practical, independently engineered digital solutions that support connectivity, business operations and digital platforms — each standing on its own engineering while presenting one coherent market face. | Draft for D14; **not** the official tagline (the official tagline is CONNECTING IDEAS · BUILDING SOLUTIONS) |
| Vision | To be a credible Kenyan technology business with potential international reach, recognised for independently built products, transparent architecture and customer-focused service — without inflated claims or unverified achievements. | Credible and achievable; deliberately excludes unverifiable superlatives |
| Brand promise | **CONNECTING IDEAS · BUILDING SOLUTIONS** | **owner-approved** (U-001B) |
| Positioning areas | ICT services · wireless internet and connectivity · business software · construction technology · business management systems · future digital products and services | **owner-supplied** (U-001B); brand ambition must not be implied to exceed the registered nature of business |
| Target customers | SMEs in Kenya seeking connectivity and business management solutions; developers and integrators evaluating independently built, API-compatible systems; regional businesses needing hotspot or business-management capability; international evaluators assessing independently built digital products. | Derived from the suite's product set |
| Service categories | 1. CIVOLINK WIFI — managed hotspot connectivity · 2. Biashara Flow — business and enterprise management platform · 3. CIVOLINK corporate website — umbrella brand, product discovery, contact routing. | Directly from the suite product structure |

**Blocked by:** D14 (mission, vision, values and audience wording). **D15 (tagline and identity-usage rules) is resolved** by U-001B — see `docs/OWNER_DECISIONS_REGISTER.md` D15.

---

## 5. Product and platform architecture

### 5.1 Platform inventory

| Platform | Role | Engineering boundary | State |
|---|---|---|---|
| CIVOLINK corporate website | Umbrella brand, product discovery, contact routing | Static content only at launch; no backend, database, auth, analytics (see §11) | `NOT IMPLEMENTED` |
| CIVOLINK WIFI | Managed hotspot connectivity (MikroTik + PHP backend) | Own backend, own SQLite database, own security boundaries, own release cycle | `VERIFIED` in repo as code; production `NOT IMPLEMENTED` |
| Biashara Flow | Business and enterprise management platform | Same independence as CIVOLINK WIFI | `PLANNED` / `NOT IMPLEMENTED` |
| Future products | To be developed under separate approval | Same independence framework | `PLANNED` |

### 5.2 Independence principles (non-negotiable)

> Shared branding, navigation and corporate ownership must not automatically create shared authentication, databases or privileged access.

Each product retains independent: application deployment · database · backend services · security boundaries · release cycles · operational responsibilities.

Concretely, for the umbrella website:

1. The umbrella site must **not** carry CIVOLINK WIFI payment, webhook or router-provisioning code, and must not link customers into those flows.
2. The umbrella site must **not** share a database, PHP-FPM pool, system user or session store with the WIFI backend (even if both sit on one VPS — §11.3).
3. There is **no** central account service. `accounts.civolink.co.ke` remains a future concept requiring its own identity architecture and security review (§D13, roadmap U4).
4. Website content management must never grant access to application administration, customer records, payment systems or router infrastructure.
5. Failure of the corporate website must not interrupt product services, and failure of any product must not take the corporate site with it.
6. No CMS is a dependency of any product (§D13).

**Do not merge CIVOLINK WIFI or Biashara Flow into the corporate website backend.**

### 5.3 What the umbrella site may and may not contain

| Allowed at launch | Not allowed at launch |
|---|---|
| Static HTML/CSS/JS content pages | Payment, provisioning, webhook or router code |
| Internal links, anchors, relative assets | Customer login, hotspot flows, admin dashboards |
| Owner-approved contact channels | Central login, SSO, session sharing, user accounts |
| Registered identity block | Any database or persistent server-side store |
| Privacy policy and terms of use | Analytics or non-essential cookies without D24 |
| Planned-domain table rendered as text | Clickable links to domains that do not resolve yet |

---

## 6. Domain and subdomain architecture — `ADOPTED BASE: civolink.co.ke` (D17 adoption addendum, 2026-11-16)

**Adopted hostname family (owner direction, 2026-11-16):**

| Domain | Intended role | Evidence state |
|---|---|---|
| `civolink.co.ke` | Corporate website / umbrella platform | **Registered (owner-supplied; Truehost). Adopted as primary domain (D17 adoption addendum).** Not verified resolving, hosted or configured — D23 |
| `wifi.civolink.co.ke` | CIVOLINK WIFI | `PLANNED` — product-hostname plan under the adopted base; no DNS/deployment evidence |
| `biashara.civolink.co.ke` | Biashara Flow | `PLANNED` — product-hostname plan under the adopted base; no DNS/deployment evidence |
| `docs.civolink.co.ke` | Documentation and support portal | `PLANNED` (future) — requires a separate portal decision |
| `accounts.civolink.co.ke` | Potential central identity service | `PLANNED` (future concept; separate architecture decision required) |

**Historical record — the original §D13 `.com` direction (unchanged, not adopted):**

| Domain | Intended role | Evidence state at record time |
|---|---|---|
| `civolink.com` | Corporate website / umbrella platform | `PLANNED` — no registration, DNS or deployment evidence; possible future alternative only if the owner separately adopts/acquires it |
| `wifi.civolink.com` / `biashara.civolink.com` / `docs.civolink.com` / `accounts.civolink.com` | Same roles as above under the `.com` base | `PLANNED` — historical design direction (§D13), retained verbatim in D13 |

**Restrictions:**

- No domain may be described as resolving, controlled, hosted or live without evidence (D17/D23; registration of the apex is owner-supplied and is not evidence of DNS, hosting or TLS).
- The website renders planned hostnames as styled text (`<span class="domain-ref">`), never as clickable links, so it contains no dead links. Production keeps that rule until each hostname verifies resolving.
- No DNS, registrar or certificate action is taken by documentation tasks (`NOT AUTHORIZED`); D23 governs all DNS/TLS/deployment steps.

---

## 7. Reference-suite review and production page decisions

Reviewed: `index.html`, `products.html`, `control-center.html`, `developers.html`, `about.html`, `contact.html`.

| # | Current file | Production decision | Rationale | Required changes before publication |
|---|---|---|---|---|
| 1 | `index.html` | **Retain with modifications** → `/` | Strong homepage structure: hero, featured products, technology direction, why CIVOLINK, business value, planned domains, contact CTA | Add registered-identity footer block (§3.1); retagline only if D15 approved; keep planned-domain table as non-clickable text |
| 2 | `products.html` | **Retain with modifications** → `/products` | Correct product-discovery page with explicit status labels | Copy subject to D21; status badges remain until each claim is true; no invented pricing, dates or coverage |
| 3 | `control-center.html` | **Defer from initial launch.** If later published: **rename** → `platforms.html`, titled *Our Platforms* | The page is built almost entirely on demonstration content — directory statuses, service-health presentation *model*, `stat-strip` counts, central-account concept. None of it can be published truthfully today, and "Control Center" wrongly implies an operational dashboard customers can use | Before any publication: remove health model, all status/health labels, all counts, the central-account concept; keep only architecture-intent and independence narrative; retitle and rename file; re-verify |
| 4 | `developers.html` | **Rename** → `technology.html`, titled *Technology*; retain with modifications | The architecture, security and independence narrative is genuine corporate credibility content and is true without an API. The marked-illustrative payload examples are not, and imply an API that does not exist | Remove the illustrative payload block from public view (defer it to a future `docs.civolink.co.ke`); remove `example.invalid` samples; retitle; re-verify |
| 5 | `about.html` | **Retain with modifications** → `/about` | Correct identity/vision page | Add registered identity, registration number and postal address; remove the "no awards claimed" hedging, which reads as defensive on a public site; mission/vision/values subject to D14 |
| 6 | `contact.html` | **Retain with modifications** → `/contact` | Correct contact-routing structure with general/partnership/technical routes | Add registered + postal address; publish only D19-approved channels; keep explicit placeholders for anything unapproved; static demonstration form is replaced by a real server-side endpoint in U-003, or removed until then — it must never be presented as sending mail |

**Naming decisions required by the brief (§7):**

- `control-center.html` → **defer**; if revived, rename to **`platforms.html` / "Our Platforms"** (chosen over "Platform Ecosystem" as plainer and over "Technology Overview" because `/technology` already occupies that name).
- `developers.html` → **rename** to `technology.html`, not deferred, because its core content is a true engineering-principles narrative rather than an API claim.

---

## 8. Recommended initial production sitemap — `PROPOSED` (decision D20)

### 8.1 Launch set (7 pages)

| URL | Page | Source |
|---|---|---|
| `/` | Home | `index.html` (modified) |
| `/about` | About CIVOLINK | `about.html` (modified) |
| `/products` | Products and services | `products.html` (modified) |
| `/technology` | Technology | `developers.html` (renamed + modified) |
| `/contact` | Contact | `contact.html` (modified) |
| `/privacy` | Privacy policy | **new** — required before any form is live |
| `/terms` | Terms of use | **new** — required before any form is live |

### 8.2 Deferred (explicitly not in the launch set)

| Page | Source | Deferral reason | Revisit trigger |
|---|---|---|---|
| Our Platforms | `control-center.html` | Built on demonstration content (§7) | At least two products live with real status to describe |
| Developers / docs | `developers.html` payload section, future `docs.civolink.co.ke` | No public API exists | First real public API contract |
| Per-product sites | `wifi.`, `biashara.` subdomains | Products not launched; domains unregistered | Product launch + D17 |
| Accounts / SSO | `accounts.civolink.co.ke` | Requires separate identity architecture (§D13) | Separate architecture decision |

### 8.3 Sitemap hygiene

Ship `sitemap.xml` and `robots.txt` only when the site is on its final hostname. Every URL must resolve before it appears in `sitemap.xml`. Canonical URLs, per-page `<title>`/description, a single `<h1>`, Open Graph tags and JSON-LD `Organization` (using `legalName` = CIVOLINK ENTERPRISES) are build requirements, not launch afterthoughts.

---

## 9. Brand identity and design governance

> **Branding is governed authoritatively by `docs/CIVOLINK_BRAND_GUIDELINES.md` (U-001B).** Palette, logo assets, tagline and legal identity rules are stated there and are not restated as alternatives here.

### 9.1 Approved brand palette — `OWNER-APPROVED` (decision D16)

The six official brand colours, exact and owner-approved:

| Role | Name | Hex |
|---|---|---|
| Primary | Primary Navy | `#102A43` |
| Primary accent | Primary Teal | `#00A6A6` |
| Secondary accent | Secondary Cyan | `#18C3C8` |
| Body text / neutral dark | Graphite | `#263238` |
| Surface background | Cloud | `#F4F7F8` |
| Content surface | White | `#FFFFFF` |

**Superseded proposal.** Earlier revisions of this document recorded a *proposed* palette (`#071c33`, `#0b2747`, `#123a63`, `#0d9488`, `#12b5a5`, `#38c6d9`, `#1f6fe0`, plus status/neutral tokens). That palette was never an approved brand standard and is **superseded as a brand standard** by the six colours above. It still exists in the reference suite CSS/HTML — which must remain byte-unchanged — and therefore remains a *rendered reference-design* value only, not a brand value. Production builds adopt the approved palette.

### 9.2 Design system rules carried into production

- Approved logo variants only (eight assets, `docs/CIVOLINK_BRAND_GUIDELINES.md` §11) — never recreate, recolour or substitute logo artwork. The reference-suite mark `assets/icons/civolink-mark.svg` is **not** an approved brand asset.
- Official tagline **CONNECTING IDEAS · BUILDING SOLUTIONS** — the suite hero line "Practical technology, connected." is superseded for production use (suite stays unmodified).
- System font stack only — no web-font download, no third-party font CDN. **No corporate font is approved yet** (`docs/CIVOLINK_BRAND_GUIDELINES.md` §15).
- One stylesheet, CSS custom properties for every token, reusable `.card` / `.btn` / `.badge` / `.notice` / `.table` / `.diagram` / `.cta-band` components.
- Reduced-motion respected (`prefers-reduced-motion`); visible focus indicator on every interactive element; skip link; single `<h1>` per page; semantic landmarks.
- Contrast per the measured ratios in `docs/CIVOLINK_BRAND_GUIDELINES.md` §21 — teal and cyan are **not** body-text colours on light grounds.
- Status badges are permitted only when the status they assert is true. A badge reading "Live" on a page with no live service is a defect, not a style choice.

### 9.3 Accessibility target

WCAG 2.2 AA for every launch page, verified in U-004 (keyboard, focus order, contrast, reflow at 320 px, labels on all form controls, error identification), using the brand guidelines' contrast table.

---

## 10. Corporate contact and legal information

### 10.1 Available vs required — `OWNER-SUPPLIED` / `BLOCKED`

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
| Social accounts | **missing — D19** | owner to confirm, decline, or specify platforms |
| Support channels and hours | **missing — D19** | owner to define |

Nothing in this list may be invented, guessed or filled with a placeholder that looks real.

### 10.2 Legal artifacts required before the contact form is live

| Artifact | Requirement |
|---|---|
| Privacy policy | What is collected, why, legal basis, retention, who to contact, rights under the Kenya Data Protection Act, 2019 |
| Terms of use | Site use, accuracy/no-warranty of published content, intellectual property, liability limits, governing law |
| Contact-form data handling | Server-side processing only; validated input; rate limiting; spam protection; explicit retention period; no client-side-only "success" |
| Cookie/analytics disclosure | Required only if D24 permits analytics or non-essential cookies; default is none |
| Incident handling | Contact point and process for a data-subject or security enquiry |

**Kenya Data Protection Act, 2019:** applies to any processing of personal data from the contact form. The existing static demonstration form must **not** be presented as a functioning enquiry service, and no form may go live before the privacy policy is published and the processing path is server-side.

---

## 11. Production technology recommendation — `PROPOSED` (decisions D22, D23)

### 11.1 Layer recommendation

| Layer | Recommendation | Class |
|---|---|---|
| Content authoring | Hand-authored semantic HTML5 derived from the reference suite; no client-side framework | `PROPOSED` |
| Build step | None required at launch. Add a minify/asset-hash step only if it demonstrably pays for itself | `PROPOSED` |
| Web server | **Nginx** — owner-approved as the production web server for the umbrella site | `OWNER-SUPPLIED` |
| Hosting | The already-approved VPS (§D8/D13), Ubuntu LTS | `PROPOSED` (VPS itself is an approved decision) |
| TLS | Let's Encrypt or equivalent, automated renewal, HTTP→HTTPS redirect, HSTS enabled only after the hostname is confirmed stable | `PROPOSED` |
| Backend | **Only** a contact-form endpoint: PHP-FPM (already the stack direction in §D8) or a small isolated service, own pool, own user, own logs | `PROPOSED` |
| Database | **None at launch.** The site has no accounts, no sessions and no CMS | `PROPOSED` |
| CMS | **None at launch.** §D13 permits an optional future headless/content service; it must never become a dependency | `PLANNED` |
| Analytics / cookies | **None by default**; adopt only on D24, privacy-preserving and cookieless preferred | `BLOCKED` |
| CDN | Not required at launch. If adopted later, must not log, cache or intercept form POSTs | `PROPOSED` |
| CI/CD | Optional. A static site can be released by verified copy + checksum; automate only when release frequency justifies it | `PROPOSED` |
| Search | `sitemap.xml`, `robots.txt`, canonical URLs, JSON-LD `Organization`, per-page metadata | `PROPOSED` |

### 11.2 Why static-first

Seven content pages with low change frequency, no personalisation and no user accounts need no application server. Static delivery gives: the smallest attack surface, no runtime dependency for content, no build toolchain to maintain, fastest page loads, cheapest hosting, and — critically — the **lowest coupling to CIVOLINK WIFI**, which is what §D13 requires. It is also exactly what has already been verified (255/255 checks), so the production site starts from a proven baseline rather than a rewrite.

**Revisit triggers (not decisions to take now):** an editorial workflow for non-technical publishers → D25; multi-language content; personalisation; any account feature → separate identity architecture first.

### 11.3 Isolation if the umbrella site shares the VPS with the WIFI backend

Sharing one VPS is acceptable at launch for cost and operational simplicity **only** with all of the following enforced:

- separate Nginx `server` block and separate document root;
- separate PHP-FPM pool and separate system user; no `wwwdata`-style shared pool;
- no shared database file, no shared session directory, no shared `.env`;
- separate log files, separate deploy credentials, least-privilege file permissions;
- the umbrella document root contains **only** static content plus the single contact endpoint — never `backend/`, never `docs/`.

**Recommended future state:** split onto a separate host when traffic, risk or availability requirements justify it. The isolation requirements above are the minimum, not the target.

---

## 12. Security and operational readiness baseline

| Control | Requirement | State |
|---|---|---|
| HTTPS | Mandatory for any production deployment | `NOT IMPLEMENTED` |
| Security headers | HSTS (after hostname confirmation), CSP, `X-Frame-Options`, `Referrer-Policy`, `X-Content-Type-Options` | `NOT IMPLEMENTED` |
| Contact-form processing | Server-side only; validated input; no static form may claim to send mail | `NOT IMPLEMENTED` (current form is a demonstration) |
| Spam protection + rate limiting | Required before the form is live | `NOT IMPLEMENTED` |
| Input validation / output encoding | Standard practice at the endpoint; no `innerHTML` with untrusted data | `NOT IMPLEMENTED` |
| Secret management | No secrets in static content; endpoint secrets in environment/config outside the web root, never committed | `VERIFIED` (suite contains none) |
| Least-privilege deployment access | Dedicated deploy user; no root for web-file operations; no shared credentials with the WIFI backend | `NOT IMPLEMENTED` |
| Backups and recovery | Content backup plus rollback to the previous release | `NOT IMPLEMENTED` |
| Logging and monitoring | Nginx access/error logs, endpoint error log, uptime check, alert recipient (owner-defined) | `NOT IMPLEMENTED` |
| Dependency maintenance | Suite has zero runtime dependencies; any endpoint dependencies pinned and reviewed | `VERIFIED` (suite) / `NOT IMPLEMENTED` (endpoint) |
| Error handling | Static 404 and 500 pages, graceful degradation, no stack traces or paths exposed | `NOT IMPLEMENTED` |
| Accessibility and browser compatibility | WCAG 2.2 AA; verified at 375/768/1440 with focus, reflow and keyboard checks | reference suite `VERIFIED` (255/255); production site `NOT IMPLEMENTED` |
| SEO and metadata | Title/description/canonical/OG/JSON-LD per page | reference suite has basics `VERIFIED`; production `NOT IMPLEMENTED` |
| Rollback strategy | Previous-release copy retained; documented revert step | `NOT IMPLEMENTED` |
| Separation from WIFI systems | No payment, webhook, provisioning or router code; no shared auth or DB | `VERIFIED` as a design constraint (`§D13`); production `NOT IMPLEMENTED` |

**Blocking rule:** no item in this table may be marked `VERIFIED` for the production site until it has been independently checked in U-004 with evidence recorded.

---

## 13. Delivery phases U-001 … U-006

| Phase | Purpose | Entry criteria | Exit criteria (evidence) | State |
|---|---|---|---|---|
| **U-001** | Umbrella production architecture and readiness definition | Owner authorization | This document published; D14–D25 registered; governance docs updated; reference suite unchanged | `IN PROGRESS` (this task) |
| **U-002** | Business identity, content and legal readiness | D14, D15, D18, D19, D20, D21 answered | Identity verified against the certificate; approved copy pack for every launch page; registered-identity blocks written; privacy + terms drafted; contact-channel list final; product claims matched to reality | `NOT STARTED` |
| **U-003** | Production build | U-002 exit; D16, D22, D23 answered | Static site built from approved content; renames and deferrals applied (§7); no demonstration content; contact endpoint only if approved; brand mark/palette as approved | `NOT STARTED` |
| **U-004** | Security, accessibility and SEO verification | U-003 exit | Independent verification pass with recorded evidence: headers/TLS config review, WCAG 2.2 AA, link/anchor/asset checks, metadata and structured data, no external requests, no demonstration content, no forbidden claims | `NOT STARTED` |
| **U-005** | Domain, DNS and hosting preparation | D17, D23 answered | Domain under owner-controlled registrar account; DNS plan; TLS issuance plan; hosting/isolation configured per §11.3; deploy and rollback runbook written. **Deployment itself requires separate owner authorization** | `NOT STARTED` |
| **U-006** | Launch and post-launch operations | U-004 + U-005 exit **and** explicit owner launch authorization | Site live on the approved hostname; monitoring and alerting active; rollback proven; privacy/terms published; progress register and manifest updated to the real state | `NOT STARTED` |

**Recommended sequence adjustments (proposals, not authority changes):**

1. **Shift U-004 left.** Run accessibility, link, metadata and content checks *continuously during U-003* and keep U-004 as an independent formal gate. Fixing a contrast defect during the build costs minutes; finding it after acceptance costs a release.
2. **Parallelize U-005 with U-003/U-004** once D17 and D23 are answered. Domain and hosting preparation does not depend on page content and shortens the critical path. Nothing in U-005 may deploy without owner authorization.

---

## 14. Owner decisions required — D14 … D25

All twelve were `BLOCKED` until the owner answers; **D14, D15 and D16 are now PARTIALLY RESOLVED by the owner-supplied brand information recorded in `docs/CIVOLINK_BRAND_GUIDELINES.md` (U-001B)** — the brand-name/tagline/palette/logo-set material is settled, while the residua named below stay open (mirroring `docs/OWNER_DECISIONS_REGISTER.md`, which is the decision authority; this table must not overstate it). Each row records what it blocks and the default applied if it stays unanswered (so work can still be planned without inventing an answer).

| ID | Decision | Status | Blocks | Default if unanswered |
|---|---|---|---|---|
| **D14** | Corporate positioning: description, mission, vision, values, audience | **PARTIALLY RESOLVED** — brand name, tagline and positioning areas owner-supplied (U-001B, guidelines §6); mission/vision/values/audience wording still open (gap G8) | U-002 home/about copy | §4 wording stays draft; no public launch of the draft positioning claims |
| **D15** | Tagline / hero line and brand voice; CIVOLINK vs CIVOLINK ENTERPRISES usage rules | **PARTIALLY RESOLVED** — official tagline `CONNECTING IDEAS · BUILDING SOLUTIONS` and the legal-identity usage rules owner-supplied (U-001B, guidelines §2/§3/§7); production brand-voice wording still open | U-002 copy tone, U-003 headings (voice portion) | Approved tagline governs wherever a tagline is used; §3.3 voice guidance stays draft |
| **D16** | Logo/mark, favicon and colour palette approval | **PARTIALLY RESOLVED** — six exact colours and eight named logo variants owner-approved and asset-verified (U-001B, guidelines §9/§11); still open: owner-authorised copy of the approved SVGs into the repository (gap G1), clear-space ratio and minimum sizes (§13), favicon production behaviour (§22) | U-003 build (asset copy + above gaps) | Approved palette/variants stand; use only assets from the CIVOLINK Assets/logo folder; suite mark/palette remain superseded proposals |
| **D17** | Domain acquisition: which domains to register, registrar, and who owns the registrar account | **OPEN** — not addressed by U-001B | U-005 | No registration, no DNS action, no purchase |
| **D18** | Operating address: is Kenyatta Avenue also the operating location, or is there a separate one? | **OPEN** — not addressed by U-001B | U-002 contact/legal copy | Publish only the registered address, labelled as registered; the postal address stays internal until separately approved (brand guidelines rule 10) |
| **D19** | Public contact channels: business email, phone, WhatsApp, social accounts, support hours; and the data-handling policy behind the form | **OPEN** — not addressed by U-001B | U-002/U-003 contact page; privacy policy; form go-live | Contact page keeps explicit placeholders; **no form goes live** |
| **D20** | Production sitemap: which reference pages launch and which defer (§8) | **OPEN** — not addressed by U-001B | U-002/U-003 page set | Launch set in §8.1 stands as the proposal; `control-center` stays deferred |
| **D21** | Product descriptions and status claims for CIVOLINK WIFI and Biashara Flow | **OPEN** — not addressed by U-001B | U-002 products copy | Reference-suite wording with explicit status labels; no unverified claims |
| **D22** | Production technology stack and hosting topology (static hand-authored vs minimal static generator; same-VPS isolation vs separate host) | **OPEN** — not addressed by U-001B | U-003 build | Static hand-authored HTML; same VPS with full §11.3 isolation |
| **D23** | Hosting/TLS/DNS operational details: which VPS and provider, TLS authority, DNS host. Nginx is already approved as the web server | **OPEN** — not addressed by U-001B | U-005 | No deployment; Nginx remains the stated target |
| **D24** | Analytics and cookies: whether any analytics are used, and the consent model | **OPEN** — not addressed by U-001B | U-003/U-005 | No analytics, no non-essential cookies |
| **D25** | Future content management: whether/when an optional CMS or editorial workflow is introduced (§D13 permits; never a dependency) | **OPEN** — not addressed by U-001B | Post-launch U-006+ | No CMS; content edited as static files |

**Open decisions already recorded elsewhere that also gate umbrella work:** §D13 (umbrella independence, planned domains, WordPress optional) and roadmap §U items U2–U6. D14–D25 do not reopen or replace them, and **D1–D13 are untouched by U-001B**.

---

## 15. Risks, assumptions and dependencies

### 15.1 Risks

| # | Risk | Impact | Mitigation |
|---|---|---|---|
| R-U1 | Owner-supplied identity (BN-55SLLRED, addresses) published without verification | Legal and credibility exposure | U-002 gate: verify against the certificate before publication; label as unverified until then |
| R-U2 | Parallel work sessions produce conflicting or duplicate governance records (observed during U-001) | Corrupted registers, contradictory status | Single-writer rule per document; record provenance and hashes; stop and report on conflict |
| R-U3 | Demonstration content shipped as fact (metrics, statuses, health, counts) | Loss of trust; misleading statements | D20 page set; §7 deferrals; explicit U-004 content-audit checklist |
| R-U4 | Target domain unavailable or held by a third party | Launch blocked | Raise D17 early in U-002; agree fallback naming before U-005 |
| R-U5 | Contact form live without a legal basis or protection | Kenya Data Protection Act, 2019 exposure | No form before privacy policy + server-side processing + spam/rate limiting (§10.2) |
| R-U6 | Shared VPS couples availability of the corporate site and the WIFI backend | One host failure affects both | §11.3 isolation; split hosts when risk justifies it |
| R-U7 | Scope creep into auth, accounts, SSO or product backends | Breaches §D13 independence | §5.3 allow/deny list enforced as a U-003 acceptance criterion |
| R-U8 | Proposed palette/mark treated as approved brand | Rework after launch | D16 gate; label the palette as proposed everywhere it is recorded |
| R-U9 | Reference suite modified during production work | Loss of the verified baseline | Suite frozen; production derives from a copy; aggregate hash re-checked |
| R-U10 | Owner decisions unanswered | Phases stall | D14–D25 defaults recorded so planning continues without inventing answers |

### 15.2 Assumptions (each must hold, or the plan changes)

- Nginx is the approved production web server for the umbrella site (`OWNER-SUPPLIED`).
- VPS hosting is the approved production target (§D8/§D13); only its details remain open (D23).
- The launch set is seven pages in English for a Kenyan-first audience.
- No user accounts, personalisation or e-commerce are in scope for launch.
- Static delivery is sufficient for the launch content volume.

### 15.3 Dependencies

- Owner answers to D14–D25 (§14).
- Verification of the registration certificate (U-002).
- Domain availability and registrar access (D17, U-005).
- TLS authority and DNS access on the chosen host (D23, U-005).
- Approval of product status claims (D21) before any "live" badge is published.

---

## 16. Related documents

| Document | Role |
|---|---|
| `docs/CIVOLINK_BRAND_GUIDELINES.md` | **Authoritative branding source** — palette, logo assets, tagline, legal identity and disclosure rules |
| `docs/umbrella-reference/` + `README.md` | Verified design source; frozen baseline (brand values superseded by the brand guidelines) |
| `docs/OWNER_DECISIONS_REGISTER.md` | §D13 (ecosystem boundary) and D14–D25 |
| `docs/IMPLEMENTATION_ROADMAP.md` §U | Delivery sequence U-001 … U-006 |
| `docs/PROJECT_PROGRESS_REGISTER.md` | Status vocabulary, task register, change history |
| `docs/PRODUCTION_BUILD_MANIFEST.md` §6 | Excludes `docs/` from every WIFI production artifact |
| `docs/CLI_AGENT_RULES.md` | Read-before-write, preserve uncommitted work, stop on conflict |
| `CIVOLINK_UMBRELLA_U001_REPORT.md` | Task report, evidence and preserved superseded draft |
| `CIVOLINK_BRAND_GUIDELINES_U001B_REPORT.md` | U-001B task report and asset verification evidence |

---

**End of document.** This is an architecture and readiness definition only. No production code, hosting, DNS, domain, deployment or CMS action is taken or implied by it.
