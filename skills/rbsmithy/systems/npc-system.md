# NPC System Blueprint

## Purpose

Manage NPC definitions, spawning, interactions, dialogue hooks, vendors, enemies, and ambient behavior.

## Server responsibilities

- Spawn authoritative NPCs when gameplay matters.
- Own NPC health, hostility, quest/vendor state, and rewards.
- Validate interactions by distance and state.

## Client responsibilities

- Show prompts.
- Play local overhead UI/effects.
- Manage local-only ambient NPCs when safe.

## Shared modules

- `NPCDefinitions`
- `NPCTypes`
- `RemoteContracts`

## Common bugs

- Client creates gameplay NPCs that server cannot validate.
- Prompt exists but server does not check distance.
- NPC state is stored in random scripts.

## Manual tests

1. NPC spawns once.
2. Interaction from valid distance.
3. Interaction from invalid distance.
4. NPC death/reward test.
5. Streaming/rejoin test.
