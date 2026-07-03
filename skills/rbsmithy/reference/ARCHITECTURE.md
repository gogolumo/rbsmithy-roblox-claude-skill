# Roblox Architecture Guide

## Goal

Build Roblox games as small, testable systems instead of giant scripts. Every feature should have a clear owner:

- **Server**: truth, validation, saves, rewards, damage, quest progress.
- **Client**: input, camera, UI, local-only effects, presentation.
- **Shared**: constants, types, pure helper functions, remote contracts.

## Identify project type

### Studio-only

The user talks in terms of Roblox Studio containers:

- `ServerScriptService`
- `ReplicatedStorage`
- `StarterPlayer > StarterPlayerScripts`
- `StarterGui`
- `Workspace`

For Studio-only answers, explain exact placement:

```text
ServerScriptService
└── InventoryService.server.lua

ReplicatedStorage
└── Shared
    └── InventoryTypes.lua

StarterPlayer
└── StarterPlayerScripts
    └── InventoryController.client.lua
```

### Rojo-based

A Rojo project usually has files such as:

```text
default.project.json
src/
wally.toml
selene.toml
stylua.toml
```

Recommended structure:

```text
src/
├── server/
│   ├── init.server.luau
│   └── Services/
│       └── InventoryService.luau
├── client/
│   ├── init.client.luau
│   └── Controllers/
│       └── InventoryController.luau
├── shared/
│   ├── Remotes.luau
│   ├── Types.luau
│   └── Constants.luau
└── ui/
    └── MainHud.client.luau
```

### Hybrid

Some teams use Studio objects for UI/models and Rojo for scripts. Be explicit about which side each asset belongs to. Do not assume a file path maps to Studio unless a Rojo project file shows it.

## Roblox containers

### ServerScriptService

Use for server-only scripts and modules. Clients cannot access it. Put trusted game logic here:

- player data services;
- combat validation;
- inventory ownership;
- quest progress;
- reward grants;
- purchase processing;
- anti-cheat checks.

### ReplicatedStorage

Visible to server and clients. Use for shared code and objects:

- shared types;
- constants;
- pure utility modules;
- remote folders;
- assets that clients need.

Do not put secrets, server authority, or write-sensitive logic here.

### StarterPlayerScripts

Client scripts copied into each player. Use for:

- input handling;
- camera control;
- local UI controllers;
- local visual/audio effects;
- client prediction or interpolation.

### StarterGui

UI templates copied into each player's `PlayerGui`. Use ScreenGuis and LocalScripts for presentation. Do not make UI the source of truth for data.

### Workspace

World objects, NPCs, vehicles, interactables, parts, models, constraints, and physics. Prefer tags or attributes to discover many objects instead of hardcoding every path.

## Services / controllers / modules pattern

Use a simple split:

```text
Server Service: owns server state and validation.
Client Controller: owns input, UI, camera, and local display.
Shared Module: owns types, constants, and pure helper functions.
```

Example inventory feature:

```text
ServerScriptService/Services/InventoryService.lua
ReplicatedStorage/Shared/InventoryTypes.lua
ReplicatedStorage/Remotes/InventoryRemote
StarterPlayerScripts/Controllers/InventoryController.lua
StarterGui/InventoryGui
```

## Feature design flow

When planning a new feature, answer:

1. What state exists?
2. Which state is server-authoritative?
3. Which state is only visual/client-side?
4. What remotes cross the boundary?
5. What validates each remote?
6. What data must persist?
7. What happens if the player disconnects mid-action?
8. How will the feature be manually tested?

## Avoid circular dependencies

Bad pattern:

```text
InventoryService requires QuestService
QuestService requires InventoryService
```

Better options:

- extract shared types/constants to `ReplicatedStorage/Shared`;
- use events for one-way notifications;
- call through a small interface passed during `Init`;
- let a top-level bootstrapper wire services together.

## BindableEvent vs RemoteEvent

Use **BindableEvent** or **BindableFunction** for server-to-server or client-to-client communication inside the same environment.

Use **RemoteEvent** or **RemoteFunction** only when crossing the server/client boundary.

Do not use a RemoteEvent for server-to-server communication.

## Designing feature modules

A feature module should usually expose a small API:

```lua
FeatureService.Init(context)
FeatureService.Start()
FeatureService.GetState(player)
FeatureService.HandleRequest(player, payload)
FeatureService.CleanupPlayer(player)
```

Keep private helpers local to the module. Avoid exporting every internal detail.

## Bootstrap pattern

Server bootstrap:

```lua
-- ServerScriptService/init.server.lua
local ServerScriptService = game:GetService("ServerScriptService")

local Services = ServerScriptService:WaitForChild("Services")
local InventoryService = require(Services:WaitForChild("InventoryService"))
local QuestService = require(Services:WaitForChild("QuestService"))

InventoryService.Init({ QuestService = QuestService })
QuestService.Init({ InventoryService = InventoryService })

InventoryService.Start()
QuestService.Start()
```

Client bootstrap:

```lua
-- StarterPlayerScripts/init.client.lua
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Controllers = script.Parent:WaitForChild("Controllers")
local HudController = require(Controllers:WaitForChild("HudController"))

HudController.Init({ Player = player })
HudController.Start()
```

## Answer expectations

When giving architecture advice, include:

- current problem;
- proposed structure;
- exact script locations;
- what stays server-side;
- what stays client-side;
- migration steps;
- test steps.
