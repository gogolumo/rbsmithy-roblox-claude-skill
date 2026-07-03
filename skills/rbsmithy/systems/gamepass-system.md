# Game pass system blueprint

## Purpose
Grant persistent entitlements safely.

## Server responsibilities
- Check ownership through Roblox services.
- Cache entitlement during session.
- Apply non-pay-to-win benefits.
- Handle failed ownership checks gracefully.

## Client responsibilities
- Show purchase prompts.
- Update UI after server confirms entitlement.

## Design rule
Prefer cosmetics, slots, private-server convenience, or supporter perks over direct competitive power.
