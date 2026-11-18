# CIVOLINK — Corporate Website Sitemap (U-002.3)

## 1. Document control and scope

| Field | Value |
|---|---|
| Task | **U-002.3 — Corporate Website Content and Sitemap Development** |
| Date | 2026-11-11 |
| Status | **PROPOSAL — decision D20 is OPEN.** This sitemap is the input for the owner's D20 confirmation, not a confirmed structure |
| Companion documents | `docs/CIVOLINK_U002_3_CORPORATE_WEBSITE_CONTENT.md` (full draft copy); `docs/CIVOLINK_U002_3_COMPLETION_REPORT.md` |
| Authority | Decision source: `docs/OWNER_DECISIONS_REGISTER.md` D20 (and D17/D19 as noted). Structural source: `docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md` §7–§8 |
| Scope | Page inventory, URL map, navigation, footer, internal link graph, status labels, placeholders, URL hygiene, D20 confirmation checklist |
| Not in scope | Production HTML/CSS/JS, sitemap.xml/robots.txt generation, domain/DNS work, deployment, privacy/terms drafting (recommended separately — §9) |

---

## 2. Status and authority

- **D20 (register):** OPEN — "confirm or amend the launch page set, the two renames, and the deferral of the control-centre page." Default if unanswered: the architecture §8.1 seven-page launch set stands as the plan; `control-center.html` stays deferred; no demonstration content is published.
- **This document implements the U-002.3 task scope:** a **six-page** set (Home, Our Platforms, Services, Technology, About, Contact). It therefore **diverges** from the architecture §8.1 proposal in two ways, recorded in §10: page names (`/services` vs `/products`) and the inclusion of *Our Platforms* (which §8.2 deferred).
- Neither divergence is a decision. Both are listed for explicit owner confirmation in §14.
- No reference-suite file was modified; the suite remains the frozen structural reference (33 files, byte-unchanged).

---

## 3. Page inventory

