# CIVOLINK â€” Corporate Website Content Package (U-002.3)

## 1. Document control and scope

| Field | Value |
|---|---|
| Task | **U-002.3 â€” Corporate Website Content and Sitemap Development** |
| Date | 2026-11-11 |
| Status | **Documentation â€” content preparation only. No production implementation.** |
| Branch / HEAD | `main` / `1bf0b2fe717ae916afd23a4dd3bb3d92c974fa1b` (baseline captured at task start) |
| Companion deliverables | `docs/CIVOLINK_U002_3_SITEMAP.md` (page inventory, navigation, footer, link graph); `docs/CIVOLINK_U002_3_COMPLETION_REPORT.md` |
| Authoritative decision source | `docs/OWNER_DECISIONS_REGISTER.md` (D14â€“D25) â€” this document renumbers nothing, closes nothing, changes no status |
| Page scope | **Six pages:** Home, Our Platforms, Services, Technology, About, Contact (task scope; D20 remains OPEN and must confirm this set) |
| Not in scope | HTML/CSS/JS production files, domain/DNS/TLS, deployment, analytics, form endpoints, privacy/terms drafting, logo asset copying, reference-suite changes |

**What this document contains.** For each of the six pages: purpose, audience, primary visitor question, calls to action, URL, navigation label, section hierarchy, complete draft copy (headings and body), internal links and dependencies â€” plus a per-page content-governance table classifying every content block. Sections 1â€“5 define the rules and global elements that all pages inherit; sections 6â€“11 are the six pages; section 12 covers cross-cutting responsive, accessibility and static-first requirements; section 13 records open decisions and next steps.

**What this document is not.** It is not an approved copy pack. Draft copy marked below as proposal remains subject to the owner decisions named in each dependency list. Nothing here may be published without passing its governance class (Â§4).

---

## 2. Evidence basis

Every factual statement in the draft copy traces to one of the sources below. No other source was used; nothing was invented to fill a gap.

| # | Source | What it provided |
|---|---|---|
| E1 | `docs/OWNER_DECISIONS_REGISTER.md` | Authoritative D14â€“D25 subjects, statuses, gates and defaults (read in full, 2026-11-11) |
| E2 | `docs/CIVOLINK_BRAND_GUIDELINES.md` (U-001B, 26 sections) | Brand/legal identity rules (Â§3â€“Â§5), positioning areas (Â§6), tagline (Â§7), values and communication principles (Â§8), palette (Â§9), logo inventory (Â§11), usage rules (Â§13), typography (Â§15), website conventions (Â§16), co-branding (Â§17â€“Â§19), accessibility (Â§21), owner-approval status (Â§25), gaps G1â€“G11 (Â§26) |
| E3 | `docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md` | Language rules (Â§3.3), mission/vision/audience drafting material (Â§4), platform inventory and independence (Â§5), planned domains (Â§6), page-by-page production decisions (Â§7), proposed launch sitemap (Â§8), contact/legal requirements (Â§10), static-first stack direction (Â§11), D14â€“D25 mirror table (Â§14) |
| E4 | `docs/umbrella-reference/` (six frozen reference pages) | Structural source material: navigation, footer, section skeletons, service/product framing. Byte-unchanged; reference only |
| E5 | `PHASE_1B_AUDIT_REPORT.md`, `PHASE_1B_FINAL_REPORT.md`, `PHASE_1B_REMEDIATION_R016_REPORT.md`, `backend/` | **CIVOLINK WIFI maturity evidence:** working PHP backend (payments, provisioning, status checks), Phase 1B audit/remediation cycle in progress |
| E6 | Biashara Flow development project outside this repository (`E:\Documents\VS\Biashara Flow`) | **Biashara Flow maturity evidence:** `REAL CODE/biashara_flow_app/biashara-flow-platform` â€” FastAPI + SQLAlchemy + Alembic backend, pytest suite recording **323 passed, 2 skipped**, schema head `0012_shop_order_refunds_reconciliation`, public storefront with M-Pesa checkout, SQLAdmin portal (read-only inspection 2026-11-11; project README and file inventory only) |
| E7 | `docs/IMPLEMENTATION_ROADMAP.md` | Phase table (U-001â€¦U-006), U-002 exit criteria, U-001B traceability note |
| E8 | `docs/CIVOLINK_U002_2_PROGRESS_READINESS_AND_GOVERNANCE_AUDIT.md` and `docs/CIVOLINK_U002_2_1_EXECUTION_READINESS_CORRECTION_REPORT.md` Â§10 | Readiness findings; the U-002.3 activity list this package implements (page hierarchy, content structure, messaging drafts, product/service descriptions, CTAs, placeholders, responsive/accessibility requirements, static-first planning) |

**Maturity-label evidence (used for every status badge in Â§6â€“Â§11):**

| Label | Applied to | Evidence |
|---|---|---|
| **In development** | CIVOLINK WIFI | E5 (backend code + Phase 1B cycle); consistent with reference-suite badge and register D21 default |
| **In development** | Biashara Flow | E6 (existing development project with passing test suite) â€” see the discrepancy note below |
| **In preparation** | CIVOLINK corporate website | This task and its companions are content preparation; the site itself is not built (U-003) |
| **Future concept** | `docs.civolink.com`, `accounts.civolink.com` | E3 Â§6 (planned only; no registration evidence); `accounts.civolink.com` requires a separate identity architecture (E3 Â§5.2, Â§D13) |
| **Planned** | Future products | E3 Â§5.1; brand guidelines Â§20 (individual approval required) |

**Recorded discrepancy â€” Biashara Flow status and naming.** This repository's governance documents label Biashara Flow `PLANNED` (E3 Â§5.1, brand guidelines Â§19, reference-suite badge), while E6 shows an active development project. The maturity label used here is **In development**, per the evidence above and the U-002.2 finding that "its development status is established". Additionally, the external project's README describes *Biashara Flow* as an internal implementation codename that does not appear in its UI text. **Public product naming and status wording therefore require owner confirmation under D21 (with D15 for brand-family treatment); no new decision ID was created.** Until confirmed, every Biashara Flow block in this package is class B.

---

## 3. Brand, voice and legal rules applied

All six pages inherit these rules without exception. Violating any of them makes copy unpublishable regardless of approval status.

### 3.1 Identity rules (brand guidelines Â§2â€“Â§5, architecture Â§3.3)

1. Brand contexts say **CIVOLINK** (capitals). Legal/identity contexts say **CIVOLINK ENTERPRISES**. No third variant; no **LTD/LIMITED**; never "company", "incorporated" or "corporation".
2. Approved public distinction statement (footer / About / legal contexts):
   > CIVOLINK is a brand operated under CIVOLINK ENTERPRISES, a registered business name in Kenya. Registration No.: BN-55SLLRED.
3. **BN-55SLLRED** may appear (optional, owner-approved) only together with the registered business name; recommended placement is footer, About or a legal page â€” never the homepage hero.
4. Entity status **ACTIVE** and registration date **26 June 2025** are internal reference only (rule 8) â€” never published.
5. The registered street address is **not automatically published** (rule 9); the postal address needs separate owner approval (rule 10). Per register D18 (U-001B update), **no address is published without owner instruction.**
6. Registration particulars are `OWNER-SUPPLIED` and must be verified against the official certificate before publication (rule 11). Verification has not happened; all such copy is class C until it does.
7. Never invent dates of incorporation, directors, licences, awards, customer counts, uptime, coverage, revenue or response times.

