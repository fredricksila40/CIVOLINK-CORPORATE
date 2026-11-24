# CIVOLINK Corporate Website ? UTF-8 Encoding Audit and Mojibake Correction Report

**Date:** 2026-11-18  
**Repository:** `E:\Documents\VS\CIVOLINK-CORPORATE`  
**Website source (audited):** `E:\Documents\VS\CIVOLINK-CORPORATE\website\`  
**Production site (inspected):** `https://civolink.co.ke/`  
**Status:** **LOCAL SOURCE CORRECTION COMPLETED AND LOCALLY VERIFIED ? PRODUCTION NOT DEPLOYED / PRODUCTION RESPONSES STILL UNCORRECTED** (see ?8, ?10, ?11)

---

## 1. Objective and scope
Website-wide investigation and correction of UTF-8 encoding problems, character corruption, and mojibake in the CIVOLINK Corporate website source (`website/`), with verification of related deployed text resources where observable, Nginx/deployment configuration review in-repo, and preparation of a controlled release update (inventory refreshed). Work preserved approved copy, design, layout, navigation, accessibility, and functionality; no unrelated redesign/content rewrite.

**Governance protection:** Draft indicators and publication-status notices (including `DRAFT ? D14`, `WORDING ? D14`, and the About-page internal verification/removal note) were preserved; character encoding was corrected without removing, rewriting, or approving draft content.

---

## 2. Website-wide audit (initial)

### 2.1 Files inspected (website source directory, recursive)
Total text-based/inspectable files in `website/`: **13** (binary image assets excluded from text scan; all other website source resources inspected).

| File | Size (bytes) | UTF-8 BOM | UTF-8 valid (strict decode) | HTML `<meta charset>` | Residual mojibake-pattern hits (post-fix re-scan) |
| --- | --- | --- | --- | --- | --- |
| about.html | 14745 | False | True | <meta charset="UTF-8"> | 0 |
| about.html.orig | 0 | False | True | ? | 0 |
| assets/css/styles.css | 25594 | False | True | ? | 0 |
| assets/js/main.js | 4842 | False | True | ? | 0 |
| contact.html | 13507 | False | True | <meta charset="UTF-8"> | 0 |
| index.html | 12565 | False | True | <meta charset="UTF-8"> | 0 |
| our-platforms.html | 12276 | False | True | <meta charset="UTF-8"> | 0 |
| README.md | 2856 | False | True | ? | 0 |
| review/accessibility-audit.json | 10625 | False | True | ? | 0 |
| review/qa-run-details.json | 10263 | False | True | ? | 0 |
| review/README.md | 2626 | False | True | ? | 0 |
| services.html | 15478 | False | True | <meta charset="UTF-8"> | 0 |
| technology.html | 11041 | False | True | <meta charset="UTF-8"> | 0 |

### 2.2 Initial findings (pre-fix, confirmed)
- **Affected files:** 6 HTML pages in `website/` ? `about.html`, `contact.html`, `index.html`, `our-platforms.html`, `services.html`, `technology.html`.
- **Corruption type:** Mojibake from UTF-8 bytes misinterpreted/round-tripped (common CP1252/UTF-8 mismatch symptoms), present in source text. Examples found: `???` (em dash), `???` (en dash), `???`/apostrophe form, `???`/`???` (`??`/`??` forms), `??` (middle dot), `??` (copyright), `??` (section sign), `???` (ellipsis). **No `?` (U+FFFD replacement character) found in website source before or after fix.**
- **Encoding/HTML declaration issues (pre-fix):** all 6 affected pages had **UTF-8 BOM** (`EF BB BF`) and declared `<meta charset="utf-8">` (lowercase) at byte index 274; corrected to `<meta charset="UTF-8">` (no BOM). `assets/css/styles.css`, `assets/js/main.js`, `README.md` and image assets showed no encoding corruption.
- **Mirrors/related copies:** `docs/website/<same 6 pages>.html` were byte-identical to `website/` copies before fix and were synchronized after correction. `docs/website/umbrella-reference/*.html` (6 files) had no mojibake/BOM but used lowercase charset declarations ? normalized to `<meta charset="UTF-8">`.
- **Not blindly altered:** patterns were matched in context and replaced with intended Unicode characters; no whole-file encoding conversion/re-encoding of unclear bytes performed.

