# Procedural Modeling with Rojo

## Goal

Let Claude Code create repeatable Roblox 3D assets by writing Luau source files that Rojo syncs into Studio.

## Workflow

```text
Claude Code edits blueprint + builder modules
rojo serve default.project.json
Studio Rojo plugin syncs files
Command Bar or plugin runs builder
Model appears in Workspace/GeneratedModels
```

## What Claude can generate well

- Low-poly ships.
- Stylized houses.
- Docks and piers.
- Rocks and cliffs.
- Trees and plants.
- Crates, barrels, signs, props.
- Greybox islands and levels.
- Collision boxes and attachment sockets.

## What should use mesh import instead

- Organic characters.
- Highly detailed creatures.
- Sculpted weapons/tools with complex curves.
- Rigged/skinned meshes.
- PBR texture-heavy assets.

## Exporting generated models

After a model is generated and reviewed in Studio, the developer may:

- keep it in the place file;
- move it to ServerStorage/ReplicatedStorage;
- export it as `.rbxmx` for Rojo sync;
- keep only the blueprint as the editable source of truth.
