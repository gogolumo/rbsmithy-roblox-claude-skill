# Output Error Diagnosis Playbook

Use this when the user pastes a Roblox Output error.

## Steps

1. Extract the exact error message.
2. Extract script path and line number.
3. Identify whether it is server, client, plugin, or command bar context.
4. Identify the missing value or wrong type.
5. Trace where it should have been created.
6. Suggest the smallest fix first.
7. Include a diagnostic print only if useful.
8. Include Studio test steps.

## Common patterns

- `attempt to index nil` → missing instance, bad path, replication timing, wrong variable name.
- `Infinite yield possible on WaitForChild` → object path wrong or created later than expected.
- `is not a valid member` → wrong class/path or Studio hierarchy mismatch.
- `Module code did not return exactly one value` → bad ModuleScript return.
- Remote handler parameter mistakes → remember OnServerEvent first arg is `player`.
