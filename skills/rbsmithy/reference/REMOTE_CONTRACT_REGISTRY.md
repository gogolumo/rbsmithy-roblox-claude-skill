# Remote Contract Registry

## Purpose

A remote contract registry is a source-of-truth document/module that describes every RemoteEvent and RemoteFunction before code uses it.

Use it to prevent chaotic networking, hidden exploit paths, and client/server confusion.

## Core rules

- Every remote must have one owner.
- Every client-to-server remote must validate type, range, permissions, cooldowns, and game state.
- Sensitive remotes must have rate limits.
- The server decides final results.
- Do not let the client choose reward amounts, damage numbers, inventory contents, currency values, quest completion, or save payloads.

## Recommended contract fields

```lua
export type RemoteContract = {
    Name: string,
    Kind: "RemoteEvent" | "RemoteFunction",
    Direction: "ClientToServer" | "ServerToClient" | "Both",
    Owner: "Server" | "Client" | "Shared",
    RateLimitPerSecond: number?,
    Args: { string },
    Returns: { string }?,
    Validation: { string },
    Description: string,
}
```

## Decision guide

Use a `RemoteEvent` when:

- the message is one-way;
- the result can arrive later;
- the client sends input intent;
- the server broadcasts state changes;
- the server tells the client to update UI.

Use a `RemoteFunction` only when:

- a direct request-response flow is truly needed;
- the caller can safely wait;
- the server handler cannot be abused by repeated calls;
- there is a timeout/failure plan.

Avoid RemoteFunctions for combat, spammy input, per-frame systems, physics steering, or anything that may hang gameplay.

## Contract example

```lua
RequestAttack = {
    Name = "RequestAttack",
    Kind = "RemoteEvent",
    Direction = "ClientToServer",
    Owner = "Server",
    RateLimitPerSecond = 8,
    Args = {
        "weaponId: string",
        "attackId: string",
        "clientAimCFrame: CFrame",
    },
    Validation = {
        "player has weapon equipped",
        "attackId exists for weapon",
        "player is alive",
        "cooldown has elapsed on server",
        "target is within server-validated range",
    },
    Description = "Client requests an attack. Server validates cooldown, ownership, hit range, and damage.",
}
```

## Claude behavior

When creating or reviewing networking code, Claude should:

1. identify existing remotes;
2. write or update the remote contract registry;
3. show unsafe remotes first;
4. add validation and rate limits;
5. include Studio multiplayer test steps.
