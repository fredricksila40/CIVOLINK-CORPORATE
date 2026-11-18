# CIVOLINK — Owner Decision Request Pack

- **Milestone origin:** U-003.2 master plan §10 immediate next task 4 and §11
- **Date:** 2026-11-12
- **Status: REQUEST PACK DELIVERED — no decision status changed; the Owner Decisions Register remains authoritative.**
- **Purpose:** one consolidated, answer-ready list of everything the owner
  needs to supply or decide so the U-003.2 roadmap can keep moving. Each item
  says what is needed, why, and what it unblocks. Answer in any order; nothing
  outside the listed effects changes.

---

## A. Evidence the owner (or operator) must supply

| # | Request | Decision | Why needed | Unblocks |
|---|---|---|---|---|
| A1 | Official PayHero API contract details: endpoint list, authentication method, STK-push request/response schema, callback signature (header name, encoding, payload), amount representation, status literals, retry semantics | **D6** (BLOCKED) | Code exists and is locally tested but cannot be verified or enabled against the real provider | WIFI payment verification (B1), flags stay `false` until then |
| A2 | Confirmation of the PayHero channel ID for this merchant account (recorded discrepancy: matrix `133` vs earlier config `4419`) | D6 | Wrong channel = payments routed/attributed incorrectly | Same as A1 |
| A3 | Sight of the business registration certificate (or current official record) so registration particulars can be verified before publication | Rule 11 / G2 | Identity blocks are owner-supplied and must be verified before any publication | Website identity blocks, BN-55SLLRED disclosure |
| A4 | Authorization for router-side and local-loop verification work on the MikroTik hAP lite (API-SSL test, CA deployment, test-user provisioning) | **D12** / roadmap L2 | Router chain is implemented but never verified; cannot proceed without access | WIFI B5/B6 verification steps |
| A5 | Biashara Flow: authorization for that project's session to commit/push its working tree and operate externally | Owner instruction (external project) | ~95 files incl. all deploy infra are uncommitted; work is at risk | Biashara Phase 3 (see `CIVOLINK_BIASHARA_FLOW_RELEASE_ENGINEERING_TASK_BRIEF.md`) |

## B. Decisions to answer (with recommended answers from U-003.2 §11)

| # | Decision | Question for the owner | Recommended answer | Effect of answering |
|---|---|---|---|---|
| B1 | **D14** | Approve the About page wording (mission/vision/values) as drafted, or supply preferred wording | Approve as-is, or provide final wording | Website About content locks |
| B2 | **D19** | Which public contact channels (email/phone/WhatsApp/social) and support hours may be published — and is the privacy-first form data handling approved? | Supply approved channels; approve data handling only together with the published privacy policy | Real contact page + form go-live decision |
| B3 | **D20** | Confirm the six-page set and filenames, and add `/privacy` + `/terms` to the launch set (recommended) | Confirm as proposed | Sitemap freezes; production build scope locks |
| B4 | **D21** | May Biashara Flow be publicly listed by name as "In Development" on the website? | Confirm (reversible prototype treatment already in place) | Removes reversibility caveat |
| B5 | **D22** | Confirm stack/topology: hand-authored static site on the shared VPS with strict per-product isolation | Confirm | Deployment design locks |
| B6 | **D23** | Choose TLS authority (recommended: Let's Encrypt) and DNS host; confirm who holds access | Choose | HTTPS + DNS setup can be scheduled |
| B7 | **D17** | Authorize acquisition of `civolink.com` + planned subdomains | Authorize when ready | Public hosting becomes possible |
| B8 | **D3** | Trial access: retain or remove? | Recommend remove initially (abuse risk X15) | Removes X15 test scope; decides voucher/offline-tool conditionality |
| B9 | **D1/D2** | Final weekly price (150/200) and daily duration (12/24h) — note `plans.php` currently uses Weekly 150 / Daily 40/24h | Confirm `plans.php` values or amend | Locks pricing before controlled live test |
| B10 | **D4/D5/D7/D10** | Device binding, credential release, rate-limit matrix, data retention — confirm as implemented/documented | Confirm | WIFI launch parameters lock |
| B11 | **D8** | VPS provider/OS (hosting approved in principle) — choose provider and OS (e.g. Ubuntu 24.04 LTS) | Choose | Concrete provisioning scripts |
| B12 | **D9** | Monitoring: alert recipient, cadence, thresholds | Owner email; immediate failure alerts + daily digest | Monitoring go-live in Phase 4 |
| B13 | **D11** | After verifying the old Cloudflare tunnel is no longer needed, revoke/rotate the stored credential | Revoke after status check | Closes a security loose end |
| B14 | **D16 residual / G1** | Authorize copying the eight approved SVG assets into this repository (checksum verification against guidelines §11.2) | Authorize copy-in | Production logo/favicon adoption |
| B15 | **D24/D25** | Analytics and CMS: keep the defaults (none / static files)? | Keep defaults | Nothing to build; simplest compliance |

## C. What continues without any answer

Per the roadmap's activity-specific gating, the following continue now:
website page polish and drafting, WIFI portal token-handoff work and all
non-payment implementation, reconciliation and dashboard development, local
test-suite maintenance, Biashara Flow release engineering (task 1–9 of its
brief are code/infra tasks that need no new decision), monitoring setup, and
documentation.

Answers only gate: publication, deployment, live payments, router work and
domain actions — exactly as recorded in the register.

**End of request pack.**
