--!strict
-- File: ReplicatedStorage/Shared/RemoteRegistry.lua
-- Purpose: Source-of-truth registry for RemoteEvents and RemoteFunctions.

export type RemoteKind = "RemoteEvent" | "RemoteFunction"
export type RemoteDirection = "ClientToServer" | "ServerToClient" | "Both"
export type RemoteOwner = "Server" | "Client" | "Shared"

export type RemoteContract = {
    Name: string,
    Kind: RemoteKind,
    Direction: RemoteDirection,
    Owner: RemoteOwner,
    RateLimitPerSecond: number?,
    Args: { string },
    Returns: { string }?,
    Validation: { string },
    Description: string,
}

local RemoteRegistry: { [string]: RemoteContract } = {
    RequestExampleAction = {
        Name = "RequestExampleAction",
        Kind = "RemoteEvent",
        Direction = "ClientToServer",
        Owner = "Server",
        RateLimitPerSecond = 5,
        Args = { "targetId: string" },
        Validation = {
            "player is loaded",
            "target exists on server",
            "target is within allowed distance",
            "action cooldown has elapsed on server",
        },
        Description = "Client requests an action. Server validates and decides the result.",
    },
}

return RemoteRegistry
