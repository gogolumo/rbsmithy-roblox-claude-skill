# Seasonal event system blueprint

## Purpose
Add temporary content without hardcoding dates everywhere.

## Server responsibilities
- Own event calendar/config.
- Enable event rewards and spawns.
- Save participation.
- Disable expired content safely.

## Client responsibilities
- Show event UI.
- Display timers.
- Play cosmetic effects.

## Config fields
- event id;
- start/end timestamp;
- rewards;
- locations;
- analytics tags;
- rollback flag.

## Test steps
- before event;
- during event;
- after event;
- late join;
- server restart.
