# Example: feature package

## User request

"Turn my sprint system into a reusable package."

## Claude behavior

Claude should split code into config, types, service, controller, remotes, analytics, README, and TESTS.

## Expected output

```text
features/Sprint/
├── README.md
├── TESTS.md
├── SprintConfig.luau
├── SprintTypes.luau
├── SprintService.server.luau
├── SprintController.client.luau
└── SprintAnalytics.luau
```

Claude should include migration steps and multiplayer tests.
