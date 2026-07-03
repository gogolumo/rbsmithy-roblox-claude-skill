-- Studio Command Bar template
-- Purpose: Spawn a procedural model after Rojo syncs the builder and blueprint into ReplicatedStorage.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local generatedModels = ReplicatedStorage:WaitForChild("Shared"):WaitForChild("GeneratedModels")
local builder = require(generatedModels:WaitForChild("ProceduralModelBuilder"))
local blueprint = require(generatedModels:WaitForChild("Blueprints"):WaitForChild("LowPolyShipBlueprint"))

local folder = workspace:FindFirstChild("GeneratedModels")
if not folder then
    folder = Instance.new("Folder")
    folder.Name = "GeneratedModels"
    folder.Parent = workspace
end

builder.Build(blueprint, folder, CFrame.new(0, 8, 0))
