# Combat System Blueprint

## Purpose

Handle attacks, cooldowns, damage, hit validation, blocking/parrying, and combat UI without trusting the client.

## Server responsibilities

- Validate equipped weapon.
- Enforce cooldowns.
- Validate range and line-of-sight where needed.
- Apply damage.
- Award XP/loot.

## Client responsibilities

- Capture input.
- Play local windup/animation prediction.
- Show cooldown UI.
- Request attack intent.

## Shared modules

- `WeaponDefinitions`
- `CombatTypes`
- `RemoteContracts`

## Required remotes

- `RequestAttack` client -> server.
- `CombatResult` server -> client.
- `PlayCombatEffect` server -> clients.

## Common bugs

- Client sends target and damage amount.
- Server accepts impossible attack rate.
- Hitboxes exist only on client.
- Cooldowns are only UI-side.

## Manual tests

1. Attack with valid weapon.
2. Spam attack remote.
3. Try attacking from too far away.
4. Test two players and NPCs.
5. Reset during attack.
