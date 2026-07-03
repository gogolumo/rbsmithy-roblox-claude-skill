--!strict
-- File: ReplicatedStorage/Shared/GeneratedModels/Blueprints/LowPolyShipBlueprint.lua
-- Rojo path: src/shared/GeneratedModels/Blueprints/LowPolyShipBlueprint.luau
-- Purpose: Example part-based low-poly ship blueprint for procedural generation.

local Blueprint = {
    Name = "LowPolyShip",
    PrimaryPartName = "Hull_Core",
    Components = {
        {
            Name = "Hull_Core",
            Shape = "Block",
            Size = Vector3.new(18, 2, 6),
            CFrame = CFrame.new(0, 1, 0),
            Color = Color3.fromRGB(105, 72, 45),
            Material = Enum.Material.Wood,
            Anchored = true,
            CanCollide = true,
        },
        {
            Name = "Bow_Wedge",
            Shape = "Wedge",
            Size = Vector3.new(6, 2, 6),
            CFrame = CFrame.new(12, 1, 0) * CFrame.Angles(0, math.rad(90), 0),
            Color = Color3.fromRGB(95, 63, 38),
            Material = Enum.Material.Wood,
            Anchored = true,
            CanCollide = true,
        },
        {
            Name = "Stern_Wedge",
            Shape = "Wedge",
            Size = Vector3.new(6, 2, 6),
            CFrame = CFrame.new(-12, 1, 0) * CFrame.Angles(0, math.rad(-90), 0),
            Color = Color3.fromRGB(95, 63, 38),
            Material = Enum.Material.Wood,
            Anchored = true,
            CanCollide = true,
        },
        {
            Name = "Deck",
            Shape = "Block",
            Size = Vector3.new(16, 0.4, 5.2),
            CFrame = CFrame.new(0, 2.25, 0),
            Color = Color3.fromRGB(145, 103, 65),
            Material = Enum.Material.WoodPlanks,
            Anchored = true,
            CanCollide = true,
        },
        {
            Name = "Mast",
            Shape = "Cylinder",
            Size = Vector3.new(0.7, 12, 0.7),
            CFrame = CFrame.new(1, 8, 0) * CFrame.Angles(0, 0, math.rad(90)),
            Color = Color3.fromRGB(92, 61, 38),
            Material = Enum.Material.Wood,
            Anchored = true,
            CanCollide = true,
        },
        {
            Name = "Sail_Main",
            Shape = "Block",
            Size = Vector3.new(0.25, 7, 6),
            CFrame = CFrame.new(1.2, 8, 0),
            Color = Color3.fromRGB(235, 220, 175),
            Material = Enum.Material.Fabric,
            Anchored = true,
            CanCollide = false,
        },
        {
            Name = "HelmSocket",
            Shape = "Ball",
            Size = Vector3.new(0.6, 0.6, 0.6),
            CFrame = CFrame.new(-5.5, 3, 0),
            Color = Color3.fromRGB(70, 45, 28),
            Material = Enum.Material.Wood,
            Anchored = true,
            CanCollide = false,
            Transparency = 0.35,
            Attributes = {
                SocketType = "Helm",
            },
            Tags = { "ShipSocket" },
        },
    },
}

return Blueprint
