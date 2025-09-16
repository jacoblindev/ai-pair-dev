---
version: v1
status: draft
product: <product-or-scope>
related_prd: ../prd/<feature-slug>-v1.md
adr: ../adr/ADR-00xx-<title>.md
---

# Architecture — {{Product or Scope}}

## Overview

- Drivers: performance, privacy, scale, etc.
- Selected architecture style and rationale.

## Module Map & Boundaries

| Module | May Depend On | Public API Notes | Comments |
| --- | --- | --- | --- |
| module-a | module-b | | |

## Data & Control Flow

- Bullet the main request/response path.
- Note state ownership and persistence boundaries.

## Key Contracts

- Public APIs/interfaces between modules or external systems.
- Include data shape references if helpful.

## Non-Functionals

- Latency, throughput, availability budgets.
- Testability / observability expectations.

## Tech & Dependencies

- Libraries/services in use with one-line rationale.
- Note any ADR requirement for new runtime deps.

## Risks & Mitigations

- Top risks (boundary drift, scaling, etc.) and planned mitigations.

## Traceability

- PRD: `docs/prd/<feature-slug>-v1.md`
- ADRs: `docs/adr/ADR-00xx-<title>.md`
- Portfolio log entry (if needed): `docs/portfolio/log.md`
