# Global event system blueprint

## Purpose
Coordinate temporary live events across servers.

## Server responsibilities
- Read active event state.
- Update contribution totals safely.
- Cache briefly.
- Handle MemoryStore failure without crashing gameplay.

## Client responsibilities
- Show event status.
- Display contribution feedback.

## Examples
- global boss progress;
- community treasure goal;
- timed storm event;
- rotating merchant.
