# Example: Studying a Reference Combat Mechanic

## User request

```text
I like the combat in this Roblox game. Study it and add something similar to our open-world adventure game.
```

## Skill behavior

Claude should not claim it can read the hidden code of the public game. Claude should ask for or use visible references: video, screenshots, timing notes, public docs, or an open-source repo if available.

## Expected output

```text
Project mode assumption:
Rojo-based.

Source status:
Public gameplay observation only. No source code access. Inspiration only.

Mechanic breakdown:
- light attack combo;
- short cooldown;
- hitbox in front of character;
- server-side damage;
- client-side animation and camera feedback.

Original implementation:
- src/server/Services/CombatService.luau
- src/client/Controllers/CombatController.luau
- src/shared/Combat/CombatConfig.luau
- src/shared/Networking/RemoteRegistry.luau

Remote contract:
RequestAttack: ClientToServer RemoteEvent
Args: weaponId: string, comboIndex: number, clientTime: number
Validation: cooldown, equipped weapon, range, facing, alive state.

Test steps:
- attack dummy in solo;
- attack another player in local server;
- spam remote and verify rate limit;
- try impossible target distance and verify server rejects it.
```

## What Claude must not do

- copy exact code;
- copy move names;
- use animation IDs from the reference game;
- copy UI/VFX/audio;
- claim hidden source code access.
