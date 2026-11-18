# CIVOLINK — U-002 Owner Decision Review Pack

**Date:** 2026-11-10  
**Repository:** `E:\Documents\VS\WIFI`  
**Task type:** Documentation and decision preparation only  
**Scope:** CIVOLINK umbrella platform — preparation for U-002 Business Identity, Content and Legal Readiness  
**Authorization:** OWNER-AUTHORIZED PLANNING AND DOCUMENTATION TASK  
**Production implementation:** NOT AUTHORIZED  
**Deployment:** NOT AUTHORIZED  
**Status:** CIVOLINK U-002 OWNER REVIEW PACK — COMPLETED — LOCALLY VERIFIED

---

## 1. Purpose and Scope

This review pack identifies, explains, and organizes **all outstanding owner decisions** (D14–D25) that must be addressed before U-002 — Business Identity, Content and Legal Readiness — can begin.

This is a **preparation task only**. It does not authorize:

- U-002 implementation
- Website development
- Domain registration or DNS configuration
- VPS configuration or deployment
- WordPress installation
- Product integrations
- Payment or webhook changes
- MikroTik changes
- Logo redesign or vectorization
- Production asset replacement
- Commit or push

---

## 2. Current Project Baseline

| Item | Value |
|------|-------|
| Repository root | `E:\Documents\VS\WIFI` |
| Branch | `main` (tracks `origin/main`) |
| HEAD | `1bf0b2fe717ae916afd23a4dd3bb3d92c974fa1b` |
| HEAD subject | `feat(provisioning): implement secure RouterOS v7 TLS provisioning and retry engine` |
| Working tree | NOT clean — pre-existing modified and untracked files preserved |
| Commit/push | None performed |

### 2.1 Working-tree status (as inspected)

**9 modified tracked files:** `.gitignore`, `README.md`, `backend/check_status.php`, `backend/common.php`, `backend/db.php`, `backend/pay.php`, `backend/provision.php`, `backend/schema.sql`, `backend/webhook.php`

**Untracked files include:** `.phpunit.result.cache`, `PHASE_1B_AUDIT_REPORT.md`, `PHASE_1B_FINAL_REPORT.md`, `backend/Payment/`, `backend/tests/`, `composer.json`, `composer.lock`, `docs/`, `phpunit.xml`, `.tools/` (partial list)

## 3. Summary of U-001B Completion

U-001B (brand guidelines documentation and repository alignment) completed the following documentation-only work:

- Created `docs/CIVOLINK_BRAND_GUIDELINES.md` (26 sections, all verified)
- Aligned six governance documents (Owner Decisions Register, Architecture Document, Build Manifest, Umbrella Reference README, Root README, Project Progress Register)
- Verified all 8 approved SVG logo assets at `E:\Documents\VS\CIVOLINKssets\logo\` (SHA-256 checksums recorded)
- Recorded 8 proposed PNG crops in `docs/brand/logos/` (pending owner approval — not approved replacements)
- Recorded owner-approved tagline: `CONNECTING IDEAS · BUILDING SOLUTIONS`
- Recorded owner-approved palette: Primary Navy `#102A43`, Primary Teal `#00A6A6`, Secondary Cyan `#18C3C8`, Graphite `#263238`, Cloud `#F4F7F8`, White `#FFFFFF`
- Documented legal disclosure rules (rules 1–11) for BN-55SLLRED and CIVOLINK ENTERPRISES
- D14–D16 reconciled to PARTIALLY RESOLVED; D17–D25 remain OPEN
- D1–D13 untouched
- No production implementation; no commit or push

## 4. Current Logo Asset Governance Status

### 4.1 Approved SVG assets (source of truth)

