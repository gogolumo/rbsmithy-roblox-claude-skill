--!strict
-- File: ReplicatedStorage/Shared/<Feature>Types.lua
-- Purpose: Shared types, constants, and pure helpers for <feature>.

local FeatureTypes = {}

export type FeatureAction = "ExampleAction" | "Cancel"

export type ExamplePayload = {
    ClientTime: number?,
}

export type FeatureUpdate = {
    Status: string,
}

FeatureTypes.Actions = {
    ExampleAction = "ExampleAction" :: FeatureAction,
    Cancel = "Cancel" :: FeatureAction,
}

function FeatureTypes.IsValidAction(action: unknown): boolean
    return action == FeatureTypes.Actions.ExampleAction or action == FeatureTypes.Actions.Cancel
end

function FeatureTypes.IsExamplePayload(payload: unknown): boolean
    if typeof(payload) ~= "table" then
        return false
    end

    local tablePayload = payload :: { [string]: unknown }
    local clientTime = tablePayload.ClientTime

    return clientTime == nil or typeof(clientTime) == "number"
end

return FeatureTypes
