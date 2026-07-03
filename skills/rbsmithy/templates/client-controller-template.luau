--!strict
-- File: StarterPlayer/StarterPlayerScripts/Controllers/<FeatureController>.lua
-- Purpose: Client controller for input, UI, camera, and local display for <feature>.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local FeatureController = {}

type Connection = RBXScriptConnection

type ControllerState = {
    Started: boolean,
    Connections: { Connection },
}

local state: ControllerState = {
    Started = false,
    Connections = {},
}

local remotes = ReplicatedStorage:WaitForChild("Remotes")
local featureRequestRemote = remotes:WaitForChild("<Feature>Request") :: RemoteEvent
local featureUpdateRemote = remotes:WaitForChild("<Feature>Update") :: RemoteEvent

local function addConnection(connection: Connection): ()
    table.insert(state.Connections, connection)
end

local function sendExampleRequest(): ()
    featureRequestRemote:FireServer("ExampleAction", {
        ClientTime = os.clock(),
    })
end

local function handleUpdate(payload: unknown): ()
    if typeof(payload) ~= "table" then
        return
    end

    -- Update UI/local display from sanitized server data.
end

function FeatureController.Init(): ()
    -- Connect UI references here if needed.
end

function FeatureController.Start(): ()
    if state.Started then
        return
    end
    state.Started = true

    addConnection(featureUpdateRemote.OnClientEvent:Connect(handleUpdate))

    addConnection(UserInputService.InputBegan:Connect(function(input: InputObject, gameProcessed: boolean)
        if gameProcessed then
            return
        end

        if input.KeyCode == Enum.KeyCode.E then
            sendExampleRequest()
        end
    end))
end

function FeatureController.Stop(): ()
    for _, connection in state.Connections do
        connection:Disconnect()
    end
    table.clear(state.Connections)
    state.Started = false
end

return FeatureController
