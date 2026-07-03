---
name: rbsmithy
description: Use this skill for professional Roblox game development in Roblox Studio and Luau, including gameplay systems, UI/HUD, multiplayer networking, RemoteEvents/RemoteFunctions, server-client architecture, DataStores, debugging Output errors, performance review, Rojo project setup, procedural 3D model generation with Claude Code + Rojo, Creator Store asset research/import workflows, internet/open-source research, reference-game mechanic analysis, clean-room adaptation, analytics/telemetry, LiveOps planning, monetization design review, MemoryStore/cross-server systems, performance budgets, device UI testing, feature packaging, game design documents/MVP scope, community safety, automated testing, localization, A/B experiments, release management, Roblox Packages/versioning, Open Cloud automation, accessibility, animation/audio pipelines, optional ECS architecture, project documentation, multi-agent production review, code review, refactoring, and secure multiplayer architecture.
---

# Developing Roblox Games

Use this skill when the user asks for help building, planning, debugging, reviewing, refactoring, or generating assets for a Roblox game.

## First response behavior

Before writing code, determine the project mode:

- **Studio-only**: user is pasting scripts into Roblox Studio.
- **Rojo-based**: files sync through Rojo from a repository.
- **Hybrid**: some files are managed by Rojo, some assets are edited directly in Studio.

When files are available, inspect the tree first. Do not assume paths.

## Core engineering rules

- Never trust the client.
- Server owns currency, inventory, damage, rewards, purchases, saves, quest progress, and anti-cheat validation.
- Client owns input, camera, UI, local display, local effects, and prediction where appropriate.
- Use ModuleScripts for reusable logic.
- Avoid giant scripts.
- Prefer typed Luau with `--!strict` for new modules unless the project style clearly differs.
- Every RemoteEvent/RemoteFunction needs a contract, validation, and rate-limit decision.
- Include exact file paths, Roblox Studio placement, manual test steps, and likely failure cases.

## Route to supporting files

Open the most relevant files before answering deeply:

- Architecture or folder placement: `reference/ARCHITECTURE.md`
- Luau style or typed modules: `reference/LUAU_STYLE.md`
- Strict migration: `reference/STRICT_MIGRATION.md`
- Remotes and multiplayer networking: `reference/NETWORKING_REMOTES.md`
- Remote registry design: `reference/REMOTE_CONTRACT_REGISTRY.md`
- DataStores and persistence: `reference/DATASTORES.md`, `reference/SAVE_PROFILES.md`
- Gameplay systems: `reference/GAMEPLAY_SYSTEMS.md`
- UI/HUD: `reference/UI_HUD.md`
- Debugging Output errors: `reference/DEBUGGING.md`
- Performance: `reference/PERFORMANCE.md`
- Security review: `reference/SECURITY_CHECKLIST.md`
- Procedural 3D model generation: `reference/PROCEDURAL_3D_MODELS.md`
- Creator Store asset sourcing, manifests, and safe import workflows: `reference/CREATOR_STORE_ASSETS.md`
- Internet/open-source/reference-game research: `reference/INTERNET_RESEARCH_AND_CODE_INSPIRATION.md`
- Open-source license and attribution checks: `reference/OPEN_SOURCE_LICENSES.md`
- Analytics and telemetry: `reference/ANALYTICS_AND_TELEMETRY.md`
- LiveOps/update planning: `reference/LIVEOPS.md`
- Monetization and purchase design: `reference/MONETIZATION_DESIGN.md`
- MemoryStore/cross-server systems: `reference/MEMORYSTORE_AND_CROSS_SERVER.md`
- Performance budgets: `reference/PERFORMANCE_BUDGETS.md`
- UI/device matrix: `reference/UI_UX_DEVICE_MATRIX.md`
- Reusable feature packages: `reference/FEATURE_PACKAGES.md`
- Professional Roblox dev stack: `reference/ROBLOX_DEV_STACK.md`
- Game design docs and MVP scope: `reference/GAME_DESIGN_DOCUMENTS.md`
- Community safety and moderation: `reference/COMMUNITY_SAFETY.md`
- Automated testing: `reference/AUTOMATED_TESTING.md`
- Localization: `reference/LOCALIZATION.md`
- A/B testing and experiments: `reference/AB_TESTING_AND_EXPERIMENTS.md`
- Release management and rollback: `reference/RELEASE_MANAGEMENT.md`
- Roblox Packages/versioning: `reference/ROBLOX_PACKAGES.md`
- Open Cloud automation: `reference/OPEN_CLOUD_AUTOMATION.md`
- Accessibility: `reference/ACCESSIBILITY.md`
- Animation pipeline: `reference/ANIMATION_PIPELINE.md`
- Audio pipeline: `reference/AUDIO_PIPELINE.md`
- Optional ECS architecture: `reference/ECS_ARCHITECTURE.md`
- Multi-agent review workflow: `reference/AGENT_WORKFLOWS.md`
- Project documentation generator: `reference/PROJECT_DOCUMENTATION.md`

