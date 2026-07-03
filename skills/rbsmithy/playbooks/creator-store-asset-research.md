# Creator Store Asset Research Playbook

Use this when the user wants Claude to check Creator Store assets, build with existing models, or combine Store assets with procedural generation.

## Step 1 — Clarify the asset kit

Do not search randomly. First define:

- game style;
- asset purpose;
- scale;
- whether it is decoration, gameplay object, UI, audio, plugin, or mesh;
- target platform/performance level;
- whether scripts are allowed.

## Step 2 — Choose access mode

Use one of these:

### A. User-guided Studio Toolbox mode

Tell the user to open Roblox Studio > Toolbox > Creator Store, search the terms, inspect assets, then provide asset IDs or screenshots.

### B. Claude Code/Open Cloud mode

Only use this if credentials/network access are actually configured. Never commit tokens or cookies. Put local scripts under `tools/` and read keys from environment variables.

### C. Manifest placeholder mode

If no search access exists, create a manifest with placeholder `assetId: 0` entries and exact search terms for the user to fill in.

## Step 3 — Candidate scoring

Score each candidate 1–5:

| Criterion | Meaning |
| --- | --- |
| Style | Matches art direction |
| Scale | Fits avatars/world |
| Modularity | Can be reused in multiple places |
| Performance | Reasonable parts/meshes/effects |
| Safety | No unreviewed scripts or suspicious objects |
| Permissions | Expected to load in this experience |

Reject assets that fail safety or permissions, even if they look good.

## Step 4 — Manifest before code

Before generating loader code, create or update:

```text
assets/creator-store-manifest.json
```

or:

```text
src/shared/Assets/CreatorStoreManifest.luau
```

## Step 5 — Safe Studio import

For manual workflow:

1. Insert asset into a scratch place.
2. Inspect descendants.
3. Remove or review scripts.
4. Rename and organize the hierarchy.
5. Move approved assets into project storage.
6. Save a clean copy as `.rbxmx` only if the project workflow supports it.

For code-assisted workflow:

1. Load only approved manifest IDs.
2. Wrap loading in `pcall`.
3. Parent to a temporary review folder first.
4. Sanitize if appropriate.
5. Move to final folder after review.

## Step 6 — Combine with procedural generation

If Store assets are incomplete, Claude should generate missing compatible parts:

- sockets/connectors;
- collision boxes;
- signs;
- placeholder buildings;
- docks/bridges;
- rocks/foliage clusters;
- kitbash connectors;
- labels and debug markers.

## Output format

For asset research requests, answer with:

1. asset kit brief;
2. search terms;
3. filters/categories;
4. candidate manifest table;
5. safe import workflow;
6. Rojo/Studio placement;
7. cleanup checklist;
8. fallback procedural plan.
