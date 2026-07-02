<p align="center">
  <img src="assets/bloxsmith-banner.png" alt="BloxSmith — Claude Skill for Roblox Game Development" />
</p>
# BloxSmith — Claude Skill for Roblox Game Development

BloxSmith is a production-ready Claude Skill for serious Roblox game development. It helps Claude Code plan, implement, debug, refactor, optimize, and review Roblox games using Luau, Roblox Studio, Rojo, secure multiplayer architecture, DataStores, UI/HUD systems, procedural 3D workflows, Creator Store asset pipelines, QA, analytics, LiveOps, and release management.

This repository is designed for:

1. **Claude Code personal skill** — install once and use across many Roblox projects.
2. **Project-level skill** — commit it inside a Roblox game repository so Claude follows the same engineering rules for the whole project.

## What the skill does

It helps Claude with:

- Roblox Studio and Rojo project structure;
- server/client/shared architecture;
- typed Luau modules;
- RemoteEvent and RemoteFunction contracts;
- multiplayer exploit review;
- DataStore profile systems;
- UI/HUD systems;
- gameplay systems such as inventory, quests, dialogue, combat, ships, NPCs, economy, interactions, and open-world regions;
- Output error diagnosis;
- performance review;
- procedural 3D model generation using Claude Code + Rojo + Roblox Studio;
- Creator Store asset research, manifests, safe import helpers, and asset-kit workflows.
- Internet/open-source research workflows for learning from public docs, tutorials, and GitHub repositories.
- Reference-game mechanic analysis that converts visible gameplay into original Roblox systems without copying protected code/assets.

## What makes it opinionated

The skill pushes back against bad Roblox habits:

- giant scripts;
- trusting the client;
- insecure remotes;
- untyped messy modules with unclear boundaries;
- DataStore code without failure handling;
- no folder structure;
- code without Studio placement instructions;
- code without test steps;
- fake Roblox APIs.




## Internet, open-source, and reference mechanic workflow

The skill can help Claude learn from external sources without turning the project into a copyright/security mess.

Supported sources:

```text
Official Roblox docs
Official Roblox creator-docs GitHub repository
Open-source Roblox/Luau repositories with clear licenses
Tutorials and DevForum examples, after license/quality review
Creator Store assets, through the manifest/import/review workflow
User-owned place files and project exports
Visible gameplay observations from public games
```

Important boundary: public Roblox experiences usually do **not** expose their real source code. The skill must not pretend it can inspect hidden scripts from another game. It can study visible mechanics, videos, screenshots, timing, UI flow, and public/open-source code, then build an original clean-room implementation for your game.

The workflow creates:

```text
/docs/research/source-log.md
/docs/research/mechanic-studies/
THIRD_PARTY_NOTICES.md, when code/assets are actually reused
```

The skill should push back against requests to copy closed-source code, leaked place files, exploit dumps, private repositories, or paid assets without permission. It should instead produce an original typed Luau implementation with proper server authority, Remote contracts, test steps, and attribution notes where needed.

## Creator Store asset workflow

The skill can help Claude use existing Roblox Creator Store assets without turning your game into a pile of random free models.

Supported modes:

```text
Manual Studio mode: user searches Toolbox > Creator Store and provides asset IDs/screenshots
Open Cloud/search mode: Claude Code uses approved local credentials, if configured
Manifest-first mode: Claude creates the asset manifest and search terms before real IDs exist
```

The skill tells Claude to record candidates in a manifest, verify permissions and style fit, load approved IDs into a review folder, inspect scripts/remotes/collision/performance, and generate procedural placeholders when assets are unavailable.

Important limitation: Claude should not claim it can directly browse your private Roblox Studio Toolbox unless the current environment actually provides Studio/browser/API access. It can still prepare search terms, manifests, import commands, and cleanup workflows.

## Procedural 3D model generation

The skill includes a practical workflow for generating Roblox models from code:

```text
Claude Code writes Luau blueprint/builder files
Rojo syncs them into Roblox Studio
Studio Command Bar or a dev plugin runs the generator
Generated Model appears under Workspace/GeneratedModels
```

This works well for part-based low-poly assets, ships, houses, docks, rocks, props, blockout islands, collision boxes, sockets, and placeholders.

Important limitation: this does **not** magically upload FBX/OBJ meshes. True mesh imports still go through Roblox Studio Importer or Asset Manager, and scripts need real Roblox asset IDs before referencing MeshParts.



## v6 production QA workflow

The skill now includes a stronger production layer:

```text
Automated tests → Localization → Experiments → Release checklist → Rollback plan → Accessibility → Animation/audio pipeline → Docs update
```

This means Claude should not only write Luau. It should also help keep the project testable, localizable, releasable, and maintainable.

New supported workflows:

