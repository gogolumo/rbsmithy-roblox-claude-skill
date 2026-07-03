# Ship and Vehicle System Blueprint

## Purpose

Create multiplayer ships/vehicles with stable movement, seats, steering, wind/sail state, damage, docking, and HUD integration.

## Server responsibilities

- Own ship health, ownership, docking, cargo, and important state.
- Validate helm access.
- Replicate ship state.
- Decide damage and sinking.

## Client responsibilities

- Input steering while seated/authorized.
- Local camera and HUD.
- Local effects such as sail flutter, spray, and minor camera sway.

## Shared modules

- `ShipTypes`
- `ShipDefinitions`
- `RemoteContracts`

## Required remotes

- `RequestHelmControl` client -> server.
- `ShipInput` client -> server, rate limited.
- `ShipStateSnapshot` server -> client.
- `ShipDamaged` server -> clients.

## Movement guidance

- Do not move the ship only from a LocalScript.
- Keep input small: throttle, rudder, sail trim, anchor state.
- Server validates who can steer.
- Avoid jitter from multiple scripts fighting for CFrame/physics.
- Use one movement authority per ship.
- Smooth display on clients, but keep gameplay state server-owned.

## Common bugs

- Ship shakes because server and client both force CFrame.
- Helm sends raw target position every frame.
- Anchor is only visual.
- Cargo exists in client UI but not server state.

## Manual tests

1. Solo steer test.
2. Two-player helm permission test.
3. Passenger test.
4. Anchor stop test.
5. Lag assumption test: low input rate still behaves.
6. Sink/respawn/cargo-loss test.
