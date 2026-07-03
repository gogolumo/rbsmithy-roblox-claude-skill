# Monetization design

Use this file when designing shops, game passes, developer products, subscriptions, premium benefits, cosmetics, private servers, or paid upgrades.

## Non-negotiable rules

- Do not design scammy, misleading, or manipulative monetization.
- Do not sell direct unfair advantage in PvP or competitive systems.
- Do not hide core gameplay behind surprise paywalls.
- Do not pressure young players with fear-of-missing-out loops.
- Server must process and verify all purchases.
- Never trust the client with purchase rewards.
- Never store product IDs only inside client scripts.

## Good monetization candidates

- cosmetics;
- ship skins;
- emotes;
- pets/companions that are not required for power;
- extra save slots;
- private server features;
- convenience that does not break balance;
- cosmetic battle-pass style progression without gambling;
- supporter badges.

## Risky or usually bad candidates

- paid direct damage boosts;
- paid-only best combat items;
- paid quest completion;
- loot boxes or chance-based rewards;
- paid anti-grind that means the base game is intentionally painful;
- purchases that minors can misunderstand.

## Implementation checklist

For each product:

- product type: game pass, developer product, subscription, paid access, private server, cosmetic;
- product ID storage path;
- server validation path;
- reward idempotency plan;
- DataStore save plan;
- refund/failure behavior;
- analytics event plan;
- balance review.

## Claude output requirements

When monetization is involved, include:

1. fairness review;
2. server purchase flow;
3. product catalog module;
4. reward validation;
5. DataStore persistence;
6. abuse cases;
7. Studio test steps;
8. published-game test notes.
