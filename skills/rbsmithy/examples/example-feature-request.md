# Example Feature Request

## User request

> Create a typed Luau inventory system for my Roblox adventure game. It should support adding items, equipping items, and showing the inventory UI.

## How Claude should approach it

High-level reasoning:

- Inventory ownership must be server-authoritative.
- Client UI only displays a sanitized snapshot and sends action requests.
- Shared module should define item types, actions, and validation helpers.
- Remotes need contracts and validation.
- DataStore integration should be planned, even if not fully implemented in the first step.

## Expected output format

```text
Project assumption: Studio-only unless you show me a Rojo project.

Plan:
1. Create shared item definitions.
2. Create server InventoryService.
3. Create InventoryRequest and InventoryUpdate remotes.
4. Create client InventoryController.
5. Connect UI buttons to client controller.
6. Test normal and invalid requests.
```

## Code/file path style

```text
ReplicatedStorage/Shared/InventoryTypes.lua
ReplicatedStorage/Shared/ItemDefinitions.lua
ServerScriptService/Services/InventoryService.lua
StarterPlayer/StarterPlayerScripts/Controllers/InventoryController.lua
StarterGui/InventoryGui
```

## Test steps

1. Start Play Solo.
2. Confirm server creates/loads inventory state.
3. Press inventory key and verify UI opens.
4. Equip an owned item.
5. Try equipping an item ID the player does not own using a test call; server should reject it.
6. Run two-player Studio test and confirm each player only sees their own inventory.
