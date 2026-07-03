# Performance Guide

## Performance mindset

Roblox performance problems usually come from:

- too much work every frame;
- too many event connections;
- unbounded loops;
- excessive physics complexity;
- too many replicated objects;
- heavy UI rebuilds;
- memory leaks from uncleaned connections/instances;
- expensive server validation done too often.

Optimize the real bottleneck, not random code style.

## RunService usage

Use `RunService.RenderStepped` for camera and visual-only client updates that need to run before rendering.

Use `RunService.Heartbeat` for general per-frame simulation work.

Avoid server per-frame loops for every player unless absolutely necessary.

Bad:

```lua
RunService.Heartbeat:Connect(function()
    for _, player in Players:GetPlayers() do
        savePlayerData(player)
    end
end)
```

Good:

```lua
-- Save on meaningful events, player leaving, autosave interval, and shutdown.
```

## Avoid uncontrolled loops

Bad:

```lua
while true do
    wait()
    updateEverything()
end
```

Better:

```lua
while running do
    task.wait(0.25)
    updateNearbyObjects()
end
```

Or event-driven updates when possible.

## Event connection cleanup

Track and disconnect connections when systems stop, UI closes, character dies, or player leaves.

```lua
local connections: { RBXScriptConnection } = {}

table.insert(connections, button.Activated:Connect(function()
    print("Clicked")
end))

local function cleanup()
    for _, connection in connections do
        connection:Disconnect()
    end
    table.clear(connections)
end
```

## Debris cleanup

Use Debris for temporary instances like effects, temporary attachments, or sounds:

```lua
local Debris = game:GetService("Debris")
Debris:AddItem(effectPart, 3)
```

Do not use Debris as a substitute for designing ownership and cleanup for important gameplay objects.

## Object pooling

For frequent short-lived objects, consider object pooling:

- projectiles;
- damage number labels;
- hit effects;
- splash particles;
- tracers.

Pooling avoids repeated instance creation/destruction spikes.

## Streaming considerations

With StreamingEnabled, clients may not have every Workspace object loaded. Client code should not assume distant objects exist. Server logic should own critical state.

For client UI markers/minimap, handle objects appearing/disappearing.

## Expensive UI updates

Avoid redrawing a full inventory/minimap/quest tracker every frame. Use dirty flags or event-driven updates.

```lua
local dirty = false

local function markDirty()
    dirty = true
end

RunService.RenderStepped:Connect(function()
    if not dirty then
        return
    end
    dirty = false
    redrawUi()
end)
```

## Physics and network ownership

For vehicles and ships:

- decide whether server or a client owns physics simulation;
- watch for jitter when ownership changes often;
- avoid excessive constraints on many parts;
- weld static model parts where possible;
- test with multiple players;
- validate important gameplay outcomes server-side.

If a ship shakes or jitters:

- check conflicting forces/constraints;
- check anchored/unanchored mix;
- check network ownership changes;
- add damping;
- reduce per-frame CFrame teleports;
- avoid fighting Roblox physics with manual positioning.

## Profiling checklist

Before changing code, ask:

- Is the lag server-side, client-side, physics, network, or UI?
- Does it happen with one player or only multiplayer?
- Does it spike or stay constant?
- Are there repeated warnings/errors in Output?
- Are instances/connections increasing over time?
- Is a loop doing work for far-away objects?
- Is UI rebuilding unnecessarily?
- Are remotes being spammed?

## Answer expectations

For performance reviews, include:

- likely bottlenecks;
- proof or reasoning;
- prioritized fixes;
- code-level changes;
- test method;
- what to measure after the change.
