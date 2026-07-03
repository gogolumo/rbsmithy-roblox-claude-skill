# Asset Sourcing System Blueprint

Use this blueprint when a Roblox game needs external assets from Creator Store, user inventory, uploaded meshes, or procedural placeholders.

## Purpose

Create a repeatable asset pipeline so the game can use existing Creator Store assets without turning the project into a messy folder full of random free models.

## Server responsibilities

- Own gameplay-critical asset spawning decisions.
- Never trust a client-sent asset ID for production spawning.
- Keep approved asset IDs in a server/shared manifest.
- Validate requested kit names against the manifest.
- Use server-owned storage for assets that affect gameplay.

## Client responsibilities

- Display previews, UI icons, local decorations, and placement ghosts.
- Request approved asset kit placement by kit ID, not arbitrary asset ID.
- Never decide rewards, costs, inventory additions, or permanent placement alone.

## Shared modules

Recommended modules:

```text
src/shared/Assets/CreatorStoreManifest.luau
src/shared/Assets/AssetKitTypes.luau
src/shared/Assets/AssetTags.luau
```

Optional server module:

```text
src/server/Services/AssetKitService.luau
```

Optional Studio tooling module:

```text
src/shared/StudioTools/CreatorStoreAssetLoader.luau
```

## Required remotes

Only create remotes if players can request asset placement in-game. For dev-only Studio importing, use Command Bar or plugin tooling instead.

Example remote contract:

```text
RequestPlaceAssetKit
Direction: ClientToServer
Kind: RemoteEvent
Args: kitId: string, placementCFrame: CFrame
Validation: kit exists, player has permission, placement is inside allowed zone, rate limited.
```

## Data schema

If the game persists placed objects, save logical placement data, not the whole imported model:

```lua
{
    placedAssets = {
        { kitId = "CoastalDock01", position = { x = 0, y = 5, z = 20 }, rotationY = 90 },
    },
}
```

## Folder placement

Studio-only:

```text
ReplicatedStorage/Assets/CreatorStoreManifest
ServerStorage/Assets/ImportedKits
ServerScriptService/Services/AssetKitService
Workspace/PlacedAssets
```

Rojo:

```text
src/shared/Assets/CreatorStoreManifest.luau
src/server/Services/AssetKitService.luau
src/client/Controllers/AssetPreviewController.luau
```

## Minimal implementation plan

1. Define the asset kit brief.
2. Search Creator Store manually or through approved Open Cloud workflow.
3. Record candidates in a manifest.
4. Insert candidates into a scratch place.
5. Review scripts, hierarchy, scale, collision, and performance.
6. Approve or reject each candidate.
7. Generate a manifest module from approved candidates.
8. Create import/spawn tooling.
9. Add tags and placement conventions.
10. Playtest with fallback procedural assets.

## Common bugs

- Asset ID points to the wrong asset type.
- Asset cannot load because the experience does not have permission.
- Imported model contains scripts that run unexpectedly.
- Model scale is wildly wrong.
- Collision blocks players.
- Asset is too heavy for mobile.
- Asset hierarchy changes when inserted through Toolbox vs loaded by script.

## Manual test steps

- Insert asset in a clean test place first.
- Inspect all descendants in Explorer.
- Search descendants for scripts and unknown remotes.
- Play Solo and walk around the object.
- Test local server with two players if the object affects gameplay.
- Check performance with several copies.
- Remove the asset and verify procedural fallback still works.

## Upgrade path

- Start with manifest JSON.
- Convert stable kits into typed Luau manifest modules.
- Add a dev-only Studio plugin for spawning approved kits.
- Add preview thumbnails and placement ghosts.
- Replace rough Store assets with custom/procedural or owned polished assets over time.
