# Inventory System Blueprint

## Purpose

Track items a player owns, stackable counts, equipped items, and UI display without trusting the client.

## Server responsibilities

- Own the profile inventory table.
- Validate pickups, purchases, crafting, trading, drops, and equip requests.
- Enforce max stack sizes and ownership.
- Save inventory through the profile/data service.

## Client responsibilities

- Show inventory UI.
- Send intent requests like `RequestEquipItem(itemId)`.
- Play local feedback after server confirmation.

## Shared modules

- `InventoryTypes`
- `ItemDefinitions`
- `RemoteContracts`

## Required remotes

- `InventorySnapshot` server -> client RemoteEvent.
- `RequestEquipItem` client -> server RemoteEvent.
- `RequestDropItem` client -> server RemoteEvent.

## Data schema

```lua
Inventory = {
    Items = { [itemId: string]: number },
    Equipped = { Weapon = "RustySword", Tool = nil },
}
```

## Common bugs

- Client sends item count directly.
- Item definitions duplicated differently on server and client.
- UI updates before profile load.
- Equip request ignores cooldown or item ownership.

## Manual tests

1. Start two-player local server.
2. Give item on server.
3. Confirm only that player receives UI update.
4. Try equipping an item not owned by the player.
5. Leave/rejoin and verify inventory persists.
