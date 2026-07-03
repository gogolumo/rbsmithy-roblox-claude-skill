# Networking and Remotes

## Core rule

Treat every RemoteEvent and RemoteFunction as a public API exposed to modified clients.

A client can lie about:

- position;
- damage;
- currency amount;
- inventory item ownership;
- quest progress;
- cooldowns;
- input timing;
- target selection;
- purchase state.

The server must verify sensitive actions.

## RemoteEvent vs RemoteFunction

Use **RemoteEvent** when:

- the caller does not need an immediate return value;
- the message is an action or notification;
- the flow can be async;
- you want to avoid yielding the caller.

Examples:

- client requests “swing weapon”;
- server sends inventory snapshot;
- client requests interaction with an object;
- server broadcasts quest update.

Use **RemoteFunction** when:

- there is a real request-response operation;
- the response is small and immediate;
- failure handling is clear;
- you accept the risk of yielding.

Examples:

- client asks for current shop catalog snapshot;
- client asks for initial UI bootstrap data.

Do not use RemoteFunction for long-running operations or chains of dependent calls.

## Remote contract format

Every remote should have a contract:

```text
Remote: InventoryRequest
Direction: Client -> Server
Transport: RemoteEvent
Payload:
  action: "Equip" | "Unequip" | "Drop"
  itemId: string
Server validates:
  - player owns itemId
  - item is equippable/droppable
  - player is not on cooldown
Server response:
  - InventoryUpdate RemoteEvent with sanitized snapshot
```

Put contracts in shared documentation or a shared module, not scattered in comments across many scripts.

## Safe server remote handler

```lua
--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remotes = ReplicatedStorage:WaitForChild("Remotes")
local inventoryRequest = remotes:WaitForChild("InventoryRequest") :: RemoteEvent

local RATE_LIMIT_SECONDS = 0.25
local lastRequestAt: { [Player]: number } = {}

local function isRateLimited(player: Player): boolean
    local now = os.clock()
    local last = lastRequestAt[player]
    if last and now - last < RATE_LIMIT_SECONDS then
        return true
    end
    lastRequestAt[player] = now
    return false
end

local function isValidAction(action: unknown): boolean
    return action == "Equip" or action == "Unequip" or action == "Drop"
end

inventoryRequest.OnServerEvent:Connect(function(player: Player, action: unknown, itemId: unknown)
    if isRateLimited(player) then
        return
    end

    if not isValidAction(action) then
        return
    end

    if typeof(itemId) ~= "string" then
        return
    end

    -- Continue with server-owned validation:
    -- 1. Does player own this item?
    -- 2. Is item allowed for this action?
    -- 3. Is the player's state compatible?
end)
```

## Unsafe remote handler

```lua
-- Do not do this.
remote.OnServerEvent:Connect(function(player, coins)
    player.leaderstats.Coins.Value += coins
end)
```

Problems:

- client controls the amount;
- no type check;
- no limit;
- no reason validation;
- no logging or failure path.

## Rate limiting

Rate limit sensitive remotes such as:

- combat attacks;
- inventory actions;
- shop purchases;
- trading;
- quest completion;
- interaction prompts;
- placement/building;
- vehicle control if spam can cause server load.

Simple per-player limiter:

```lua
local lastAt: { [Player]: number } = {}

local function allow(player: Player, cooldown: number): boolean
    local now = os.clock()
    local last = lastAt[player]
    if last and now - last < cooldown then
        return false
    end
    lastAt[player] = now
    return true
end
```

For more complex systems, use token buckets or server-side action queues.

## Validate by action type

For a combat request, validate:

- weapon is equipped server-side;
- attack is not on cooldown;
- target exists and is alive;
- target is within plausible range;
- line of sight if relevant;
- player state allows attacking;
- damage is calculated by server, not sent by client.

For a shop request, validate:

- item exists in server catalog;
- price is server-defined;
- player has enough currency server-side;
- purchase limit is not exceeded;
- inventory has capacity;
- grant and charge happen together.

For a quest request, validate:

- quest is active server-side;
- objective condition is true server-side;
- reward has not already been claimed;
- progression is saved safely.

## Server to client updates

Send sanitized state only. Do not send hidden server-only data if the client does not need it.

Good:

```lua
InventoryUpdate:FireClient(player, {
    Items = publicItems,
    Capacity = capacity,
})
```

Avoid sending:

- anti-cheat thresholds;
- secret shop logic;
- unrevealed loot rolls;
- other players' private data.

## Remote naming

Use names that describe intent:

```text
InventoryRequest
InventoryUpdate
CombatAction
QuestAction
QuestUpdate
DialogueRequest
DialogueUpdate
ShipControlRequest
ShipStateUpdate
```

Avoid vague names:

```text
Remote1
ServerEvent
DoThing
MainRemote
```

## Answer expectations

When implementing remotes, include:

- remote name;
- direction;
- payload contract;
- validation rules;
- rate limit rules;
- server handler code;
- client caller code;
- test steps for normal behavior and exploit-like bad payloads.
