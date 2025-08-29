# PRD: Dark Mode (Web App)

Version: 1.0

## Context

Users request a dark theme toggle to reduce eye strain.

## Goals

- Add a persistent dark mode toggle accessible from the header.
- Persist preference per browser; respect OS preference on first visit.

## Non-Goals

- No per-page theme overrides.
- No server-side theming.

## User Stories

- As a user, I can toggle dark mode on/off and see the change immediately.
- As a returning user, my theme preference is remembered.

## Acceptance Criteria

- Toggle exists in the header; keyboard accessible; ARIA labels present.
- Theme persists across reloads; initial value respects `prefers-color-scheme`.
- No layout regressions; color contrast meets WCAG AA.

## Risks & Assumptions

- CSS variables are available across supported browsers.
- Low risk; ensure no FOUC.

## Telemetry & KPIs

- Track toggle usage event; track chosen theme; no PII.

---

## Reference Architecture (Required)

Style: Feature-Sliced.

- ui/theme: Toggle component and CSS variables.
- app/preferences: Orchestration service for reading/writing preference.
- domain/theme: Pure logic for resolving initial theme and validation.
- infra/storage: LocalStorage adapter behind a port.

Allowed imports:

- ui → app → domain → infra (ports/adapters)
- ui can import public types from domain (not internals)

Call flow:

- UI Toggle → App Service → Domain Resolver → Storage Port → LocalStorage Adapter

## Module Decomposition Plan (Required)

Target layout:

```shell
src/
  ui/theme/          # Toggle UI, styles
  app/preferences/   # Application service
  domain/theme/      # Pure logic, types
  infra/storage/     # LocalStorage adapter
```

Modules:

- ui/theme
  - Responsibility: Toggle and theme CSS variables
  - Public API: `Toggle` component; `applyTheme(theme)`
  - Internal: CSS variable map
  - Files: 3–5

- app/preferences
  - Responsibility: Orchestrate read/write of theme preference
  - Public API: `getInitialTheme()`, `setTheme(theme)`
  - Internal: calls to domain + storage port
  - Files: 2–4

- domain/theme
  - Responsibility: Determine initial theme; validate input
  - Public API: `resolveInitialTheme(osPref, savedPref)`
  - Internal: constants and pure fns
  - Files: 2–3

- infra/storage
  - Responsibility: Adapter to LocalStorage
  - Public API: `readTheme()`, `writeTheme(theme)`
  - Internal: key naming; JSON handling
  - Files: 1–2

## File & Function Size Limits (Required)

- max_file_lines: 500
- max_func_lines: 70
- max_cyclomatic: 10

## Shared Conventions (Required)

- Folder strategy: feature-first.
- Cross-module access: only via declared public APIs.

## Test Strategy (Required)

- Unit: domain functions (90%+ coverage); app service behaviors.
- Contract/API: toggle integration test ensuring persistence and initial resolution.
- Runtime: < 5 minutes locally.

## Dependency Policy (Required)

- No new runtime deps expected. If added, record ADR: size/license/security/alternatives.
- Targets: prod ≤ 30, dev ≤ 40.
