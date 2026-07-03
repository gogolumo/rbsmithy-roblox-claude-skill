# Analytics system blueprint

## Purpose
Centralize feature telemetry so gameplay code does not scatter raw AnalyticsService calls everywhere.

## Server responsibilities
- Own all analytics logging.
- Validate player and event input.
- Wrap calls in `pcall`.
- Provide typed helper methods for core events.
- Avoid logging personal information.

## Client responsibilities
- Request UI/action events only when needed.
- Never directly own analytics truth.
- Send minimal intent signals to server.

## Suggested modules
- `src/server/Services/AnalyticsService.server.luau`
- `src/shared/Analytics/AnalyticsEvents.luau`
- `src/shared/Analytics/AnalyticsTypes.luau`

## Common events
- onboarding step started/completed;
- quest accepted/completed;
- shop opened/purchase attempted;
- ship boarded/launched/sunk;
- combat encounter started/ended;
- tutorial hint used.

## Test steps
- In Studio, verify code does not error.
- In a published private test place, verify events populate after Roblox delay.
- Check that client cannot spoof reward/economy analytics.
