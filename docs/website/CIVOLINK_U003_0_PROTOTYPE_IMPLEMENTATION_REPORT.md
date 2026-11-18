# CIVOLINK U-003.0: Prototype Implementation Report

**Status:** Complete (static prototype milestone — not a production launch)
**Date:** 2026-11-10
**Baseline:** `main` @ `1bf0b2fe717ae916afd23a4dd3bb3d92c974fa1b`
**Deliverable location:** `docs/umbrella-prototype/`

---

## 1. Purpose and scope

Proceed from the completed U-002.3 content package into a visible, browser-reviewable six-page CIVOLINK corporate website prototype. The owner can inspect the rendered interface and give practical feedback (hero, navigation, layout, colours, wording, platform cards, page structure) instead of approving abstract descriptions.

**In scope:** static prototype, shared assets, local preview, screenshot evidence, this report, and progressive updates to the roadmap, manifest and progress register.

**Out of scope (not authorized by this milestone):** production deployment, domain/DNS changes, VPS work, public launch, live CMS, analytics, live contact form or email integration, authentication, payment/router integration, changes to CIVOLINK WIFI production functionality, unapproved legal or contact disclosures, and irreversible external commitments.

**Operating principle (owner directive):** proceed continuously where authorized; use reversible assumptions for layout/visual/naming decisions; document them; do not treat D20 or other open decisions as blanket blockers; present the rendered interface rather than abstract approvals.

## 2. Guiding documents used

- `docs/CIVOLINK_U002_3_CORPORATE_WEBSITE_CONTENT.md` — primary copy source (60,616 bytes)
- `docs/CIVOLINK_U002_3_SITEMAP.md` — navigation, footer, link-graph specification (20,507 bytes)
- `docs/CIVOLINK_U002_3_COMPLETION_REPORT.md` — content-package verification
- `docs/OWNER_DECISIONS_REGISTER.md` — authoritative D-numbers and statuses (read-only)
- `docs/CIVOLINK_BRAND_GUIDELINES.md` — palette (§9), opacity derivatives (§10.3), logo rules (§15), contrast rules (§21), identity conventions (§25)
- `docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md` — §7 stack, §8 information architecture, §10.2 planned domains
- `docs/IMPLEMENTATION_ROADMAP.md`, `docs/PRODUCTION_BUILD_MANIFEST.md`, `docs/PROJECT_PROGRESS_REGISTER.md` — updated at completion
- `docs/umbrella-reference/` — historical reference suite, preserved byte-identical (33/33)

## 3. Files created

All under `docs/umbrella-prototype/`:

| File | Bytes | Purpose |
|---|---|---|
| `index.html` | 12,382 | Home |
| `our-platforms.html` | 12,127 | Our Platforms |
| `services.html` | 15,315 | Services |
| `technology.html` | 10,874 | Technology |
| `about.html` | 16,073 | About |
| `contact.html` | 12,889 | Contact |
| `assets/css/styles.css` | 24,941 | Shared design system |
| `assets/js/main.js` | 4,516 | Shared local-only behaviour |
| `assets/logos/CIVOLINK_Mark.png` | 42,959 | Header lockup (copy of T-020 provisional art) |
| `assets/logos/CIVOLINK_Primary.png` | 45,841 | About page, white surface (copy of T-020 provisional art) |
| `README.md` | 2,291 | Preview instructions |
| `evidence/*.png` (17 files) | — | Browser screenshot evidence (§9) |

Logo files are unchanged copies of the provisional T-020 PNG crops from `docs/brand/logos/`; originals untouched. All source hashes are recorded in §10.

## 4. Architecture and technology choices

- **Static HTML/CSS/JS only.** No build step, no framework, no backend, no database. Opens by double-click (`file://`); everything is relative-path local.
- **One shared stylesheet** (`styles.css`) with design tokens as CSS custom properties: palette, spacing scale (`--sp-1`…`--sp-8`), typography, radii, shadows, container width. Page-level sections compose utility/feature classes (hero variants, cards, grids, splits, notices, tables, badges, CTA band, forms, placeholders, footer).
- **One shared script** (`main.js`), plain ES5-compatible JavaScript in an IIFE: mobile nav toggle + Escape close + close-on-link-select, `[data-year]` copyright fill, and local-only contact-form validation. **Zero network requests, zero storage, zero cookies.**
- **No external fonts, icons, images or CDNs** — system font stack; inline SVG only where needed.
- **Accessibility basics:** one `<h1>` per page, semantic landmarks, `aria-expanded` on the nav toggle, `aria-invalid` on form fields, visible focus styles, `scope` on table headers, contrast-compliant colour pairings per brand §21.
- **Deliberately absent:** analytics, tracking cookies, authentication, payments, external APIs, live email, CMS, dead external links. Planned domains are rendered as non-link text with a `future`/`planned` badge.

