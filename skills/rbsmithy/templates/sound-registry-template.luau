--!strict

local SoundRegistry = {
    UI = {
        Click = "rbxassetid://0",
        Error = "rbxassetid://0",
    },
    Ship = {
        Creak = "rbxassetid://0",
        AnchorDrop = "rbxassetid://0",
    },
    Combat = {
        Swing = "rbxassetid://0",
        Impact = "rbxassetid://0",
    },
    Ambience = {
        Ocean = "rbxassetid://0",
        Town = "rbxassetid://0",
    },
}

table.freeze(SoundRegistry)
return SoundRegistry
