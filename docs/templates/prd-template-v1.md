---
version: v1
status: draft
slug: <feature-slug>
product: <product-or-scope>
owner: <name-or-team>
---

# PRD — {{Feature Name}}

## Context

- Why this matters; relevant background.

## Goals

- Outcome 1
- Outcome 2

## Non-Goals

- Explicit exclusions for this iteration.

## User Stories / Scenarios

- As a {{role}}, I want {{capability}} so that {{benefit}}.

## Acceptance Criteria

- Testable condition 1 (include edge cases).
- Testable condition 2.

## UX Notes

- Key states, interactions, accessibility guarantees.

## Risks & Assumptions

- Unknowns, dependencies, fallback options.

## Telemetry & KPIs

- Metrics, events, success signals to capture.

## Open Questions

- Items still needing human decisions.

## Reference Architecture (lean)

- Selected style (e.g., Hexagonal) and rationale.
- Allowed module dependencies (bullets).
- Expected data/call flow (3–5 bullets).
- Shared modules touched and state ownership.

## Module Decomposition Plan

| Module | Responsibility | Public API | Internal Notes | Est. Footprint |
| --- | --- | --- | --- | --- |
| module-a | | | | |
| module-b | | | | |

## Shared Conventions

- Naming, folder strategy, coding patterns specific to this feature.

## Test Strategy

- Preferred test types, coverage focus, runtime expectations.

## Dependency Policy

- Runtime dependency stance; ADR expectations.
- Link planned ADR IDs once created.

## Traceability

- Related ADRs: `docs/adr/ADR-00xx-<title>.md`
- Related ARCH: `docs/arch/<product>/ARCH-v1.md`
- Portfolio log entry (if needed): `docs/portfolio/log.md`
