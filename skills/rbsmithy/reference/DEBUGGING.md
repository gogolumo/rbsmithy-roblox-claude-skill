# Debugging Roblox Projects

## How to read Output errors

When the user shares an Output error, extract:

1. error text;
2. script path;
3. line number;
4. whether it happened on client or server;
5. what action triggered it;
6. whether it happens once or repeatedly.

Do not guess too much from one line. Give the most likely causes and ask for the specific script only if needed.

## Common error: attempt to index nil

Example:

```text
attempt to index nil with 'WaitForChild'
```

Likely causes:

- parent object is nil;
- script is in the wrong place;
- a service/path variable failed;
- code runs before character/UI exists;
- `FindFirstChild` returned nil and the code used it without checking.

Fix pattern:

```lua
local parent = script.Parent
if not parent then
    warn("Script has no parent")
    return
end

local child = parent:FindFirstChild("ExpectedChild")
if not child then
    warn("Missing ExpectedChild under", parent:GetFullName())
    return
end
```

Use `WaitForChild` when the object should appear soon. Use `FindFirstChild` plus error handling when it might genuinely not exist.

## Missing services

Correct:

```lua
local Players = game:GetService("Players")
```

Incorrect:

```lua
local Players = game.Players
```

`game.Players` often works but `GetService` is the safer standard.

## Replication timing

Client scripts may run before replicated objects appear. Use:

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
```

But if `Remotes` is never created, `WaitForChild` can hide the real bug. Server boot should create required remotes or the project should include them in Studio/Rojo.

## WaitForChild misuse

Avoid chains that hide which object is missing:

```lua
local button = player.PlayerGui:WaitForChild("MainGui"):WaitForChild("Frame"):WaitForChild("Button")
```

Better:

```lua
local playerGui = player:WaitForChild("PlayerGui")
local mainGui = playerGui:WaitForChild("MainGui")
local frame = mainGui:WaitForChild("Frame")
local button = frame:WaitForChild("Button") :: TextButton
```

Now the Output warning tells you which step failed.

## RemoteEvent parameter order mistakes

Server receives the player automatically as the first argument:

```lua
remote.OnServerEvent:Connect(function(player, action, payload)
    -- player is inserted by Roblox
end)
```

Client should not send the player manually:

```lua
remote:FireServer(action, payload)
```

Bad:

```lua
remote:FireServer(player, action, payload)
```

That shifts arguments and breaks validation.

## ModuleScript require errors

Common causes:

- ModuleScript does not return a value;
- module errors while loading;
- circular dependency;
- requiring a server-only module from the client;
- path points to a Script instead of a ModuleScript;
- module is in ServerScriptService and client cannot access it.

Good module shape:

```lua
local Module = {}

function Module.DoThing()
    return true
end

return Module
```

## Camera bugs

For dialogue cameras that fly away:

- check `workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable`;
- compute camera position relative to NPC head/root, not arbitrary world origin;
- use `CFrame.lookAt(cameraPosition, focusPosition)`;
- restore camera type when closing dialogue;
- do not set character CFrame every frame unless intended;
- make sure the NPC model has a stable `Head` or `HumanoidRootPart`.

## When to ask for more info

Ask for screenshots/logs only when needed. Prefer first giving likely fixes from the given error.

Ask for:

- full Output error with script path and line number;
- the script around the failing line;
- Explorer hierarchy screenshot;
- whether the error appears on server or client;
- whether the project uses Rojo.

## Debugging answer format

Use:

1. **Most likely cause**
2. **Why it happens**
3. **Fix**
4. **Safer version of the code**
5. **How to verify**
6. **What to send next if it still fails**
