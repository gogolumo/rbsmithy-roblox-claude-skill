# Automated Testing

Use this reference when adding unit tests, regression tests, or test runners to a Roblox/Rojo project.

## Goal

Claude should not treat manual Studio testing as the only quality gate. For logic-heavy systems, create automated tests for pure modules and service behavior that can be run outside normal gameplay.

## Recommended testing layers

1. **Pure unit tests**
   - Config validation
   - math helpers
   - cooldown logic
   - inventory add/remove
   - quest state transitions
   - localization key lookup
   - data migration functions

2. **Service integration tests**
   - service starts without missing dependencies
   - required remotes exist
   - RemoteRegistry matches implementation
   - DataStore migration handles old schemas
   - analytics wrappers accept expected event payloads

3. **Manual Studio tests**
   - still required for physics, UI, networking, Studio services, animations, and live-only behavior.

## Tool choices

- **TestEZ**: good for classic Roblox Lua/Luau BDD-style tests.
- **Jest Roblox**: good when the project already uses the Roblox Luau Jest ecosystem.
- Do not add both unless the project already has both. Pick one and be consistent.

## Folder convention

Rojo-friendly layout:

```text
src/
  shared/
    Inventory/
      InventoryMath.luau
      InventoryTypes.luau
  server/
    Services/
      InventoryService.server.luau
  tests/
    shared/
      InventoryMath.spec.luau
    server/
      InventoryService.spec.luau
```

Studio-only layout:

```text
ReplicatedStorage/Shared/Inventory/InventoryMath
ServerScriptService/Tests/InventoryMath.spec
```

## Claude behavior

When implementing a medium/large feature, Claude should include:

- at least one unit test for pure logic;
- at least one regression test when fixing a bug;
- manual Studio tests for networking/physics/UI;
- clear command or plugin instructions for running tests.

## What not to test with unit tests

Do not fake everything. Some systems need live/manual tests:

- DataStore request budget behavior;
- published-experience analytics;
- actual mobile safe area behavior;
- physics/network ownership;
- animations uploaded to Roblox;
- AssetService loading permissions.

## Test naming

Use behavior names:

```text
InventoryMath.spec.luau
QuestStateMachine.spec.luau
SprintCooldown.spec.luau
DataMigrations.spec.luau
```

## Regression test rule

When fixing a bug, add a test that fails before the fix and passes after the fix whenever the bug is pure logic or reproducible without full Studio simulation.
