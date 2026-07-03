# Narrative and Dialogue Writing

Use this reference for quests, NPC dialogue, cutscenes, item descriptions, lore, faction voice, and cinematic moments. The goal is to learn from literature, games, and film without copying protected scenes, dialogue, characters, or unique expressions.

## Inspiration rules

Allowed:

- Analyze themes, pacing, emotional structure, conflict, archetypes, tone, and scene function.
- Compare broad patterns such as mystery reveal, mentor warning, tragic backstory, unreliable guide, or faction propaganda.
- Create original dialogue in the project world, with new characters, wording, events, and stakes.
- Use public-domain works more freely, but still adapt to the game world.

Avoid:

- Copying dialogue, scenes, monologues, named characters, plot twists, or exact quest structures from copyrighted games, films, shows, or books.
- Writing “the same as X but in Roblox.” Instead, extract design principles and write a new scene.

## Dialogue quality checklist

Good dialogue usually has:

- A clear hidden want: what each character wants but may not say directly.
- Subtext: the real meaning under the surface words.
- Pressure: time, danger, guilt, debt, fear, hunger, pride, loyalty, or temptation.
- Voice: each NPC sounds different because of culture, job, age, status, belief, and relationship.
- Gameplay function: the player learns what to do, why it matters, and what changes next.
- Choice design: choices reveal personality or intent, not just “yes/no/info.”
- Brevity: Roblox players often skim; strong lines beat long lore dumps.

## Dialogue structure for quests

Use this pattern for interactive NPC conversations:

1. Hook: one sentence that creates curiosity or urgency.
2. Situation: what happened, in plain terms.
3. Personal stake: why this NPC cares.
4. Player role: what the player can do.
5. Choice: accept, question, refuse, bargain, threaten, joke, or ask for lore.
6. Consequence preview: what might happen next.
7. Exit line: a memorable line or practical instruction.

## Deep dialogue prompt pattern

When asked to write dialogue, Claude should ask internally:

```text
What is the scene's purpose?
What does the NPC want?
What is the NPC hiding?
What does the player need to learn?
What emotion should the player feel?
What action should happen after the dialogue?
```

## Voice cards

Create a voice card per important NPC:

```text
Name:
Role:
Faction/culture:
Education/social class:
Belief:
Fear:
Desire:
Speech rhythm:
Forbidden words:
Common metaphors:
How they lie:
How they show kindness:
```

## Branching dialogue design

For Roblox, do not create infinite dialogue trees. Prefer compact nodes:

```text
Greeting
- Ask about quest
- Ask about world
- Ask about reward
- Accept quest
- Leave
```

Each node should update state only through server-owned quest services. Client dialogue UI must not complete quests or grant rewards.

## Tone adaptation examples

Instead of copying a reference, extract a design principle:

```text
Reference feeling: lonely lighthouse keeper in gothic fiction
Design principle: isolation, ritual, fear of the sea, repeated warnings
Original game result: a Lantern Keeper who talks in short, weather-beaten lines and treats the fog like a living debt.
```

## Red flags

- Everyone sounds like the same narrator.
- NPC explains lore for 20 lines before giving the player a goal.
- Choice buttons all lead to the same outcome but pretend to matter.
- Dialogue gives rewards directly from the client.
- Dialogue references copyrighted names or copied scenes.
