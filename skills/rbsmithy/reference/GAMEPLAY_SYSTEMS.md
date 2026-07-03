# Gameplay Systems

## Feature planning checklist

For any gameplay feature, define:

1. Player fantasy: what should it feel like?
2. State: what data exists?
3. Authority: server, client, or shared?
4. Inputs: keyboard, mobile, gamepad, proximity prompt, UI button?
5. Outputs: animation, sound, UI, world change, saved progress?
6. Multiplayer: how do other players see it?
7. Persistence: what needs saving?
8. Failure: what happens if the player leaves, dies, disconnects, or spams input?
9. Test: how to verify in Studio and multiplayer test.

## State machines

Use state machines for features with modes:

- ship: `Docked`, `Anchored`, `Sailing`, `Damaged`, `Sinking`;
- combat: `Idle`, `Windup`, `Active`, `Recovery`, `Stunned`;
- dialogue: `Closed`, `Opening`, `Active`, `ChoicePending`, `Closing`;
- quest: `Locked`, `Available`, `Active`, `ReadyToTurnIn`, `Completed`.

Keep transitions explicit:

```lua
local AllowedTransitions = {
    Idle = { Windup = true, Stunned = true },
    Windup = { Active = true, Stunned = true },
    Active = { Recovery = true, Stunned = true },
    Recovery = { Idle = true },
    Stunned = { Idle = true },
}
```

## Cooldowns

Cooldowns must be enforced on the server for sensitive actions. Client cooldowns are only UX.

Server cooldown example:

```lua
local lastAttackAt: { [Player]: number } = {}
local ATTACK_COOLDOWN = 0.6

local function canAttack(player: Player): boolean
    local now = os.clock()
    local last = lastAttackAt[player]
    if last and now - last < ATTACK_COOLDOWN then
        return false
    end
    lastAttackAt[player] = now
    return true
end
```

## Combat hit validation

The client can request an attack, but the server decides damage.

Validate:

- player has weapon equipped server-side;
- attack is within cooldown;
- target exists;
- target is within plausible range;
- target is alive and damageable;
- player state allows attacking;
- damage comes from server item stats, not client payload.

Client can handle:

- input;
- animations;
- camera shake;
- local hit feel;
- hitmarker UI after server confirmation.

## Quest systems

Recommended split:

```text
Shared QuestDefinitions: static quest data.
Server QuestService: owns active/completed progress and rewards.
Client QuestController: displays tracker and sends interaction requests.
```

Do not let the client claim completion without server verification.

Quest definition example:

```lua
return {
    LostBeacon = {
        Id = "LostBeacon",
        Name = "The Lost Beacon",
        Objectives = {
            { Type = "VisitLocation", LocationId = "OldLighthouse" },
            { Type = "TalkToNpc", NpcId = "KeeperMara" },
        },
        Rewards = {
            Coins = 100,
            Items = { "BeaconCharm" },
        },
    },
}
```

## Inventory systems

Server owns:

- item grants/removals;
- stack limits;
- equip validation;
- capacity;
- trading;
- persistence.

Client owns:

- inventory UI;
- drag/drop visuals;
- hotbar selection request;
- display sorting/filtering.

Never accept `GiveItem` from a normal client remote.

## Interaction prompts

Use ProximityPrompt for simple world interactions when appropriate. For custom interactions, the server should still validate distance and object state.

Validation examples:

- object exists;
- object is tagged as interactable;
- player character exists;
- distance is within threshold;
- object is not already used/locked;
- player meets requirements.

## Vehicles and ships

For ship/vehicle systems:

- decide who owns physics/network ownership;
- server validates high-level state and important results;
- client can provide input direction/throttle;
- smooth visuals locally, but do not let client grant rewards or teleport the ship freely;
- use constraints and forces carefully;
- add damping to reduce jitter;
- test with two players and simulated latency.

Ship states example:

```text
Docked -> Boarding -> Anchored -> Sailing -> Damaged -> Sinking -> Respawn
```

## NPC dialogue

Recommended split:

```text
DialogueDefinitions shared module
DialogueService server module
DialogueController client module
DialogueCameraController client module
DialogueGui in StarterGui
```

Server validates:

- NPC exists;
- player is close enough;
- dialogue node is valid;
- choice requirements are met;
- rewards/quest updates are legal.

Client handles:

- camera framing;
- typewriter effect;
- choice buttons;
- input lock if desired;
- UI transitions.

If the camera flies away, check:

- wrong CFrame direction;
- using world position instead of NPC head position;
- anchoring to a moving part incorrectly;
- updating camera before character/NPC exists;
- not restoring `CameraType` after dialogue.

## Progression systems

Progression should be server-owned:

- XP;
- levels;
- unlocks;
- achievements;
- skill points;
- quest progress;
- region unlocks.

Client can request actions but cannot decide progression.

## Answer expectations

For gameplay systems, output:

- feature goal;
- server/client/shared split;
- state model;
- remotes and validation;
- data persistence if needed;
- file paths or Studio placement;
- implementation steps;
- test plan;
- edge cases.