| # | Asset | Location | Bytes | SHA-256 |
|---|-------|----------|-------|---------|
| 1 | CIVOLINK_Primary.svg | `E:\Documents\VS\CIVOLINKssets\logo\` | 25,898 | `436acbd58029f0e87b654a6355497b2c589c5c0f9892d53380c49cb4bb23260e` |
| 2 | CIVOLINK_Monochrome.svg | `E:\Documents\VS\CIVOLINKssets\logo\` | 25,896 | `1adb3456c23be672f563461407c8a15b7861fceb45d07ac7bd14b8dd999379d7` |
| 3 | CIVOLINK_Reversed.svg | `E:\Documents\VS\CIVOLINKssets\logo\` | 25,886 | `96bf122fdfa416aa81de73cab05f81fdcd9d0e1b7a1b85c5989be7b899d5cff0` |
| 4 | CIVOLINK_White.svg | `E:\Documents\VS\CIVOLINKssets\logo\` | 25,882 | `967d043eee48feb93527c5e2a5f534896e76dff75e9cb3b7c20c4464c1b53767` |
| 5 | CIVOLINK_Mark.svg | `E:\Documents\VS\CIVOLINKssets\logo\` | 2,008 | `c6e7aaf2e175689c3e113aeb146f05e8c13b65e94a7634044f9da3b68680a936` |
| 6 | CIVOLINK_Mark_Monochrome.svg | `E:\Documents\VS\CIVOLINKssets\logo\` | 2,008 | `98b5e18ef4f80aa16a251ff39f81638b94cfab851459c519a1d9c26b4b8f2d0e` |
| 7 | CIVOLINK_Mark_Reversed.svg | `E:\Documents\VS\CIVOLINKssets\logo\` | 2,006 | `52c5887fd5a49fe232d5a0d0684bdc77bb4942a6b6e6d9f0e2981f0f087e7ea5` |
| 8 | CIVOLINK_Mark_White.svg | `E:\Documents\VS\CIVOLINKssets\logo\` | 2,001 | `8b90d492e41169ecba47b60866ff3132681309ee2b99fe7e8e203ad33806de30` |

All 8 are valid SVG documents (well-formed root, closed `</svg>`, no scripts, no external references). A byte-identical second copy exists at `E:\Documents\VS\EDMOLT\EDMOLT_CORPORATE_DOCUMENT_SYSTEM\Civolink Assets\Logo\`.

> **Important:** These are the owned SVG source-of-truth assets. They should be the only logo assets promoted into production/UI references at this stage.

### 4.2 Proposed PNG crops (docs/brand/logos/)

| Asset | Location |
|-------|----------|
| CIVOLINK_Primary.png | `docs/brand/logos/CIVOLINK_Primary.png` |
| CIVOLINK_Monochrome.png | `docs/brand/logos/CIVOLINK_Monochrome.png` |
| CIVOLINK_Reversed.png | `docs/brand/logos/CIVOLINK_Reversed.png` |
| CIVOLINK_White.png | `docs/brand/logos/CIVOLINK_White.png` |
| CIVOLINK_Mark.png | `docs/brand/logos/CIVOLINK_Mark.png` |
| CIVOLINK_Mark_Monochrome.png | `docs/brand/logos/CIVOLINK_Mark_Monochrome.png` |
| CIVOLINK_Mark_Reversed.png | `docs/brand/logos/CIVOLINK_Mark_Reversed.png` |
| CIVOLINK_Mark_White.png | `docs/brand/logos/CIVOLINK_Mark_White.png` |
| Composite board reference | `docs/brand/logos/reference/` |

**Important:** These PNGs are **proposed raster crops pending owner approval**. They are unresampled crops of the composite board — not editable vector originals. They must not automatically replace existing product or production logos. The previously verified external SVG family remains untouched. No production logo replacement is authorized.

### 4.3 Open logo gaps

| Gap | Impact | Needed to close |
|-----|--------|-----------------|
| G1 | Approved SVG assets are not in this repository | Production builds cannot reference them from the repo; owner-authorised copy with checksum verification required |
| G5 | No approved clear-space ratio | Provisional guidance only; owner confirmation needed |
| G6 | No approved minimum logo size | Provisional guidance only; owner confirmation needed |
| G10 | No approved product lockups for CIVOLINK WIFI / Biashara Flow | Co-branding uses umbrella assets only for now |

## 5. Owner Decision Register — Outstanding Decisions D14–D25

This section provides the **starter decision matrix** for the outstanding owner decisions. It is a decision-support table only; it does not itself make decisions.

> **Correction (2026-11-11, U-002.2 audit): the D14–D25 subject labels used in this section diverge from the decision authority.**
>
> `docs/OWNER_DECISIONS_REGISTER.md` is the decision authority (mirrored by `docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md` §14 and `docs/CIVOLINK_BRAND_GUIDELINES.md`). The table below — and the explanations in §6, the dependency graph in §10, the sequence in §11 and the entry list in §12 — use **different subject labels for the same decision IDs**. This divergence is the root cause of the "D24 = RIC-1A/RIC-2 products" and "D25 overlaps G1" claims recorded in `docs/CIVOLINK_U002_1_PROGRESS_AND_BLOCKER_CORRECTION_REPORT.md` §9a/§11b. **The register's subjects govern.** Correct mapping (this note changes no decision status and creates no decision):
>
> | ID | Authoritative subject (register / architecture §14) | Status | Label used in this pack — superseded for subject definitions |
> |---|---|---|---|
> | D14 | Corporate positioning: description, mission, vision, values, audience | PARTIALLY RESOLVED | Web product-name decision |
> | D15 | Tagline / hero line and brand voice; CIVOLINK vs CIVOLINK ENTERPRISES usage rules | PARTIALLY RESOLVED | Sub-brand treatment for Biashara Flow |
> | D16 | Logo/mark, favicon and colour palette approval | PARTIALLY RESOLVED | Legal/positioning clarity for CIVOLINK vs CIVOLINK ENTERPRISES |
> | D17 | Domain acquisition: which domains, registrar, registrar-account ownership | OPEN | Logo usage rights and re-distribution |
> | D18 | Operating address vs registered address | OPEN | Tagline approval and usage rules |
> | D19 | Public contact channels, support hours and form data handling | OPEN | Brand colours approval and variant usage |
> | D20 | Umbrella production sitemap and page set | OPEN | Logo horizontal/vertical lockups |
> | D21 | Product descriptions and status claims | OPEN | Clear-space and minimum size rules |
> | D22 | Production technology stack and hosting topology | OPEN | Wordmark vs full wordmark |
> | D23 | Hosting, TLS and DNS operational details | OPEN | Legal entity / brand consistency |
> | D24 | Umbrella analytics, cookies and consent | OPEN (primary classification **Deferrable**, U-002.2) | Product naming for RIC-1A / RIC-2 nodes |
> | D25 | Future content management / editorial workflow | OPEN (primary classification **Future**, U-002.2) | Production version control of brand assets |
>
> Consequences recorded by U-002.2: (a) **D25 and G1 do not overlap** under the authoritative numbering — D25 governs editorial workflow, G1 governs approved-SVG repository availability; **D25 is retained, not merged or removed**; (b) **D24 does not concern RIC-1A/RIC-2 products** and no authoritative document records a D24→D14 dependency; (c) subjects that appear only under this pack's labels (web product-name, Biashara Flow sub-brand treatment, wordmark, lockups, RIC-1A/RIC-2 naming, production asset control) are **not separately registered owner decisions** — no new IDs are created for them, and where genuinely needed they fall under the register's nearest subject (product naming/status wording → D21; brand-family/legal usage rules → D15; lockups/wordmark/clear-space → D16 and gaps G5/G6/G10; asset custody → gaps G1/G11). (d) The strings "RIC-1A"/"RIC-2" occur nowhere in the repository outside this pack and the U-002.x reports — if those are real future products, that is an unresolved matter for the owner, not a decision this task may invent.

| Decision | Owner | Current status | What must be decided | Outcome options |
|----------|-------|----------------|----------------------|-----------------|
| D14 | Owner | OPEN | Title/format for web product name vs umbrella | **Option A:** "CIVOLINK WIFI" as primary; **Option B:** "CIVOLINK" as primary; **Option C:** Co-brand placeholder to be confirmed later |
| D15 | Owner | OPEN | Sub-brand treatment for Biashara Flow | **Option A:** Fully branded sub-brand; **Option B:** Generic "Business" naming until redefined; **Option C:** Owner review before commit |
| D16 | Owner | PARTIALLY RESOLVED | Legal/positioning clarity for CIVOLINK vs CIVOLINK ENTERPRISES | **Option A:** Treat as one legal family; **Option B:** Split legal entity naming for compliance; **Option C:** Re-run due-diligence before choosing |
| D17 | Owner | OPEN | Logo usage rights and re-distribution | **Option A:** Owned logos only in repo; UI references via SVG; **Option B:** Vendor license ahead of production; **Option C:** Pause production branding until legal sign-off |
| D18 | Owner | OPEN | Tagline approval and usage rules | **Option A:** Approve "CONNECTING IDEAS · BUILDING SOLUTIONS"; **Option B:** Revise/track later; **Option C:** Defer to final brand guidelines |
| D19 | Owner | OPEN | Brand colours approval and variant usage | **Option A:** Approve navy/teal/cyan set; **Option B:** Revise one or more colours; **Option C:** Use palette but require final usage guide |
| D20 | Owner | OPEN | Logo horizontal/vertical lockups | **Option A:** Approve horizontal lockup only; **Option B:** Approve both; **Option C:** Provide rules on stacking |
| D21 | Owner | OPEN | Clear-space and minimum size rules | **Option A:** Approve provisional guide; **Option B:** Revise numbers; **Option C:** Table as product requirement |
| D22 | Owner | OPEN | Wordmark vs full wordmark | **Option A:** Approve primary full wordmark; **Option B:** Approve mark-only at small sizes; **Option C:** Add stance on wordmark in body text |
| D23 | Owner | OPEN | Legal entity / brand consistency | **Option A:** Single brand family; **Option B:** Two legal tracks with shared brand; **Option C:** Re-scope branding scope |
| D24 | Owner | OPEN | Product naming for RIC-1A / RIC-2 nodes | **Option A:** Use "CIVOLINK" umbrella; **Option B:** Use "Biashara Flow"; **Option C:** Use co-brand rules |
| D25 | Owner | OPEN | Production version control of brand assets | **Option A:** Vendor/repo asset workflow; **Option B:** Owner-controlled asset store; **Option C:** Chain-of-custody log for approved assets |

> **Note:** This matrix is a decision-support table. It does not itself make decisions. It is the output of the owner review, not the basis for implementation.

## 6. Individual Decision Explanations

### D14 — Web product-name decision

**Purpose:** Establish the correct primary product naming for web/UX surfaces.

**Current state:** D14 is OPEN.

**Options:**
- **Option A:** Use "CIVOLINK WIFI" as the primary public product name.
- **Option B:** Use "CIVOLINK" as the primary public product name.
- **Option C:** Use a placeholder and revisit after co-brand agreement.

**Impact:**
- Affects: README, project progress register, website copy, product help, documentation headers.
- Risk if wrong: Inconsistent naming across deliverables; perceived brand misalignment.

**Recommended next step:** Owner selects one option in the Owner Decisions Register.

### D15 — Sub-brand treatment for Biashara Flow

**Purpose:** Establish how the Biashara Flow sub-brand is to be presented on web and product surfaces.

**Current state:** D15 is OPEN.

**Options:**
- **Option A:** Use "Biashara Flow" as a fully branded sub-brand.
- **Option B:** Use generic "Business" naming until redefined.
- **Option C:** Defer to owner review before commit.

**Impact:**
- Affects: README, project progress register, website copy, product help, documentation headers, asset naming.
- Risk if wrong: Sub-brand either over-claimed (confusing trademark/entity scope) or under-defined (lost positioning clarity).

**Recommended next step:** Owner selects one option in the Owner Decisions Register.

### D16 — Legal/positioning clarity: CIVOLINK vs CIVOLINK ENTERPRISES

**Purpose:** Define the legal/positioning relationship between the public brand "CIVOLINK" and the registered entity "CIVOLINK ENTERPRISES".

**Current state:** D16 is PARTIALLY RESOLVED. The distinction and baseline registration information (BN-55SLLRED, registered business name, active internal reference) are documented in `docs/CIVOLINK_BRAND_GUIDELINES.md`.

**Options:**
- **Option A:** Treat as one legal family (brand + registered entity used coherently).
- **Option B:** Split legal entity naming for compliance (separate brand statutes and entity references).
- **Option C:** Re-run due-diligence before choosing.

**Impact:**
- Affects: legal/privacy pages, footer/certificate disclosures, trademark references, partner and vendor documentation.
- Risk if wrong: Compliance exposure, inconsistent legal-entity references in production copy.

**Recommended next step:** Owner confirms the legal-family model; separately assess trademark/domain availability outside this pack.

### D17 — Logo usage rights and re-distribution

**Purpose:** Determine how approved logos may be stored, rendered, and distributed in the repository and downstream production.

**Current state:** D17 is OPEN. SVG family is externally verified and identical byte-for-byte across two owners; no distribution or usage rights have been granted to this repository.

**Options:**
- **Option A:** Owned logos only in repo; UI references via SVG.
- **Option B:** Vendor license ahead of production.
- **Option C:** Pause production branding until legal sign-off.

**Impact:**
- Affects: asset management, CI/CD import of logo assets, UI canvas rendering, third-party redistribution risk.
- Risk if wrong: Unlicensed redistribution, production reuse of assets without rights.

**Recommended next step:** Officer selects a rights model in the Owner Decisions Register.

### D18 — Tagline approval and usage rules

**Purpose:** Authorize the official tagline and its usage constraints across web surfaces.

**Current state:** D18 is OPEN. The approved tagline CONNECTING IDEAS · BUILDING SOLUTIONS is documented in `docs/CIVOLINK_BRAND_GUIDELINES.md` as owner-approved, but production usage rules are not yet finalized.

**Options:**
- **Option A:** Approve "CONNECTING IDEAS · BUILDING SOLUTIONS".
- **Option B:** Revise/track later.
- **Option C:** Defer to final brand guidelines.

**Impact:**
- Affects: homepage hero, product pages, footer, social profiles, business documents, tagline usage rules.
- Risk if wrong: Unauthorized re-punctuation/abbreviation; losing the canonical approved wording.

**Recommended next step:** Owner selects **Option A** (approve) or an amendment, and records the decision in the Owner Decisions Register.

### D19 — Brand-colour approval and variant usage

**Purpose:** Authorize the approved palette and define how each colour may be used in UI, print, and digital contexts.

**Current state:** D19 is OPEN. The approved palette (Navy #102A43, Teal #00A6A6, Cyan #18C3C8, Graphite #263238, Cloud #F4F7F8, White #FFFFFF) is recorded in `docs/CIVOLINK_BRAND_GUIDELINES.md` §9, but variant and usage guidance is not yet finalized.

**Options:**
- **Option A:** Approve navy/teal/cyan set.
- **Option B:** Revise one or more colours.
- **Option C:** Use palette but require final usage guide.

**Impact:**
- Affects: stylesheets, UI components, marketing material, accessibility contrast, product accents.
- Risk if wrong: Colour drift, inconsistent brand expression, accessibility failures.

**Recommended next step:** Owner selects an approval path or amendment, and guidance is added to the brand guidelines before production styling begins.

### D20 — Logo horizontal/vertical lockups

**Purpose:** Determine which lockup orientations are approved for production use.

**Current state:** D20 is OPEN. SVG family and PNG crops exist, but the permitted lockup rules (horizontal only, both orientations, or stacking rules) are not yet owner-approved.

**Options:**
- **Option A:** Approve horizontal lockup only.
- **Option B:** Approve both.
- **Option C:** Provide rules on stacking.

**Impact:**
- Affects: website layout, product packaging, signage, social media, document headers.
- Risk if wrong: Wrong lockup applied in production; vertical/horizontal mismatch causing visual inconsistency.

**Recommended next step:** Owner selects a lockup policy in the Owner Decisions Register.

### D21 — Clear-space and minimum size rules

**Purpose:** Establish and approve the governing clear-space and minimum logo-size constraints.

**Current state:** D21 is OPEN. Provisional clear-space and minimum-size guidance exists, but no approved numbers exist.

**Options:**
- **Option A:** Approve provisional guide.
- **Option B:** Revise numbers.
- **Option C:** Table as product requirement.

**Impact:**
- Affects: UI spacing, responsive layouts, print, signage, digital assets, accessibility/padding safety.
- Risk if wrong: Logo touching adjacent elements, shrunk to unusable size, inconsistent negative space.

**Recommended next step:** Owner selects an approval path; approved numbers are recorded in the brand guidelines before production use.

### D22 — Wordmark vs full wordmark

**Purpose:** Decide how the logo may be rendered as a wordmark in body text, headings, and standalone contexts.

**Current state:** D22 is OPEN. The SVG family includes full wordmark and mark-only variants, but no owner-approved wordmark-in-body-text stance exists.

**Options:**
- **Option A:** Approve primary full wordmark.
- **Option B:** Approve mark-only at small sizes.
- **Option C:** Add stance on wordmark in body text.

**Impact:**
- Affects: typography rules, body-copy treatment, headings, small component labels, accessibility.
- Risk if wrong: Over-using the full wordmark where a mark-only lockup or wordmark is appropriate; legibility/quality issues.

**Recommended next step:** Owner selects the wordmark policy in the Owner Decisions Register.

### D23 — Legal entity / brand consistency

**Purpose:** Confirm the legal-entity and brand-consistency stance across the umbrella platform and future products.

**Current state:** D23 is OPEN. Brand guidelines document the registered name ("CIVOLINK ENTERPRISES", BN-55SLLRED) and the public brand ("CIVOLINK"), but a final owner stance on single vs two-track consistency is pending.

**Options:**
- **Option A:** Single brand family.
- **Option B:** Two legal tracks with shared brand.
- **Option C:** Re-scope branding scope.

**Impact:**
- Affects: every document, website, product, and governance artifact that names the brand or the entity.
- Risk if wrong: Legal-entity mismatch, inconsistent naming, compliance exposure.

**Recommended next step:** Owner confirms a single, documentable stance and records it in the Owner Decisions Register.

### D24 — Product naming for RIC-1A / RIC-2 nodes

**Purpose:** Set the naming convention for RIC-1A and RIC-2 nodes on product and documentation surfaces.

**Current state:** D24 is OPEN. No approved naming convention exists for these nodes.

**Options:**
- **Option A:** Use "CIVOLINK" umbrella naming.
- **Option B:** Use "Biashara Flow" naming.
- **Option C:** Use co-brand rules derived from D15.

**Impact:**
- Affects: product labels, documentation headings, admin/portal copy, node identifiers.
- Risk if wrong: Conflicting product identifiers and unclear ownership across nodes.

**Recommended next step:** Owner selects a naming convention in the Owner Decisions Register.

### D25 — Production version control of brand assets

**Purpose:** Determine how approved brand assets are managed, verified, and promoted from the repo into production.

**Current state:** D25 is OPEN. The approved SVG family is verified and externally stored, but production version control of assets has not been decided.

**Options:**
- **Option A:** Vendor/repo asset workflow.
- **Option B:** Owner-controlled asset store.
- **Option C:** Chain-of-custody log for approved assets.

**Impact:**
- Affects: asset import in CI/CD, checksum verification, provenance records, production rollout of logos.
- Risk if wrong: Unmanaged asset promotion, missing provenance, unauthorized substitution.

**Recommended next step:** Officer selects an asset-control model and records it in the Owner Decisions Register.

## 7. Legal and Business Identity Readiness

**Legal family:** CIOLINK / CIVOLINK ENTERPRISES  
**Disclosure rules:** Document rules 1–11 for brand/legal positioning  
**Preparedness statement:**
- Legal entity hierarchy: `pending owner confirmation`
- Brand specificity: `owner decision required`
- Position statements: `not yet signed off`

| Item | Status | Evidence |
|------|--------|----------|
| Legal entity model | Pending owner confirmation | `docs/OWNER_DECISIONS_REGISTER.md` |
| Brand rules / disclosure | Partial documentation | `docs/CIVOLINK_BRAND_GUIDELINES.md` |
| Trademark / domain availability | Out of scope for this pack | Requires separate trademark and domain research |

> **Stop condition:** Do not proceed to U-002 production branding until at least D14, D18, D19, D20, D21, D22, D23, and D25 are resolved.

## 8. Website Content and Sitemap Readiness

This is a cover list. It assumes standard CMS/product pages. It should be re-checked against the actual target website spec before U-002 implementation.

| Page/area | Content status | Brand status | Owner action |
|-----------|----------------|--------------|------|
| Homepage | Placeholders only | Pending brand resolution | Owner branding decision |
| About | Placeholders only | Pending brand resolution | Owner branding decision |
| Services/Products | Partial | Pending brand resolution | Owner branding decision |
| Contact | Basic contact form | Pending brand resolution | No blocker |
| Legal/Privacy | Basic legal | Pending brand resolution | No blocker |
| Brand page (if any) | Empty | Pending brand resolution | Owner decision |

## 9. Technology, Domain, Hosting Decisions

| Decision | Status | Owner action |
|----------|--------|--------------|
| Domain name | Not decided | Owner to confirm |
| Hosting/VPS | Not decided | Owner to confirm |
| CMS/installation | Not decided | Not a blocker for brand decision pack |
| Product integrations | Not required for U-002 | N/A |

## 10. Decision Dependencies

```text
D14 ──> D18
D14 ──> D19
D18 ──> D19
D17 ──> D25
D21 ──> D20
D23 ──> D16
D24 ──> D14
```

Explanation:
- Some decisions are independent.
- Some are linked by presentation order.
- Some are blockers for production branding.

Recommendation — an owner decision sequence:

1. **D14** — Product naming
2. **D15** — Biashara Flow treatment
3. **D23** — Legal entity / brand family
4. **D16** — CIVOLINK / CIVOLINK ENTERPRISES clarity
5. **D17** — Logo usage rights
6. **D25** — Production asset control
7. **D18** — Tagline
8. **D19** — Brand colours
9. **D20** — Lockups
10. **D21** — Clear-space/minimum size
11. **D22** — Wordmark
12. **D24** — RIC-1A/RIC-2 naming

Prioritise time-critical, high-visibility decisions first (D14, D16, D18) because they appear immediately in README, documentation, and product copy.

## 11. Recommended Owner Decision Sequence

| Order | Decision | Reason |
|-------|----------|--------|
| 1 | D14 | Determines primary product name used everywhere |
| 2 | D15 | Determines sub-brand treatment |
| 3 | D23 | Ensures legal/brand consistency |
| 4 | D16 | Resolves legal/brand family conflicts |
| 5 | D17 | Confirms logo usage rights |
| 6 | D25 | Sets production asset control |
| 7 | D18 | Authorises tagline |
| 8 | D19 | Authorises colour palette |
| 9 | D20 | Authorises lockups |
| 10 | D21 | Authorises clear-space/minimum size |
| 11 | D22 | Authorises wordmark usage |
| 12 | D24 | Confirms RIC-1A/RIC-2 naming |

## 12. U-002 Entry Requirements

**Correction (2026-11-11, U-002.2 audit):** the previous version of this section listed a ten-decision blanket minimum using this pack's divergent D-labels and stated that U-002 "must remain **on hold**" if any of them were unresolved. That contradicted the decision authority — `docs/OWNER_DECISIONS_REGISTER.md`, `docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md` §13 and `docs/IMPLEMENTATION_ROADMAP.md` §U.1 all record U-002 entry as **six** answered decisions. The blanket wording is replaced below. No decision status is changed, and no entry/exit criterion of any phase is weakened.

**Phase entry (authoritative — identical in architecture §13 and roadmap §U.1):**

U-002 may begin when **D14, D15, D18, D19, D20 and D21** are answered.

**Activity-specific gates (an unresolved decision blocks only the activity that actually depends on it):**

| Activity | Decision(s) / gap that gate it | May the activity proceed beforehand? |
|---|---|---|
| Sitemap and page-inventory drafting | D20 confirms the final page set | Yes — draft against the architecture §8.1 proposed launch set, labelled `PROPOSED` |
| General page-copy drafting (home, about) | D14 wording, D15 voice | Yes — material stays draft; nothing is published |
| Product/service description drafting | D21 status claims | Yes — with explicit provisional status labels only |
| Contact page drafting | D19 channels, D18 address | Yes — placeholders retained; no form goes live |
| Privacy / terms drafting | D18, D19; gap G2 (certificate) | Yes — draft with unresolved-particulars labels; publication separately gated |
| Architecture-neutral technical planning | D22, D23 | Yes — planning documents only; no purchase, DNS or deployment |
| Security and operational planning | D23 (planning only) | Yes |
| Identity-detail publication (name, number, addresses) | G2 certificate verification; rules 8–11 | **No** — verification/owner approval required first |
| Contact form go-live | D19 + published privacy policy | **No** |
| "Live" / pilot / availability status claims | D21 | **No** |
| Production logo asset adoption or production-scale logo usage | D16 residual (G1, G5, G6) and G10 | **No** — provisional artwork may continue to be used in drafts |
| Domain registration, DNS change, VPS purchase, deployment | D17, D23 + separate owner authorization | **No** |
| CMS installation | D25 (+ §D13 standing constraints) | **No** |
| Git commit or push | repository control (not a decision) | **No** |

Genuine remaining gates before U-002 **phase exit** (approved copy pack for every launch page, identity verified against the certificate, registered-identity blocks written, privacy + terms drafted, contact-channel list final, product claims matched to reality) are unchanged and are defined by the architecture §13 exit criteria.

## 13. Outstanding Evidence

| Evidence | Needed for | Owner action |
|----------|------------|--------------|
| Logo source copy in repo | G1 | Owner approval to add assets |
| Clear-space guidance | G5 | Owner sign-off |
| Minimum size guidance | G6 | Owner sign-off |
| Product lockups | G10 | Owner decision |
| Trademark check | D16/D23 | Separate legal review |
| Domain confirmation | Technology | Owner confirmation |

## 14. Explicit Exclusions and Stop Conditions

**Correction (2026-11-11, U-002.2 audit):** the previous version of this section opened with the blanket item "No website development" and a stop condition naming eight decisions at once. Blanket wording of that kind is exactly the project-wide blocker U-002.1 identified (report §3), yet U-002.1's claimed split of this section was not present in the file (U-002.1 addendum item 1/6). The section is split below into **persistent controls** (never authorized by this document, independent of any decision) and **activity-specific gates** (each decision blocks only the activity that depends on it). No control is removed and no decision status is changed.

**Persistent controls — never authorized by this document (independent of any decision):**

- No git commit or push.
- No domain registration or DNS change.
- No VPS purchase, configuration or deployment.
- No payment or webhook changes; no MikroTik or CIVOLINK WIFI production changes.
- No CMS installation (D25 governs whether a CMS is ever adopted; the §D13 standing constraints apply regardless).
- No production logo replacement, redesign or vectorization — the owner has deferred logo refinement; provisional artwork stays as-is.
- No publication of unverified legal particulars, unapproved registered/postal addresses, or unsupported product claims.
- No external service activation; no financial or legal commitment.

**Activity-specific gates — each decision or gap blocks only its own activity:**

| If unresolved | Blocks | Does NOT block |
|---|---|---|
| D14 (wording residual) | Publication of approved positioning copy | Drafting; unrelated page work |
| D15 (voice residual) | Final voice/tone sign-off | Drafting with the approved tagline |
| D16 (G1, G5, G6, G10) | Production logo asset adoption; production-scale logo usage | Drafting with provisional artwork; use of the approved palette |
| D17 | Domain registration, DNS change, launch date | All content, sitemap and planning work |
| D18 | Publishing an address anywhere | Contact/legal page drafting with placeholders |
| D19 | Contact channels in copy; form go-live; finalizing the privacy policy | Contact page drafting; privacy policy drafting |
| D20 | Final page-set confirmation | Drafting against the §8.1 proposed launch set |
| D21 | "Live" / pilot / availability claims | Product copy with provisional status labels |
| D22 | Build-stack and hosting-topology confirmation | Architecture-neutral planning documents |
| D23 | Hosting/TLS/DNS choices; any deployment | Hosting comparison and runbook drafting |
| D24 | Enabling any analytics or non-essential cookies | Launch itself (default = no analytics, no non-essential cookies) |
| D25 | Introducing a CMS / editorial workflow | Static-site operation and all launch work |
| G2 (certificate verification) | Publishing identity particulars | Drafting legal/privacy pages with unresolved-particulars labels |

**Stop condition (corrected):** do not *publish, deploy, register, purchase or commit* on the strength of an unanswered decision. Preparation and drafting may continue under the defaults recorded in `docs/OWNER_DECISIONS_REGISTER.md`. If a proposed correction would conflict with an existing owner decision, the owner's decision is preserved and the conflict is documented instead.

## Completion Status

**Task:** U-002 Owner Decision Review Pack (D14–D25)

**Owner decision register:** `docs/OWNER_DECISIONS_REGISTER.md`

**Brand governance document:** `docs/CIVOLINK_BRAND_GUIDELINES.md`

**Authorised actions:** None for production implementation.

**Recommended next step:** Owner reviews D14–D25 and confirms resolve status in the Owner Decisions Register.