## 5. Page-by-page summary

All pages share the sticky header (mark + wordmark, six-item nav with active-page indication, Contact CTA), the navy footer (nav links, planned-domain listing as text, identity block with registered name + BN-55SLLRED, prototype disclaimer), and the `CONNECTING IDEAS · BUILDING SOLUTIONS` tagline treatment.

| Page | Structure |
|---|---|
| **Home** (`index.html`) | Navy hero with corporate introduction and dual CTAs; service overview (wireless internet & ICT support, CIVOLINK WIFI, Biashara Flow, future products) each with honest maturity badge; platform discovery cards; planned-domain strip; closing CTA band. |
| **Our Platforms** (`our-platforms.html`) | Platform directory table (name, what it is, stage) covering CIVOLINK WIFI *In development*, website *In preparation*, Biashara Flow *In development* (D21 notice), docs./accounts. *Future concept*; legend explaining the four maturity labels; Biashara Flow evidence note; planned domains. |
| **Services** (`services.html`) | Service-category sections with anchors: wireless internet & ICT support (registered activity), CIVOLINK WIFI (In development), Biashara Flow (In development + prominent D21 prototype-treatment notice, `#biashara-flow` anchor), future products (Planned); product-status table; CTA to contact. |
| **Technology** (`technology.html`) | Engineering-principles narrative (independent applications, explicit boundaries, honest status, small explicit versioned interfaces); stack approach; planned documentation portal `docs.civolink.com` shown as unlinked future reference; support routing via contact page. |
| **About** (`about.html`) | Corporate identity (registered name CIVOLINK ENTERPRISES, BN-55SLLRED, rule-11 verification note); mission and vision labelled `Draft — D14`; values labelled `Wording — D14`; contribution aim `Draft — D14`; provisional logo on white surface; identity conventions summary. |
| **Contact** (`contact.html`) | Enquiry routes (general, partnership, technical) with contact channels shown as *being confirmed* (D19); **interactive prototype form** behind a prominent notice — fields validate locally, submission never transmits, an on-page prototype confirmation is shown; privacy note that a production form requires a published privacy policy before go-live; planned-domain listing. |

## 6. Visual design decisions

- **Palette applied exactly per brand §9:** Navy `#102A43`, Teal `#00A6A6`, Cyan `#18C3C8`, Graphite `#263238`, Cloud `#F4F7F8`, White `#FFFFFF`. CSS scan confirmed only approved colours plus permitted derivatives: hover navy `#0a1e33`, graphite greys `#EEF1F4 / #E2E7EC / #D0D7DE / #8A939E` (rules/disabled only, brand §10.3).
- **Contrast rules (§21) honoured:** body copy is navy/graphite on white/cloud only; primary buttons are teal background + navy text (4.88:1) or navy background + white text (14.64:1); cyan text appears only on dark grounds; `strong` inside dark sections is forced white for legibility.
- **Maturity badges:** four documented states — `In development` (dev), `In preparation` (prep), `Planned` (planned), `Future concept` (future) — with a legend on Our Platforms.
- **Typography and hierarchy:** system font stack, restrained scale, generous whitespace, consistent card/table/notion components, distinct per-page layout while keeping shared chrome.
- **Logo treatment:** provisional `CIVOLINK_Mark.png` in the header lockup (live-text wordmark beside it) and `CIVOLINK_Primary.png` on About over white. The Reversed PNG was **not** used — it is a badge-on-white raster with no alpha, unsuitable for the navy footer; a typographic white wordmark was used there instead (recorded as a reversible decision). No logo was redesigned, vectorized or declared canonical; provisional status (T-020, pending owner approval) is preserved.

## 7. Content adaptations (U-002.3 copy → interface)

The U-002.3 draft copy was used verbatim in substance; only interface-level adaptations were made, with factual meaning unchanged:

