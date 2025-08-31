---
id: ADR-0001
title: Architecture Style and Module Boundaries
status: accepted
date: 2025-08-31
supersedes: none
---

## Context

We need a simple, testable structure with clear boundaries to support incremental delivery.

## Decision

Adopt a hexagonal architecture (Ports/Adapters) with domain isolation, per `docs/architecture/ARCH-v1.md`.

## Consequences

- Pros: Testability, clear dependencies, controlled growth.
- Cons: Slight upfront structure; requires diligence to maintain boundaries.

## Alternatives Considered

- Clean Architecture: Very similar; chosen style is sufficient and simpler for now.
- Feature-sliced monolith: Faster start but weaker boundary enforcement.
