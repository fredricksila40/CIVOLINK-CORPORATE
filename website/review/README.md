# Visual QA screenshots (U-003.1)

Genuine browser screenshots of the U-003.0 prototype, captured with Google
Chrome via Playwright on 2026-11-11 from the local `file://` pages. No page
was modified for capture. **Static images only — review evidence, not part
of the prototype itself.**

## How to read these images

Each file is a **full-page** screenshot (scroll and everything below the
fold included). The filename is `<page>-<viewport>.png`:

| Viewport | Size | Meaning |
|---|---|---|
| `desktop` | 1440 × 900 | typical laptop display |
| `tablet`  | 768 × 1024 | tablet; shows the hamburger menu button |
| `mobile`  | 390 × 844  | phone; single-column layout |

## Page index

| Page | Desktop | Tablet | Mobile |
|---|---|---|---|
| Home (`index.html`) | `home-desktop.png` | `home-tablet.png` | `home-mobile.png` |
| Our Platforms (`our-platforms.html`) | `platforms-desktop.png` | `platforms-tablet.png` | `platforms-mobile.png` |
| Services (`services.html`) | `services-desktop.png` | `services-tablet.png` | `services-mobile.png` |
| Technology (`technology.html`) | `technology-desktop.png` | `technology-tablet.png` | `technology-mobile.png` |
| About (`about.html`) | `about-desktop.png` | `about-tablet.png` | `about-mobile.png` |
| Contact (`contact.html`) | `contact-desktop.png` | `contact-tablet.png` | `contact-mobile.png` |

## Behaviour evidence

| File | Shows |
|---|---|
| `mobile-nav-open.png` | Mobile hamburger menu opened: overlay visible, all six links listed, button marked expanded |
| `contact-form-validation.png` | Contact form submitted empty: per-field error messages shown, on-page notice "Please check the highlighted fields", nothing sent |
| `contact-form-confirmation.png` | Contact form filled and submitted: on-page prototype confirmation shown, message not transmitted anywhere |

## Automated checks behind the run (`qa-run-details.json`)

For every page × viewport combination the run recorded: zero console
errors or warnings, zero page errors, zero external network requests,
no horizontal overflow, no broken images, exactly one `<main>` heading,
and no external links. Menu open/close and the contact-form validation
and confirmation states were exercised and pass. Full machine-readable
results are in `qa-run-details.json` in this folder.

## Visual inspection outcome (U-003.1)

All 21 screenshots were visually inspected. **No objective defects were
found** — no broken layout, no unreadable text, no misaligned or clipped
elements, no missing images, no inconsistent header/footer treatment.
No prototype file was changed, so no re-screenshot was required.