### 3.2 Voice rules (brand guidelines Â§7â€“Â§8, architecture Â§3.3)

- Tagline **CONNECTING IDEAS Â· BUILDING SOLUTIONS** (middle dot U+00B7, capitals) â€” owner-approved; used once per view; never rewritten, translated or used as a service or performance claim. The reference-suite hero line "Practical technology, connected." is superseded (guidelines Â§7.3).
- Plain language, short sentences. No superlatives ("leading", "best", "fastest"), no unverifiable numbers, no jargon walls.
- Status honesty: never "Live", "Available" or "Now serving" unless genuinely true. Every badge must match reality (guidelines Â§8.2, architecture Â§9.2).
- Accuracy over ambition: brand-positioning areas (guidelines Â§6) are never presented as registered business activities or delivered services.
- Brand-voice wording itself remains open under D15 (only the tagline is approved); voice used here follows guidelines Â§8.2 as the documented default.

### 3.3 Content rules

- No invented contact channels, offices, emails, phone numbers, social accounts, prices, SLAs, certifications or statistics. Unresolved particulars appear as explicit placeholders (Â§4).
- Planned domains (`civolink.com`, `wifi.`, `biashara.`, `docs.`, `accounts.`) render as **styled text, never links**, until each resolves (architecture Â§6, D17).
- Only the six approved colours (guidelines Â§9) and approved logo variants (guidelines Â§11) may appear in production; no third-party fonts, icons or image hosts (guidelines Â§16).

---

## 4. Content governance framework

Every content block in Â§6â€“Â§11 carries a **category** and a **class** in that page's governance table.

### 4.1 Categories

| Category | Meaning |
|---|---|
| **Ready for owner review** | Draft complete, internally consistent, no unsupported claims â€” awaiting owner review and approval |
| **Requires owner confirmation** | Depends on an open decision (D14, D15-residual, D18, D19, D20, D21); written under the documented default until the owner answers |
| **Requires verified factual info** | Owner-supplied particulars that must be checked against source records (registration certificate â€” rule 11) before use |
| **Restricted from publication** | Explicitly not approved for public display (rules 8â€“10; D19 channels; any form before privacy/terms) |
| **Future content** | Deferred by design; recorded here so it is not silently lost, but not part of the launch copy |

### 4.2 Classes

| Class | Meaning |
|---|---|
| **A â€” Drafting permitted** | No owner decision is needed to write it; it may be approved through normal review |
| **B â€” Owner review required** | Drafted under a documented default; cannot be approved or published until the named decision is answered or the owner signs off |
| **C â€” Publication restricted** | Must not appear publicly until a verification or approval gate clears, even where owner-supplied values already exist |

### 4.3 Master gate table (decisions referenced in this package)

| ID | Status (register, 2026-11-11) | What it gates here | Default applied in this draft |
|---|---|---|---|
| **D14** | PARTIALLY RESOLVED (positioning areas/tagline approved; mission/vision/values wording open â€” gap G8) | Home/About mission, vision, values, corporate description | Architecture Â§4 wording used as labelled draft |
| **D15** | PARTIALLY RESOLVED (tagline approved; brand-voice wording open) | Copy tone; hero line choice | Tagline per guidelines Â§7; voice per guidelines Â§8.2 |
| **D16** | PARTIALLY RESOLVED (palette + 8 SVGs approved; G1/G5/G6 open) | Logo assets in production build | Asset names referenced only; G1 does not block content drafting (U-002.2.1) |
| **D17** | **PARTIALLY RESOLVED (2026-11-16)** â€” primary domain adopted: `civolink.co.ke` (registrar: Truehost; email routing: Cloudflare Email Routing; public contact: `info@civolink.co.ke` â€” see `CIVOLINK-WORKSPACE-AUDIT\CIVOLINK_DOMAIN_REGISTER_AND_VERIFICATION.md` Â§9). `.com` retention/redirect question remains open | Any clickable domain | Planned domains as styled text only; email now shown as the public contact address (see D19) |
| **D18** | OPEN (U-001B rules 9â€“10 supersede the older default) | Any address on About/Contact | **No address published**; placeholders with explanation |
| **D19** | **PARTIALLY RESOLVED (2026-11-16)** â€” public business email confirmed: **`info@civolink.co.ke`**. Phone, WhatsApp, social accounts, support hours, form data-handling, form go-live remain open | Contact channels, support hours, form data handling, form go-live | `info@civolink.co.ke` now the approved public contact; remaining channels still explicit placeholders; **no form goes live** |
| **D20** | OPEN | Final page set, URLs, page names | Six-page task scope used; architecture Â§8.1 seven-page set recorded as the divergent proposal |
| **D21** | OPEN | Product descriptions and status claims | Reference-suite wording + evidence-backed maturity labels; no pricing/dates/coverage; Biashara Flow listing marked for confirmation |
| **D22** | OPEN | Production stack statement on Technology page | Static-first direction presented as plan, labelled proposal |
| **D23** | OPEN | Hosting/TLS/DNS details | Not mentioned in public copy |
| **D24** | OPEN | Analytics/cookies | Default: no analytics, no non-essential cookies; stated plainly in footer/legal note |
| **D25** | OPEN | CMS/editorial | Default: static files; no CMS mentioned to visitors |

---

## 5. Global site elements

These appear on every page and are drafted once here; Â§6â€“Â§11 reference them instead of repeating them.

### 5.1 Primary navigation

```text
Home Â· Our Platforms Â· Services Â· Technology Â· About Â· Contact
```

