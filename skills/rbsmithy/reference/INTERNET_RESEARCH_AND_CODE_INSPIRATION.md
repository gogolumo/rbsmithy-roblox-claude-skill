# Internet Research and Code Inspiration

Use this guide when the user wants to learn from public Roblox games, open-source projects, tutorials, Creator Store assets, framework examples, or general internet references.

## Principle

Claude may study ideas, architecture patterns, public documentation, open-source code, tutorial code, and user-provided authorized project files. Claude must not copy proprietary code, leaked place files, ripped assets, decompiled scripts, private game source, or paid assets the user has no right to use.

The goal is **inspired implementation**, not cloning.

Good request:

```text
Study how Roblox melee combat systems usually handle hitboxes, cooldowns, and server validation, then design an original combat system for our game.
```

Bad request:

```text
Copy the exact combat code from this private Roblox game and paste it into mine.
```

## Allowed source categories

Prefer these sources:

1. Official Roblox documentation.
2. Official Roblox Creator Docs GitHub repository.
3. Open-source Roblox/Luau repositories with clear licenses.
4. User-owned Roblox project files, if the user provides them.
5. User-provided code from a collaborator, if they have permission.
6. Tutorial snippets, only after checking their terms/license and rewriting them into project-specific code.
7. Creator Store assets that are permitted for the project and reviewed before use.
8. Playtest observations from public games, described as behavior/mechanics, not extracted code.

## Forbidden source categories

Do not use:

- leaked `.rbxl`, `.rbxlx`, `.rbxm`, `.rbxmx`, or source files;
- decompiled Roblox games;
- exploit tool dumps;
- paid assets the user has not licensed;
- private repositories without permission;
- copied code from another live game unless the user owns it or the license explicitly allows reuse;
- code or assets with unclear origin when the user wants to ship the game commercially.

## Mechanics vs expression

Game mechanics can be studied at a concept level. Exact code, exact UI, exact art, exact names, exact maps, exact character designs, exact animations, exact audio, exact icons, and exact written content should not be copied.

When using a reference game, Claude should extract a neutral design pattern:

```text
Reference observation:
The game uses a stamina-limited dash with short invulnerability and a server-side cooldown.

Original implementation:
Create a dash system with different timings, new animation hooks, server-side cooldown validation, and movement values tuned for this project.
```

## Research output format

When the task uses internet or external references, Claude should produce:

```text
Research scope
Sources checked
What can be reused directly
What must only be used as inspiration
License/permission notes
Mechanic breakdown
Risks
Original implementation plan
Files to create/edit
Test steps
Attribution notes if needed
```

## Source log rule

For any external code or asset reference, create or update a source log:

```text
/docs/research/source-log.md
```

Each entry should record:

- source title/name;
- URL or asset ID when available;
- author/owner;
- license/terms if known;
- date checked;
- what was learned;
- what was copied, if anything;
- attribution requirement;
- risk level.

## Using open-source code

If the source is open-source:

1. Identify the license.
2. Check whether commercial use, modification, distribution, and attribution are allowed.
3. Avoid mixing incompatible licenses into the game repository.
4. Prefer reimplementation unless the license is permissive and the code is small, clean, and useful.
5. Keep attribution files when required.
6. Do not remove copyright headers.

## Studying other Roblox places

Most public Roblox experiences do not expose their source code. Claude should treat them as design references only:

- observe gameplay behavior;
- describe systems at a high level;
- design original equivalents;
- do not claim access to hidden server/client scripts;
- do not use exploit dumps or decompiled code.

If the user provides a place file they own, Claude can analyze its structure and help migrate, refactor, or adapt systems.

## Internet access rule

Claude Code may or may not have internet access. If internet access is unavailable, Claude should:

- ask the user to provide links, code, screenshots, videos, docs, asset IDs, or exported files;
- create a research checklist and source log template;
- avoid inventing source details.

If internet access is available, Claude should cite sources in the final response and still create a source log for the project.
