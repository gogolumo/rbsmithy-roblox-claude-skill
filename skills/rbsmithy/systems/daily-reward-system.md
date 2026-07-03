# Daily reward system blueprint

## Purpose
Reward return visits without making progression feel mandatory or predatory.

## Server responsibilities
- Load player profile.
- Check last claim timestamp.
- Grant reward once per period.
- Save reward state.
- Log economy source event.

## Client responsibilities
- Show eligibility UI.
- Request claim.
- Display result.

## Data schema
- `daily.lastClaimUnix`
- `daily.streak`
- `daily.claimedToday`

## Abuse checks
- Client cannot choose reward.
- Server handles time logic.
- No duplicate claim on reconnect.

## Test steps
- claim once;
- reconnect;
- try claim again;
- simulate next day in test config;
- verify save.
