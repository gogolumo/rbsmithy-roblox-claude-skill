# Roblox development stack

Use this file when upgrading a project to professional file-based development.

## Recommended stack

- **Roblox Studio** for scene editing, testing, asset importing, terrain, animation, and publishing.
- **Rojo** for syncing files between the repository and Roblox Studio.
- **Wally** for Luau packages when appropriate.
- **Selene** for Luau linting.
- **StyLua** for formatting.
- **Aftman** or another tool manager for pinning tool versions.
- **GitHub Actions** for basic CI checks.

## Modes

### Beginner Studio-only

Use Studio hierarchy instructions and full script contents.

### Hybrid

Use Rojo for source code but keep maps/assets in Studio.

### Full Rojo project

Use file-based project structure, project JSON, packages, tooling, CI, and clear asset workflows.

## Upgrade checklist

1. Identify current project mode.
2. Add `default.project.json`.
3. Create `src/server`, `src/client`, `src/shared`.
4. Move reusable code into ModuleScripts.
5. Add lint/format config.
6. Add README with run instructions.
7. Add a minimal GitHub Actions workflow.
8. Keep Studio-only assets documented.

## Claude output requirements

When upgrading tooling, include:

- before/after tree;
- migration steps;
- commands;
- files to create;
- what not to move to Rojo yet;
- rollback plan.
