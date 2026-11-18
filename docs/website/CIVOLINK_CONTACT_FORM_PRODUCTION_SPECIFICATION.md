# CIVOLINK Corporate Website — Contact Form Production Specification
Task ID: U-003.3 (completed by T-026)
Date: 2026-11-12
Status: COMPLETED — SPECIFICATION ONLY

- **Authority inputs:** `docs/CIVOLINK_UMBRELLA_PRODUCTION_ARCHITECTURE.md` §10.2 (legal artifacts + form requirements), §11.1 (PHP-FPM pool), §11.3 (isolation); `docs/CIVOLINK_U002_3_CORPORATE_WEBSITE_CONTENT.md` §11.3 (field draft + go-live requirements); U-003.0 prototype `contact.html` + `assets/js/main.js` (current inert form); owner decision **D19** (OPEN — the substance of channels, hours and data handling).
- **Class:** Specification/preparation. **The form does not go live under this specification.** No endpoint is built, no mail is sent, nothing is deployed. Activation is gated by D19 + published `/privacy` + `/terms` + this spec's controls.
- **Provenance note:** re-authored in full by **T-026**; the parallel U-003.3 write did not survive its truncation window. No decision status changed.

## 1. Current state (verified)

`contact.html` ships the form as an **explicitly inert prototype**: `data-prototype-form`, local validation only, submit always prevented, a status message states nothing was sent (main.js:89–117, DOM-API rendering, no `innerHTML`, no storage, no transmission). The page carries the `[PLACEHOLDER — D19]` channel set and the `[NOT PUBLISHED]` address rows. **This state is correct and stays until every go-live requirement is met** (content §11.3: the demonstration form must never ship as-is — it is replaced by the real endpoint or removed; until then it renders as the honest prototype it is).

## 2. Endpoint architecture (at build, after D19)

| Layer | Specification |
|---|---|
| Runtime | PHP-FPM **separate pool + separate system user** (architecture §11.3, binding) — never the WIFI backend's pool |
| Files | One endpoint script + config outside or locked-down inside the web root; no WIFI code reachable from it |
| Transport | Mail delivery via the D19-approved route: local MTA or authenticated SMTP; credentials in environment/config **outside the web root**, never committed |
| Database | **None.** Messages are forwarded to the destination and not persisted by default; if the owner wants an archive, that is its own decision with its own retention policy (D19) |
| Logs | Endpoint error log only; **no message content, no sender email in logs** (PII-free logging) |
| Recipient | The D19-confirmed destination — never invented, never a guess |

## 3. Form contract (fields fixed by the content package §11.3)

`name` (required), `email` (required, used only to reply), `route` (required: general | partnership | technical), `message` (required, ≥10 chars). Submit label `Send message`. A privacy notice adjacent to Submit links to `/privacy` — which must exist before activation. No hidden marketing-consent checkbox may appear unless the owner adds and documents it.

## 4. Server-side controls (all mandatory before activation)

| Control | Requirement |
|---|---|
| Server-side validation | Mirror the prototype rules exactly (required fields, email pattern, message ≥10 chars) + server-side length caps (e.g. name ≤100, email ≤254, message ≤5000) |
| CSRF | Per-session single-use token on the form; verified server-side |
| Rate limiting | Per-IP and per-form token bucket (modest defaults, tuned at build); enforced before any mail is generated |
| Spam protection | Honeypot field + time-to-submit check; optional lightweight text heuristics; **no third-party captcha service** (external requests prohibition) unless the owner explicitly approves one |
| Output handling | Message content is inserted into the mail body **as plain text** (no HTML rendering of user input); header values (`From`, `Reply-To`) built from validated fields only; recipient fixed in config, never from user input (header-injection defence) |
| Error responses | Generic, no stack traces, no path disclosure; details to the endpoint log |
| Success handling | Real send verified server-side before any success message; **never a client-side-only "success"** (architecture §10.2) |
| File uploads | **None.** The form has no file field; any future upload feature is a separate decision and security review |

## 5. Data handling (the D19 substance — none of it is invented here)

The privacy policy (drafted separately, `docs/website-legal/PRIVACY_POLICY_DRAFT.md`) must state, before activation:
- what is collected (name, email, route, message, and nothing else);
- why (replying to the enquiry);
- the legal basis under the Kenya Data Protection Act, 2019 (confirmed by legal review);
- the retention period (**owner-defined at D19** — no period may be assumed);
- who processes/receives the messages (D19 destination);
- the contact point for data-subject requests (D19 channel);
- that no analytics, no marketing lists and no cookies are involved (D24 default: none).

**No submission is possible until `/privacy` and `/terms` are published and match this data handling.**

## 6. Acceptance criteria (before the form ever goes live)

1. D19 answered: channels, hours, data handling, retention period, destination.
2. `/privacy` + `/terms` published (owner-approved, legally reviewed).
3. §4 controls implemented and exercised in a controlled test (valid send, invalid input, rate-limit trip, spam-honeypot trip) with recorded evidence.
4. Endpoint pool/user isolation verified; no WIFI code reachable; secrets outside the web root.
5. Logs contain no message PII.
6. U-004 independent verification passes the endpoint checks.

## 7. Standing prohibitions

No live form in the prototype phase; no third-party form/captcha/spam services; no marketing use of addresses; no shared pool/logs/credentials with CIVOLINK WIFI; no retention period invented; no activation without the full §6 chain.

---

**End of contact-form production specification (U-003.3 / T-026).**
