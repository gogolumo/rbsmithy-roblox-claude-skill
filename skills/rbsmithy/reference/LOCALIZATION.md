# Localization

Use this reference when UI text, dialogue, quests, shops, item names, tutorials, settings, or notifications appear in the game.

## Rule

Do not hardcode player-facing text inside gameplay code for production systems. Use localization keys.

Bad:

```luau
button.Text = "Start Quest"
```

Better:

```luau
button.Text = Localization.get("quest.start")
```

## What must be localizable

- UI buttons and labels
- tutorial text
- quest names and descriptions
- NPC dialogue
- item names and descriptions
- shop text
- error/toast messages
- patch notes shown in-game
- accessibility prompts

## Key naming

Use stable keys, not English text as IDs:

```text
menu.play
menu.settings
quest.lost_beacon.title
quest.lost_beacon.step.find_lantern
item.rusty_sword.name
item.rusty_sword.description
shop.ship_skin.price_label
```

## CSV workflow

Create a localization table CSV for external translators or Creator Hub import/export.

Recommended columns:

```csv
Key,Context,en-us,nl-nl,uk-ua,fr-fr,de-de,es-es
menu.play,Main menu play button,Play,Spelen,Грати,Jouer,Spielen,Jugar
```

## Studio integration

Roblox has built-in localization tables and automatic translations. Claude should support both:

1. **Roblox localization tables** for production;
2. **simple Luau dictionary fallback** for prototypes, tests, and Rojo-managed UI modules.

## Claude behavior

When implementing new UI/dialogue:

- create or update localization keys;
- avoid scattering English strings across controllers;
- include a fallback language;
- include missing-key behavior;
- preserve context notes for translators;
- do not localize internal remote names, datastore keys, or analytics event IDs.

## Common mistakes

- translating config IDs instead of display labels;
- using player-visible text as a datastore key;
- using different keys for the same button across screens;
- forgetting mobile prompt variants;
- localizing text but not images/icons that contain words.
