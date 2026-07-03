# Animation System Blueprint

## Purpose
Centralize animation IDs, loading, playback, stopping, and cleanup.

## Server responsibilities
- own gameplay state that triggers important animations;
- validate combat/action states;
- replicate state, not arbitrary client animation requests for authoritative actions.

## Client responsibilities
- play cosmetic animation feedback;
- handle local responsiveness;
- stop tracks on state changes;
- clean up character connections.

## Shared modules
- `AnimationRegistry.luau`
- `AnimationTypes.luau`

## Common states
- Idle
- Walk
- Run
- AttackWindup
- AttackRecover
- Talk
- Gesture
- Stunned

## Tests
- respawn cleanup;
- invalid asset ID handling;
- state transition spam;
- mobile/gamepad action animation triggers.
