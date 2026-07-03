# Leaderboard system blueprint

## Purpose
Show rankings without unsafe client authority.

## Server responsibilities
- Own score sources.
- Write durable or temporary scores depending on design.
- Use ordered DataStore for permanent boards or MemoryStore sorted maps for temporary boards.

## Client responsibilities
- Display server-provided board.
- Request refresh with rate limit.

## Abuse checks
- Client cannot submit arbitrary score.
- Scores are derived from validated gameplay.
