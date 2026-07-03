# Feature packages

Use this file when turning a system into a reusable module that can be moved between Roblox projects.

## Goal

A feature package is a self-contained gameplay feature with code, config, UI, analytics, tests, and documentation.

## Recommended package shape

```text
features/Sprint/
├── README.md
├── TESTS.md
├── SprintConfig.luau
├── SprintTypes.luau
├── SprintRemotes.luau
├── SprintService.server.luau
├── SprintController.client.luau
├── SprintAnalytics.luau
└── ui/
    └── SprintHud.client.luau
```

## Package rules

- Public API must be small and typed.
- Config must not be scattered across scripts.
- Remotes must be documented.
- Server/client/shared split must be clear.
- Analytics hooks must be optional and safe.
- Tests/manual verification must be included.
- No hidden dependency on one specific place hierarchy unless documented.

## Package README fields

- purpose;
- dependencies;
- folder placement;
- server responsibilities;
- client responsibilities;
- remotes;
- config;
- analytics;
- test steps;
- known limitations.

## Claude output requirements

When asked to package a feature, output:

1. package folder structure;
2. moved files;
3. public API;
4. config module;
5. integration steps;
6. regression tests;
7. migration notes.
