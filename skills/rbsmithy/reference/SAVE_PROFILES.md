# Save Profiles and Persistent Data

## Purpose

Use this guide for player data systems that persist across sessions: inventory, currency, progression, quest state, unlocked ships, settings, and cosmetics.

## Server ownership

The server owns saved data. The client may request actions, but never sends the full save payload.

Bad flow:

```text
Client sends complete inventory -> server saves it
```

Good flow:

```text
Client requests pickup -> server validates pickup -> server mutates profile -> server saves profile
```

## Profile schema example

```lua
export type PlayerProfile = {
    SchemaVersion: number,
    Currency: number,
    Inventory: { [string]: number },
    Equipped: { [string]: string? },
    Quests: { [string]: QuestSave },
    Settings: {
        MusicVolume: number,
        SfxVolume: number,
    },
    LastSaveUnix: number,
}
```

## Loading flow

1. Player joins.
2. Server attempts to load profile with retries.
3. If no profile exists, create defaults.
4. If profile exists, merge missing defaults.
5. Run migrations if `SchemaVersion` is old.
6. Mark profile as loaded.
7. Only then allow gameplay systems that need saved data.

## Failure rule

If loading fails in a way that risks overwriting real data, do not silently use defaults and save them. Put the player in a safe failure state and ask them to rejoin or retry.

## Save triggers

- periodic autosave;
- important progression moments;
- purchase/reward completion;
- PlayerRemoving;
- BindToClose.

## Session locking concept

For serious projects, use a session-lock strategy so two servers do not edit the same profile at once. If the project is simple, at least document that session locking is missing and risky.

## Migration checklist

- Keep a `SchemaVersion` number.
- Never delete unknown old fields without a migration plan.
- Merge defaults recursively.
- Test old profile -> new profile migration with sample data.
- Do not let the client trigger arbitrary migrations.
