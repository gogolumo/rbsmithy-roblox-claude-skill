# Example: Creator Store Asset Workflow

## User request

> I want Claude to check Roblox Creator Store for stylized coastal village assets, use existing models where possible, and generate missing parts with Rojo.

## How Claude should approach it

Claude should not pretend it can directly browse the user's private Studio Toolbox unless that access exists. It should choose one access mode:

- manual Studio Toolbox search;
- Open Cloud search with explicit local credentials;
- placeholder manifest.

## Expected output

```text
Project mode assumption: Rojo-based
Asset kit: StarterCoastalVillageKit
Access mode: Manual Studio Toolbox unless user confirms Open Cloud credentials

Search terms:
- low poly dock
- stylized island rocks
- cartoon palm tree
- wooden fishing hut
- coastal village props

Files to create:
- assets/creator-store-manifest.json
- src/shared/Assets/CreatorStoreManifest.luau
- src/shared/StudioTools/CreatorStoreAssetLoader.luau
- src/shared/StudioTools/CreatorStoreAssetSanitizer.luau

Studio workflow:
1. Search Toolbox > Creator Store.
2. Copy candidate asset IDs.
3. Add candidates to the manifest.
4. Run import command into Workspace/ImportedAssetReview.
5. Review scripts/collision/scale/performance.
6. Move approved assets into ServerStorage/Assets/ApprovedCreatorStoreKits.
7. Generate procedural connectors if the kit has gaps.
```

## Test steps

- Insert one asset into a clean place.
- Scan it for scripts and remotes.
- Walk around it in Play Solo.
- Test with several duplicated copies.
- Replace it with procedural fallback and verify the map still loads.