### 2.3 Mirror and reference audit results (post-fix)
| Scope | File | Size (bytes) | BOM | UTF-8 valid | `<meta charset>` | Residual mojibake-pattern hits |
| --- | --- | --- | --- | --- | --- | --- |
| docs/website/ (mirror) | about.html | 14745 | False | True | <meta charset="UTF-8"> | 0 |
| docs/website/ (mirror) | contact.html | 13507 | False | True | <meta charset="UTF-8"> | 0 |
| docs/website/ (mirror) | index.html | 12565 | False | True | <meta charset="UTF-8"> | 0 |
| docs/website/ (mirror) | our-platforms.html | 12276 | False | True | <meta charset="UTF-8"> | 0 |
| docs/website/ (mirror) | services.html | 15478 | False | True | <meta charset="UTF-8"> | 0 |
| docs/website/ (mirror) | technology.html | 11041 | False | True | <meta charset="UTF-8"> | 0 |
| docs/website/umbrella-reference/ | about.html | 23132 | False | True | <meta charset="UTF-8"> | 0 |
| docs/website/umbrella-reference/ | contact.html | 20225 | False | True | <meta charset="UTF-8"> | 0 |
| docs/website/umbrella-reference/ | control-center.html | 21482 | False | True | <meta charset="UTF-8"> | 0 |
| docs/website/umbrella-reference/ | developers.html | 23145 | False | True | <meta charset="UTF-8"> | 0 |
| docs/website/umbrella-reference/ | index.html | 21829 | False | True | <meta charset="UTF-8"> | 0 |
| docs/website/umbrella-reference/ | products.html | 22523 | False | True | <meta charset="UTF-8"> | 0 |

---

## 3. HTML character encoding normalization
- All 6 public pages in `website/` now declare **`<meta charset="UTF-8">`** near the beginning of `<head>` (within the first 1024 bytes) with no conflicting charset declaration found.
- UTF-8 BOM removed from all 6 corrected HTML pages; files saved as **valid UTF-8 without BOM**.
- `docs/website/umbrella-reference/*.html` charset declarations normalized to `<meta charset="UTF-8">`.
- `website/about.html.orig` (0 bytes, pre-existing artifact) left untouched (empty; not a valid page).

---

## 4. Repairs and normalization (confirmed corrections)

| Source file | Mirror synced | BOM removed | Meta before ? after | Confirmed mojibake replacements (count) | Intended characters / notes |
|---|---|---:|---|---:|---|
| `website/about.html` | `docs/website/about.html` | True | `<meta charset="utf-8"> (idx 274, UTF-8 BOM present)` ? `<meta charset="UTF-8">` | **24** | 21? em dash (?, mojibake `???`), 1? middle dot (?, `??`), 1? copyright (?, `??`), 1? section sign (?, `??`) |
| `website/contact.html` | `docs/website/contact.html` | True | `<meta charset="utf-8"> (BOM)` ? `<meta charset="UTF-8">` | **25** | 21? em dash (?), 1? en dash (? in `rules 9?10`, mojibake `???` cp1252 form), 2? ellipsis (? in `Choose a route?` and placeholder), 1? copyright (?) |
| `website/index.html` | `docs/website/index.html` | True | `<meta charset="utf-8"> (BOM)` ? `<meta charset="UTF-8">` | **17** | 13? em dash (?), 3? middle dot (? in tagline/panel), 1? copyright (?) |
| `website/our-platforms.html` | `docs/website/our-platforms.html` | True | `<meta charset="utf-8"> (BOM)` ? `<meta charset="UTF-8">` | **14** | 11? em dash (?), 1? left double quote (?), 1? right double quote (?) in `?live?` badge text, 1? copyright (?) |
| `website/services.html` | `docs/website/services.html` | True | `<meta charset="utf-8"> (BOM)` ? `<meta charset="UTF-8">` | **18** | 13? em dash (?), 2? left double quote (?), 2? right double quote (?) in `?in development?` labels, 1? copyright (?) |
| `website/technology.html` | `docs/website/technology.html` | True | `<meta charset="utf-8"> (BOM)` ? `<meta charset="UTF-8">` | **15** | 11? em dash (?), 1? right single quote/apostrophe (? in `each other?s`), 1? left double quote (?), 1? right double quote (?) in `?Live?`, 1? copyright (?) |

