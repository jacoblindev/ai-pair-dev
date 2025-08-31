---
version: v1
status: draft
---

# Architecture (SD/SA)

- Context: Derived from PRDs under `docs/prd/`; captures project-wide module boundaries and key contracts.
- Drivers: Keep boundaries clear, minimize runtime deps, favor testability.

## Architecture Overview

- Style: Hexagonal (Ports/Adapters) with clear domain isolation.
- Layers: UI/Interface → Application Services → Domain → Ports → Adapters (infra).

## Module Map (boundaries)

- app: orchestration/services; depends on domain and ports only.
- domain: pure logic; no infrastructure imports; stable public API.
- infra: adapters for db/http/files; implements outbound ports.
- ui (if present): web/mobile/cli; calls app public APIs.

Allowed imports:

- ui → app; app → domain, ports; infra → ports; shared utils are read-only.

## Key Contracts

- Ports: Outbound interfaces owned by domain/app; implemented in infra.
- Public APIs: Explicit functions/types exposed by each module; no deep imports.

## Data Flow (example)

UI → App Service → Domain Policy → Port(Outbound) → Adapter(Infra) → External System

## Non‑Functionals (budgets)

- Local tests under a few minutes; avoid flaky snapshots.
- Latency: keep critical path under agreed SLA for the product context.

## Risks & Mitigations

- Risk: Boundary drift. Mitigation: Review changes against this doc; add ADRs for exceptions.
- Risk: Dependency creep. Mitigation: ADR required for runtime deps; prefer stdlib/owned utils.
