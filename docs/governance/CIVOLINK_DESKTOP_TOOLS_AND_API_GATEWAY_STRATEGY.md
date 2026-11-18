# CIVOLINK Desktop Tools and API Gateway Strategy

- **Milestone:** U-003.2 (companion deliverable B)
- **Date:** 2026-11-12
- **Type:** Strategy/evaluation document. No desktop application, gateway, integration service or new authentication system is implemented by this milestone.
- **Companion to:** `docs/CIVOLINK_ECOSYSTEM_COMPLETION_AND_GO_LIVE_PLAN.md`

---

## Part I — Desktop-installable tools evaluation

### 1. Ground rules applied

- No desktop app is justified by "it would be nice" — each candidate must name
  a **real workflow** that existing or planned web/CLI tooling cannot serve,
  especially an **offline/local** requirement.
- Existing web application/PWA is the default answer; native shell is the
  exception.
- Avoid duplicating functionality the web dashboards (Phase 2 WIFI dashboard,
  Biashara SQLAdmin) will already provide.
- Technology selection compares real requirements, not fashion.

### 2. Candidate evaluation

| # | Candidate | Intended user | Problem solved | Essential functions | Web sufficient? | Online/offline | Local data | Security | Maintenance | Integration | Recommended technology | Verdict |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | CIVOLINK owner administration console | Owner | One place to see business state | Cross-product status view, approvals | Yes — a single authenticated web dashboard (or even bookmarks per product) serves this | Online (business ops are online) | None | Would need its own auth → new attack surface for zero gain | Another app to patch | Would require exactly the cross-product integrations the ecosystem deliberately avoids | Web page / dashboard | **Not needed** |
| 2 | WIFI operator management/provisioning tool | Owner/operator | Operate hotspot day-to-day | Subscribers, manual provisioning, vouchers, retry | A web admin dashboard is planned (Phase 2 B8) and is sufficient | Online required (it drives a live router) | None | Web auth + session; desktop adds nothing | Duplicated if native | Same RouterOS API as backend | Web dashboard first | **Deferred** — revisit only after Phase 2 dashboard operation shows a field gap |
| 3 | Router monitoring/diagnostics utility | Owner/operator | Router health visibility | Signal, uptime, DHCP leases, errors | RouterOS own tooling + VPS-side checks are sufficient; monitor from the VPS, not a desktop | Online | Small cached metrics at most | Router credentials on a desktop = new secret-surface risk | Script upkeep | RouterOS API-SSL (already isolated over WireGuard) | Python scripts (EDMOLT precedent) run on the VPS | **Not needed as a desktop app** |
| 4 | Offline voucher / customer-management utility | Operator | Sell/manage vouchers when internet is down | Generate/print vouchers, record sales | Only meaningful if an offline sales workflow actually exists | **Offline** — the only genuine desktop justification pattern | Local store + sync | Local data at rest; sync conflict rules; licensing | Moderate | Must reconcile with backend DB | Tauri (small binary, system webview) or Python/Tkinter packaged with PyInstaller | **Conditional** — depends on D3 (trial/voucher policy) and observed demand; do not build preemptively |
| 5 | Biashara Flow desktop companion | Enterprise users | — | — | The web app **is** the product; no offline workflow found in the repository evidence | Online | None | — | — | — | — | **Not needed** |
| 6 | Internal deployment/backup/support utilities | Owner | Repeatable ops | Deploy, backup, restore, diagnostics | These are scripts, not apps | Online | Config files | Secrets handling discipline | Low | Per-product APIs/SSH | Python/PowerShell scripts under version control | **As scripts** (already the EDMOLT pattern) |

### 3. Technology comparison (for the one conditional candidate)

| Option | Assessment |
|---|---|
| Existing web/PWA | First choice for anything online-capable; offline voucher tool could even be a PWA with IndexedDB if the workflow is thin |
| **Electron** | Rejected for these tools: ships a full Chromium runtime (~100+ MB) and a Node runtime for what is forms-and-tables work; heaviest update/maintenance burden; no requirement here needs a bundled browser |
| **Tauri** | Best fit for a small Windows utility with a native feel: tiny binary, system WebView2, Rust core; requires Rust toolchain maintenance |
| **.NET (WPF/WinForms/MAUI)** | Strong Windows-native option; sensible only if the team standardizes on C#; heavier installers than Tauri |
| **Python desktop (Tkinter/PySide + PyInstaller)** | Matches the demonstrated in-house skill pattern (EDMOLT tooling, Biashara FastAPI); fastest path for a small internal utility; larger binaries, slower UI |