**Total confirmed mojibake corrections in website source pages:** **113** across **6** files (plus identical corrections applied to 6 `docs/website/` mirror copies).  
**Unintended replacement chars (`?`, U+FFFD):** none introduced (verified by re-scan).  
**Other modified artifacts (factual, deployment-prep):** `deploy/release-inventory.txt` refreshed to reflect corrected payload hashes/sizes (10 production files, 198,848 bytes total); `deploy/CIVOLINK_CORPORATE_DEPLOYMENT_MANIFEST.md` updated with a dated encoding-correction note (still NOT DEPLOYED).

---

## 5. Nginx and production response verification (in-repo/config and live responses)

### 5.1 In-repository configuration findings
- **No Nginx server-block/config files found in this repository.** Deployment materials present: `deploy/deploy-corporate.sh`, `deploy/healthcheck.sh`, `deploy/CIVOLINK_CORPORATE_DEPLOYMENT_MANIFEST.md`, `deploy/release-inventory.txt`, and `docs/website/CIVOLINK_WEBSITE_SECURITY_AND_DEPLOYMENT_SPECIFICATION.md`.
- **No existing `charset utf-8`/explicit `Content-Type: text/html; charset=utf-8` directives found** in repo deployment scripts/manifests/spec text (searched). `deploy/healthcheck.sh` does not currently assert a charset parameter on HTML responses.
- **Action taken:** no Nginx configuration modified (none in repo; live config not accessible from workspace). **No production services reloaded/restarted.**

### 5.2 Required production configuration (not applied from this workspace)
For `civolink.co.ke` and `www.civolink.co.ke` server blocks (scoped to those vhosts, not global unless appropriate), ensure HTML responses include **`Content-Type: text/html; charset=utf-8`** (e.g. `charset utf-8;` with appropriate `charset_types`, and/or explicit `types`/header handling consistent with existing config). Validate config (`nginx -t`) before any reload. This remains an **owner/operator production action**.

### 5.3 Live HTTP response inspection (observed 2026-11-18, from workspace)
| URL | HTTP status | Content-Type header (as received) | Body observations | Mojibake-pattern matches (sample patterns) |
| --- | --- | --- | --- | --- |
| https://civolink.co.ke/ | 200 | text/html | UTF-8 BOM in body; no charset parameter in Content-Type header | 17 |
| https://civolink.co.ke/about.html | 200 | text/html | BOM; no charset param | 24 |
| https://civolink.co.ke/services.html | 200 | text/html | BOM; no charset param | 18 |
| https://civolink.co.ke/our-platforms.html | 200 | text/html | BOM; no charset param | 14 |
| https://civolink.co.ke/technology.html | 200 | text/html | BOM; no charset param | 15 |
| https://civolink.co.ke/contact.html | 200 | text/html | BOM; no charset param | 25 |
| https://civolink.co.ke/assets/css/styles.css | 200 | text/css | no charset param shown; no mojibake pattern matches | 0 |
| https://civolink.co.ke/assets/js/main.js | 200 | application/javascript | no charset param shown; no mojibake pattern matches | 0 |

