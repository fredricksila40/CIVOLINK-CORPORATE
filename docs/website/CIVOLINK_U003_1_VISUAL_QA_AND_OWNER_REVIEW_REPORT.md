# CIVOLINK U-003.1 — Visual QA and Owner Review Package Report

- **Task ID:** U-003.1
- **Date completed:** 2026-11-11
- **Scope:** Documentation/QA only — visual QA, defect correction if any, and
  owner review package for the six-page corporate website prototype in
  `docs/umbrella-prototype/` (U-003.0). No production deployment, no redesign,
  no backend/router/payment/credential changes, no commits.
- **Final status: U-003.1 — COMPLETED — VISUAL QA PASSED, NO DEFECTS FOUND,
  OWNER REVIEW PACKAGE PRODUCED.**

---

## 1. What was done

1. Ran a scripted browser QA pass against the local `file://` prototype
   pages using **Google Chrome** (`C:\Program Files\Google\Chrome\Application\chrome.exe`)
   driven through Playwright (harness: `C:\Users\Fredrick\AppData\Local\Temp\opencode\u0031_qa.py`).
2. Captured **21 full-page screenshots** into `docs/umbrella-prototype/review/`.
3. Exercised interactive behaviour: mobile hamburger menu (open, aria-expanded,
   close-on-link-click navigation) and the prototype contact form (empty-submit
   validation state and filled-submit confirmation state).
4. Visually inspected **all 21 screenshots** for layout, alignment, spacing,
   readability and consistency defects.
5. Produced the owner review package (`review/README.md` visual index) and
   updated the prototype README's Evidence section.

## 2. Automated QA results (`review/qa-run-details.json`)

For every page × viewport combination (6 pages × 3 viewports):

| Check | Result |
|---|---|
| Console errors / warnings | 0 |
| Page errors (JS exceptions) | 0 |
| External network requests | 0 |
| Horizontal overflow (scrollWidth > innerWidth) | none |
| Broken images | 0 |
| `<main>` H1 count per page | exactly 1 |
| External links (`http(s)://`) | 0 |

Interactive checks:

- **Mobile nav:** toggle opens menu (6 visible links, `aria-expanded="true"`);
  clicking a link closes the menu (`aria-expanded="false"`) and navigates
  (verified: → `services.html`).
- **Contact form, empty submit:** per-field errors shown, on-page notice
  "Please check the highlighted fields", nothing sent.
- **Contact form, valid submit:** on-page prototype confirmation shown
  ("Prototype only — this message was not sent anywhere…"); no transmission,
  storage or logging.

Note: the harness's per-element overflow probe flagged a few *clipped*
elements (`SPAN.visually-hidden`, table header/rows on table-heavy pages).
These are intentionally hidden/overflow-clipped by design (screen-reader-only
text, responsive table handling) and are **not visible overflow** — page-level
`scrollWidth == innerWidth` confirmed no visible overflow anywhere.

## 3. Screenshots produced (`docs/umbrella-prototype/review/`)

- 6 pages × desktop 1440×900 / tablet 768×1024 / mobile 390×844
  (full-page): `home-*`, `platforms-*`, `services-*`, `technology-*`,
  `about-*`, `contact-*`
- `mobile-nav-open.png`, `contact-form-validation.png`,
  `contact-form-confirmation.png`
- `qa-run-details.json` — machine-readable run record

All indexed for a non-technical reader in `review/README.md`.

## 4. Visual inspection outcome

All 21 screenshots were visually reviewed page by page:

- Header/logo/nav consistent across pages; active-page indication correct
  on every page and viewport.
- Hero sections, cards, tables, status badges and footers render cleanly at
  all three widths; no clipped or overlapping elements; no unreadable text
  (contrast follows the approved palette pairings).
- Tablet/mobile correctly collapse to the hamburger navigation; the
  hamburger menu renders and behaves correctly (see behaviour evidence).
- Status badges, D14/D19/D21 gating chips and planned-domains-as-text are
  present and legible everywhere they appear.
- **No objective defects were found.** No prototype HTML/CSS/JS file was
  changed, so no re-screenshot was required.

## 5. Files inspected and changed

Inspected (read-only):

- `docs/umbrella-prototype/` — all six HTML pages, `assets/css/styles.css`,
  `assets/js/main.js`, `assets/logos/*.png` (via the rendered pages)
- `docs/umbrella-prototype/review/qa-run-details.json` and all 21 screenshots
- `docs/umbrella-prototype/README.md`, `docs/CIVOLINK_U003_0_PROTOTYPE_IMPLEMENTATION_REPORT.md`

Changed:

- **Created** `docs/umbrella-prototype/review/README.md` (screenshot index +
  QA summary for a non-technical owner)
- **Created** `docs/umbrella-prototype/review/*.png` (21) and
  `review/qa-run-details.json` (QA outputs)
- **Edited** `docs/umbrella-prototype/README.md` — Evidence section now
  points to `review/` (U-003.1 package) alongside the earlier `evidence/`
  (U-003.0). No other README content touched; the parallel-session refresh
  of that README (U-002.3 content references, T-020 logo note) was preserved.
- Progress register task row, roadmap §U and manifest entries updated for
  traceability.

Not changed: the six prototype pages and their assets (byte-untouched),
`docs/umbrella-reference/`, all backend/production files, Owner Decisions
Register.

## 6. Limitations

- QA ran against local `file://` pages in one browser engine (Chrome/
  Chromium). Real Safari/Firefox and physical devices were not exercised.
- Viewport emulation (1440×900, 768×1024, 390×844) approximates rather than
  replaces real hardware.
- Accessibility was checked structurally (single H1, aria-expanded toggles,
  visible focus/labels in screenshots), not with a full screen-reader audit.
- The contact form confirmation is a **local prototype state only** — no
  message is sent, stored or logged anywhere (by design, pending D19).

## 7. Subjective items for owner judgement (not defects)

1. **Mission/vision/values wording on About** is marked DRAFT — D14 residual;
   owner wording decision still open.
2. **Biasara Flow public listing** (name + IN DEVELOPMENT badge on Our
   Platforms/Services) is a reversible prototype treatment pending D21
   confirmation.
3. **Prototype filenames** (`our-platforms.html`, …) are provisional pending
   formal D20 confirmation.
4. **Provisional PNG logo crops** (T-020) are pending owner approval; the
   approved SVG family remains outside the repo (gap G1).
5. General look-and-feel preferences (spacing density, hero treatment,
   word choices) are owner taste — the QA found nothing objectively wrong.

## 8. Status

U-003.1 complete. The prototype is visually consistent, functionally correct
within its stated prototype limits, and makes no external requests. The
owner can review by opening `docs/umbrella-prototype/index.html` directly in
a browser, or by browsing the screenshots in `docs/umbrella-prototype/review/`
starting from `review/README.md`.
