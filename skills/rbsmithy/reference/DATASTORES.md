# DataStores

## Core rule

Data loss is worse than a visible error. Do not silently overwrite real player data with defaults when loading fails.

DataStores can only be accessed from the server. Client scripts must never directly own persistent data decisions.

## Player data schema

Use one root table with a version field:

```lua
type PlayerData = {
    Version: number,
    Coins: number,
    Inventory: { string },
    Quests: { [string]: string },
    Settings: {
        Music: boolean,
        CameraShake: boolean,
    },
}
```

Recommended principles:

- include `Version`;
- keep defaults centralized;
- migrate old data on load;
- never assume old saves have every new field;
- treat unknown/malformed fields carefully.

## Default data merging

When adding a new field, old data will not have it. Merge defaults into loaded data:

```lua
local function mergeDefaults(data, defaults)
    for key, value in pairs(defaults) do
        if data[key] == nil then
            if type(value) == "table" then
                data[key] = table.clone(value)
            else
                data[key] = value
            end
        elseif type(value) == "table" and type(data[key]) == "table" then
            mergeDefaults(data[key], value)
        end
    end
end
```

For nested tables, prefer a deep copy helper instead of sharing the same default table across players.

## Loading flow

Recommended player load flow:

1. Player joins.
2. Server creates a loading state.
3. Server attempts to load data with retry/backoff.
4. If data loads:
   - migrate it;
   - merge defaults;
   - validate critical fields;
   - mark player data as loaded.
5. If load fails:
   - do not grant a normal default profile that can be saved over real data;
   - show a safe error/kick message or limited no-save session depending on game design.

## Saving flow

Save when:

- player leaves;
- important milestones happen;
- periodic autosave triggers;
- server shuts down.

Do not save every tiny change instantly. Batch changes and autosave responsibly.

## UpdateAsync vs SetAsync

Prefer `UpdateAsync` for player data writes because it reads the current stored value and lets you decide the next value in a callback. This is safer for merging, session checks, and avoiding accidental overwrites.

Use `SetAsync` only for simple cases where overwriting the whole value is definitely intended and safe.

## Retry and backoff

Wrap DataStore calls in `pcall`. Retry transient failures with small backoff.

```lua
local function retry<T>(attempts: number, callback: () -> T): (boolean, T?)
    local lastResult: T? = nil

    for attempt = 1, attempts do
        local ok, result = pcall(callback)
        if ok then
            return true, result
        end

        lastResult = nil
        task.wait(math.min(2 ^ attempt, 10))
    end

    return false, lastResult
end
```

## Session locking concept

Session locking helps prevent two servers from writing the same profile at the same time. A simple lock usually stores:

```lua
SessionLock = {
    JobId = game.JobId,
    UpdatedAt = os.time(),
}
```

On load, the server checks whether another active server appears to own the profile. Locks need expiration because servers can crash.

Do not implement session locking casually if you do not understand the tradeoffs. For complex games, consider a well-tested profile management library or build a carefully reviewed profile service.

## BindToClose saves

Use `game:BindToClose()` to attempt final saves on shutdown. Keep it bounded; the server has limited shutdown time.

```lua
game:BindToClose(function()
    -- Save loaded player profiles.
    -- Do not start infinite waits here.
end)
```

## Migration pattern

```lua
local CURRENT_VERSION = 3

local function migrate(data)
    data.Version = data.Version or 1

    if data.Version < 2 then
        data.Settings = {
            Music = true,
            CameraShake = true,
        }
        data.Version = 2
    end

    if data.Version < 3 then
        data.Quests = data.Quests or {}
        data.Version = 3
    end

    return data
end
```

## Data loss prevention checklist

Before approving DataStore code, check:

- Does the code distinguish load failure from new player data?
- Are DataStore calls server-side only?
- Are all DataStore calls wrapped in `pcall`?
- Is there retry/backoff?
- Are defaults merged into old saves?
- Is there a version/migration path?
- Is saving blocked if loading failed?
- Is data saved on PlayerRemoving?
- Is there a bounded BindToClose save?
- Are duplicate sessions considered?
- Is client data treated as untrusted?

## Answer expectations

When creating DataStore code, include:

- schema;
- defaults;
- migration logic;
- load failure behavior;
- save strategy;
- Studio/API services setting reminder if needed;
- manual testing steps with Studio DataStore access enabled;
- warning about not testing persistence only in a single quick Play Solo session.
