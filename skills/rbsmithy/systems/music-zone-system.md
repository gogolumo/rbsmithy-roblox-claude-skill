# Music Zone System Blueprint

## Purpose
Change music/ambience based on regions such as town, ocean, cave, boss arena, or ghost sea.

## Implementation idea
- tag zone parts with CollectionService;
- each zone has attributes: `MusicKey`, `Priority`, `FadeSeconds`;
- client checks local character position at a controlled interval;
- highest-priority active zone wins;
- fade between tracks.

## Avoid
- running expensive per-frame zone checks for many parts;
- hardcoding SoundIds in zone scripts;
- failing to stop old tracks;
- changing boss music from client-only state if boss state is server-owned.
