# UI and HUD

## UI ownership

Client owns UI display. Server owns the truth behind UI values.

Examples:

- Health display shows server/character health.
- Currency display shows server-owned currency snapshot.
- Inventory UI shows server-sanitized inventory data.
- Quest tracker shows server-owned quest progress.

Do not let UI directly decide rewards, inventory ownership, or quest completion.

## StarterGui placement

Studio placement:

```text
StarterGui
└── MainHud
    ├── SafeArea
    ├── TopLeft
    ├── BottomBar
    ├── RightStack
    └── HudController.client.lua
```

Rojo placement can map UI scripts through `src/ui` or `src/client` depending on the project.

## ScreenGui structure

Recommended properties:

```text
ScreenGui
- ResetOnSpawn = false for persistent HUDs
- IgnoreGuiInset = false unless you handle inset manually
- ZIndexBehavior = Sibling
```

Use a root frame:

```text
MainHud ScreenGui
└── SafeArea Frame
    ├── UIScale
    ├── TopLeft Frame
    ├── BottomBar Frame
    ├── RightStack Frame
    └── ModalLayer Frame
```

## Safe area and insets

Roblox UI must work across desktop, mobile, tablet, and different aspect ratios.

Guidelines:

- use `AnchorPoint` and `Position` intentionally;
- avoid fixed pixel-only layouts for the whole HUD;
- use `UIScale` for global scaling;
- use `UIPadding` around screen edges;
- keep important buttons away from notches and system UI;
- test with device emulator sizes.

## UIScale pattern

Basic responsive scale idea:

```lua
--!strict

local camera = workspace.CurrentCamera
local uiScale = script.Parent:WaitForChild("UIScale") :: UIScale

local BASE_WIDTH = 1920
local MIN_SCALE = 0.75
local MAX_SCALE = 1.1

local function updateScale(): ()
    local viewport = camera.ViewportSize
    local scale = math.clamp(viewport.X / BASE_WIDTH, MIN_SCALE, MAX_SCALE)
    uiScale.Scale = scale
end

updateScale()
camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)
```

## HUD state modes

For adventure games, separate HUD modes:

```text
OnFoot: health, stamina, currency, quickbar, minimap.
ShipLight: hull, wind summary, anchor/dock prompt.
Helm: trim meter, wind dial, hull, speed, anchor state; hide quickbar if it distracts.
Dialogue: dialogue box and choices; hide combat HUD.
Menu: inventory/settings; pause-like overlay if game design allows.
```

Use one controller that switches visibility rather than many scripts fighting over UI.

## Modal UI

Modal screens include inventory, shop, dialogue, settings, map, and quest journal.

Rules:

- only one major modal should own focus at a time;
- restore input state when closing;
- do not leave movement locked after UI closes;
- close or ignore stale UI when the player dies/respawns;
- handle gamepad/mobile where appropriate.

## Input prompts

Use consistent prompts:

```text
[E] Talk
[Hold E] Dock
[Q] Drop
[Tap] Interact
```

Do not hardcode keyboard-only prompts if mobile/gamepad support matters. Consider mapping display text through an input helper.

## Client/server data flow

Good flow:

```text
Server changes inventory
-> Server fires InventoryUpdate to that player
-> Client updates local UI model
-> UI redraws
```

Bad flow:

```text
Player clicks UI button
-> Client locally adds item
-> UI shows fake state
-> Server maybe catches up later
```

## Expensive UI updates

Avoid rebuilding entire UI every frame. Update when data changes.

Bad:

```lua
RunService.RenderStepped:Connect(function()
    rebuildInventoryGrid()
end)
```

Better:

```lua
InventoryChanged.Event:Connect(function(snapshot)
    renderInventory(snapshot)
end)
```

## Answer expectations

For UI/HUD tasks, include:

- Studio hierarchy;
- controller script placement;
- state model;
- responsive scaling notes;
- server/client data flow;
- accessibility/input notes;
- manual test steps for desktop and mobile emulator.