| # | Page | URL | Nav label | `<title>` (draft) | Source file | Maturity / status label | Governance |
|---|---|---|---|---|---|---|---|
| 1 | Home | `/` | Home | `CIVOLINK — CONNECTING IDEAS · BUILDING SOLUTIONS` | `index.html` (modified) | In preparation (site not built) | B — D14, D20, D21 |
| 2 | Our Platforms | `/platforms` | Our Platforms | `Our Platforms — CIVOLINK` | `control-center.html` → **rename + strip demo content** | In preparation | B — D20 (page inclusion), D21, D14 |
| 3 | Services | `/services` | Services | `Services — CIVOLINK` | `products.html` → **retitle** | In preparation | B — D20 (name/URL), D21, D14 |
| 4 | Technology | `/technology` | Technology | `Technology — CIVOLINK` | `developers.html` → **rename** (architecture §7 #4) | In preparation | B — D20, D22 |
| 5 | About | `/about` | About | `About CIVOLINK — CIVOLINK ENTERPRISES` | `about.html` (modified) | In preparation | B/C — D14, D18, rule 11 |
| 6 | Contact | `/contact` | Contact | `Contact — CIVOLINK` | `contact.html` (modified) | In preparation | B/C — D19 (hard gate), D18 |

**Page count: 6.** Every page is `In preparation` — content is drafted (companion content package), the site itself is not built (U-003).

---

## 4. URL map and file mapping

| URL (planned) | Production file | Derived from | Change required vs reference suite |
|---|---|---|---|
| `/` | `index.html` | `docs/umbrella-reference/index.html` | Retagline (approved tagline), add identity footer block, keep planned-domain table as non-clickable text |
| `/platforms` | `platforms.html` | `docs/umbrella-reference/control-center.html` | **Rename file and title** ("Control Center" → "Our Platforms"); remove health model, health/directory status labels, stat-strip counts, central-account concept; keep independence narrative; add true stage badges |
| `/services` | `services.html` | `docs/umbrella-reference/products.html` | **Retitle** ("Products" → "Services"); keep product discovery + status-summary structure; product blocks as drafted in content package §8 |
| `/technology` | `technology.html` | `docs/umbrella-reference/developers.html` | **Rename file and title** (architecture §7 #4); remove illustrative API payload block and `example.invalid` samples |
| `/about` | `about.html` | `docs/umbrella-reference/about.html` | Add identity block + BN-55SLLRED (after rule-11 verification); remove "no awards claimed" hedging; mission/vision/values subject to D14 |
| `/contact` | `contact.html` | `docs/umbrella-reference/contact.html` | Channels stay explicit placeholders (D19); addresses not published (D18/rules 9–10); demonstration form replaced by real endpoint in U-003 or removed — never presented as sending mail |

**Rules:** extensionless URLs (clean paths) with trailing-slash-free canonicals; lowercase, hyphenated slugs; one file per page; no client-side routing; every URL must resolve before appearing in `sitemap.xml`.

---

## 5. Navigation structure

### 5.1 Primary navigation (all pages, same order)

```text
Home  ·  Our Platforms  ·  Services  ·  Technology  ·  About  ·  Contact
```

| Rule | Detail |
|---|---|
| Placement | Site header, persistent on every page |
| Mobile | Collapsible toggle (reference-suite `nav-toggle` pattern); `aria-expanded` maintained; no hamburger-only dead ends |
| Active state | Visual highlight + `aria-current="page"` |
| Excluded | No account/login link (no central accounts — §D13); no product submenu; no language switcher; no search at launch (6 pages do not need it) |
| Legal pages | `/privacy` and `/terms` are **not** nav items in this six-page scope; when added (§9) they live in the footer legal area, not the primary nav |

### 5.2 Breadcrumbs

Not used at launch — a flat six-page hierarchy does not benefit from them; adding them later is a build decision, not a sitemap change.

### 5.3 Anchor targets (in-page)

| Page | Anchors exposed to other pages / footer |
|---|---|
| `/services` | `#civoli-wifi`, `#biashara-flow`, `#future-products` (footer product links), `#what-we-provide`, `#what-we-are-building` |
| `/platforms` | `#inventory` (optional deep link from Home cards) |
| `/technology` | none exposed |
| `/contact` | none exposed |
| `/about` | `#business-identity` (optional, from footer identity block) |

Anchors use stable, lowercase, hyphenated IDs; no anchor may point at removed demonstration content.

---

## 6. Footer structure

```text
┌────────────────────┬──────────────┬───────────────┬─────────────────────┐
│ Brand              │ Site         │ Products      │ Planned destinations│
│ [approved logo]    │ Home         │ CIVOLINK WIFI │ civolink.co.ke      │
│ One-line descriptor│ Our Platforms│ Biashara Flow │ wifi.civolink.co.ke │
│                    │ Services     │ Future products│ biashara.civolink.co.ke│
│                    │ Technology   │               │ docs.civolink.co.ke │
│                    │ About        │               │ accounts.civolink.co.ke│
│                    │ Contact      │               │                     │
├────────────────────┴──────────────┴───────────────┴─────────────────────┤
│ Identity block: CIVOLINK is a brand operated under CIVOLINK             │
│ ENTERPRISES, a registered business name in Kenya.                       │
│ Registration No.: BN-55SLLRED.                                          │
│ Footer note: no analytics, no non-essential cookies, no external        │
│ services. © 2026 CIVOLINK.                                              │
└─────────────────────────────────────────────────────────────────────────┘
```

Hostname family updated 2026-11-16 to the adopted `civolink.co.ke` base (D17 adoption addendum, `WIFI\docs\OWNER_DECISIONS_REGISTER.md`); the original U-002.3 (2026-11-11) planned set used `civolink.com`. State labels are unchanged: only the apex is registered — no subdomain is registered, resolving, hosted or deployed (D23).

| Rule | Detail |
|---|---|
| Planned destinations | Styled text (`<span>`), **never `<a>` links** until each domain resolves (architecture §6; D17) |
| Product links | Point to `/services` anchors, not to product subdomains (products have no sites yet) |
| Identity block | Brand guidelines §5 approved wording; BN-55SLLRED only with the registered name; **only after rule-11 verification** (class C until then) |
| No address in footer | Address disclosure is D18/§9-gated; identity block carries no address |
| Legal links (future) | `/privacy`, `/terms` appear here when they exist (§9) |

---

## 7. Internal link graph

```text
                    ┌──────────┐
          ┌────────►│  Home /  │◄────────┐
          │         └────┬─────┘         │
          │       ┌──────┼──────┐        │
          │       ▼      ▼      ▼        │
          │  /platforms  │  /services    │
          │       │      │      │        │
          │       └──┬───┘      │        │
          │          ▼          │        │
          │     /technology ────┘        │
          │          │                   │
          │          ▼                   │
          │       /about ────────────────┤
          │          │                   │
          │          ▼                   │
          └──── /contact ◄───────────────┘
```

**Link rules:**

1. Every page links to every other page — directly in the primary nav or footer; no orphan pages.
2. Home is the hub: primary content CTAs point outward (`/services` primary, `/platforms`, `/technology`, `/contact`); no page links "up" to Home except nav/footer brand link.
3. `/services` ↔ `/platforms` cross-link (services CTA "see platform inventory", platforms CTA "evaluate services").
4. `/technology` links to `/contact` (integration questions) and `/platforms`; receives from Home and About.
5. `/contact` is the terminal CTA target for Home, Our Platforms, Services, Technology and About; it links back to `/services` and `/platforms` as guidance.
6. `/about` links to `/technology`, `/services`, `/contact`.
7. **No page links to a planned domain** (`wifi.`, `biashara.`, `docs.`, `accounts.`) — styled text only.
8. `/privacy` and `/terms` are linked from `/contact` (form privacy notice) **only when those pages exist** (§9); until then the contact form is not live, so no broken link can occur.
9. Zero external links at launch (no third-party assets, no social profiles until D19 confirms them — and even then as plain text unless approved).

---

## 8. Page hierarchy rules (applies to every page)

| Rule | Detail |
|---|---|
| Headings | Exactly one `<h1>` (the page title); `<h2>` for top-level sections; `<h3>` for products within a section; never skip levels |
| Depth | Maximum three heading levels (h1–h3); section count per page: 5–8 `h2`s (Home may reach 7) |
| Landmarks | `header > nav`, `main`, `footer`; skip link to `main` |
| Title/description | Unique `<title>` and meta description per page (drafts in content package §6.1–§11.1 and §3 above); description ≤ 160 characters, no unsupported claims |
| Canonical | Absolute canonical URL per page once hostname is final (D17/D23) |
| Structured data | JSON-LD `Organization` on every page (or at least Home/About): `name` = CIVOLINK, `legalName` = CIVOLINK ENTERPRISES — only after rule-11 verification |
| OG tags | `og:title`, `og:description`, `og:url`, `og:type` (`website`); no external og-image required at launch (self-hosted only if added) |
| Content parity | Nav and footer are identical on all pages; no page-specific nav experiments |

---

## 9. Not in this set: recommended additions and explicit deferrals

### 9.1 Recommended for the production-launch stage (before any form is live)

| URL | Page | Why | Gate |
|---|---|---|---|
| `/privacy` | Privacy policy | Required before the contact form collects personal data — Kenya Data Protection Act, 2019; architecture §10.2 | D19 (data-handling policy) supplies the substance; drafting is U-002/U-003 work |
| `/terms` | Terms of use | Site use, accuracy/no-warranty, IP, liability limits, governing law — architecture §10.2 | Drafting after D20 confirms page set |

**Recommendation to the owner:** these two are outside the task's six-page content scope, but they are **mandatory pre-conditions for form activation** and should be added to the confirmed launch set at D20 (or as an explicit D20 amendment) so U-003 builds them with the rest of the site. Footer legal area is their navigation home.

### 9.2 Explicitly deferred (not in this six-page set)

| Page / feature | Source | Deferral reason | Revisit trigger |
|---|---|---|---|
| Control Center (original) | `control-center.html` | Built on demonstration content (health model, counts, directory statuses, central-account concept) — architecture §7 #3 | Its content is **replaced** by `/platforms` (§4); the original must never ship |
| Developers / API docs | `developers.html` payload section | No public API exists | First real public API contract → future `docs.civolink.co.ke` |
| Per-product sites | `wifi.`, `biashara.` subdomains | Products not launched; no subdomain has DNS or deployment (D23) | Product launch + D23 |
| Accounts / SSO | `accounts.civolink.co.ke` | Requires separate identity architecture (§D13) | Separate architecture decision |
| Docs portal | `docs.civolink.co.ke` | Future concept (§D13, roadmap U4) | Portal project approved |
| Blog / news / careers | — | Not in any approved page set | Owner proposal + D20 amendment |
| Search, language switcher, live chat | — | Six-page English launch does not need them; live chat would also require D19 | Owner proposal |

---

## 10. Naming divergences recorded (for D20)

| # | Divergence | This document (task scope) | Architecture proposal (§7–§8) | Resolution |
|---|---|---|---|---|
| D-a | Product page name/URL | **`/services`, "Services"** | `/products`, "Products and services" | **D20 must pick one.** Content is identical either way (content package §8); renaming after build is a redirect cost — decide now |
| D-b | Platforms page | **Included: `/platforms`, "Our Platforms"** (renamed from control-center, demo content stripped) | **Deferred** from launch (§8.2); revive trigger "at least two products live" | **D20 must confirm inclusion.** Task scope includes it; the page as drafted ships only true stage badges and no demonstration content |
| D-c | Page count | **6** (no legal pages) | **7** (adds `/privacy`, `/terms`) | Recommend adopting the architecture's two legal pages at launch (§9.1) — D20 amendment |
| D-d | Technology page | `/technology` (aligned) | `/technology` from `developers.html` (renamed) | **Agreed** — no divergence |

No other divergences exist: footer structure, planned-domain treatment, control-center deferral-rewrite and developers rename all follow architecture §7.

---

## 11. Status badge vocabulary and provisional status labels

Badges are text labels with contrast-compliant styling; never colour-only; never "Live"/"Available"/"Now serving" unless verified true at publish time (guidelines §8.2, architecture §9.2).

| Badge | Meaning | Used on |
|---|---|---|
| **In preparation** | Content/planning under way; site not built | This site (all pages, until U-004 verification) |
| **In development** | Engineering work exists and is ongoing; not generally available | CIVOLINK WIFI, Biashara Flow |
| **Planned** | Approved direction; no product built | Future products; planned domains (as `[planned]` text) |
| **Future concept** | Considered, not started; requires its own decision | `docs.civelink.com`, `accounts.civelink.com` |

**Evidence for each product label** (content package §2): CIVOLINK WIFI — repository backend + Phase 1B cycle; Biashara Flow — existing external development project (323 passing tests recorded in its README). Biashara Flow's public listing and naming remain **D21-gated** (discrepancy: this repo's older documents say "Planned").

**Re-verification rule:** every badge on every page is re-checked immediately before launch and again in U-004; a badge that is no longer true is a defect, not a style choice.

---

## 12. Placeholders and restricted-content inventory

| Placeholder string | Page(s) | Clears when |
|---|---|---|
| `[PLACEHOLDER — D19: …]` (email, phone, WhatsApp, social, support hours) | `/contact` (routes, channels, support) | D19 answered |
| `[NOT PUBLISHED — address … (D18; rules 9–10)]` (registered, postal, operating) | `/contact`, `/about` identity area | Owner instructs disclosure (D18) + approvals (rules 9–10) |
| `[NOT LIVE — contact form …]` | `/contact` | `/privacy` + `/terms` published + server-side endpoint + spam/rate limiting + D19 retention policy |
| `[DRAFT — D14]` markers (mission, vision, values, corporate description) | `/`, `/about`, `/services`, `/technology` leads | D14 answered |
| Internal verification note (rule 11) | `/about` (internal only) | Certificate verification completed |

**Pre-launch sweep:** search all six files for `[PLACEHOLDER`, `[NOT PUBLISHED`, `[NOT LIVE`, `[DRAFT` — zero matches may remain unless the owner has consciously accepted each one in writing.

**Restricted from publication anywhere (rules 8–10, D19):** entity status `ACTIVE`; registration date `26 June 2025`; unpublished addresses; any invented contact detail, price, date, coverage area, metric, SLA, certification or customer count.

---

## 13. URL hygiene and metadata rules

| Rule | Detail |
|---|---|
| `sitemap.xml` | Ship only when the site is on its final hostname (D17/D23) and every listed URL resolves 200 |
| `robots.txt` | Same trigger; allow all public pages; no disallow of content pages; no sitemap reference before sitemap.xml exists |
| 404 page | Static, branded, with nav links — built in U-003, verified in U-004 |
| Redirects | None required at launch (no old URLs); if the `/services` vs `/products` decision changes after build (D-a), ship a 301 — reason to decide D20 first |
| Trailing slashes | Pick one canonical form at build; canonical tags must match sitemap.xml exactly |
| Dead links | Zero: internal links verified in U-004; planned domains are text; no external links at launch |
| HTTPS | Mandatory for any production deployment (architecture §12); HTTP→HTTPS redirect; HSTS only after hostname confirmed stable |
| Anchors | Every cross-page anchor (§5.3) verified to exist in the target file |

---

## 14. D20 confirmation checklist

Owner ticks each line (or amends it) to confirm the sitemap:

- [ ] **Six-page set confirmed:** Home, Our Platforms, Services, Technology, About, Contact
- [ ] **URLs confirmed:** `/`, `/platforms`, `/services`, `/technology`, `/about`, `/contact` — or amended (note: `/services` vs `/products` — divergence D-a)
- [ ] **Nav order confirmed:** Home · Our Platforms · Services · Technology · About · Contact
- [ ] **Our Platforms inclusion confirmed** (divergence D-b — architecture had deferred this page)
- [ ] **Legal pages decision:** add `/privacy` + `/terms` to the launch set now (recommended — divergence D-c, §9.1) or defer with the explicit understanding that no form goes live until they exist
- [ ] **Footer structure confirmed** (brand / site / products / planned destinations / identity block / legal note)
- [ ] **Planned domains stay non-clickable** until each resolves (D17)
- [ ] **Status badge vocabulary confirmed** (§11), including Biashara Flow "In development" pending D21
- [ ] **File mapping confirmed** (§4: `platforms.html`, `services.html`, `technology.html` renames)
- [ ] **Deferred list acknowledged** (§9.2: original Control Center content, API docs, per-product sites, accounts, docs portal, blog/careers)

**On confirmation:** this document plus the content package become the approved sitemap and copy input for U-003. **If unanswered:** the architecture §8.1 seven-page set remains the standing default (register D20), and this six-page proposal stays a proposal.

---

*End of sitemap document. Companion documents: `docs/CIVOLINK_U002_3_CORPORATE_WEBSITE_CONTENT.md`, `docs/CIVOLINK_U002_3_COMPLETION_REPORT.md`.*
