# CIVOLINK corporate website prototype (U-003.0)

Static, locally previewable six-page prototype of the CIVOLINK corporate
website. **Prototype only** — not deployed, not a live service, no backend.

## Preview

Open any page directly in a desktop browser (double-click, or Ctrl/O):

```
index.html            Home
our-platforms.html    Our Platforms
services.html         Services
technology.html       Technology
about.html            About
contact.html          Contact
```

No server, no install, no internet connection required. Everything is
relative-path local: `assets/css/styles.css`, `assets/js/main.js`,
`assets/logos/*.png`. There are **no external requests** of any kind.

Optional local server (only if your browser restricts `file://` features,
which this prototype does not rely on):

```bash
# Python
python -m http.server 8000
# then visit http://localhost:8000/
```

## What works

- Header navigation across all six pages, with active-page indication
- Mobile hamburger navigation (toggle, Escape to close)
- In-page anchors (e.g. services → product sections) and cross-page CTAs
- Contact form: local validation only — **submission never transmits,
  stores or logs anything**; it shows an on-page prototype confirmation
- Responsive layouts at mobile / tablet / desktop widths
- Footer links, planned domains shown as text (never links)

## What is deliberately absent

Analytics, cookies, trackers, external fonts/icons/images, authentication,
payments, live email/contact services, backend, database, CMS, dead
external links. See the footer note on every page.

## Brand and content basis

- Palette, contrast pairings, identity rules: `docs/CIVOLINK_BRAND_GUIDELINES.md`
- Copy: `docs/CIVOLINK_U002_3_CORPORATE_WEBSITE_CONTENT.md` (U-002.3)
- Structure: `docs/CIVOLINK_U002_3_SITEMAP.md`
- Logo: provisional PNG crops from `docs/brand/logos/` (T-020, **pending
  owner approval**), copied here unchanged. Not redrawn, not canonical.
  The approved SVG family is outside this repository (gap G1).

Filenames (`our-platforms.html`, `services.html`, …) are **provisional
prototype conventions** pending formal D20 confirmation — see
`docs/CIVOLINK_U003_0_PROTOTYPE_IMPLEMENTATION_REPORT.md`.

## Evidence

- `review/` — U-003.1 visual QA package: 21 genuine Chrome screenshots
  (6 pages × desktop / tablet / mobile, plus mobile-nav-open and the two
  contact-form states) with a visual index in `review/README.md` and
  machine-readable results in `review/qa-run-details.json`. All pages
  passed; no defects found, no prototype file changed.
- `evidence/` — earlier screenshots from the U-003.0 build.
- `evidence/u0031/` — post-correction screenshots from the U-003.1
  technical verification (four pages after the accessibility fixes;
  see `docs/CIVOLINK_U003_1_TECHNICAL_QUALITY_AND_ACCESSIBILITY_REPORT.md`).
