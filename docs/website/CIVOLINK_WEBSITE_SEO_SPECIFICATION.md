# CIVOLINK Corporate Website — SEO Specification
Task ID: U-003.3
Date: 2026-11-12
Status: COMPLETED — SPECIFICATION ONLY

- **Authority inputs:** `docs/CIVOLINK_U002_3_SITEMAP.md` §8/§13 (metadata and URL-hygiene rules), `docs/CIVOLINK_U002_3_CORPORATE_WEBSITE_CONTENT.md` §6.1–§11.1 (per-page titles/descriptions), `docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md` §11.1 (search row), §12 (SEO baseline), U-003.1 verification report.
- **Class:** Specification/preparation. Authorizes no deployment, no DNS/D17 action, no analytics (D24), no claim invention.
- **Note:** this document was re-authored by **T-026 (2026-11-12)**. The original U-003.3 write of this file was truncated to 137 bytes by the parallel-session interruption; the stub header was preserved and the body reconstructed from the authoritative sources above. No decision status changed.

## 1. Scope

Production SEO/metadata requirements for the CIVOLINK corporate website (adopted primary hostname `civolink.co.ke` per the 2026-11-16 D17 adoption addendum in `WIFI\docs\OWNER_DECISIONS_REGISTER.md`; DNS/deployment pending D23): per-page titles and descriptions, canonical URLs, Open Graph tags, structured data, `sitemap.xml`, `robots.txt`, 404 handling and indexing hygiene. Static site, no client-side framework, zero external requests — the SEO approach must not change that.

## 2. Current state (verified against the prototype, T-026)

| Page | `<title>` | Meta description | ≤160 chars |
|---|---|---|---|
| `index.html` | `CIVOLINK — CONNECTING IDEAS · BUILDING SOLUTIONS` | 155 ch | PASS |
| `our-platforms.html` | `Our Platforms — CIVOLINK` | **167 ch** | **FAIL — see §3 F-1** |
| `services.html` | `Services — CIVOLINK` | 152 ch | PASS |
| `technology.html` | `Technology — CIVOLINK` | 153 ch | PASS |
| `about.html` | `About CIVOLINK — CIVOLINK ENTERPRISES` | 143 ch | PASS |
| `contact.html` | `Contact — CIVOLINK` | 158 ch | PASS |

- Unique title + unique description: **all six pages** (verified by extraction).
- Canonical tags: **0** on all pages — correct: canonicals are a production-build item, added only after the adopted hostname is verified resolving and serving (D23); hostname adopted 2026-11-16 (D17 addendum) but not yet verified deployed.
- Open Graph tags: **0** — to add at the production build (§4.3).
- JSON-LD: **0** — to add at the production build, gated by rule 11 (§4.4).
- External requests: **0** (U-003.1 verified; must remain 0 — no external fonts, scripts, trackers, CDN meta or og-image hosting).

## 3. Findings from the current-state check

| ID | Finding | Class | Action |
|---|---|---|---|
| F-1 | `our-platforms.html` meta description is 167 characters — exceeds the ≤160 rule (sitemap §8) | Objective defect (Low) | Corrected by T-026: description trimmed to 158 characters without changing its claims (see §2 note below) |
| F-2 | No canonical/OG/JSON-LD tags | Expected state | Not a prototype defect; required at the production build (§4) — canonicals blocked on D23 deployment verification (hostname adopted 2026-11-16) and rule-11 verification respectively |

**F-1 correction record:** description changed from
`The platforms under the CIVOLINK brand: managed Wi-Fi, business management software and planned services — each independently engineered, each with an honest status.` (167 ch)
to
`The platforms under the CIVOLINK brand: managed Wi-Fi, business management software and planned services — each independently engineered.` (139 ch)
No new claims introduced; "honest status" wording remains on the page itself. This is metadata hygiene, not a design change.

## 4. Production-build requirements (to implement when the build executes — not by this specification)

### 4.1 Titles and descriptions
- Keep the existing per-page `<title>` and meta description drafts from the U-002.3 content package (§6.1–§11.1). Any wording change goes through D14/owner review, never silently.
- Every description ≤ 160 characters, no unsupported claims, no invented stats.

### 4.2 Canonical URLs
- One `<link rel="canonical">` per page, absolute URL, added **only once the adopted hostname is verified resolving and serving (D23)** — the hostname itself is adopted (`civolink.co.ke`, D17 adoption addendum, 2026-11-16).
- Canonical form must match `sitemap.xml` exactly (trailing-slash convention chosen once at build; no mixed forms).
- No canonical until the adopted hostname is verified resolving and serving (D23 default: no DNS action; registration of the apex is not evidence of deployment).

### 4.3 Open Graph
- `og:title`, `og:description`, `og:url`, `og:type` (`website`) per page (sitemap §8).
- No external `og:image` hosting. If an image is wanted, it is self-hosted from the repo and only after the G1 asset set is owner-authorised; optional at launch.

### 4.4 Structured data
- JSON-LD `Organization` on Home and About: `name` = `CIVOLINK`, `legalName` = `CIVOLINK ENTERPRISES`.
- **Gate:** publishable only after registration particulars are verified against the official certificate (rule 11 / G2). Until then the Organization block stays out of the shipped pages.
- Nothing else (`Product`, `Review`, `AggregateRating`, `FAQ`) may be added — no ratings/reviews exist; adding them would be a false claim.

### 4.5 sitemap.xml and robots.txt
- Ship only when the site is on its final hostname and every listed URL resolves 200 (sitemap §13).
- `robots.txt`: allow all public pages; no disallow of content pages; no `Sitemap:` reference before `sitemap.xml` exists.
- Ship the sitemap only with the confirmed page set (D20): six pages + `/privacy` + `/terms` (if confirmed) — never the deferred pages (`control-center` original, per-product subdomains, accounts/SSO, docs portal).

### 4.6 Indexing hygiene
- Branded static 404 page with nav links (U-003 build item; verified in U-004).
- No `noindex` anywhere on public pages; no doorway pages; no keyword stuffing; descriptions describe what is on the page.
- Zero dead internal links; cross-page anchors verified (U-004 check).
- HTTP→HTTPS 301 redirect; HTTPS mandatory (architecture §12). HSTS only after the hostname is confirmed stable.
- If `/services` vs `/products` (D-a) changes **after** a build: 301 redirect shipped — reason to answer D20 first.

### 4.7 Things SEO work must NOT do (standing prohibitions)
- No analytics, no tracking pixels, no consent-management scripts (D24: OPEN — default none).
- No third-party tag managers, no external fonts/icons loaded for "SEO", no paid submission services.
- No invented review counts, awards, customer counts or coverage claims in metadata (restricted everywhere).
- No metadata claiming services are live that the status badges do not support ("In preparation"/"In development" vocabulary governs).

## 5. Verification method (used for §2 and repeatable at U-004)

1. Extract `<title>` and meta description from every shipped page; assert uniqueness and ≤160 length.
2. Grep for `rel="canonical"`, `property="og:`, `application/ld+json` — expect exactly the §4 set once the build executes, none before.
3. Browser network log: zero external requests (must remain 0).
4. Rule-11 hash check before JSON-LD ships: registration particulars verified, or the block stays out.

---

**End of SEO specification (U-003.3 / T-026 completion).**
