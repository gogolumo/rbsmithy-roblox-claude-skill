# Example Code Review

## User request

> Review my Roblox RemoteEvent code for exploits.

## How Claude should approach it

High-level reasoning:

- Security issues come before style.
- Check whether the client controls rewards, damage, item grants, quest completion, or purchases.
- Check argument validation and rate limits.
- Give a verdict and concrete code-level fixes.

## Expected output format

```text
Verdict: Unsafe

Critical issues:
1. Client sends coin amount directly.
2. No typeof validation.
3. No rate limit.
4. No server-side ownership check.

Fix:
Replace RewardRemote(amount) with RequestPickup(coinId), then server validates the coin and grants server-defined reward.
```

## Code/file path style

```text
ServerScriptService/Services/CurrencyService.lua
ReplicatedStorage/Remotes/PickupRequest
```

## Test steps

1. Fire the remote with a string instead of expected value.
2. Fire the remote 100 times quickly.
3. Try to claim a pickup from far away.
4. Try to claim the same pickup twice.
5. Confirm server rejects all invalid attempts.
