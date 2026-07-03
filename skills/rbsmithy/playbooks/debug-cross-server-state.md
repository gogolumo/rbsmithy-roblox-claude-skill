# Cross-server state debug playbook

Use for MemoryStore, matchmaking, global events, temporary leaderboards, or reservations.

## Diagnosis
- Is the bug one server or cross-server?
- Which key/data structure is used?
- What TTL is set?
- Are processed queue items removed?
- Are calls throttling?
- Is there a fallback?

## Output
- likely cause;
- logging points;
- retry/backoff plan;
- safe reproduction steps.
