--!strict
-- File: ServerScriptService/Services/<FeatureService>.lua
-- Purpose: Server-authoritative service for <feature>.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FeatureService = {}

export type Context = {
    -- Add dependencies here, for example:
    -- DataService: any,
}

type PlayerState = {
    LastRequestAt: number,
}

local context: Context? = nil
local stateByPlayer: { [Player]: PlayerState } = {}

local RATE_LIMIT_SECONDS = 0.25

local function getRemotesFolder(): Folder
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if remotes and remotes:IsA("Folder") then
        return remotes
    end

    local newRemotes = Instance.new("Folder")
    newRemotes.Name = "Remotes"
    newRemotes.Parent = ReplicatedStorage
    return newRemotes
end

local function getOrCreateRemote(name: string): RemoteEvent
    local remotes = getRemotesFolder()
    local existing = remotes:FindFirstChild(name)
    if existing then
        assert(existing:IsA("RemoteEvent"), `{name} must be a RemoteEvent`)
        return existing
    end

    local remote = Instance.new("RemoteEvent")
    remote.Name = name
    remote.Parent = remotes
    return remote
end

local featureRequestRemote = getOrCreateRemote("<Feature>Request")
local featureUpdateRemote = getOrCreateRemote("<Feature>Update")

local function getState(player: Player): PlayerState
    local state = stateByPlayer[player]
    if not state then
        state = {
            LastRequestAt = 0,
        }
        stateByPlayer[player] = state
    end
    return state
end

local function isRateLimited(player: Player): boolean
    local state = getState(player)
    local now = os.clock()

    if now - state.LastRequestAt < RATE_LIMIT_SECONDS then
        return true
    end

    state.LastRequestAt = now
    return false
end

local function handleRequest(player: Player, action: unknown, payload: unknown): ()
    if isRateLimited(player) then
        return
    end

    if typeof(action) ~= "string" then
        return
    end

    if typeof(payload) ~= "table" then
        return
    end

    -- Validate action-specific payload here.
    -- Never trust client-owned rewards, damage, currency, or item ownership.

    if action == "ExampleAction" then
        -- Perform server-authoritative logic.
        featureUpdateRemote:FireClient(player, {
            Status = "Accepted",
        })
    end
end

function FeatureService.Init(newContext: Context): ()
    context = newContext
end

function FeatureService.Start(): ()
    featureRequestRemote.OnServerEvent:Connect(handleRequest)

    Players.PlayerRemoving:Connect(function(player: Player)
        stateByPlayer[player] = nil
    end)
end

return FeatureService
