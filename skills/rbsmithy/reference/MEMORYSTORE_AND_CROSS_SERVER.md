# MemoryStore and cross-server systems

Use this file for matchmaking, queues, cross-server events, temporary leaderboards, server reservations, auction-style systems, global bosses, and other live state that must be shared between servers.

## DataStore vs MemoryStore

Use **DataStore** for durable player data:

- inventory;
- currency;
- quest progress;
- unlocked cosmetics;
- save slots;
- permanent progression.

Use **MemoryStore** for temporary live data:

- matchmaking queues;
- server discovery;
- temporary cross-server cooldowns;
- global event state;
- short-lived leaderboard cache;
- server reservation coordination.

Do not use MemoryStore as permanent storage. MemoryStore data expires.

## Data structures

### Queue

Use for ordered processing:

- matchmaking requests;
- party queue;
- dungeon queue;
- background jobs.

### Sorted map

Use when ordering matters:

- temporary leaderboard;
- server list ordered by player count;
- auction items by expiry time;
- global event score ranking.

### Hash map

Use for quick key-value lookups:

- live server metadata;
- short-lived party information;
- temporary locks;
- shared state cache.

## Cross-server rules

- Use TTL/expiration for every temporary entry.
- Remove processed queue items.
- Shard queues/maps when throughput becomes a risk.
- Store compact values; do not put large player profiles in MemoryStore.
- Assume MemoryStore calls can fail or throttle.
- Use retries with backoff, but do not block gameplay forever.
- Never put secrets in MemoryStore.

## Claude output requirements

For cross-server features, include:

1. why MemoryStore is needed;
2. chosen data structure;
3. key naming convention;
4. TTL rules;
5. retry/backoff plan;
6. fallback behavior;
7. abuse/throttle cases;
8. server-only code paths.
