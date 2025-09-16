# Create PRD (lean v3)

Purpose: Deliver a PRD clear enough for a junior developer while steering architecture and sustainability with minimal ceremony.

Write for a junior teammate. Be explicit, avoid jargon, and prefer examples. Mark unused sections with `n/a` instead of deleting them.

---

## Clarifying Questions

Ask only what removes ambiguity. Capture answers inline in the PRD.

Example prompts:

- Users & roles — Who benefits? Any access differences?
- Scope — What’s in vs out for this iteration?
- Success — Observable outcomes, metrics, KPIs?
- Constraints — Performance, privacy, compliance, budget, timeline?
- Dependencies — Required integrations, shared modules, external services?

---

## PRD Sections (baseline)

- **Context** — Why we’re doing this; brief background.
- **Goals** — Desired user/business outcomes.
- **Non-Goals** — Explicit exclusions for this iteration.
- **User Stories / Scenarios** — “As a {{role}}, I want {{capability}} so {{benefit}}.”
- **Acceptance Criteria** — Testable conditions, including edge cases.
- **UX Notes** — Key interactions, states, accessibility expectations.
- **Risks & Assumptions** — Unknowns, external dependencies, fallback plans.
- **Telemetry & KPIs** — Events, metrics, and success measurements.
- **Open Questions** — Outstanding unknowns that need a human decision.

Keep each section concise and specific. Use bullet lists or tables when clearer.

---

## Reference Architecture (lean)

Choose an approach (Hexagonal, Clean, Feature-sliced, etc.) and state why it fits.

Document:

- Module boundaries and allowed dependencies.
- Expected data/call flows (3–5 bullets).
- Where state lives and how it moves between modules.
- Any shared or cross-product modules it touches.

This section seeds the `docs/arch/<product>/ARCH-vN.md` file.

---

## Module Decomposition Plan (required)

Target directory layout and ownership. For each module list:

- **Responsibility** — What the module owns.
- **Public API** — Functions/types/classes exposed externally.
- **Internal Notes** — Hidden implementation details or patterns.
- **Estimated Footprint** — Rough file counts or size expectations.

Stick to the repo’s folder strategy (feature-first or layer-first) and note any intentional deviations.

---

## Shared Conventions (required)

- Consistent naming; avoid ambiguous abbreviations.
- Cross-module access only through declared public APIs.
- Tests focus on public behaviors.
- Keep local test runtime within a mutually agreed budget.

Add any team-specific conventions here.

---

## Test Strategy (required)

- Prefer unit, integration, and contract/API tests over brittle snapshots.
- Update or retire obsolete tests within the same change.
- Highlight critical scenarios for regression suites.

---

## Dependency Policy (required)

- New runtime dependencies demand a short ADR (alternatives, license, security posture).
- Prefer lightweight dependencies; don’t add one for trivial helpers.

---

## Output of this Step

- Save the PRD to `docs/prd/<feature-slug>-vN.md`.
- Immediately draft:
  - `docs/arch/<product>/ARCH-vN.md` (1–2 pages) derived from the PRD.
  - `docs/adr/ADR-00xx-<short-title>.md` capturing the main architectural decision.
- Update `docs/arch/index.md` with the new/changed architecture entry.

If scope or boundaries shift later, bump to `vN+1`, link the superseded version at the top, and note the change in `docs/portfolio/log.md`.
