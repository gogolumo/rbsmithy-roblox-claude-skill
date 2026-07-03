# Roblox Code Review

## Verdict

Safe / Mostly safe / Needs changes / Unsafe

## Critical issues

1. Security/data-loss issues first.
2. Runtime-breaking issues second.
3. Performance issues third.
4. Style/maintainability last.

## Findings

### Finding 1: <Title>

- Severity: Critical / High / Medium / Low
- Location: `<file path or Studio path>`
- Problem:
- Why it matters:
- Fix:

```lua
-- patch or safer example
```

## Architecture notes

- Server/client/shared split:
- Remotes:
- DataStore safety:
- UI/state flow:

## Test checklist

- Normal path:
- Bad payload:
- Spam/rate limit:
- Respawn/rejoin:
- Multiplayer:
