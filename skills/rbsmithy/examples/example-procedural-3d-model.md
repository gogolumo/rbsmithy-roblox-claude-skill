# Example Procedural 3D Model Request

## User request

> Generate a low-poly ship model directly in Roblox Studio using Claude Code and Rojo.

## How Claude should approach it

Claude should not claim it can automatically create a true imported mesh. It should propose a procedural part-based model unless the user provides real mesh asset IDs.

Claude should:

1. identify the project as Rojo or Studio-only;
2. create/update `ProceduralModelBuilder`;
3. create `LowPolyShipBlueprint`;
4. provide a Command Bar spawn command;
5. include optimization and Studio review steps.

## Expected output format

```text
Files to create:
- src/shared/GeneratedModels/ProceduralModelBuilder.luau
- src/shared/GeneratedModels/Blueprints/LowPolyShipBlueprint.luau

Studio placement:
- ReplicatedStorage/Shared/GeneratedModels/ProceduralModelBuilder
- ReplicatedStorage/Shared/GeneratedModels/Blueprints/LowPolyShipBlueprint
```

## Test steps

1. Start `rojo serve default.project.json`.
2. Connect Rojo plugin in Roblox Studio.
3. Run the provided Command Bar code.
4. Confirm `Workspace/GeneratedModels/LowPolyShip` appears.
5. Check part count, scale, PrimaryPart, Anchored state, and collision.
