# NPC Dialogue System Blueprint

## Purpose

Create NPC conversations with camera framing, choices, quest hooks, and safe server validation.

## Server responsibilities

- Validate dialogue start distance.
- Validate choice availability.
- Trigger quest/shop/reward actions.

## Client responsibilities

- Camera framing.
- Typewriter text.
- Choice buttons.
- Input locking only while needed.
- Local UI transitions.

## Shared modules

- `DialogueDefinitions`
- `DialogueTypes`
- `RemoteContracts`

## Required remotes

- `RequestStartDialogue` client -> server.
- `DialogueSessionStarted` server -> client.
- `RequestDialogueChoice` client -> server.
- `DialogueSessionEnded` server -> client.

## Camera rules

- Do not teleport player unless explicitly requested.
- Prefer rotating NPC/player to face each other.
- Compute camera from NPC head/root position plus a stable offset.
- Avoid offsets based on the wrong character side.
- Restore camera mode on exit.

## Manual tests

1. Talk to NPC from correct distance.
2. Try from too far away.
3. Choose each branch.
4. Reset character mid-dialogue.
5. Confirm camera restores after goodbye.