**Conclusion:** Live HTML pages currently served **without** an explicit charset parameter and **with** BOM/mojibake present in response bodies; corrected source is **not yet deployed**.

---

## 6. Content-governance protection
- Inspected draft/publication-status indicators including `DRAFT ? D14`, `WORDING ? D14`, and `Draft wording awaiting owner confirmation. Not approved for publication.` (present in `website/about.html`, preserved). The About-page internal verification note (`Verification note (internal ? remove before publication): ... rule 11 ...`) was preserved with encoding corrected only.
- **No draft content removed, rewritten, or approved.** Publication-status resolution remains a separate governance/owner-confirmation matter (not changed by this encoding repair).

---

## 7. Local verification
1. **Re-scan:** all 13 inspectable website-source files re-scanned; plus `docs/website/` HTML mirrors and `docs/website/umbrella-reference/*.html` checked ? **no residual mojibake-pattern hits, no BOM, UTF-8 valid** in corrected scope.
2. **HTML charset:** all 6 public pages declare `<meta charset="UTF-8">` within the first 1024 bytes.
3. **UTF-8 validation:** strict UTF-8 decode passed for all 6 corrected pages; **no `?` (U+FFFD)** found.
4. **Structure/syntax:** lightweight HTML parse passed for all 6 pages; `node --check website/assets/js/main.js` passed (Node v24.21.0, exit 0).
5. **Links/assets (static):** internal `href/src` targets resolved for all 6 pages (no missing local references found).
6. **Interactive browser QA:** not fully automated in this session (no browser automation executed as part of this pass). Static/layout-impact risk assessed as low (text/encoding normalization only). Prior prototype review evidence exists in `website/review/` and `website/evidence/`; recommend a quick visual smoke check on release.

---

## 8. Production verification and release status
- **Corruption layer assessment:** confirmed in **source files (fixed locally)** and in **current production responses** (still corrupted, BOM present, no charset header). HTTP response encoding/headers do not declare UTF-8 for HTML. Browser rendering of live site is therefore expected to reflect the corrupted served bytes until a corrected release is deployed and headers are corrected.
- **Local vs deployed:** corrected build is prepared locally in `website/` with refreshed `deploy/release-inventory.txt`; `docs/website/` page mirrors synchronized.
- **Deployment performed:** **NO.** No DNS/TLS/infra changes made. No production service reload/restart performed. External deployment authorization/credentials and execution of `deploy/deploy-corporate.sh` (or equivalent owner-approved release procedure) against the origin were **not** performed in this session; therefore deployment success is **not claimed**.
- **Rollback readiness:** deployment manifest/procedure and `deploy/healthcheck.sh` remain in repo; prior release retention/rollback is governed by existing deployment architecture (operator action required on host). Local working changes are standard file edits (not committed here).

---

## 9. Documentation updates
- **Created:** `docs/website/CIVOLINK_UTF8_ENCODING_AUDIT_AND_CORRECTION_REPORT_2026-11-18.md` (this report).
- **Updated (factual):** `deploy/release-inventory.txt` (hashes/sizes for corrected payload), `deploy/CIVOLINK_CORPORATE_DEPLOYMENT_MANIFEST.md` (dated encoding-correction note; not deployed).
- **Progress register:** no `PROJECT_PROGRESS_REGISTER.md` found within `CIVOLINK-CORPORATE`; no project-local register updated. (Workspace-level registers exist outside this repository and were not modified.)

---

## 10. Final report summary (requested items)

