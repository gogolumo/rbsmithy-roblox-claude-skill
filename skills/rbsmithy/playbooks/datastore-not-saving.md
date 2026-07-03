# DataStore Not Saving Playbook

## Checklist

- Is API Services enabled in Studio Game Settings?
- Is code running on the server?
- Is the experience published?
- Is the key stable and unique per user?
- Are errors swallowed by `pcall` without logging?
- Is `PlayerRemoving` connected?
- Is `BindToClose` implemented for shutdown?
- Are writes too frequent?
- Is the code saving defaults after a load failure?

## Fix priority

1. Prevent data loss.
2. Log real errors.
3. Add retries/backoff.
4. Add schema defaults/migrations.
5. Add Studio test steps.
