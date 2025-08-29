# Architecture Overview

Decision snapshot for this codebase. Keep this current.

## Style

- Chosen style: {{Hexagonal | Clean | Feature-Sliced | Layered}}
- Rationale: {{why this fits the problem and team}}

## Boundaries & Dependencies

- Allowed imports:
  - {{module A}} → {{module B}}
  - Public APIs only; no deep imports.
- Forbidden imports:
  - {{example}}

## Public APIs

- Module: {{name}}
  - Public surface: {{functions/classes/types}}
- Module: {{name}}
  - Public surface: {{functions/classes/types}}

## Sample Flow

- {{UI/Controller}} → {{Application Service}} → {{Domain Policy}} → {{Port}} → {{Adapter}}

## Notes

- Exceptions documented via ADRs.
- Keep modules small; split when nearing size limits.
