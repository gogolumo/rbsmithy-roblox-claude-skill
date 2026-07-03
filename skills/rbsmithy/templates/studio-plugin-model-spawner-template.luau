--!strict
-- File: src/plugin/GeneratedModelSpawner.plugin.luau
-- Purpose: Studio plugin template that spawns a generated model from a synced blueprint.
-- Important: This file only works in Roblox Studio plugin context. The `plugin` global does not exist in normal game scripts.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local toolbar = plugin:CreateToolbar("Generated Models")
local spawnButton = toolbar:CreateButton(
    "Spawn Model",
    "Spawn the selected procedural model blueprint into Workspace/GeneratedModels.",
    ""
)

local function getGeneratedFolder(): Folder
    local existing = workspace:FindFirstChild("GeneratedModels")
    if existing and existing:IsA("Folder") then
        return existing
    end

    local folder = Instance.new("Folder")
    folder.Name = "GeneratedModels"
    folder.Parent = workspace
    return folder
end

spawnButton.Click:Connect(function()
    local generatedModels = ReplicatedStorage:WaitForChild("Shared")
        :WaitForChild("GeneratedModels")

    local builder = require(generatedModels:WaitForChild("ProceduralModelBuilder"))
    local blueprintsFolder = generatedModels:WaitForChild("Blueprints")

    -- Replace this with the blueprint you want to spawn.
    local blueprint = require(blueprintsFolder:WaitForChild("LowPolyShipBlueprint"))

    local parent = getGeneratedFolder()
    builder.Build(blueprint, parent, CFrame.new(0, 8, 0))
end)
