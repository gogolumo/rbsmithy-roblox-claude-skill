# Open World and Streaming Blueprint

## Purpose

Plan large Roblox worlds with islands, regions, NPCs, quests, ships, and performance-friendly streaming.

## Server responsibilities

- Own gameplay-critical region state.
- Spawn important NPCs and interactables.
- Validate travel, docking, rewards, and combat.

## Client responsibilities

- Local ambience.
- Region UI.
- Minimap display.
- Non-critical visual effects.

## Design guidance

- Split world into regions.
- Keep each island modular.
- Use CollectionService tags for groups of interactables.
- Avoid one giant workspace script.
- Put region definitions in shared modules.

## Common bugs

- Every NPC and prop has its own heavy script.
- Minimap scans workspace every frame.
- Region loading assumes all objects exist immediately.

## Manual tests

1. Spawn in each region.
2. Travel across boundary.
3. Rejoin in region.
4. Test low graphics/performance assumptions.
5. Confirm important objects work with StreamingEnabled.
