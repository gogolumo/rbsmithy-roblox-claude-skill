# Audio System Blueprint

## Purpose
Centralize sound playback for UI, gameplay, combat, ships, environment, and music.

## Server responsibilities
- trigger important replicated sound events where needed;
- validate gameplay state before broadcasting important sounds.

## Client responsibilities
- play local UI and feedback sounds;
- manage music/ambience zones;
- apply user volume settings;
- clean up temporary sounds.

## Shared modules
- `SoundRegistry.luau`
- `AudioSettings.luau`

## Volume categories
- Master
- Music
- Ambience
- SFX
- UI

## Manual tests
- repeated UI clicks do not stack loudly;
- leaving music zone fades out;
- combat sounds clean up;
- user volume settings persist.
