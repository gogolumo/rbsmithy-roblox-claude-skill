# Roblox Security Checklist

## Threat model

Assume a client can:

- call any RemoteEvent or RemoteFunction visible to it;
- send wrong types;
- send huge values;
- send values very quickly;
- pretend to own items;
- lie about position or target;
- bypass local UI restrictions;
- read anything replicated to the client.

## Remote validation

For every client-to-server remote, check:

- Are argument types validated?
- Are allowed enum/string values checked?
- Are numeric ranges checked?
- Is the player state checked server-side?
- Is the target/object checked server-side?
- Is there rate limiting?
- Is the remote split by purpose instead of one giant `MainRemote`?
- Does the server calculate rewards/damage/prices?

## Currency and inventory protection

Unsafe:

```lua
CoinsRemote.OnServerEvent:Connect(function(player, amount)
    addCoins(player, amount)
end)
```

Safe design:

- client requests an action, not a reward;
- server validates action;
- server calculates reward;
- server updates data;
- server sends sanitized update.

Example:

```text
Client: RequestPickup(coinInstanceId)
Server: checks coin exists, nearby, not already picked up
Server: grants server-defined coin value
Server: sends new coin total to client
```

## Cooldown enforcement

Client cooldowns are cosmetic. Server cooldowns are required for:

- attacks;
- abilities;
- shop purchases;
- interactions;
- trading;
- vehicle actions;
- quest turn-ins;
- placement/building.

## Combat sanity checks

Check:

- equipped weapon server-side;
- cooldown server-side;
- target distance;
- target alive/damageable;
- attacker state;
- team/friendly-fire rules;
- server-side damage values;
- no client-sent damage amount.

## Purchase handling caution

For real-money developer products or game passes, be extra careful. Do not grant products only because a client says it bought something. Use the official Roblox purchase processing flow and server-side receipt handling.

If unsure, Claude should check official Roblox documentation instead of inventing purchase code.

## DataStore safety

Check:

- server-side only;
- no saving if load failed;
- no blind defaults over possible existing saves;
- `pcall` around calls;
- retries/backoff;
- migrations;
- bounded shutdown saves;
- no client-sent full data tables.

## Secrets

Never place secrets in:

- `ReplicatedStorage`;
- `StarterPlayerScripts`;
- `StarterGui`;
- ModuleScripts required by the client;
- Attributes visible to clients;
- Remote payloads.

Roblox game code should generally avoid external API secrets unless handled through a secure backend you control.

## Exploit review output format

When reviewing code, use:

```text
Verdict: Unsafe / Mostly safe / Safe with minor fixes

Critical issues:
1. ...

Concrete fixes:
- Replace client-sent amount with server-calculated amount.
- Add typeof checks.
- Add per-player cooldown.
- Verify player ownership server-side.

Exploit tests:
- Fire remote with wrong type.
- Fire remote 100 times quickly.
- Fire remote with item the player does not own.
- Fire remote from too far away.
```

## Pushback rules

Push back when the user wants:

- client-owned currency;
- client-owned combat damage;
- client-owned inventory grants;
- one giant universal remote with no validation;
- DataStore saves based on client tables;
- hidden values stored in client-readable locations;
- no test plan.
