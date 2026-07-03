# Creator Store Workflow with Roblox Studio, Claude Code, and Rojo

This guide explains how to let Claude help with Creator Store assets without pretending it has magic Studio access.

## Recommended workflow

```text
1. Claude creates asset brief and search terms
2. User searches Studio Toolbox > Creator Store, or Claude Code uses approved Open Cloud search
3. Candidate assets are recorded in a manifest
4. Claude generates loader/organizer code from the manifest
5. Rojo syncs code into Studio
6. User runs dev-only Command Bar/plugin action
7. Imported assets are reviewed and cleaned
8. Approved assets become part of the game kit
```

## Manual Studio Toolbox path

Use this when no API credentials are configured.

1. Open Roblox Studio.
2. Open Toolbox.
3. Go to Creator Store.
4. Search the terms Claude gives you.
5. Inspect the asset page/details.
6. Copy asset ID or provide screenshot/name/link to Claude.
7. Insert into a scratch place first, not directly into production map.
8. Run the cleanup checklist.

## Claude Code/Open Cloud path

Use this only when the user has explicitly configured credentials and understands that secrets stay local.

Suggested local-only folder:

```text
tools/creator-store-search/
```

Rules:

- Read API keys from environment variables.
- Never commit `.env`.
- Never place API keys in `ReplicatedStorage`, `StarterPlayer`, `StarterGui`, or any client-readable place.
- Store only selected public metadata and approved asset IDs in the repo.
- If API access fails, fall back to manual Toolbox mode.

## Rojo placement

Recommended files:

```text
src/shared/Assets/CreatorStoreManifest.luau
src/shared/StudioTools/CreatorStoreAssetLoader.luau
src/shared/StudioTools/CreatorStoreAssetSanitizer.luau
```

Recommended Studio folders after Rojo sync:

```text
ReplicatedStorage/Assets/CreatorStoreManifest
ReplicatedStorage/Shared/StudioTools/CreatorStoreAssetLoader
Workspace/ImportedAssetReview
ServerStorage/Assets/ApprovedCreatorStoreKits
```

## Asset loading note

Prefer `AssetService:LoadAssetAsync()` for modern code-assisted loading when the experience has permission/settings for the asset. Older examples may use `InsertService:LoadAsset()`, but Claude should explain permission limitations and wrap calls in `pcall`.

## Safe folder policy

Use a temporary review folder first:

```text
Workspace/ImportedAssetReview
```

Do not insert unreviewed Creator Store assets directly into:

```text
Workspace/FinalMap
ServerScriptService
StarterPlayerScripts
StarterGui
```

## Production policy

Once an asset is approved:

- save a clean copy;
- remove unwanted scripts;
- standardize names;
- set pivots;
- set collision;
- tag important parts;
- document source and asset ID;
- test in local multiplayer if it affects gameplay.