1. **Interactive contact form** rendered per the task's functional requirements, with a prominent `[Prototype form]` notice and local-only JavaScript: `submit` is always prevented, nothing is transmitted/stored/logged, an on-page prototype confirmation is shown. D19 (real channels/form) remains a hard gate for a real form go-live — not for this prototype.
2. **D21 notices** on Services and Our Platforms: Biashara Flow's development status is evidence-backed (active engineering project, passing test suite), but public listing/naming is flagged as *pending owner confirmation* — a reversible prototype treatment, not an approval.
3. **D14 draft tags** on About: mission, vision, values and contribution aim carry visible `Draft — D14` / `Wording — D14` chips and an explicit "owner decision required" callout.
4. **Rule-11 verification note** in the About identity block: certificate verification is pending; no address is published (rule 10 / D18).
5. **Planned domains** (`civolink.com`, `accounts.civolink.com`, `docs.civolink.com`, `biashara.civolink.com`) are plain text with state badges — never links, because they do not exist.

**Claims discipline observed:** no customer numbers, statistics, partnerships, accreditations or coverage claims; no invented contact details, legal particulars or address; CIVOLINK WIFI and Biashara Flow both labelled *In development*, never generally available; future platforms never presented as operational; no promised SSO/shared accounts/integrations.

## 8. Provisional assumptions (reversible, pending owner confirmation)

| # | Assumption | Consequence if changed |
|---|---|---|
| A1 | **Filenames/paths** `index.html`, `our-platforms.html`, `services.html`, `technology.html`, `about.html`, `contact.html` (content package used `/platforms`, `/services`) | Renaming is a mechanical find/replace across six files + README. Pending formal **D20**. |
| A2 | **Sticky header** with active-page indication | Purely presentational; can be made static or restructured. |
| A3 | **`our-platforms.html` included** in the six-page set even though architecture §8.2 deferred the control-center idea | Page can be removed from nav/footer without touching other pages. Pending **D20**. |
| A4 | **`/services` vs architecture `/products`** divergence — prototype uses `services.html` to match the content package | Aligns once D20 fixes the sitemap. |
| A5 | **Contact form rendered interactive** as a local prototype (task §8) despite D19 being open | Form is inert; removing it or swapping to static contact details is trivial. |
| A6 | **Typographic wordmark in footer** (Reversed PNG unsuitable) | Replace with approved reversed logo asset when available. |
| A7 | **`/privacy` and `/terms` not in the six-page set** (D20 scope) | Required before any real form go-live (Kenya Data Protection Act, 2019) — recommended for the next documentation page set. |

## 9. Outstanding owner decisions and documentation gaps

**Owner decisions (statuses unchanged — register is authoritative):**

- **D14** (mission/vision/values wording) — G8 residual; About page copy is visibly draft-tagged until resolved.
- **D18** (registered address) — no address published anywhere (correct per rule 10); About shows the identity block without one.
- **D19** (contact channels + real form) — channels shown as "being confirmed"; prototype form is inert. Hard gate for real form go-live.
- **D20** (final sitemap/page set, URLs) — prototype filenames and page set are provisional (A1–A4).
- **D21** (product claims, Biashara Flow public listing/naming) — D21 notices shown; listing is reversible.
- **D22** (stack), **D24** (analytics default: none — honoured), **D25** (CMS default: none — honoured) — no prototype impact beyond defaults already applied.
- **Rule 11** (certificate verification) — verification note shown on About; no certificate claim made.

**Documentation gaps discovered and recommendations:**

1. **No `/privacy` or `/terms` page** in the sitemap. Recommendation: add both to the next documentation page set before any real contact form goes live (DPA 2019).
2. **Approved SVG logo family lives outside this repository** (gap G1). Recommendation: bring the canonical assets in (or document their location) before production build; the prototype PNGs are explicitly provisional (T-020).
3. **`/services` vs `/products` naming** is unresolved between the content package and architecture §8. Recommendation: settle within D20 so nav, filenames and future routes agree.
4. **Contact channels have no approved values** (D19). Recommendation: owner supplies approved channels; then the form decision (keep prototype pattern with backend, or static details only) can be taken.

## 10. Validation and browser testing

**Static validation (all passed):**

- All six HTML pages exist ✅
- Every internal `href`/`src` target resolves; no broken local references ✅
- Cross-page anchors resolve ✅
- CSS, JS and both logo files exist and load ✅
- Exactly one `<h1>` per page ✅
- Tag balance for `section`/`div`/`ul`/`table`/`form` correct ✅
- **Zero external URLs** in all sources (no CDN/fonts/icons/links) ✅
- CSS hex scan = approved palette + permitted derivatives only ✅
- Claim scan clean (only prohibition-text "Ltd" matches, which is the required negative wording) ✅
- Prototype disclaimer present on every page ✅
- `git diff --check` exit 0 ✅
- Reference suite `docs/umbrella-reference/` verified **33/33 byte-identical** against baseline `u0022_suite_baseline.txt` ✅

