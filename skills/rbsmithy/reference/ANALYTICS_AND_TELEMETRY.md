# Analytics and telemetry

Use this file when adding measurement to any Roblox feature. Good Roblox development is not only implementation; it is implementation plus proof that players understand and enjoy the feature.

## Core rule

Do not add analytics as an afterthought. For every feature, define telemetry before implementation:

- **Adoption**: did players discover or start using the feature?
- **Completion**: did players finish the intended loop?
- **Drop-off**: where did players quit, reset, close UI, or stop progressing?
- **Economy**: where do resources enter and leave the game?
- **Performance**: did the feature add frame, memory, network, or server cost?

## Roblox AnalyticsService constraints

When using Roblox AnalyticsService, follow these rules:

- Analytics events should be fired from the server.
- Some analytics will not appear while testing in Studio; verify in a published experience.
- Avoid high-cardinality event names. Use custom fields for dimensions such as island, class, quest, enemy family, shop tab, or ship type.
- Keep event names stable. Changing names breaks long-term comparison.
- Do not log personal information or raw chat text.
- Wrap analytics calls with `pcall` so metrics cannot break gameplay.

## Event categories

### Custom events

Use custom events for feature-specific behavior:

- `SprintStarted`
- `ShipBoarded`
- `DialogueStarted`
- `QuestAccepted`
- `QuestCompleted`
- `TreasureDelivered`
- `BossAttemptStarted`
- `TutorialHintClicked`

### Funnel events

Use funnel events for ordered steps:

- onboarding;
- tutorial;
- first quest;
- first shop purchase;
- first ship launch;
- first combat encounter;
- first multiplayer crew flow.

### Economy events

Use economy events for sources and sinks:

- source: quest reward, daily reward, treasure delivery, enemy drop;
- sink: shop purchase, crafting, repair, upgrade, fast travel.

## Feature telemetry checklist

Before finalizing a feature, answer:

1. What is the success metric?
2. What is the failure metric?
3. What is the first-time-player path?
4. What is the repeat-player path?
5. What event proves the player understood the feature?
6. What event proves the player abandoned the feature?
7. Which values need custom fields instead of unique event names?
8. What should never be logged?

## Output expectations for Claude

When analytics are relevant, include:

- event list;
- exact event names;
- where each event fires;
- server/client ownership;
- custom field plan;
- privacy/safety notes;
- published-experience verification steps.