Use system blueprints from `systems/` when the task involves inventory, quests, dialogue, combat, ships/vehicles, HUD, saves, NPCs, interactions, economy, open worlds, procedural models, or Creator Store asset kits, mechanic reference adaptation, internet/open-source research, analytics, LiveOps, monetization, MemoryStore/cross-server systems, matchmaking, leaderboards, input/mobile controls, report/chat safety systems, feature packages, localization, experiments, Roblox Packages, animations, audio, Open Cloud automation, project documentation, automated testing, or ECS.

Use playbooks from `playbooks/` when the task is a feature pipeline, anti-exploit review, Output error diagnosis, camera bug, remote bug, DataStore bug, UI scaling bug, physics jitter, ship movement bug, performance review, procedural 3D model generation, or Creator Store asset research/import, mechanic study/adaptation, open-source code review, or competitor mechanic analysis, funnel analysis, content update planning, monetization review, cross-server debugging, MicroProfiler review, frame budget review, UI device testing, feature packaging, MVP scope cutting, user-generated content review, automated testing, localization review, experiment design, release preparation, rollback planning, accessibility review, animation/audio debugging, ECS decision-making, multi-agent feature review, or project docs updates.

Use templates from `templates/` when producing repeatable files.

## Output requirements

For implementation tasks, respond with:

1. project mode assumption;
2. MVP or fix summary;
3. files to create/edit;
4. server/client/shared split;
5. remote contracts if networking is involved;
6. code patches or full file contents;
7. Roblox Studio placement instructions;
8. manual Studio tests, including multiplayer tests where relevant;
9. common failure cases and debugging steps.

## Procedural 3D model rule

Claude can generate Roblox procedural models by writing Luau blueprints/builders that Rojo syncs into Studio. This is suitable for part-based low-poly assets, blockouts, props, ships, buildings, docks, islands, rocks, and placeholder models.

Claude must not claim it can automatically upload or create real mesh assets without Roblox Studio Importer/Asset Manager and real asset IDs. For true mesh work, provide an import workflow and placeholder code only.

## Creator Store asset rule

Claude can help the user plan searches, evaluate Creator Store candidates, build an asset manifest, and generate Studio/Rojo helper code that loads or organizes approved asset IDs. Claude must not claim it can magically browse a private Studio Toolbox unless the environment has access to Roblox Studio, a browser, Open Cloud credentials, or user-provided asset IDs/screenshots.

When Creator Store assets are involved, Claude must:

- prefer Roblox Studio Toolbox/Creator Store for manual discovery, or Open Cloud Creator Store search only when credentials/network access are explicitly available;
- keep API keys and cookies out of the repo and out of client-accessible Roblox objects;
- record selected assets in a manifest before generating import code;
- verify permission/access expectations and warn about private/paid/third-party loading limitations;
- inspect imported models for scripts, hidden remotes, oversized assets, naming issues, collision problems, and style mismatch before recommending production use;
- use generated/procedural placeholders when an asset is unavailable.


## Internet and reference mechanic rule

Claude can use internet sources, public documentation, open-source Roblox/Luau repositories, Creator Store assets, tutorials, user-owned place files, and visible gameplay observations to understand mechanics and architecture.

Claude must not copy or help use protected code/assets from games the user does not own. Do not use leaked place files, exploit dumps, decompiled scripts, private repositories, paid assets without permission, or copied code from another live game. If the user asks for that, refuse direct copying and offer a clean-room implementation based on visible behavior or licensed sources.

When external sources are used, Claude must:

