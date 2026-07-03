# Luau Style Guide

## Default to typed Luau for new modules

Use `--!strict` for new modules unless the existing project clearly uses a different convention.

```lua
--!strict

local Players = game:GetService("Players")

type PlayerState = {
    Coins: number,
    Level: number,
}

local PlayerStates: { [Player]: PlayerState } = {}
```

If strict mode creates too much friction in an old messy file, do not rewrite the whole project blindly. Add types to new boundaries first.

## Service declarations

Prefer service variables at the top:

```lua
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
```

Do not repeatedly call `game:GetService()` deep inside hot loops.

## Naming conventions

Recommended defaults:

- Module table: `InventoryService`, `HudController`, `QuestDefinitions`
- Types: `InventoryItem`, `PlayerData`, `RemotePayload`
- Constants: `MAX_STACK_SIZE`, `DEFAULT_COOLDOWN_SECONDS`
- Private helper functions: `validateItemId`, `getOrCreateState`
- Remote names: `InventoryRequest`, `InventoryUpdate`, `QuestAction`

Use the existing project convention if it is consistent.

## ModuleScript return table pattern

```lua
--!strict

local InventoryService = {}

function InventoryService.Init(): ()
    -- prepare dependencies
end

function InventoryService.Start(): ()
    -- connect events
end

return InventoryService
```

Avoid modules that do significant side effects at require-time. Prefer `Init()` and `Start()` so dependencies are easier to control.

## Type aliases

Use type aliases for data structures that cross module or remote boundaries.

```lua
type ItemId = string

type InventoryItem = {
    Id: ItemId,
    Count: number,
}

type InventorySnapshot = {
    Items: { InventoryItem },
    Capacity: number,
}
```

## Avoid globals

Bad:

```lua
coins = 10
function GiveCoins(player, amount)
    coins += amount
end
```

Good:

```lua
local coinsByPlayer: { [Player]: number } = {}

local function giveCoins(player: Player, amount: number): ()
    coinsByPlayer[player] = (coinsByPlayer[player] or 0) + amount
end
```

## Avoid magic strings

Bad:

```lua
if action == "BuySword" then
    -- ...
end
```

Better:

```lua
local Actions = {
    BuySword = "BuySword",
    EquipItem = "EquipItem",
}

if action == Actions.BuySword then
    -- ...
end
```

## Roblox instance access

Use `WaitForChild` for replicated instances that may not exist yet on the client. Do not use infinite waiting for objects that might be missing because of a bug.

```lua
local remotes = ReplicatedStorage:WaitForChild("Remotes")
local inventoryRemote = remotes:WaitForChild("InventoryRemote") :: RemoteEvent
```

For server-created objects, create them deterministically during boot.

## Good Luau example

```lua
--!strict

local Players = game:GetService("Players")

type PlayerStats = {
    Coins: number,
    Gems: number,
}

local StatsService = {}
local statsByPlayer: { [Player]: PlayerStats } = {}

local function createDefaultStats(): PlayerStats
    return {
        Coins = 0,
        Gems = 0,
    }
end

function StatsService.GetStats(player: Player): PlayerStats
    local stats = statsByPlayer[player]
    if not stats then
        stats = createDefaultStats()
        statsByPlayer[player] = stats
    end
    return stats
end

function StatsService.AddCoins(player: Player, amount: number): boolean
    if amount <= 0 or amount > 1000 then
        return false
    end

    local stats = StatsService.GetStats(player)
    stats.Coins += amount
    return true
end

Players.PlayerRemoving:Connect(function(player: Player)
    statsByPlayer[player] = nil
end)

return StatsService
```

## Bad Luau example

```lua
-- Avoid this style for serious systems.
_G.Data = {}

script.Parent.Remote.OnServerEvent:Connect(function(player, action, amount)
    if action == "AddCoins" then
        _G.Data[player.Name].Coins = _G.Data[player.Name].Coins + amount
    end
end)
```

Problems:

- global mutable state;
- no type validation;
- client controls amount;
- uses player name as key;
- no cleanup;
- direct remote handler with no contract.

## Answer expectations

When writing Luau, include:

- complete file content when practical;
- `--!strict` for new modules;
- clear type aliases for payloads and data;
- no fake APIs;
- comments only where they clarify decisions;
- code that explains exact Roblox Studio placement.
