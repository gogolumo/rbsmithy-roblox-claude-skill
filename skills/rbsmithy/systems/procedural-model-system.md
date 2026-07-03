# Procedural Model System Blueprint

## Purpose

Generate Roblox Studio models from code using Claude Code + Rojo + Luau. This is for part-based and hybrid models, not automatic FBX upload.

## Server/client responsibility

This is primarily a developer tooling system, not runtime gameplay logic.

- Builder modules may live in `ReplicatedStorage/Shared/GeneratedModels` for easy Studio Command Bar access.
- Dev-only plugin scripts may call the builder.
- Final generated models can be moved to Workspace, ServerStorage, ReplicatedStorage, or exported as `.rbxmx` depending on use.

## Recommended folders

```text
src/shared/GeneratedModels/ProceduralModelBuilder.luau
src/shared/GeneratedModels/Blueprints/LowPolyShipBlueprint.luau
src/shared/GeneratedModels/Blueprints/HarborHouseBlueprint.luau
src/plugin/GeneratedModelSpawner.plugin.luau
```

## Blueprint data

A blueprint should describe:

- model name;
- scale;
- components;
- colors/materials;
- part names;
- CFrames and sizes;
- optional tags/attributes;
- optional sockets/attachments;
- optional collision-only parts.

## Build flow

1. Claude creates or edits a blueprint module.
2. Claude creates or edits the shared builder module.
3. Rojo syncs files into Studio.
4. Developer runs the Command Bar spawn command or clicks plugin button.
5. Model appears under `Workspace/GeneratedModels`.
6. Developer reviews, tweaks, saves, or exports as `.rbxmx`.

## Common bugs

- Trying to use `plugin` global in a normal Script.
- Assuming a generated blueprint creates a real MeshId.
- Overbuilding hundreds of tiny Parts.
- Leaving generated preview parts unanchored.
- No PrimaryPart.
- No clear scale in studs.

## Manual tests

1. Rojo sync completes.
2. Command Bar can `require` the builder and blueprint.
3. Model spawns at requested CFrame.
4. Parts are named and grouped.
5. PrimaryPart exists if model should move.
6. Collision parts are transparent and non-query settings are intentional.
