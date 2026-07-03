# Procedural 3D Model Generation with Claude Code, Rojo, and Roblox Studio

## What this can and cannot do

Claude Code can generate source files. Rojo can sync those files into Roblox Studio. Roblox Studio can run Luau scripts/plugins that create Instances such as `Model`, `Part`, `WedgePart`, `MeshPart`, `Attachment`, `Folder`, and constraints.

This means Claude can help generate **procedural Roblox models** directly in Studio: low-poly ships, buildings, props, rocks, crates, docks, houses, stylized trees, UI mock objects, greybox levels, and part-based environment pieces.

Claude should not pretend it can magically create and upload arbitrary FBX/OBJ mesh assets by itself. Real mesh imports still go through Studio Importer or Asset Manager, and uploaded meshes/textures must have real Roblox asset IDs before scripts can reference them.

## Recommended workflow

```text
Claude Code writes blueprint/module files
        ↓
Rojo syncs them into Studio
        ↓
Studio Command Bar or dev plugin calls generator
        ↓
Generator creates a Model in Workspace/GeneratedModels
        ↓
Developer reviews, tweaks, saves, exports, or keeps blueprint as source of truth
```

## Source of truth options

### Option A: Blueprint-as-code

Best for repeatable procedural assets.

- Store model descriptions in Luau modules.
- Generate Roblox Instances from primitives.
- Keep the blueprint in Git.
- Regenerate assets whenever needed.

Good for:

- low-poly ships;
- modular houses;
- docks;
- rocks;
- crates;
- stylized trees;
- blockout islands;
- NPC placeholder rigs;
- collision volumes.

### Option B: `.rbxmx` model files

Best for hand-authored complex Studio models.

- Build or import the model in Studio.
- Export it as `.rbxmx` or `.rbxm`.
- Sync it through Rojo.

Good for:

- final hand-polished models;
- models with many Studio-authored details;
- assets that are easier to edit visually.

### Option C: External mesh import

Best for true mesh geometry.

- Create or obtain `.fbx`, `.obj`, or supported model files outside Studio.
- Import through Studio Importer or Asset Manager.
- Use resulting `MeshPart.MeshId` and `TextureID` only after the assets exist.

Claude may generate placeholder MeshPart code, but it must not invent working `MeshId` values.

## Claude behavior for 3D model requests

When the user asks for a Roblox 3D model, Claude should ask internally:

1. Is this a primitive/procedural model or a true mesh?
2. Is the project Rojo-based, Studio-only, or hybrid?
3. Should the output be a generator script, a blueprint module, a plugin button, or an `.rbxmx` export workflow?
4. What scale should the model use?
5. Should parts be anchored, welded, grouped, or physics-enabled?
6. Should it include collision boxes, seats, prompts, attachments, or named sockets?
7. What manual Studio test steps prove the model spawned correctly?

## Naming conventions

Generated models should use consistent names:

```text
Workspace/GeneratedModels/<ModelName>
ReplicatedStorage/Shared/GeneratedModels/Blueprints/<ModelName>Blueprint
ReplicatedStorage/Shared/GeneratedModels/ProceduralModelBuilder
ServerStorage/GeneratedModelSources/<optional rbxmx exports>
```

## Model quality checklist

- Clear scale in studs.
- Named parts.
- PrimaryPart set when appropriate.
- Anchored during preview unless physics is intended.
- Collision simplified when visual detail is high.
- Materials and colors consistent with art direction.
- Folders for visual parts, collision parts, attachments, prompts, and constraints.
- No per-frame scripts inside static props.
- No large union/mesh assumptions unless assets exist.

## Low-poly style guidance

For stylized Roblox games, prefer:

- simple silhouettes;
- large readable shapes;
- limited color palettes;
- bevel-like illusion with smaller accent parts;
- named sockets for gameplay systems;
- modular pieces that can be reused.

Do not overbuild tiny details that will not be visible in-game.

## Studio Command Bar spawn example

After Rojo syncs the builder and blueprint into `ReplicatedStorage`, the developer can run a small command in Studio Command Bar:

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local builder = require(ReplicatedStorage.Shared.GeneratedModels.ProceduralModelBuilder)
local blueprint = require(ReplicatedStorage.Shared.GeneratedModels.Blueprints.LowPolyShipBlueprint)

local folder = workspace:FindFirstChild("GeneratedModels") or Instance.new("Folder")
folder.Name = "GeneratedModels"
folder.Parent = workspace

builder.Build(blueprint, folder, CFrame.new(0, 8, 0))
```

## Plugin option

For repeated use, Claude can create a dev-only Studio plugin script that adds a toolbar button. The plugin should call the same generator modules. The plugin script must only be used inside Studio plugin context, because the `plugin` global is not available in normal game scripts.

## Safety rule

Procedural generation files are developer tools, not gameplay authority. Do not put secret keys, admin powers, or exploit-sensitive live gameplay decisions in client-accessible generator modules.
