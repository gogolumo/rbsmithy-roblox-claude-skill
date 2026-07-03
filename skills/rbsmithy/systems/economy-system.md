# Economy System Blueprint

## Purpose

Handle currency, shops, prices, rewards, and purchases safely.

## Server responsibilities

- Own currency.
- Validate purchases.
- Apply price rules.
- Save final results.

## Client responsibilities

- Display shop UI.
- Request purchase by item ID only.
- Never choose price or reward amount.

## Shared modules

- `ShopDefinitions`
- `ItemDefinitions`
- `EconomyTypes`

## Common bugs

- Client sends price.
- Client sends currency balance.
- Race condition: two purchases spend the same currency.
- Shop data duplicated in UI and server differently.

## Manual tests

1. Buy valid item.
2. Buy without enough currency.
3. Spam buy button.
4. Leave/rejoin after purchase.
