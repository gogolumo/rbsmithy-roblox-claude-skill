# Server reservation system blueprint

## Purpose
Coordinate private sessions, dungeon instances, or crew voyages.

## Server responsibilities
- Create session metadata.
- Store temporary reservation state.
- Teleport players through server-side flow.
- Clean up expired sessions.

## Client responsibilities
- Show session status.
- Confirm readiness.

## Failure cases
- teleport failure;
- expired reservation;
- party member disconnect;
- MemoryStore throttle.
