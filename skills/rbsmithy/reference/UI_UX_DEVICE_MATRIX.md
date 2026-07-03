# UI/UX device matrix

Use this file for HUDs, menus, dialogue, inventory, shop UI, mobile buttons, gamepad support, and responsive layouts.

## Required devices

Claude should design and test for:

- PC keyboard/mouse;
- mobile touch;
- tablet;
- gamepad/console style input;
- small screens;
- ultrawide screens;
- notches/cutouts;
- Roblox top bar and CoreGui overlap.

## Safe area rules

- Use ScreenGui safe-area behavior intentionally.
- Avoid placing critical UI under the Roblox top bar.
- Add UIScale or scale logic for different screen sizes.
- Test chat/player list/backpack overlap when CoreGui is enabled.
- Keep important buttons reachable on mobile.

## Input rules

- Do not hardcode keyboard-only interactions.
- Provide mobile buttons for critical actions.
- Provide gamepad bindings for major actions.
- Use clear input prompts: keyboard key, controller button, mobile icon.
- Hide prompts when action is unavailable.

## UI state modes

Common HUD states:

- on-foot;
- in dialogue;
- in shop/menu;
- in ship/vehicle;
- in combat;
- cinematic/cutscene;
- respawn/death;
- loading/teleport.

## Claude output requirements

For UI tasks, include:

1. device matrix;
2. ScreenGui placement;
3. safe-area plan;
4. input support plan;
5. UI state machine;
6. multiplayer data flow;
7. Studio test checklist.
