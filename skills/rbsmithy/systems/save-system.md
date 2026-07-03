# Save System Blueprint

## Purpose

Persist player profile data safely.

## Server responsibilities

- Load profile.
- Own all mutations.
- Run migrations.
- Save with retries.
- Handle PlayerRemoving and BindToClose.

## Client responsibilities

- Display save/loading status.
- Never send full save payload.

## Shared modules

- `ProfileTypes`
- `DefaultProfile`
- `MigrationDefinitions`

## Common bugs

- Saving default profile after load failure.
- Trusting client save data.
- No profile loaded checks.
- No schema version.
- Too many writes during rapid item changes.

## Manual tests

1. New player profile.
2. Existing profile load.
3. Migration from old data sample.
4. Leave/rejoin.
5. Studio API services enabled check.