- Desktop: horizontal, visible. Mobile: collapsible toggle (same pattern as the reference suite's `nav-toggle`).
- Active page indicated visually and via `aria-current="page"`.
- No account/login link (no central accounts â€” Â§D13). No product sub-menus at launch.

### 5.2 Footer (four columns + note)

| Column | Content |
|---|---|
| **Brand** | Approved logo variant (light backgrounds: `CIVOLINK_Primary.svg`; dark: `CIVOLINK_Reversed.svg` â€” assets external to repo, gap G1), one-line descriptor: "The public brand of CIVOLINK ENTERPRISES â€” independently engineered products, one coherent identity." |
| **Site** | Home Â· Our Platforms Â· Services Â· Technology Â· About Â· Contact |
| **Products** | CIVOLINK WIFI Â· Biashara Flow Â· Future products (all â†’ `#services` anchors on `/services`) |
| **Planned destinations** | `civolink.com` Â· `wifi.civolink.com` Â· `biashara.civolink.com` Â· `docs.civolink.com` Â· `accounts.civolink.com` â€” **styled text, never links**, each marked planned/future (D17) |

**Identity block** (footer bottom, brand guidelines Â§5 approved rendering):

```text
CIVOLINK is a brand operated under CIVOLINK ENTERPRISES,
a registered business name in Kenya. Registration No.: BN-55SLLRED.
```

**Footer note** (draft): "No analytics, no non-essential cookies and no external services are used by this site." (True under the D24 default; must be re-checked if D24 changes.) Copyright line: `Â© 2026 CIVOLINK` (year dynamic).

### 5.3 Status-badge vocabulary (provisional, evidence-backed â€” Â§2)

| Badge | Meaning shown to visitors | Allowed on |
|---|---|---|
| **In development** | Engineering work exists and is ongoing; not generally available | CIVOLINK WIFI, Biashara Flow |
| **In preparation** | Content and planning under way; site not built yet | CIVOLINK corporate website |
| **Planned** | Approved direction; no product built | Future products |
| **Future concept** | Considered, not started, requires its own decision | `docs.civelink.com`, `accounts.civolink.com` |

Rules: one badge per item; badge must be true at publish time; never "Live"/"Available" unless verified in U-004; badges are text with sufficient contrast (guidelines Â§21), never colour-only.

### 5.4 Tagline placement

Homepage hero only (plus optional footer signature). Never repeated within one screen (guidelines Â§7.2). Product/service names lead on their own pages.

### 5.5 Placeholders (explicit, machine-findable)

Unresolved particulars render as:

```text
[PLACEHOLDER â€” D19: telephone/WhatsApp/social/support hours not yet provided]
[NOT PUBLISHED â€” address disclosure pending owner instruction (D18, rules 9â€“10)]
[NOT LIVE â€” contact form activates only after privacy policy and terms are published]
```

Resolved particulars (2026-11-16) render plainly:

```text
info@civolink.co.ke â€” approved public contact email (D17/D19 partial resolution; Cloudflare Email Routing â†’ owner-verified destination mailbox)
```

Placeholders are styled distinctly (notice component) so they can never be mistaken for finished content, and a pre-launch sweep must find zero `[PLACEHOLDER`/`[NOT PUBLISHED`/`[NOT LIVE` strings before go-live unless the owner has consciously accepted them. The business-email placeholder in this file is now resolved; pre-launch verification must find zero remaining `business email` placeholders anywhere.

---

## 6. Home page content â€” `/`

### 6.1 Page metadata

| Field | Value |
|---|---|
| Purpose | First impression and routing: what CIVOLINK is, what exists, where to go next |
| Audience | First-time visitors: prospects, partners, evaluators |
| Primary question | **"What is CIVOLINK, and can it help me?"** |
| URL | `/` (file `index.html`) |
| Nav label | **Home** |
| `<title>` | `CIVOLINK â€” CONNECTING IDEAS Â· BUILDING SOLUTIONS` |
| Meta description (draft) | `CIVOLINK is a technology and business brand: wireless internet and ICT support, plus independently engineered digital products under one coherent identity.` |
| Source | `docs/umbrella-reference/index.html` (retained with modifications, architecture Â§7 #1) |
| Primary CTA | **Explore our services** â†’ `/services` |
| Secondary CTAs | See our platforms â†’ `/platforms`; How we build â†’ `/technology`; Contact â†’ `/contact` |
| Dependencies | D14 (hero/description wording), D20 (page set), D21 (platform status labels), D17 (domain block) |

### 6.2 Section hierarchy

```text
H1 CIVOLINK + tagline + lead + [primary/secondary CTAs]
H2 An ecosystem, not a monolith            (platform preview cards Ã—3)
H2 Built on choices we can defend          (engineering summary â†’ /technology)
H2 A single brand over independent engineering  (why CIVOLINK)
H2 One front door, separate rooms          (business value)
H2 Planned domain architecture             (styled-text table, non-clickable)
H2 Have a project, partnership or product question?  (CTA band â†’ /contact)
```

### 6.3 Draft copy

**H1 â€” CIVOLINK**

Tagline (brand signature, owner-approved):
`CONNECTING IDEAS Â· BUILDING SOLUTIONS`

Lead (draft â€” class B, D14):
> CIVOLINK is a technology and business brand. We provide wireless internet and ICT support, and we build independently engineered digital products â€” each standing on its own, presented under one identity.

Buttons: **Explore our services** (primary) Â· **See our platforms** (secondary)

---

**H2 â€” An ecosystem, not a monolith**

> Products differ. The brand does not. Every platform under CIVOLINK keeps its own engineering, data and release cycle â€” the umbrella is a shared face, not a shared backend.

Card 1 â€” **CIVOLINK WIFI** Â· badge `In development`
> Managed Wi-Fi hotspot connectivity: visitor login, paid access and router provisioning. In development â€” not presented as generally available.

Card 2 â€” **Biashara Flow** Â· badge `In development`
> A business management platform for groups, transactions, savings, loans and multi-business ventures. In development â€” no launch date or pricing is published. *(Public product listing pending owner confirmation â€” D21.)*

Card 3 â€” **Future products** Â· badge `Planned`
> New products join the brand only after individual approval. Nothing is announced before it exists.

---

**H2 â€” Built on choices we can defend**

> We favour small, explicit systems over clever ones. Products stay independent. We publish status honestly â€” something is planned, in development or live, and we say which. Read how we build â†’ `/technology`.

---

**H2 â€” A single brand over independent engineering**

> CIVOLINK gives independently built products one coherent market face: one identity, one voice, one visual system â€” without merging the systems behind them. Shared branding never creates shared logins, shared databases or shared privileged access.

---

**H2 â€” One front door, separate rooms**

> Customers and partners deal with one brand. Behind it, each product keeps its own infrastructure and responsibilities. A problem in one system does not become a problem in another.

---

**H2 â€” Planned domain architecture**

> These destinations are planned. They are shown as text, not links, until each one exists.

```text
civolink.com           â€” corporate website (this site)
wifi.civolink.com      â€” CIVOLINK WIFI            [planned]
biashara.civolink.com  â€” Biashara Flow            [planned]
docs.civolink.com      â€” documentation portal     [future]
accounts.civolink.com  â€” central accounts         [future concept]
```

---

**H2 â€” Have a project, partnership or product question?**

> Tell us what you need and we will take it from there.

Button: **Contact CIVOLINK** â†’ `/contact`

### 6.4 Internal links

`/services` (primary), `/platforms`, `/technology`, `/contact`, footer links per Â§5.2. No external links. No links to planned domains.

### 6.5 Governance

| Content block | Category | Class | Gate / evidence |
|---|---|---|---|
| H1, tagline | Ready for owner review | A | Tagline owner-approved (guidelines Â§7) |
| Hero lead (corporate description) | Requires owner confirmation | B | **D14** â€” architecture Â§4 draft used |
| Platform cards + status badges | Requires owner confirmation | B | **D21** â€” labels evidence-backed (Â§2); Biashara Flow naming confirmation noted |
| Engineering/values summary | Ready for owner review | A | Guidelines Â§8; no claims beyond Â§8.2 |
| Independence statements | Ready for owner review | A | Architecture Â§5.2 (non-negotiable design constraints) |
| Planned domain table | Ready for owner review | A | **D17** â€” styled text, never links (architecture Â§6) |
| Contact CTA target | Requires owner confirmation | B | **D19** - email channel confirmed 2026-11-16 (info@civolink.co.ke); remaining channels + form go-live pending |
| Footer identity block + BN-55SLLRED | Requires verified factual info | C | Rule 11 (certificate verification) + rule 4 (paired with registered name) |
| Entity status/date, any address | Restricted from publication | C | Rules 8â€“10; **D18** |

---

## 7. Our Platforms page content â€” `/platforms`

### 7.1 Page metadata

| Field | Value |
|---|---|
| Purpose | Honest inventory of the ecosystem: what exists, what each thing is for, what stage it is at, and how independence works |
| Audience | Evaluators, partners, technically curious prospects doing due diligence |
| Primary question | **"What does CIVOLINK actually have, and what stage is each thing at?"** |
| URL | `/platforms` (file `platforms.html`) |
| Nav label | **Our Platforms** |
| `<title>` | `Our Platforms â€” CIVOLINK` |
| Meta description (draft) | `The platforms under the CIVOLINK brand: managed Wi-Fi, business management software and planned services â€” each independently engineered, each with an honest status.` |
| Source | `docs/umbrella-reference/control-center.html` â€” **renamed and rewritten**: health model, health/status-of-directory labels, stat-strip counts, central-account concept and the "Control Center" title all removed (architecture Â§7 #3); true maturity badges retained (Â§2) |
| Primary CTA | Evaluate our services â†’ `/services` |
| Secondary CTAs | How we build â†’ `/technology`; Contact â†’ `/contact` |
| Dependencies | D20 (page inclusion â€” architecture Â§8.2 deferred this page; task scope includes it), D21 (status claims), D17 (domains), D14 (descriptions) |

### 7.2 Section hierarchy

```text
H1 Our Platforms + lead
H2 Platform inventory            (table with stage column + stage key)
H2 One front door, separate rooms (independence narrative)
H2 Planned destinations          (styled-text table, non-clickable)
H2 Future products
H2 Talk to us about a platform   (CTA band)
```

### 7.3 Draft copy

**H1 â€” Our Platforms**

Lead (draft â€” class B, D14):
> CIVOLINK is the umbrella over a set of independently engineered platforms. This page lists what exists, what each one is for, and what stage it is at. Nothing here is described as available when it is not.

---

**H2 â€” Platform inventory**

| Platform | What it is | Stage |
|---|---|---|
| **CIVOLINK corporate website** | Brand, product discovery and contact routing (this site) | `In preparation` |
| **CIVOLINK WIFI** | Managed Wi-Fi hotspot connectivity | `In development` |
| **Biashara Flow** | Business and enterprise management platform | `In development` * |
| **Documentation portal** (`docs.civelink.com`) | Technical documentation and support | `Future concept` |
| **Central accounts** (`accounts.civelink.com`) | Potential shared sign-in service â€” not decided | `Future concept` |

\* Development status is evidenced by an existing project outside this repository; public product naming and status wording require owner confirmation (D21).

**Stage key:**
- `In preparation` â€” content and planning under way; the thing itself is not built yet.
- `In development` â€” engineering work exists and is ongoing; not generally available.
- `Future concept` â€” considered but not started; requires its own decision before anything is promised.

---

**H2 â€” One front door, separate rooms**

> Every platform under CIVOLINK keeps its own systems: its own data, its own security boundaries, its own releases and its own operational responsibilities. Shared branding does not create shared logins, shared databases or shared privileged access. Failure of one platform does not take another with it. The corporate website itself holds no product data and connects to no product backend.

---

**H2 â€” Planned destinations**

> Planned addresses are shown as text. They are not links until each one exists.

```text
civolink.com           â€” corporate website (this site)
wifi.civolink.com      â€” CIVOLINK WIFI            [planned]
biashara.civolink.com  â€” Biashara Flow            [planned]
docs.civolink.com      â€” documentation portal     [future]
accounts.civolink.com  â€” central accounts         [future concept]
```

---

**H2 â€” Future products**

> New products join the CIVOLINK brand only after individual approval. They inherit the identity â€” not the infrastructure. No future product is announced before it has been approved and can be described honestly.

---

**H2 â€” Talk to us about a platform**

> Questions about a platform, a partnership or an integration start here.

Buttons: **View services** â†’ `/services` Â· **Contact** â†’ `/contact`

### 7.4 Internal links

`/services`, `/technology`, `/contact`, `/` (nav). Planned domains styled text only.

### 7.5 Governance

| Content block | Category | Class | Gate / evidence |
|---|---|---|---|
| Page existence/URL | Requires owner confirmation | B | **D20** â€” architecture Â§8.2 deferred this page; task scope includes it; owner confirms |
| Inventory table + stage key | Requires owner confirmation | B | **D21** â€” labels evidence-backed (Â§2) |
| Biashara Flow row and naming | Requires owner confirmation | B | **D21** (+ D15 brand-family treatment); discrepancy recorded in Â§2 |
| Independence narrative | Ready for owner review | A | Architecture Â§5.2 |
| Planned destinations table | Ready for owner review | A | **D17** â€” non-clickable until resolved |
| Central-accounts row | Ready for owner review | A | Architecture Â§5.2 #3 â€” presented as undecided future concept; **no** account feature implied |
| Removed demonstration content (health model, counts, directory statuses, central-account flow) | Future content | A | Architecture Â§7 #3 â€” must never be reintroduced |
| Lead/wording polish | Requires owner confirmation | B | **D14** (corporate description wording) |

---

## 8. Services page content â€” `/services`

### 8.1 Page metadata

| Field | Value |
|---|---|
| Purpose | Let visitors evaluate what CIVOLINK provides, understand what is registered activity versus brand positioning, and find the offering that fits |
| Audience | SMEs and organisations with a connectivity, ICT or business-software need |
| Primary question | **"What can CIVOLINK do for me, and which offering fits?"** |
| URL | `/services` (file `services.html`) |
| Nav label | **Services** |
| `<title>` | `Services â€” CIVOLINK` |
| Meta description (draft) | `Wireless internet and ICT support from CIVOLINK, plus business software in development: CIVOLINK WIFI and Biashara Flow â€” with honest status for each.` |
| Source | `docs/umbrella-reference/products.html` (product-discovery structure retained; page retitled "Services" per task scope â€” naming divergence from architecture Â§7 `/products` recorded in the sitemap document, pending D20) |
| Primary CTA | Contact us about your needs â†’ `/contact` |
| Secondary CTAs | See platform inventory â†’ `/platforms`; anchors to each service/product block |
| Dependencies | D21 (product descriptions/status), D14 (positioning wording), D20 (page name/URL), D19 (contact CTA â€” email channel confirmed 2026-11-16) |

### 8.2 Section hierarchy

```text
H1 Services + lead
H2 What we provide                 (registered business activity Ã—2)
H2 What we are building            (brand positioning areas â€” labelled as such)
H2 Products
   H3 CIVOLINK WIFI                [In development]
   H3 Biashara Flow                [In development]
   H3 Future products              [Planned]
H2 Product status summary          (table)
H2 Not sure which fits?            (CTA band â†’ /contact)
```

### 8.3 Draft copy

**H1 â€” Services**

Lead (draft â€” class B, D14):
> CIVOLINK provides wireless internet and ICT support, and builds business software and management platforms. This page separates what we provide today from what we are building â€” so nothing here overstates what exists.

---

**H2 â€” What we provide**

*Scope note (class B): the registered nature of business of CIVOLINK ENTERPRISES is **Provision of Wireless Internet and ICT Support Services** (owner-supplied; verify against the certificate before publication â€” rule 11).*

**Wireless internet and connectivity**
> Managed Wi-Fi hotspot connectivity â€” the core of what the business is registered to provide. Visitor login, paid access and router provisioning for hotspot networks are engineered as an independent product: CIVOLINK WIFI (below).

**ICT support services**
> Practical ICT support for businesses and organisations. Support scope, channels and hours are being finalised and will be published on the contact page when confirmed.

---

**H2 â€” What we are building**

> These are brand-positioning areas, not claims about registered activities or delivered services. Work appears here only when it exists.

| Positioning area | What it means for you | Stage |
|---|---|---|
| Business software | Independently engineered software for business use | In development (see Biashara Flow) |
| Business management systems | Tools for running day-to-day business operations | In development (see Biashara Flow) |
| Construction technology | Technology support for construction businesses â€” a stated direction | No product announced |
| Future digital products | New products under consideration | Planned; approved individually |

---

**H2 â€” Products**

**H3 â€” CIVOLINK WIFI** Â· badge `In development`
> CIVOLINK WIFI is a managed Wi-Fi hotspot platform: a customer login and payment flow, and secure provisioning for MikroTik routers. It is in development. It is not presented as generally available, and no pricing, coverage area, customer numbers or availability dates are published.

**H3 â€” Biashara Flow** Â· badge `In development` *(listing pending owner confirmation â€” D21)*
> Biashara Flow is a business management platform: groups and members, transactions, savings and loans with dual-authorization governance, multi-business ventures, payments, and a public storefront with M-Pesa checkout. It is in development, evidenced by an active engineering project with an automated test suite. No launch date, price list or availability claim is published.

**H3 â€” Future products** Â· badge `Planned`
> Future products are approved individually before they use the CIVOLINK brand. No future product is named, dated or promised here.

---

**H2 â€” Product status summary**

| Product | Stage | Availability statement |
|---|---|---|
| CIVOLINK WIFI | In development | Not generally available |
| Biashara Flow | In development | Not generally available â€” public listing pending owner confirmation (D21) |
| Future products | Planned | No product named, dated or promised |

---

**H2 â€” Not sure which fits?**

> Tell us what you need â€” connectivity for a venue, software for a business, ICT support, or something else â€” and we will point you to the right place.

Button: **Contact CIVOLINK** â†’ `/contact`

### 8.4 Internal links

`/platforms`, `/technology`, `/contact`, `/` (nav). Anchors: `#services-provide`, `#services-building`, `#civoli-wifi`, `#biashara-flow`, `#future-products` (footer product links target these).

### 8.5 Governance

| Content block | Category | Class | Gate / evidence |
|---|---|---|---|
| "What we provide" scope note (registered nature) | Requires verified factual info | C | Rule 11 â€” certificate verification before publication |
| ICT support description (scope/hours) | Requires owner confirmation | B | **D19** â€” support channels/hours open; no specifics invented |
| Positioning-areas table | Requires owner confirmation | B | **D14** â€” areas owner-approved (guidelines Â§6); wording draft |
| Construction technology row | Requires owner confirmation | B | **D14** â€” brand ambition, explicitly not a registered-activity claim (guidelines Â§6) |
| CIVOLINK WIFI description + badge | Requires owner confirmation | B | **D21** â€” evidence E5; wording per register default |
| Biashara Flow description + badge | Requires owner confirmation | B | **D21** â€” evidence E6; naming/status confirmation recorded (Â§2) |
| Product status summary | Requires owner confirmation | B | **D21** â€” no status asserts a state that is not true |
| Prices, dates, coverage, customer counts, SLAs | Restricted from publication | C | Guidelines Â§8.2; none exist â€” never invented |
| Contact CTA | Requires owner confirmation | B | **D19** - email channel confirmed 2026-11-16; page otherwise ships with remaining placeholders until channels exist |

---

## 9. Technology page content â€” `/technology`

### 9.1 Page metadata

| Field | Value |
|---|---|
| Purpose | Publish the engineering principles behind CIVOLINK products â€” credibility without implying an API, a status page or a spec that does not exist |
| Audience | Developers, integrators, technical evaluators, partners doing due diligence |
| Primary question | **"How does CIVOLINK build and run systems â€” and can I integrate with them?"** |
| URL | `/technology` (file `technology.html`) |
| Nav label | **Technology** |
| `<title>` | `Technology â€” CIVOLINK` |
| Meta description (draft) | `How CIVOLINK systems are built: independent applications, explicit boundaries, honest status â€” engineering principles from an active product portfolio.` |
| Source | `docs/umbrella-reference/developers.html` â€” renamed to Technology per architecture Â§7 #4; illustrative API payload block and `example.invalid` samples removed (they imply an API that does not exist) |
| Primary CTA | Talk to us about a technical question â†’ `/contact` |
| Secondary CTAs | See platforms â†’ `/platforms`; Services â†’ `/services` |
| Dependencies | D22 (site stack statement), D21 (product stack/status claims), D20 (page set) |

### 9.2 Section hierarchy

```text
H1 Technology + lead
H2 Build against a product, not a monolith
H2 Independent applications, shared presentation
H2 Small, explicit, versioned â€” when they exist
H2 Boundaries before features
H2 A pattern, not a specification
H2 How this site is built                (proposed static-first â€” D22)
H2 Where technical writing will live     (future documentation portal)
H2 Planning an integration?              (CTA band â†’ /contact)
```

### 9.3 Draft copy

**H1 â€” Technology**

Lead (draft â€” class B, D14):
> How CIVOLINK systems are built and run. These are working engineering principles, not a published standard and not a product API.

---

**H2 â€” Build against a product, not a monolith**

> Each product is its own application with its own data and its own release cycle. There is no shared core that everything depends on. A change in one product cannot break another by accident.

---

**H2 â€” Independent applications, shared presentation**

> Products present themselves under one brand identity while remaining separate systems. The corporate website is static content: it holds no product data, connects to no product backend, and offers no shared login.

---

**H2 â€” Small, explicit, versioned â€” when they exist**

> Where interfaces exist, they are small, explicit and versioned. Public API documentation does not exist yet. When it does, it will live at the planned documentation portal â€” shown as text until it exists: `docs.civolink.com [future]`.

---

**H2 â€” Boundaries before features**

> Security boundaries, data ownership and operational responsibility are defined before features are added. Failure of one system does not take another with it. Access is granted per system, never inherited from the brand.

---

**H2 â€” A pattern, not a specification**

> These principles are observed across current engineering work. They are not a contractual specification, a service-level agreement or a guarantee of uptime. Product-specific documentation will be published per product when each product is ready for it.

---

**H2 â€” How this site is built**

*(Proposed direction â€” class B, D22 open.)*
> The corporate website is planned as hand-authored static HTML and CSS: no framework, no database, no accounts, no analytics and no third-party assets. Nginx is the approved web server. Content is edited as files; there is no content-management system at launch. The final production stack and hosting topology remain an open decision.

---

**H2 â€” Where technical writing will live**

> A documentation and support portal is planned at `docs.civolink.com [future]`. It does not exist yet and is not linked. Until it does, technical questions go through the contact page.

---

**H2 â€” Planning an integration?**

> If you are evaluating an integration or a technical partnership, tell us what you are building and which platform you want to work with.

Buttons: **Contact CIVOLINK** â†’ `/contact` Â· **See platforms** â†’ `/platforms`

### 9.4 Internal links

`/contact`, `/platforms`, `/services`, `/` (nav). No links to planned domains; no payload examples; no `example.invalid`.

### 9.5 Governance

| Content block | Category | Class | Gate / evidence |
|---|---|---|---|
| Engineering-principles sections | Ready for owner review | A | Architecture Â§5.2/Â§5.3, Â§11; no metrics or SLAs (guidelines Â§8.2) |
| "Not a specification/SLA" disclaimer | Ready for owner review | A | Required honesty guard (no invented SLAs) |
| "How this site is built" | Requires owner confirmation | B | **D22** â€” static-first/Nginx direction; presented as plan, not fact |
| Documentation-portal mention | Ready for owner review | A | Architecture Â§6 â€” future concept, styled text, non-clickable |
| Product stack details (if added later) | Requires owner confirmation | B | **D21** â€” only evidence-backed statements; none published beyond stage badges |
| API/payload documentation | Future content | A | Deferred to future `docs.civolink.com` (architecture Â§7 #4) â€” no API claimed |
| Hosting/TLS/DNS specifics | Restricted from publication | C | **D23** open â€” no provider, domain or TLS claims |

---

## 10. About page content â€” `/about`

### 10.1 Page metadata

| Field | Value |
|---|---|
| Purpose | Identity and trust: who is behind CIVOLINK, what it stands for, how the brand and the legal entity relate |
| Audience | Everyone doing due diligence: customers, partners, evaluators |
| Primary question | **"Who is behind CIVOLINK, and can I trust them?"** |
| URL | `/about` (file `about.html`) |
| Nav label | **About** |
| `<title>` | `About CIVOLINK â€” CIVOLINK ENTERPRISES` |
| Meta description (draft) | `CIVOLINK is the public brand of CIVOLINK ENTERPRISES, a registered business name in Kenya: one identity over independently engineered products.` |
| Source | `docs/umbrella-reference/about.html` (retained with modifications; the "no awards claimed" hedging removed per architecture Â§7 #5) |
| Primary CTA | Contact â†’ `/contact` |
| Secondary CTAs | Technology â†’ `/technology`; Services â†’ `/services` |
| Dependencies | D14 (mission/vision/values/description wording), D18 (address), rule 11 (registration verification), D20 (page set), D15-residual (voice) |

### 10.2 Section hierarchy

```text
H1 About CIVOLINK + lead
H2 What CIVOLINK is
H2 Our promise                        (tagline block)
H2 Mission and vision                 [DRAFT â€” D14]
H2 What we hold to                    (values â€” D14 confirm)
H2 Where we focus                     (positioning areas + distinction note)
H2 How we are organised               (brand vs legal entity; independence)
H2 Business identity                  (identity block; verification note)
H2 What we are aiming to contribute   [DRAFT â€” D14]
H2 Want to work with CIVOLINK?        (CTA band)
```

### 10.3 Draft copy

**H1 â€” About CIVOLINK**

Lead (draft â€” class B, D14):
> CIVOLINK is the public brand of CIVOLINK ENTERPRISES, a registered business name in Kenya. One identity over independently engineered products.

---

**H2 â€” What CIVOLINK is**

> CIVOLINK ENTERPRISES is a Kenyan technology business. Its registered nature of business is the provision of wireless internet and ICT support services. Under the CIVOLINK brand, independently engineered products â€” connectivity, business software and future digital products â€” are presented as one coherent market face.

---

**H2 â€” Our promise**

```text
CONNECTING IDEAS Â· BUILDING SOLUTIONS
```
> The official CIVOLINK tagline. It is a promise about how we work â€” connecting ideas into working systems and building solutions that stand on their own â€” not a performance or uptime claim.

---

**H2 â€” Mission and vision** `[DRAFT â€” awaiting D14; not approved for publication]`

Mission (draft â€” architecture Â§4):
> To deliver practical, independently engineered digital solutions that support connectivity, business operations and digital platforms â€” each standing on its own engineering while presenting one coherent market face.

Vision (draft â€” architecture Â§4):
> To be a credible Kenyan technology business with potential international reach, recognised for independently built products, transparent architecture and customer-focused service â€” without inflated claims or unverified achievements.

---

**H2 â€” What we hold to** `[wording awaiting D14 confirmation]`

| Value | What it means in practice |
|---|---|
| **Independent engineering** | Each product stands on its own; no inflated claims of shared infrastructure or shared capability |
| **One coherent face** | Products differ, but the brand speaks with one voice and one visual system |
| **Practical, not hype** | We promote what is built and true; we never invent metrics, coverage, customers or dates |
| **Honest about status** | A product is planned, in development or live â€” and the label matches reality |
| **Respectful of legal identity** | The registered entity is described accurately, never inflated into a company it is not |

---

**H2 â€” Where we focus**

> CIVOLINK is positioned across ICT services, wireless internet and connectivity, business software, construction technology, business management systems, and future digital products.
>
> **Distinction:** the registered nature of the business is the provision of wireless internet and ICT support services. The wider positioning areas are brand direction â€” where the brand is aimed â€” not claims about registered activities or services already delivered.

---

**H2 â€” How we are organised**

> CIVOLINK is the brand. CIVOLINK ENTERPRISES is the registered business name behind it. Products are not separate legal entities and do not carry their own registration.
>
> Shared branding never creates shared systems: each product keeps its own data, its own security boundaries and its own releases. If one product has a problem, the others are unaffected.

---

**H2 â€” Business identity**

Identity block (approved wording, brand guidelines Â§5):

```text
CIVOLINK is a brand operated under CIVOLINK ENTERPRISES,
a registered business name in Kenya. Registration No.: BN-55SLLRED.
```

| Particular | Publication state in this draft |
|---|---|
| Registered business name | Published (approved) |
| Registration number BN-55SLLRED | Published with the registered name (optional approval, guidelines Â§5) |
| Entity type â€” registered Business Name in Kenya | Published (must be described accurately; never "company"/"Ltd") |
| Registered nature of business | May be stated factually where relevant; not extrapolated |
| Entity status `ACTIVE`, registration date `26 June 2025` | **Not published** â€” internal reference only (rule 8) |
| Registered street address | **Not published** â€” pending owner instruction (rule 9, D18) |
| Postal address | **Not published** â€” requires separate owner approval (rule 10) |

> **Verification note (internal â€” remove before publication):** all registration particulars above are owner-supplied and have not been checked against the official registration certificate. Verification (rule 11) is required before this page is published.

---

**H2 â€” What we are aiming to contribute** `[DRAFT â€” awaiting D14]`

> Practical technology that works in real conditions: connectivity for venues and communities, software that helps businesses run day to day, and an engineering culture that says plainly what is ready and what is not.

---

**H2 â€” Want to work with CIVOLINK?**

> Partnerships, projects and product questions all start in the same place.

Button: **Contact CIVOLINK** â†’ `/contact`

### 10.4 Internal links

`/contact`, `/technology`, `/services`, `/platforms`, `/` (nav).

### 10.5 Governance

| Content block | Category | Class | Gate / evidence |
|---|---|---|---|
| H1 lead, "What CIVOLINK is" | Requires owner confirmation | B | **D14** â€” description wording draft (architecture Â§4) |
| Tagline block + explanation | Ready for owner review | A | Owner-approved (guidelines Â§7) |
| Mission and vision | Requires owner confirmation | B | **D14** â€” architecture Â§4 draft, explicitly labelled not approved |
| Values table | Requires owner confirmation | B | **D14** â€” guidelines Â§8.1 terms; site wording open (gap G8) |
| Positioning areas + distinction note | Ready for owner review | A | Guidelines Â§6 (owner-approved) + required ambition/registered distinction |
| "How we are organised" | Ready for owner review | A | Guidelines Â§3, Â§17; architecture Â§5.2 |
| Identity block + BN-55SLLRED | Requires verified factual info | C | Rules 4, 11 â€” certificate verification before publication |
| Entity status/date | Restricted from publication | C | Rule 8 |
| Registered/postal address | Restricted from publication | C | Rules 9â€“10; **D18** â€” no address without owner instruction |
| Awards/credentials/hedging language | Restricted from publication | C | Architecture Â§7 #5 â€” no awards claimed; nothing invented |
| Mission/vision/values public release | Requires owner confirmation | B | **D14** â€” no positioning claim published before approval (register default) |

---

## 11. Contact page content â€” `/contact`

### 11.1 Page metadata

| Field | Value |
|---|---|
| Purpose | Route enquiries correctly; state plainly how to reach CIVOLINK once channels exist; never imply a working form where none exists |
| Audience | Prospects, partnership enquiries, technical questions, future support requests |
| Primary question | **"How do I reach CIVOLINK?"** |
| URL | `/contact` (file `contact.html`) |
| Nav label | **Contact** |
| `<title>` | `Contact â€” CIVOLINK` |
| Meta description (draft) | `Contact CIVOLINK: general, partnership and technical enquiry routes. Contact channels are being confirmed and are published here as soon as they are approved.` |
| Source | `docs/umbrella-reference/contact.html` (structure retained; channels remain explicit placeholders; demonstration form never presented as sending mail â€” architecture Â§7 #6) |
| Primary CTA | Choose your route and (once channels exist) send your message |
| Secondary CTAs | Services â†’ `/services`; Platforms â†’ `/platforms` |
| Dependencies | **D19** (channels, hours, form handling â€” hard gate), D18 (address), privacy policy + terms before any form is live (architecture Â§10.2, Kenya Data Protection Act 2019), D20 |

### 11.2 Section hierarchy

```text
H1 Contact + lead
H2 Where your message should go         (route table Ã—3)
H2 Contact channels                     (explicit placeholders â€” D19)
H2 Addresses                            (not published â€” rules 9â€“10, D18)
H2 Send a message                       (form â€” [NOT LIVE]; go-live requirements)
H2 Technical support                    (routing placeholder â€” D19)
H2 Not sure which route fits?           (guidance + CTAs)
```

### 11.3 Draft copy

**H1 â€” Contact**

Lead:
> Choose the route that matches your message. Contact channels are being confirmed; approved channels are published here as soon as they exist.

---

**H2 â€” Where your message should go**

| Route | Use it for | Channel |
|---|---|---|
| **General enquiries** | Questions about CIVOLINK, the brand, partnerships in principle | `info@civolink.co.ke` |
| **Partnerships** | Working together, venue or reseller conversations, integrations | `info@civolink.co.ke` (future sub-address pending D19) |
| **Technical** | Questions about a product or an integration | `info@civolink.co.ke` |

---

**H2 â€” Contact channels**

```text
Business email : info@civolink.co.ke
Telephone      : [PLACEHOLDER â€” D19: not yet provided]
WhatsApp       : [PLACEHOLDER â€” D19: include/exclude not yet decided]
Social accounts: [PLACEHOLDER â€” D19: platforms not yet confirmed]
Support hours  : [PLACEHOLDER â€” D19: not yet defined]
```

> No email address, phone number or social handle is shown because none has been approved yet. This page is updated as soon as the owner confirms the channels. Nothing here is guessed.

---

**H2 â€” Addresses**

```text
Registered address : [NOT PUBLISHED â€” disclosure pending owner instruction (D18; rules 9â€“10)]
Postal address     : [NOT PUBLISHED â€” separate owner approval required (rule 10)]
Operating location : [NOT PUBLISHED â€” D18 open: not confirmed as distinct from registered address]
```

> CIVOLINK ENTERPRISES has registered business particulars in Nairobi. A registered address is registration information â€” it is not published here as a staffed office or a place to walk in, because that has not been confirmed.

---

**H2 â€” Send a message**

```text
[NOT LIVE â€” this form is not active. It activates only after a privacy policy
and terms of use are published and the form is processed securely on the server.]
```

**Form fields (when live â€” draft specification):**
- Name (required)
- Email (required â€” used only to reply)
- Enquiry route (required â€” General / Partnership / Technical)
- Message (required)
- Submit: **Send message**
- Privacy notice adjacent to Submit, linking to `/privacy` (must exist before the form activates)

**Go-live requirements (all mandatory, architecture Â§10.2):**
1. `/privacy` published (what is collected, why, legal basis, retention, contact point, rights under the Kenya Data Protection Act, 2019);
2. `/terms` published;
3. Server-side processing with validated input â€” never a client-side-only "success" message;
4. Spam protection and rate limiting active;
5. Explicit retention period defined (D19 data-handling policy);
6. The static demonstration form from the reference suite is **never** shipped as-is â€” it must be replaced by the real endpoint or removed.

Until every item above is satisfied, the form section renders as the `[NOT LIVE]` notice only, with no input fields.

---

**H2 â€” Technical support**

> `info@civolink.co.ke` serves technical questions at the same central address.
>
> Do not use this page for urgent service issues until support routing is published. Existing product customers will be told directly where support runs from. Support hours and routing remain pending your D19 confirmation.

---

**H2 â€” Not sure which route fits?**

> Read what we provide first, or look at the platform inventory â€” most questions start there.

Buttons: **View services** â†’ `/services` Â· **See platforms** â†’ `/platforms`

### 11.4 Internal links

`/services`, `/platforms`, `/technology`, `/` (nav); `/privacy` and `/terms` **only when those pages exist** (recommended additions â€” sitemap document Â§9).

### 11.5 Governance

| Content block | Category | Class | Gate / evidence |
|---|---|---|---|
| Route table structure | Ready for owner review | A | Reference-suite structure (general/partnership/technical) |
| Business email | Resolved 2026-11-16 | A | **info@civolink.co.ke** â€” approved public contact; Cloudflare Email Routing; committed 2026-11-16 |
| Other channel values (phone/WhatsApp/social/hours) | Requires owner confirmation | B | **D19** â€” explicit placeholders; never invented (architecture Â§10.1) |
| Address rows | Restricted from publication | C | Rules 9â€“10; **D18** â€” no address without owner instruction |
| Form fields + `[NOT LIVE]` notice | Ready for owner review | A | Architecture Â§7 #6, Â§10.2 â€” honest non-live state |
| Form activation | Restricted from publication | C | **D19** + `/privacy` + `/terms` + server-side processing + spam/rate limiting (Kenya DPA 2019) |
| Support channel/hours | Requires owner confirmation | B | **D19** â€” support routing undefined |
| Response-time promises, SLAs | Restricted from publication | C | None exist â€” never invented (guidelines Â§8.2) |

---

## 12. Cross-page requirements: responsiveness, accessibility and static-first planning

These apply to all six pages when they are built in U-003; they are recorded here because U-002.3 owns the requirements, not the implementation.

### 12.1 Responsive requirements

| Requirement | Detail |
|---|---|
| Breakpoints | Verify at 375 px, 768 px and 1440 px (reference-suite verification pattern); reflow down to 320 px with no horizontal scrolling |
| Navigation | Horizontal on desktop; collapsible toggle on mobile with `aria-expanded`, focus trap discipline and a visible close state |
| Tables | Inventory/status tables scroll within their container on narrow screens or restack as cards; never clipped, never truncated |
| Typography | No fixed pixel widths on text containers; body text never below 16 px equivalent; line length ~60â€“75 characters on wide screens |
| Touch targets | â‰¥ 44 Ã— 44 px for nav toggle, buttons and links in the mobile footer |
| Media | No external images or fonts; logo SVGs scale with `max-width: 100%`; reserved aspect ratio to avoid layout shift |
| Motion | Honour `prefers-reduced-motion: reduce` (no animated transitions for users who opt out) |

### 12.2 Accessibility requirements (target: WCAG 2.2 AA â€” verified in U-004)

| Requirement | Detail |
|---|---|
| Structure | Exactly one `<h1>` per page; heading levels never skip; semantic landmarks (`header`, `nav`, `main`, `footer`) |
| Navigation | Skip-to-content link on every page; `aria-current="page"` on the active nav item; keyboard-operable mobile menu |
| Focus | Visible focus indicator on every interactive element; logical focus order; no focus traps |
| Colour | Status badges and links never rely on colour alone (icon/text label included); contrast per brand guidelines Â§21 â€” teal/cyan are not body-text colours on light grounds; text meets 4.5:1 (normal) / 3:1 (large) |
| Forms (when live) | Programmatic labels for every field; errors identified in text, associated via `aria-describedby`; no placeholder-only labels; status messages via `aria-live` |
| Text alternatives | Logo SVGs carry `alt`/`aria-label` ("CIVOLINK"); decorative marks `aria-hidden` |
| Language | `lang="en"` on every page; plain-language reading level in all draft copy |
| Zoom/reflow | 200% zoom without loss of content; 320 px reflow verified |

### 12.3 Static-first implementation planning (input to U-003; D22/D23 open)

| Layer | Plan (proposal â€” defaults from register) |
|---|---|
| Content authoring | Hand-authored semantic HTML5 derived from this package; no client-side framework |
| Build step | None required at launch; minify/asset-hash only if it demonstrably pays for itself |
| Styling | One stylesheet; CSS custom properties for every token (six-colour palette, spacing, type scale); reusable components: `.card`, `.btn`, `.badge`, `.notice`, `.table`, `.cta-band` |
| Scripting | Minimal: nav toggle + dynamic copyright year only; **no analytics, no trackers, no third-party scripts** (D24 default) |
| Backend | None at launch except an optional single contact endpoint (PHP-FPM, own pool/user/logs) **only if D19 approves**; no database, no sessions, no CMS (D25 default) |
| Assets | Approved logo variants only (guidelines Â§11 â€” external assets, gap G1 must clear before build); no web-font CDNs, no icon fonts, no external image hosts |
| Files | Six page files per sitemap mapping (`index.html`, `platforms.html`, `services.html`, `technology.html`, `about.html`, `contact.html`) + `assets/css/`, `assets/js/`, `assets/logos/` |
| Metadata | Per page: `<title>`, meta description, canonical URL, Open Graph tags, single `h1`; JSON-LD `Organization` with `legalName` = CIVOLINK ENTERPRISES |
| Search files | `sitemap.xml` and `robots.txt` only once the site is on its final hostname and every URL resolves (architecture Â§8.3) |
| Isolation | If co-hosted with the CIVOLINK WIFI backend: separate Nginx server block, document root, PHP-FPM pool, system user, logs, deploy credentials; no shared database/session/.env (architecture Â§11.3) |
| Pre-launch sweep | Zero `[PLACEHOLDER` / `[NOT PUBLISHED` / `[NOT LIVE` strings unless consciously accepted; zero demonstration content; every badge re-verified as true; zero external requests |

---

## 13. Open decisions, dependencies and next steps

### 13.1 What this package needs from the owner (in review order)

| # | Decision | What the owner is deciding here | Blocks |
|---|---|---|---|
| 1 | **D20** | Confirm or amend the six-page set, the URLs (`/platforms`, `/services`) and the names | Final sitemap; any U-003 page build |
| 2 | **D14** | Approve/amend/replace the corporate description, mission, vision, values and audience wording (drafts in Â§6, Â§8, Â§10) | Approval of Home/About lead copy |
| 3 | **D21** | Approve product descriptions and status claims â€” including whether **Biashara Flow** may be listed publicly under that name and badge (Â§2 discrepancy) | Publication of every product block (Â§7, Â§8) |
| 4 | **D19** | Provide or decline: business email, phone, WhatsApp, social accounts, support hours, form data-handling/retention policy | Publication of Contact page channels; any form go-live |
| 5 | **D18** | Decide address disclosure: whether any registered address is published, labelled as registered; postal address approval | About/Contact address blocks |
| 6 | Rule 11 verification | Check registration particulars against the official certificate | Publication of the identity block anywhere |
| 7 | **D15-residual** | Brand-voice wording (only the tagline is approved today) | Tone sign-off across all pages |
| 8 | **D22 / D23** | Final stack, hosting topology, TLS/DNS details | U-003 build and the Technology page's "How this site is built" section |
| 9 | **D17** | Domain registration, registrar, account ownership | Any clickable planned-domain link; launch date |
| 10 | **D24 / D25** | Analytics/consent (default: none) and CMS (default: static files) | Footer legal note accuracy; post-launch content workflow |

**Not required to proceed:** D16 residual (G1 logo asset copy) does not block content drafting (U-002.2.1); D16/D22/D23 gate the U-003 build, not this package.

### 13.2 Recommended additions before production launch

The task's six-page scope does not include legal pages, but **no contact form may go live before a privacy policy and terms of use are published** (architecture Â§10.2; Kenya Data Protection Act, 2019). Recommendation: add `/privacy` and `/terms` at the production-launch stage (U-002 exit / U-003), drafted from the architecture Â§10.2 requirements, before the form is enabled â€” not necessarily as navigation items on day one of content review, but before any data is collected. This is recorded in the sitemap document Â§9 for D20 confirmation.

### 13.3 Next steps

1. Owner reviews this package against the master gate table (Â§4.3) and the sitemap document.
2. Answers D20 â†’ D14 â†’ D21 â†’ D19 â†’ D18 in any order; each unblocks the blocks listed above.
3. Registration-certificate verification (rule 11) before any identity block is published.
4. On D20 confirmation, this package plus `docs/CIVOLINK_U002_3_SITEMAP.md` become the content input for U-003 (production build) and, later, for privacy/terms drafting.
5. No production implementation, deployment, domain action or reference-suite change occurs on the basis of this document.

---

*End of content package. Companion documents: `docs/CIVOLINK_U002_3_SITEMAP.md`, `docs/CIVOLINK_U002_3_COMPLETION_REPORT.md`.*
