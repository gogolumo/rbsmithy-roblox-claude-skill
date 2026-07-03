# Creator Store Assets

Use this reference when the user wants Claude to find, compare, adapt, import, or build around existing Roblox Creator Store assets.

## Honest capability model

Claude should never pretend it has direct access to the user's Roblox Studio Toolbox unless the current environment actually exposes it. There are three valid modes:

1. **Manual Studio mode** — the user searches the Creator Store tab in Roblox Studio Toolbox, then provides asset IDs, screenshots, names, links, or copied model details.
2. **Open Cloud/search mode** — Claude Code or another automation has explicit network access and credentials for Roblox Open Cloud Creator Store endpoints. Credentials must never be committed.
3. **Manifest-first mode** — Claude designs a desired asset kit, then the user/automation fills in selected asset IDs later.

If none of these are available, Claude should create a research plan and a placeholder procedural model instead of inventing asset IDs.

## What Creator Store can provide

Useful asset categories include:

- model packs;
- meshes;
- decals and textures;
- materials;
- audio and ambience;
- plugins;
- UI elements;
- VFX-style props and effects;
- scripts only after careful review.

Avoid blindly inserting code-heavy free models. Treat third-party scripts as untrusted until reviewed.

## Asset sourcing pipeline

For every requested asset kit, Claude should produce:

1. **Asset brief** — what the game needs and what style constraints matter.
2. **Search queries** — neutral Creator Store search terms.
3. **Selection criteria** — art style, scale, performance, permissions, script safety, collision, modularity.
4. **Candidate table** — asset name, creator, asset ID, type, intended use, concerns.
5. **Manifest** — the approved asset IDs and usage notes.
6. **Import/spawn code** — only for manifest-approved assets.
7. **Post-import cleanup checklist** — inspect hierarchy, scripts, collisions, pivots, tags, naming, scale, and performance.
8. **Fallback plan** — procedural placeholder if loading fails or asset permission is unavailable.

## Search query rules

Good search terms are style/function based:

- `low poly dock`
- `stylized island rocks`
- `cartoon palm tree`
- `wooden fishing hut`
- `pirate ship prop` only when the game context is fantasy/adventure and the result is reviewed as age-appropriate
- `medieval market stall`
- `cozy village house`
- `ocean ambience`
- `cartoon UI icons`

Do not rely on one perfect asset. Build a kit from compatible small assets.

## Selection criteria

Claude should score assets against:

- **Style fit** — does it match the game art direction?
- **Scale fit** — Roblox avatars and doors must make sense.
- **Performance** — avoid huge unions, excessive parts, too many particles, or heavy meshes.
- **Modularity** — individual props are easier to reuse than one giant scene model.
- **Hierarchy quality** — clear names, primary part/pivot, organized folders.
- **Collision quality** — no invisible collision walls unless intended.
- **Script safety** — no hidden scripts unless reviewed.
- **Permissions/loading** — asset must be usable by the game creator/group.
- **Attribution/license notes** — follow Creator Store terms and creator requirements.

## Manifest-first workflow

Never scatter raw asset IDs through gameplay scripts. Keep them in a single manifest module or JSON file.

Example manifest fields:

```json
{
  "version": 1,
  "kits": {
    "StarterCoastalVillage": {
      "style": "stylized low-poly coastal village",
      "assets": [
        {
          "name": "Example Dock Pack",
          "assetId": 0,
          "type": "Model",
          "source": "Creator Store",
          "creator": "Unknown until selected",
          "usage": "dock blockout",
          "status": "placeholder",
          "notes": "Replace 0 with a real asset ID after manual review."
        }
      ]
    }
  }
}
```

## Loading/importing assets

Prefer these approaches:

- **Studio Toolbox manual insert** for quick prototyping.
- **Asset Manager** for uploaded/imported assets owned by the project.
- **AssetService:LoadAssetAsync** for approved assets when the experience has permission and the required settings.
- **InsertService:LoadAsset** only when needed for older workflows and only with permission/access checks.
- **Procedural placeholders** when no asset can be loaded reliably.

Always wrap asset loading in `pcall` because network/permission/loading failures are normal.

## Third-party asset loading warning

Some assets load only when they are owned by the creator/group, shared with the creator, owned by Roblox, or allowed by the experience settings. If the user wants to load public free Creator Store assets dynamically, Claude should explain that Studio/experience settings and Roblox permissions affect whether the asset loads.

## Post-import safety checklist

After inserting a Creator Store model, inspect it before using it:

- Delete or review all `Script`, `LocalScript`, and unknown `ModuleScript` descendants.
- Check for hidden RemoteEvents, BindableEvents, or suspicious require patterns.
- Rename parts/modules to match project conventions.
- Move models into the correct folder, usually `ReplicatedStorage/Assets`, `ServerStorage/Assets`, or `Workspace` for placed world objects.
- Add CollectionService tags if the gameplay system needs them.
- Set PrimaryPart or pivot intentionally.
- Verify collision groups and CanCollide settings.
- Test in Play Solo and local multiplayer server if relevant.
- Replace asset with procedural fallback if it is too heavy or unreliable.

## How Claude should respond

For Creator Store tasks, use this format:

1. project mode assumption;
2. desired asset kit;
3. search terms and filters;
4. candidate manifest fields;
5. safe import/load workflow;
6. Rojo/Studio placement;
7. post-import review checklist;
8. fallback procedural generation plan.
