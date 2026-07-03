--!strict
-- File: ReplicatedStorage/Shared/RemoteContracts.lua
-- Purpose: Human-readable remote contracts for server/client boundaries.

local RemoteContracts = {}

export type RemoteContract = {
    Name: string,
    Direction: string,
    Transport: "RemoteEvent" | "RemoteFunction",
    Payload: string,
    ServerValidation: { string },
    Response: string,
}

RemoteContracts.Contracts = {
    InventoryRequest = {
        Name = "InventoryRequest",
        Direction = "Client -> Server",
        Transport = "RemoteEvent",
        Payload = "action: Equip | Unequip | Drop, itemId: string",
        ServerValidation = {
            "player owns itemId",
            "item supports requested action",
            "player is not rate limited",
            "player state allows inventory action",
        },
        Response = "InventoryUpdate RemoteEvent with sanitized inventory snapshot",
    } :: RemoteContract,

    CombatAction = {
        Name = "CombatAction",
        Direction = "Client -> Server",
        Transport = "RemoteEvent",
        Payload = "action: Attack, targetId: string?, clientAim: Vector3?",
        ServerValidation = {
            "weapon is equipped server-side",
            "attack cooldown passed server-side",
            "target is valid and in plausible range",
            "damage is calculated by server",
        },
        Response = "CombatResult RemoteEvent with confirmed hit/miss/result data",
    } :: RemoteContract,
}

return RemoteContracts
