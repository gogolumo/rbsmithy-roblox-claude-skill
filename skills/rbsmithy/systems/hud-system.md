# HUD System Blueprint

## Purpose

Create responsive Roblox HUDs for health, stamina, currency, quickbar, minimap, ship state, dialogue, and prompts.

## Server responsibilities

- Own values behind HUD: health, currency, inventory, quest state, ship state.
- Send snapshots or replicate attributes where appropriate.

## Client responsibilities

- Build and update ScreenGui.
- Handle safe area/insets and UIScale.
- Switch HUD modes: on-foot, dialogue, ship, helm, inventory, modal.

## Shared modules

- `HudTypes`
- `UITheme`
- `RemoteContracts`

## Structure

```text
StarterGui/MainHUD
StarterPlayer/StarterPlayerScripts/Controllers/HudController
ReplicatedStorage/Shared/UI/UITheme
ReplicatedStorage/Shared/UI/HudTypes
```

## Common bugs

- UI overlaps topbar or mobile safe area.
- Server creates player UI directly.
- HUD updates every frame even when value did not change.
- Dialogue and ship HUD both visible at once.

## Manual tests

1. Desktop resolution test.
2. Small window test.
3. Mobile emulator/safe area test.
4. Dialogue mode hides gameplay HUD.
5. Helm mode hides quickbar if required.