1. **Total files inspected:** **13** text-based/inspectable files in `website/` (recursive). Additionally reviewed: 6 `docs/website/` HTML mirrors + 6 `docs/website/umbrella-reference/*.html` + in-repo deployment docs/scripts for charset/response guidance.
2. **Total affected files (confirmed, corrected):** **6** website source HTML pages (+ 6 synced `docs/website/` mirror copies; 6 umbrella-reference HTML pages had meta normalized only). Deployment artifacts refreshed: 2 (`deploy/release-inventory.txt`, `deploy/CIVOLINK_CORPORATE_DEPLOYMENT_MANIFEST.md`).
3. **Every confirmed correction:** see ?4 table (per-file mojibake character classes/counts, BOM removal, `<meta charset="UTF-8">` normalization) and mirror/umbrella-reference normalization above.
4. **Files and lines modified:** corrected source pages ? `website/about.html`, `website/contact.html`, `website/index.html`, `website/our-platforms.html`, `website/services.html`, `website/technology.html`; synced mirrors in `docs/website/` for same basenames; `docs/website/umbrella-reference/about|contact|control-center|developers|index|products.html` (meta line); `deploy/release-inventory.txt`; `deploy/CIVOLINK_CORPORATE_DEPLOYMENT_MANIFEST.md`; this report file. (Line-level change spans cover corrected text/meta/BOM removal throughout affected HTML documents; exact diffs available via `git diff` in `CIVOLINK-CORPORATE`.)
5. **Encoding validation results:** UTF-8 strict decode **PASS** for corrected pages; no BOM; no U+FFFD introduced.
6. **HTML charset audit results:** all 6 public pages now `<meta charset="UTF-8">` within first 1024 bytes; umbrella-reference pages normalized to same.
7. **Nginx configuration findings:** no vhost config in repo; no charset directive found in repo deployment artifacts; live HTML responses lack `charset=utf-8` parameter ? **production config change required on host** (scoped to civolink site), not applied here.
8. **Production response verification:** live pages 200 but still serve BOM + mojibake and no charset parameter (see ?5.3). Assets 200 with expected types observed.
9. **Browser rendering verification:** not interactively automated this session; local static/parse/link/JS checks passed. Live rendering remains impacted until corrected deployment.
10. **Content-governance issues discovered:** draft/verification notices remain present as intended (`DRAFT ? D14`, `WORDING ? D14`, About internal verification note; `Draft wording awaiting owner confirmation. Not approved for publication.` preserved). No approval/status changes made.
11. **Deployment status:** **NOT DEPLOYED.** Corrected local release prepared (inventory refreshed) pending owner-authorized deployment and server-side charset/header configuration/validation.
12. **Rollback readiness:** documented by existing deployment manifest/script architecture; operator must ensure previous release remains available on host per procedure before/after deploy.
13. **Remaining blockers:** (a) Owner/operator execution of production deployment with corrected payload. (b) Nginx (or edge/proxy) configuration to serve `text/html; charset=utf-8` for `civolink.co.ke`/`www.civolink.co.ke`, validated and reloaded on host. (c) Post-deploy live verification (headers, body bytes/BOM, rendered text, assets, navigation/layout). (d) Optional: review/repair mojibake and BOM found in non-payload docs `docs/website/CIVOLINK_U002_2_PROGRESS_READINESS_AND_GOVERNANCE_AUDIT.md` (BOM) and `docs/website/CIVOLINK_U002_3_CORPORATE_WEBSITE_CONTENT.md` (BOM + mojibake) if desired ? intentionally not modified as unrelated historical/documentation content outside website source payload.

**Related pre-existing observation (not modified):** `website/about.html.orig` is a 0-byte artifact (left in place).

---
*End of report.*

---

## 12. Deployment update (2026-11-24, owner-authorized)

The corrected release was deployed to production: release 20261124-185300-site-utf8fix, atomic symlink switch with rollback target 20261118-000000-site-contentfix retained. A scoped charset utf-8; directive was added to the Corporate server block of /etc/nginx/sites-available/civolink (config backed up, 
ginx -t passed, service reloaded; Control Center server block untouched). Remote full SHA-256 verification passed before activation. Live verification: all six pages and both assets return 200 with Content-Type: ...; charset=utf-8; mojibake hits 0; healthcheck.sh 14/14 PASS (exit 0). Earlier sections describing production as uncorrected are historical and reflect the pre-deployment state.
