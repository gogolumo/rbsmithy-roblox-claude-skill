# Interaction System Blueprint

## Purpose

Provide a consistent way for players to interact with NPCs, chests, doors, ships, quest objects, and resources.

## Server responsibilities

- Validate interaction distance and permissions.
- Decide result.
- Mutate state.

## Client responsibilities

- Detect local prompt targets.
- Show key/button prompts.
- Send interaction intent.

## Shared modules

- `InteractionTypes`
- `InteractableDefinitions`

## Common bugs

- Client directly opens chest/rewards item.
- No cooldown on interaction spam.
- Prompt remains after object is destroyed.

## Manual tests

1. Interact with each object type.
2. Spam interaction.
3. Move away before interaction completes.
4. Two-player same chest/door test.
