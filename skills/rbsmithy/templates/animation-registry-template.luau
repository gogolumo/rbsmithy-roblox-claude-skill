--!strict

local AnimationRegistry = {
    Player = {
        Sprint = "rbxassetid://0", -- Replace with real uploaded animation ID.
    },
    NPC = {
        Idle = "rbxassetid://0",
        Talk = "rbxassetid://0",
    },
    Combat = {
        LightAttack = "rbxassetid://0",
    },
}

table.freeze(AnimationRegistry)
return AnimationRegistry
