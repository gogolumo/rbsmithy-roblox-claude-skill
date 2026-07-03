# Matchmaking system blueprint

## Purpose
Match players or parties into crews, dungeons, raids, or ship sessions.

## Server responsibilities
- Validate queue requests.
- Write short-lived queue entries to MemoryStore.
- Remove matched entries.
- Reserve/teleport if needed.
- Handle timeouts.

## Client responsibilities
- Request queue join/cancel.
- Show queue status.
- Accept match if design requires confirmation.

## MemoryStore use
Use queue for ordered matchmaking and hash/sorted map for server metadata.

## Test steps
- single player queue;
- two players queue;
- cancel;
- timeout;
- server restart;
- duplicate queue attempts.
