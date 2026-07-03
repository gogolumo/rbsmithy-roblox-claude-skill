# Audio Pipeline

Use this reference when adding music, ambience, UI sounds, combat sounds, footsteps, ship sounds, weather, or zone-based audio.

## Audio categories

- UI: clicks, hover, confirm, error
- Player: footsteps, jump, land, damage
- Combat: swing, impact, block, ability
- World: wind, waves, birds, market ambience
- Ship: creak, sail flap, hull damage, anchor
- Music: island theme, boss theme, danger theme

## Registry rule

Do not scatter raw SoundIds. Use a sound registry:

```text
ReplicatedStorage/Shared/Audio/SoundRegistry
```

## Mixing rules

- avoid too many looping sounds;
- avoid loud repeated UI clicks;
- use distance rolloff for 3D sounds;
- clean up one-shot sounds with Debris or pooling;
- separate music, ambience, SFX volumes;
- support user settings for volume categories.

## Claude behavior

When generating audio systems:

- include placeholder IDs;
- do not invent real asset IDs;
- include volume categories;
- include cleanup;
- include zone enter/exit logic for music/ambience;
- include accessibility note for important sound cues.
