# Example Gameplay System

## User request

> Plan a ship movement system for a multiplayer open-world Roblox game.

## How Claude should approach it

High-level reasoning:

- Ship input can come from the client, but important ship state and consequences should be server-authoritative.
- Movement should avoid fighting physics every frame with raw CFrame teleports.
- The system needs states: docked, anchored, sailing, damaged, sinking.
- The UI/HUD needs a ship mode.
- Multiplayer test is required.

## Expected output format

```text
Project assumption: Rojo or Studio can both work; here is a Studio layout first.

State model:
Docked -> Anchored -> Sailing -> Damaged -> Sinking -> Respawn

Server owns:
- ship state
- hull health
- docking/anchor state
- treasure loss/sink result

Client owns:
- helm input
- local camera
- ship HUD
- local water/splash effects
```

## Code/file path style

```text
ServerScriptService/Services/ShipService.lua
ReplicatedStorage/Shared/ShipTypes.lua
ReplicatedStorage/Remotes/ShipControlRequest
ReplicatedStorage/Remotes/ShipStateUpdate
StarterPlayer/StarterPlayerScripts/Controllers/ShipController.lua
StarterGui/ShipHud
```

## Test steps

1. Test entering helm.
2. Test raising/lowering anchor.
3. Test sail input.
4. Test two players on one ship.
5. Test player leaves while steering.
6. Test ship damage and sinking.
7. Test respawn/checkpoint behavior.
8. Watch Output for remote spam or physics warnings.
