# CIVOLINK — Umbrella Platform HTML Reference Suite

**STATUS: IMPLEMENTED — LOCALLY VERIFIED HTML REFERENCE SUITE**

This is a static, offline HTML/CSS/JavaScript **reference suite** for the
CIVOLINK umbrella corporate website. It establishes visual identity,
information architecture, navigation and UX direction.

It is **not** a production website, **not** deployed, and **not** connected to
any backend, database, authentication, analytics, CMS or external service.

**Production architecture authority:** what of this suite is published, renamed
or deferred is decided in
[`docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md`](../CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md)
(U-001), with owner decisions D14–D25 in
[`docs/OWNER_DECISIONS_REGISTER.md`](../OWNER_DECISIONS_REGISTER.md).

**Registered identity (owner-supplied, not independently verified):**
CIVOLINK ENTERPRISES · BN-55SLLRED · Kenyatta Avenue, Nairobi, Starehe
District, CBD · P.O. Box 30470, 00100 – G.P.O Nairobi, Kenya. The public brand
is **CIVOLINK**. Verification against the registration certificate is a U-002
gate; until then these details are recorded as owner-supplied. Public-disclosure
rules for these particulars — including that the registered street address and
postal address are **not** auto-published — are documented in
[`docs/CIVOLINK_BRAND_GUIDELINES.md`](../CIVOLINK_BRAND_GUIDELINES.md) §4.

**Brand authority (added U-001B):** the authoritative brand reference is
[`docs/CIVOLINK_BRAND_GUIDELINES.md`](../CIVOLINK_BRAND_GUIDELINES.md).
- Official tagline: **CONNECTING IDEAS · BUILDING SOLUTIONS** (the suite's
  hero line below is a superseded proposal, kept only because the suite files
  must remain byte-unchanged in this reference phase).
- Approved palette: six exact owner-approved colours — Primary Navy
  `#102A43`, Primary Teal `#00A6A6`, Secondary Cyan `#18C3C8`, Graphite
  `#263238`, Cloud `#F4F7F8`, White `#FFFFFF` (the §3 palette below is the
  superseded proposal, documented as such).
- Logo source of truth: the eight approved SVG variants in the CIVOLINK
  Assets/logo folder, recorded with checksums in the guidelines §11 — the
  suite's `assets/icons/civolink-mark.svg` is a placeholder mark, **not** an
  approved brand asset, and must not be replaced or recoloured in this
  reference phase.

---

## 1. Location

```text
docs/umbrella-reference/
    index.html              Homepage — umbrella identity
    products.html           Products and services
    control-center.html     Ecosystem overview (reference design)
    developers.html         Developers and integration direction
    about.html              About CIVOLINK
    contact.html            Contact and business enquiries
    README.md               This file
    assets/
        css/styles.css      Shared design system (single stylesheet)
        js/main.js          Shared behaviour (vanilla JS, no dependencies)
        icons/civolink-mark.svg   Brand mark (favicon + reference)
        images/             Reserved — intentionally unused (see ATTRIBUTION)
```

Sibling reference pack: `docs/url-reference/` — that is the **CIVOLINK WIFI**
UI reference suite and is a completely separate artifact.

## 2. Purpose of each page

| Page | Purpose |
|---|---|
| `index.html` | Introduce the umbrella identity: hero, featured products, technology direction, why CIVOLINK, business value, planned domain architecture, contact CTA. |
| `products.html` | Present the ecosystem: CIVOLINK WIFI, Biashara Flow, and future products with explicit status labels, plus a status summary table. |
| `control-center.html` | Future umbrella-level overview: product directory, integration landscape, service-health presentation *model*, platform relationships, central-account concept. Reference design only. |
| `developers.html` | Technical direction: architecture overview, API/integration philosophy, security principles, independent application architecture, future documentation direction, clearly marked illustrative payload examples. |
| `about.html` | Umbrella identity and long-term vision: introduction, mission, vision, values, technology philosophy, impact intentions, ecosystem approach, future direction. |
| `contact.html` | Professional contact experience: general, partnership, technical and product-specific routes; static demonstration form; placeholder contact channels. |

## 3. Proposed visual design direction

**Superseded by the owner-approved palette in `docs/CIVOLINK_BRAND_GUIDELINES.md` §9 — recorded below only to explain the suite as built. The suite files stay byte-unchanged; production styling must use the approved palette.**

| Role | Value |
|---|---|
| Foundation (deep navy) | `#071c33` / `#0b2747` / `#123a63` |
| Technology accent (teal) | `#0d9488` / `#12b5a5` |
| Secondary accent (cyan) | `#38c6d9` |
| Supporting blue | `#1f6fe0` |
| Status — positive | `#0f8f5f` on `#e6f6ef` |
| Status — planned/warning | `#9a5c05` on `#fdf2e0` |
| Neutral background | `#f4f7fb` |
| Text | `#0e1b2c` → `#5a6b80` |