**Browser testing (real Chrome, local `file://`):**

- Captured with system Chrome via puppeteer-core harness: 17 screenshots in `docs/umbrella-prototype/evidence/`:
  - 6 pages × desktop-1440 and mobile-375 (12)
  - tablet-768: `index`, `contact`
  - `mobile-nav-open` (hamburger open state)
  - `contact-form-validation` (field errors)
  - `contact-form-prototype-confirm` (local-only confirmation after submit)
- Final run: **zero console errors, zero page errors, zero external network requests.**
- Visual QA performed on all six desktop shots, footer crop, form states and mobile nav: distinct page layouts render correctly, honest maturity badges and D14/D19/D21 notices visible, no layout breakage at any tested width.

**Fixes applied during visual QA:** SVG hero panel sizing (`width:100%; height:auto`), `strong` colour forced white inside dark sections (navy-on-navy invisibility), `identity-block` alignment.

## 11. Git preservation results

- Repository `E:\Documents\VS\WIFI`, branch `main`, HEAD `1bf0b2fe717ae916afd23a4dd3bb3d92c974fa1b`.
- **Nothing committed, pushed, reverted or discarded.** All pre-existing work preserved: 0 staged; the 9 pre-existing modified files (`.gitignore`, `README.md`, 7× `backend/*`) untouched; pre-existing untracked entries untouched.
- **Milestone-owned changes (this task only):**
  - New: `docs/umbrella-prototype/**` (11 source/asset files + 17 evidence PNGs)
  - New: `docs/CIVOLINK_U003_0_PROTOTYPE_IMPLEMENTATION_REPORT.md` (this file)
  - Updated: `docs/IMPLEMENTATION_ROADMAP.md`, `docs/PRODUCTION_BUILD_MANIFEST.md`, `docs/PROJECT_PROGRESS_REGISTER.md` (U-003.0 entries only; no decision statuses changed)
- `git diff --check` passes; the only warning is the pre-existing `README.md` LF→CRLF note (not from this milestone).

**Deliverable SHA-256 (key files):**

| File | SHA-256 |
|---|---|
| `index.html` | `1D189FC638565740947560799C0B9A91EF42175387DD0D065D4BF3069B1691D0` |
| `our-platforms.html` | `292C9029F87AE057ACD5FB5788C080725463545478D93A70E2C1E6EC2E74F752` |
| `services.html` | `F1D2FD9B3586267FBC827093CC967C0A2D0113CA02CF72D7D05E9C383BD74621` |
| `technology.html` | `4A5F8C334E484EB55D0122CD15720A2F4C3FF8051A73E00F07B41389FA2696CD` |
| `about.html` | `92017339F02A1D38C0167A19CBE4A04C8A26E1626652873149A7C72F25A91ED2` |
| `contact.html` | `7ABC1923DC4000E12F1EE2ACDF5EFF79155A97DA0B026D0343521AAC9CF490AC` |
| `assets/css/styles.css` | `6DBFA577AEF912294BB778DE81EB285CF9678333457D47895BBB8327A10AAAFC` |
| `assets/js/main.js` | `F8CE1F9D3C1E8B8930909E8DFF766D3566719831A6D4C36B0E32A7C69D4B1C53` |

(Per-file hashes for all evidence PNGs were captured at validation time; re-run `Get-FileHash -Algorithm SHA256` over `docs/umbrella-prototype/` to reproduce.)

## 12. Next recommended work

1. **Owner visual review** of the rendered prototype (entry point below) — feedback on hero, navigation, layout, colours, wording, platform cards, page structure.
2. **Resolve D20** (sitemap, filenames, `/services` vs `/products`) so routes can be frozen; then apply renames once, mechanically.
3. **Resolve D19** (approved contact channels) → decide the real form pattern; add `/privacy` + `/terms` before any live form.
4. **Resolve D21** (Biashara Flow public listing/naming) → update the two D21 notices to final wording.
5. **Resolve D14** (mission/vision/values wording) → remove draft tags from About.
6. **Obtain approved logo assets** (G1) → replace provisional PNGs, including a proper reversed footer mark.
7. When the prototype direction is approved, proceed to the next roadmap milestone (production build planning per `docs/IMPLEMENTATION_ROADMAP.md`) — no deployment activity is authorized by this milestone.

---

**Final instruction (owner):** the guiding documents are controls, not obstacles. Build what is authorized, document what is assumed, recommend what is missing, and bring consequential decisions to the owner at the point where they can be evaluated meaningfully — against the rendered website.
