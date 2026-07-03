# Game Loops

Use this reference when turning a Roblox game idea into a playable loop. A feature is only valuable when it helps a player understand what to do, why it matters, and what reward pushes them into the next action.

## Core loop format

Write every loop as:

```text
Motivation -> Action -> Risk/Cost -> Reward -> Upgrade/Unlock -> Next Motivation
```

Example adventure loop:

```text
Hear rumor -> Sail to island -> Fight/explore -> Find relic -> Upgrade ship/tool -> Unlock dangerous sea route
```

## Mandatory questions

Before implementing a major system, answer:

- What does the player do in the first 30 seconds?
- What is the repeatable action after 5 minutes?
- What changes after the reward?
- What new decision opens after the reward?
- Is this feature part of the main loop, side loop, social loop, or retention loop?
- What analytics event proves the loop is working?

## Loop types

### Main loop
The main reason the player returns. Examples: explore islands, complete quests, defeat enemies, upgrade ship.

### Progression loop
The long-term ladder. Examples: new ships, tools, skills, cosmetics, regions.

### Social loop
The multiplayer reason to stay. Examples: crew roles, shared ship, boss fights, trading, parties.

### Collection loop
The completionist reason to explore. Examples: badges, discoveries, fish, relics, faction reputation.

## Pushback rule

If a requested feature does not support a loop, Claude should say so and either cut it from the MVP or mark it as a later update.
