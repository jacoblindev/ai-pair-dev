---
version: v1
status: draft
slug: sample-feature
product: foundation
---

# PRD — Sample Feature

## Context

- Brief background and why this matters.

## Goals

- What outcomes we want in user/business terms.

## Non‑Goals

- Explicitly out of scope in this iteration.

## User Stories / Scenarios

- As a user, I want X so that Y.

## Acceptance Criteria

- Concrete, testable conditions; include edge cases.

## UX Notes

- Key interactions, states, accessibility expectations.

## Risks & Assumptions

- Unknowns, dependencies, fallbacks.

## Telemetry & KPIs

- Events, metrics, and success measures.

## Open Questions

- Outstanding decisions that require human input.

## Reference Architecture (lean)

- Style: Hexagonal (Ports/Adapters) or similar; justify briefly.
- Allowed imports and state ownership at a high level.
- Shared modules touched and direction of dependencies.

## Module Decomposition Plan (required)

- app/: responsibilities; public APIs; internal notes; estimated files.
- domain/: responsibilities; public APIs; internal notes; estimated files.
- infra/: responsibilities; public APIs; internal notes; estimated files.

## Suggested Size & Complexity (optional)

- max_file_lines: ~500; max_func_lines: ~70; max_cyclomatic: ~10 (heuristics).

## Test Strategy (required)

- Focus on public behavior; prefer unit and contract/API tests; keep runtime reasonable.

## Dependency Policy (required)

- New runtime deps need an ADR (alternatives, license, security posture).
- Link ADR IDs once written and add a note to `docs/portfolio/log.md` for cross-product impact.
