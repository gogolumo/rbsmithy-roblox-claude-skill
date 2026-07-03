# Procedural 3D Model Generation Playbook

Use this when the user asks Claude to create Roblox 3D models, props, buildings, ships, islands, greyboxes, or blockouts using Claude Code and Rojo.

## First decision

Claude must distinguish between:

1. **Procedural part-based model** — Claude can generate this directly as Luau blueprints/builders.
2. **Rojo-synced `.rbxmx` model** — Claude can explain/export workflow and include files, but the model is usually created or exported from Studio.
3. **External mesh asset** — Claude can prepare placeholders and import instructions, but cannot invent valid MeshIds or bypass Roblox import/moderation.

## Required output for procedural assets

1. Model goal and art style.
2. Stud scale.
3. Folder/file paths.
4. Blueprint module.
5. Builder module or update instructions.
6. Command Bar spawn command or plugin button setup.
7. Studio review checklist.
8. Optimization notes.

## Folder paths

Rojo mode:

```text
src/shared/GeneratedModels/ProceduralModelBuilder.luau
src/shared/GeneratedModels/Blueprints/<ModelName>Blueprint.luau
src/plugin/GeneratedModelSpawner.plugin.luau
```

Studio-only mode:

```text
ReplicatedStorage/Shared/GeneratedModels/ProceduralModelBuilder
ReplicatedStorage/Shared/GeneratedModels/Blueprints/<ModelName>Blueprint
```

## Pushback rules

Claude must push back if the user asks for:

- "perfect" mesh generation with no imported asset pipeline;
- made-up MeshIds;
- huge detailed meshes created from thousands of Parts;
- runtime procedural generation for static art without a reason;
- a plugin script that uses `plugin` outside plugin context.

## Test steps

1. Start Rojo server.
2. Open Studio and connect Rojo plugin.
3. Confirm modules appear in ReplicatedStorage.
4. Run Command Bar spawn command.
5. Inspect generated model hierarchy.
6. Confirm scale, PrimaryPart, Anchored settings, and part count.
7. Move final model to correct game folder or export as `.rbxmx`.