**Decision rule recorded for Phase 5:** a candidate may proceed to build only
when its sponsor can (a) name the concrete offline/local workflow, (b) show
the web alternative fails it, and (c) state the data-sync and security
design. Preference order: PWA → Tauri → Python/PyInstaller → .NET. Electron
requires an explicit exception.

### 4. Bottom line

**Build no desktop application in the current roadmap.** Keep the slot open
for exactly one conditional tool (offline voucher/customer utility, #4)
pending D3 and operating evidence.

---

## Part II — API gateway and integration architecture

### 5. Definitions kept strict

| Term | Meaning (used in this document) |
|---|---|
| **API gateway** | A controlled entry point enforcing authentication, rate limits, quotas and policy across multiple backing APIs |
| **Integration services** | Specific services exchanging data/coordinates workflows between independent products |
| **Reverse proxy** | Infrastructure-level routing/TLS/headers for web apps (Nginx role) |
| **Shared identity** | A common sign-in across products — a *separate future architecture decision*, never an automatic consequence of a gateway |

### 6. Actual integration needs between components (evidence-based)

| Pair | Integration needed today? | Evidence |
|---|---|---|
| Corporate website ↔ WIFI | **No** | Website is static; only "planned domain" text; architecture forbids the site holding product data |
| Corporate website ↔ Biashara Flow | **No** | Same — independent presentation only |
| WIFI ↔ Biashara Flow | **No** | No shared customer, workflow or data requirement exists in any record |
| WIFI ↔ PayHero | Provider integration **inside** WIFI (correct place) | `backend/pay.php`/`webhook.php` |
| Biashara ↔ M-Pesa Daraja/Pesapal | Provider integrations **inside** Biashara (correct place) | `services/payment.py` |
| Future portals/dashboards ↔ products | Not yet; when built, each portal belongs to its product and talks to that product's own API | UI reference pack design note |
| Administrative tools ↔ products | Operator tools use each product's own authenticated API/CLI; no cross-product layer needed | §Part I |
| Future "central accounts" | Future **shared identity** concept — already labelled FUTURE CONCEPT on the platforms page; requires its own owner decision and design; do not conflate with a gateway | Umbrella prototype platforms page |

### 7. Ruling

**No API gateway now, and none in Phase 4.** Justification:

1. With zero cross-product integrations, a gateway would be a single point of
   failure and a security surface enforcing policies that have nothing to
   enforce.
2. Each product already integrates its own providers behind its own
   authentication and rate limits (WIFI: per-phone rate limiting, HMAC
   webhooks; Biashara: webhook HMAC, nginx rate limiting).
3. The independence principle (§D13, umbrella architecture) is an explicit
   project control: failure of one product must not affect another. A
   mandatory shared entry point works against that.

### 8. What replaces the gateway today

**Nginx reverse proxy on the shared VPS** (Workstream F plan): TLS
termination, per-product routing (`civolink.com` static; `wifi.civolink.com`
→ PHP backend; `biashara.civolink.com` → uvicorn container), global security
headers, per-product rate limits at the proxy if needed. This is
infrastructure routing, **not** a gateway: no shared auth, no shared policy
plane, products remain independently operable if the proxy is bypassed
locally.

### 9. If integration becomes real later (design rules pre-committed)

Any future integration must be:

- **Explicit and versioned** — a documented API contract with version prefix
  (e.g. `/v1/`), deprecation policy.
- **Least privilege** — service accounts scoped to the exact operations;
  no database-level sharing ever.
- **Failure-isolated** — consumer degrades gracefully when the provider is
  down; timeouts/retries bounded; no synchronous cross-product path in a
  customer journey.
- **Audited** — request logging with correlation IDs on both sides.
- **Explicitly authorized** — a new owner decision per integration (the
  register is the gate, not the codebase).

Only when at least two products need cross-calling with per-consumer quotas,
key rotation and policy enforcement does dedicated gateway software (or a
small purpose-built service) become worth its cost — and that decision gets
re-assessed with evidence at that time.

### 10. Things explicitly NOT to build (standing prohibitions)

- A shared/central database across products.
- A shared privileged authentication layer or SSO bundled into a gateway.
- A gateway "because multiple products exist".
- Any integration without a named user, workflow and owner decision.

**End of strategy document.**
