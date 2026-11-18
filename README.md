# CIVOLINK-CORPORATE

**Status:** Project home established 2026-11-14 (workspace audit). Materials are **copies**; originals still live in `WIFI\docs\` and `WIFI\` root pending owner-approved source cleanup.

CIVOLINK-CORPORATE is the home of the CIVOLINK corporate identity: the public corporate
website and the umbrella brand, governance and go-live documentation. It is **not** the WIFI
product, **not** the Control Center, and **not** a code monolith. Independent products
(Biashara Flow, EDMOLT, SautiBase, WIFI, Control Center) keep their own boundaries.

## Contents

| Path | Contents | Authoritative original (pending owner approval to relocate) |
|---|---|---|
| `website\` | Full copy of the corporate website prototype U-003.3: `index.html`, `about.html` (+ `about.html.orig` recovery artifact), `services.html`, `our-platforms.html`, `technology.html`, `contact.html`, `assets\{css,js,logos}`, `evidence\`, `review\`, README | `WIFI\docs\umbrella-prototype\` |
| `docs\website\` | U-002.x / U-003.x / T-024..T-027 reports and website specs (content, sitemap, SEO, accessibility, security & deployment, contact form) | `WIFI\docs\` (same filenames) |
| `docs\governance\` | U-001/U-001B/U-001C umbrella + brand governance reports, `CIVOLINK_BRAND_GUIDELINES.md`, ecosystem completion & go-live plan, production go-live checklist, owner decision request pack, umbrella production architecture, desktop tools & API gateway strategy | `WIFI\docs\` and `WIFI\` root (same filenames) |
| `docs\legal\` | `PRIVACY_POLICY_DRAFT.md`, `TERMS_OF_USE_DRAFT.md` | `WIFI\docs\website-legal\` |
| `docs\reference\umbrella-reference\` | Earlier prototype iteration snapshot | `WIFI\docs\umbrella-reference\` |
| `assets\brand\` | CIVOLINK logo/brand asset set (Mark, Primary, Monochrome, Reversed, White) | `WIFI\docs\brand\` |

## History that must remain traceable

U-002.3 (content + sitemap) → U-003.0 (prototype) → U-003.1 (accessibility) → U-003.2
(ecosystem & go-live) → U-003.3 (productionization) → T-025 (About page recovery) →
T-026 (acceptance) → T-027 (consolidation audit). Historical reports are preserved as
historical records; completed audit reports must never be rewritten to pretend the work
was originally performed in this directory.

## Not included (deliberately)

- `WIFI\docs\url-reference\` — WIFI portal UI reference pages (belongs to the WIFI product).
- `WIFI\docs\CIVOLINK_BIASHARA_FLOW_RELEASE_ENGINEERING_TASK_BRIEF.md` — cross-project brief; retained in WIFI.
- The Laravel Control Center and its U-004 documentation — see `..\CIVOLINK-CONTROL-CENTER\`.

## Pending owner decisions

1. Approve deletion of the copied originals from `WIFI\docs\` (and the two files at
   `WIFI\` root) once copies are accepted — then re-home this folder's content as the
   single authoritative location and update all cross-references.
2. Decide whether the corporate website gets its own Git repository (recommended once
   authoritative materials land here; currently the copies are untracked — run no git
   commands at workspace root).
3. Ongoing edit location: until the move is approved, edit sources in `WIFI\docs\` and
   re-copy; do not fork the content by editing both sides.