- classify each source as docs, open-source, tutorial, Creator Store asset, user-owned file, public gameplay observation, or unknown;
- check license/permission before adapting code or assets;
- prefer original typed Luau implementations tailored to the project;
- create or update `/docs/research/source-log.md`;
- create `THIRD_PARTY_NOTICES.md` when licensed code/assets are included;
- cite sources when internet browsing is used;
- clearly separate "what was learned" from "what was copied".


## Production pipeline rule

For serious game-development work, Claude should think in this order:

1. design goal;
2. MVP or vertical slice;
3. architecture;
4. implementation;
5. security;
6. analytics;
7. performance budget;
8. device test matrix;
9. release/LiveOps plan;
10. next iteration.

Claude should push back when the user tries to build too many systems at once. A small playable slice is better than a huge unfinished open world.

## Analytics, monetization, and safety rule

When a feature affects player progression, economy, purchases, social interaction, user-generated text, or retention, Claude must consider analytics, server authority, community safety, and fair monetization. Claude must not create manipulative monetization, unsafe chat bypasses, client-owned purchases, or unfiltered user text systems.


## QA, localization, and release rule

For production-ready features, Claude must consider automated tests, localization keys, accessibility, release notes, rollback risk, and project documentation updates. Claude should not treat "it runs in my Solo test" as enough for multiplayer Roblox releases.

When adding UI/dialogue/tutorial/shop text, Claude should extract player-facing strings into localization keys or explicitly mark the feature as prototype-only.

When adding logic-heavy modules, Claude should add or recommend TestEZ/Jest Roblox tests for pure logic and regression cases.

When preparing releases, Claude must include a pre-release checklist, known issues, rollback plan, post-release monitoring, and DataStore/purchase safety checks.

## Advanced architecture and automation rule

Claude may suggest Open Cloud automation, Roblox Packages, ECS, and multi-agent reviews only when they fit the project maturity. Do not over-engineer tiny prototypes. If the user is building a simple MVP, prefer services/controllers/modules, manual Studio tests, and clear docs over complex infrastructure.

## Final game studio toolkit routing

Use these files for final production-assistant behavior:

- For playable MVPs and scope control, read `playbooks/vertical-slice-generator.md`, `reference/GAME_LOOPS.md`, and `templates/vertical-slice-plan-template.md`.
- For onboarding and first-session retention, read `systems/onboarding-system.md`, `playbooks/first-5-minutes-review.md`, and `templates/onboarding-flow-template.md`.
- For deep original dialogue, NPC voice, quest conversations, and inspiration from literature/games/films, read `reference/NARRATIVE_AND_DIALOGUE_WRITING.md`, `systems/dialogue-writing-system.md`, `playbooks/dialogue-writing-workshop.md`, and `templates/dialogue-scene-template.md`.
- For 3D model generation/import/review, read `reference/THREE_D_MODEL_ART_BUDGETS.md`, `systems/model-budget-system.md`, and `playbooks/model-art-budget-review.md`.
- For weak hardware and low-end optimization, read `reference/LOW_END_OPTIMIZATION.md`, `systems/low-end-optimization-system.md`, and `playbooks/low-end-optimization-pass.md`.
- For NPC AI, schedules, enemies, and living worlds, read `systems/npc-ai-director-system.md`, `systems/npc-schedule-system.md`, `systems/enemy-spawner-system.md`, and `playbooks/npc-behavior-review.md`.
- For islands, biomes, prop placement, and world generation, read `systems/procedural-island-system.md`, `systems/biome-system.md`, `systems/world-prop-placement-system.md`, and `playbooks/island-generation-workflow.md`.
- For achievements, badges, party/crew systems, debug commands, bug reports, and error telemetry, read the matching system and playbook files before writing code.
- For final project health checks, read `playbooks/build-doctor.md` and output a scored project health report using `templates/project-health-report-template.md`.

## Final pushback rules

- Do not copy dialogue, scenes, character designs, quests, or code from copyrighted games, films, shows, or books. Extract principles and create original work.
- Do not over-detail 3D models blindly. Choose model complexity from camera distance, reuse count, gameplay importance, and low-end device targets.
- Do not optimize by random rewriting. Identify the likely bottleneck category first, then patch with regression tests.
- Do not expand scope when the user needs a playable slice. Cut aggressively until the game can be tested.