System characteristics: system font stack only (no web-font download), one
stylesheet, CSS custom properties for all tokens, reusable `.card`, `.btn`,
`.badge`, `.notice`, `.table`, `.diagram`, `.cta-band` components, restrained
reveal animation that respects `prefers-reduced-motion`, and visible focus
indicators on every interactive element.

## 4. Umbrella website vs CIVOLINK WIFI

| | Umbrella suite (this directory) | CIVOLINK WIFI |
|---|---|---|
| Role | Corporate identity, product discovery, contact routing | Customer hotspot product |
| Lives in | `docs/umbrella-reference/` | `docs/url-reference/`, root `login.html`, `backend/` |
| Runs against | Nothing — static files only | MikroTik portal + PHP backend (separate) |
| Administers | Nothing | Wi-Fi administration (separate reference set) |

This suite **never** modifies, replaces or links itself over:

- the live MikroTik customer `login.html`,
- the customer hotspot login or payment flow,
- `backend/pay.php`, `backend/webhook.php`, `backend/check_status.php`,
- router provisioning or the Wi-Fi admin dashboard,
- the existing `docs/url-reference/` samples.

The umbrella control-center sample is a **presentation concept**; it is not a
replacement for the operational Wi-Fi administration dashboard.

## 5. Reference samples vs production implementation

| Claim | Truth |
|---|---|
| Pages exist and render locally | Yes — verified |
| Navigation, responsive layout, JS work | Yes — verified locally |
| Deployed on `civolink.com` | **No** |
| Backend, CMS, database, auth | **No** |
| Product APIs published | **No** |
| Metrics, uptime, traffic, subscriber counts | **No — none are real** |
| Contact form sends mail | **No — static demonstration** |

Nothing in this directory may be marked deployed, implemented or
production-ready. The correct status is **IMPLEMENTED — LOCALLY VERIFIED HTML
REFERENCE SUITE**, applying to the reference suite only.

## 6. Planned domain architecture

Recorded in `docs/OWNER_DECISIONS_REGISTER.md` §D13 as an approved
architectural *direction* — not a confirmation of registration, DNS,
deployment or operational availability.

| Domain | Intended role | State |
|---|---|---|
| `civolink.com` | Corporate website / umbrella platform | Reference sample |
| `wifi.civolink.com` | CIVOLINK WIFI | Planned |
| `biashara.civolink.com` | Biashara Flow | Planned |
| `docs.civolink.com` | Documentation and support | Future |
| `accounts.civolink.com` | Potential central identity service | Future concept |

Planned destinations are rendered as styled text (`<span class="domain-ref">`),
never as clickable links, so the suite contains **no dead links**.

## 7. WordPress architectural decision

CIVOLINK will use an **independent, custom-built** umbrella website and
platform. WordPress is **not** a required dependency and is not part of this
suite. It may be reconsidered later as an optional headless/content service,
subject to a separate architecture decision (§D13). No WordPress installation,
plugin, theme or CMS dependency exists here.

## 8. Features that are illustrative rather than functional

- The entire Control Center page (statuses, directory rows, health labels).
- All status badges and product stages (planning labels, not measurements).
- The `stat-strip` counts on `control-center.html` (counts of design entries).
- The developer payload examples (`example.invalid` — reserved, unroutable).
- The contact form: local validation only, no transmission, no success claim.
- `data-demo-action` buttons: show an explanatory notice, never a fake result.
- Integration/relationship diagrams: architecture intent, not tested properties.

No API keys, credentials, private endpoints, real hostnames, invented email
addresses, phone numbers, office addresses or social accounts appear anywhere.

## 9. Unresolved decisions (not decided by this suite)

These are now formally registered as **D14–D25** in
`docs/OWNER_DECISIONS_REGISTER.md` (positioning, tagline/voice, mark/palette,
domain acquisition, operating address, contact channels, sitemap, product
claims, technology stack, hosting/TLS/DNS, analytics, future CMS). The
per-page production recommendations are in
`docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md` §7–§8.

1. Whether WordPress/headless CMS is adopted for content publishing (§D13).
2. Whether `accounts.civolink.com` central identity is built at all, and its
   architecture and security review.
3. Real contact channels (email, phone, address, social) — owner to publish.
4. Whether `civolink.com` / subdomains are registered, and where the suite is
   eventually hosted.
5. Biashara Flow scope, pricing and launch commitment.
6. Any real API contract for any product.
7. Production implementation of this design (build stack, CI, hosting).

## 10. Opening the suite

Any static server works; direct file opening also works because all links are
relative and no network resource is required.

```bash
# from the repository root
python -m http.server 8080 --directory docs/umbrella-reference
# then open http://localhost:8080/
```

No build step, no dependencies, no internet connection required.

## 11. Verification performed

Recorded in `docs/PROJECT_PROGRESS_REGISTER.md` for this task. Evidence
(screenshots) is stored under `docs/umbrella-reference/evidence/` when
generated by the verification run.
