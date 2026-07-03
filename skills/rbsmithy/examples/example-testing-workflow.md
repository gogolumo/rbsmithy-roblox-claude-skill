# Example: Automated Testing Workflow

## User request

"Add tests for my inventory system."

## Claude should do

- inspect project test stack;
- choose TestEZ or Jest Roblox;
- test pure inventory math first;
- add manual multiplayer tests for server inventory ownership;
- avoid pretending DataStore live behavior is fully unit-testable.

## Expected output

```text
Files:
- src/tests/shared/InventoryMath.spec.luau
- src/shared/Inventory/InventoryMath.luau

Manual Studio tests:
- add item from server command
- attempt client fake item remote
- respawn and rejoin test
```
