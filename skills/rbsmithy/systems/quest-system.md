# Quest System Blueprint

## Purpose

Track quest state, objectives, rewards, and UI progress with server authority.

## Server responsibilities

- Own quest progress.
- Validate objective completion.
- Award rewards once.
- Save quest state.

## Client responsibilities

- Display quest log/tracker.
- Send interaction intent, not completion proof.
- Play local UI feedback after server confirmation.

## Shared modules

- `QuestDefinitions`
- `QuestTypes`
- `RemoteContracts`

## Required remotes

- `QuestSnapshot` server -> client.
- `QuestUpdated` server -> client.
- `RequestStartQuest` client -> server.
- `RequestClaimQuestReward` client -> server.

## Common bugs

- Client directly fires “CompleteQuest”.
- Rewards can be claimed twice.
- Objective progress is not saved.
- Quest definitions use magic strings in many scripts.

## Manual tests

1. Start quest from NPC.
2. Progress an objective on server.
3. Rejoin and verify progress remains.
4. Attempt reward claim twice.
5. Test two players on same quest independently.