- write TestEZ/Jest Roblox tests for pure modules;
- add regression tests for fixed bugs;
- extract UI/dialogue text into localization keys and CSV tables;
- design A/B experiments with metrics and guardrails;
- prepare release checklists, patch notes, known issues, and rollback plans;
- convert repeated assets into reusable Roblox Packages;
- plan safe Open Cloud automation without exposing secrets;
- review UI accessibility and cross-platform input;
- build animation and audio registries;
- evaluate optional ECS architecture for large entity systems;
- run multi-agent style production reviews;
- update project docs after significant changes.

## Install as a Claude Code personal skill

Copy the skill folder into your personal Claude skills directory:

```bash
mkdir -p ~/.claude/skills
cp -R skills/developing-roblox-games ~/.claude/skills/developing-roblox-games
```

Then restart Claude Code or reload the session.

You can invoke it directly with:

```text
/developing-roblox-games
```

## Install as a project-level skill

Inside a Roblox project repository:

```bash
mkdir -p .claude/skills
cp -R skills/developing-roblox-games .claude/skills/developing-roblox-games
```

Commit it with the project so Claude uses the same Roblox workflow whenever working in that repository.

## Upload/use as a custom skill

If your Claude interface supports custom skill upload, upload the `skills/developing-roblox-games` folder or a ZIP containing that folder. Keep `SKILL.md` at the root of the skill folder.

## Example prompts

- Review my Roblox RemoteEvent code for exploits.
- Create a typed Luau inventory system.
- Fix this Roblox Output error.
- Plan a ship movement system.
- Create a HUD with safe area support.
- Refactor this giant server script.
- Create a DataStore service with migrations.
- Set up a Rojo project structure.
- Debug why my NPC dialogue camera flies away.
- Review my combat system for server authority.
- Generate a low-poly ship model in Roblox Studio using Claude Code and Rojo.
- Create a procedural island blockout with docks, rocks, and spawn points.
- Build a dev-only Studio plugin button that spawns a generated model.
- Find Creator Store assets for a stylized coastal village kit.
- Create a Creator Store asset manifest and safe import command.
- Review an inserted free model for scripts, remotes, collisions, and performance.
- Study this public game mechanic and build an original version for my Roblox project.
- Review this open-source Roblox anti-cheat repo and tell me if we can safely adapt it.
- Analyze this sprint/combat/ship mechanic from a video and create a clean-room implementation.

## Repository structure

```text
skills/developing-roblox-games/
├── SKILL.md
├── reference/
├── systems/
├── playbooks/
├── tooling/
├── templates/
├── prompts/
└── examples/
```

## Limitations

- The skill cannot verify private Roblox project files unless Claude has access to them.
- The skill should not invent Roblox APIs.
- Claude can generate procedural part-based models, but real imported meshes still require Roblox Studio import workflows and real asset IDs.
- Creator Store workflows require manual user-provided IDs/screenshots or explicit API/browser access; the skill must not invent asset IDs.
- Public Roblox games usually expose behavior, not source code; the skill must not claim hidden code access.
- External code/assets require license and permission checks before reuse.
- DataStore examples are templates, not a substitute for full production load testing.
- Security reviews reduce exploit risk but cannot guarantee a game is exploit-proof.

## Contributing

See `CONTRIBUTING.md`.

## License

MIT License.


## v5 production pipeline additions

The v5 update expands the skill from a Roblox coding assistant into a fuller production assistant. It adds guidance and templates for:

- analytics and telemetry;
- funnel and economy event planning;
- LiveOps/update planning;
- fair monetization review;
- MemoryStore and cross-server systems;
- matchmaking, temporary leaderboards, and global events;
- performance budgets and MicroProfiler review;
- UI/UX device testing for PC, mobile, tablet, and gamepad;
- reusable feature packages;
- professional dev stack upgrades;
- game design documents and MVP scope cutting;
- community safety, reports, and filtered user-generated text.

The skill is intentionally opinionated: it should push back against oversized MVPs, pay-to-win design, unsafe user text systems, client-owned purchases, features without analytics, and performance-heavy systems without a budget.

## v7 Final Game Studio Toolkit

v7 adds the final production layer for Roblox game development:

- Vertical Slice Generator for playable MVPs.
- Game Loop Designer and first 5 minutes review.
- Deep original dialogue writing based on structure, subtext, voice cards, and lawful inspiration analysis.
- 3D model art budgets for procedural models, Creator Store assets, and imported meshes.
- Low-end optimization workflow for weak PCs and mobile devices.
- NPC AI director, schedules, enemy spawners, procedural islands, biomes, and prop placement.
- Achievements, badges, party/crew systems, safe debug/admin commands.
- In-game bug reporter, error telemetry, asset dependency graph, content/art bibles.
- Build Doctor project health scoring.

The skill should now behave less like a code prompt and more like a Roblox production assistant: it designs, builds, tests, measures, optimizes, debugs, and cuts scope when needed.
