# Roblox Packages and Shared Asset Versioning

Use this reference when creating reusable ships, NPC prefabs, UI windows, interactable props, quest objects, enemy variants, or environment kits.

## Purpose

Packages prevent copy-paste chaos. A package should be treated like a versioned reusable asset with docs and tests.

## Good package candidates

- ship prefab
- NPC rig with interaction prompt
- quest beacon object
- vendor stall
- UI modal window
- reusable enemy model
- resource node
- island prop kit

## Package documentation

Each package should have:

```text
README.md
VERSION.md
CHANGELOG.md
TESTS.md
```

Include:

- purpose;
- dependencies;
- required attributes/tags;
- events/remotes used;
- setup instructions;
- version history;
- upgrade notes.

## Claude behavior

When converting a model/system to a package:

- identify hardcoded references;
- move configuration into attributes/config module;
- remove map-specific assumptions;
- document required children;
- add test checklist;
- warn about package updates affecting all copies.

## Avoid

- packages that contain hidden scripts with unclear behavior;
- packages that require manual random renaming;
- packages with map-specific absolute paths;
- packages without version notes.
