--!strict
-- File: ReplicatedStorage/Shared/GeneratedModels/Blueprints/<ModelName>Blueprint.lua
-- Rojo path: src/shared/GeneratedModels/Blueprints/<ModelName>Blueprint.luau
-- Purpose: Data-only procedural model blueprint. This creates Parts, not external mesh uploads.

export type ComponentShape = "Block" | "Ball" | "Cylinder" | "Wedge"

export type Component = {
    Name: string,
    Shape: ComponentShape,
    Size: Vector3,
    CFrame: CFrame,
    Color: Color3?,
    Material: Enum.Material?,
    Transparency: number?,
    CanCollide: boolean?,
    Anchored: boolean?,
    Tags: { string }?,
    Attributes: { [string]: string | number | boolean }?,
}

export type Blueprint = {
    Name: string,
    PrimaryPartName: string?,
    Components: { Component },
}

local Blueprint: Blueprint = {
    Name = "<ModelName>",
    PrimaryPartName = "Root",
    Components = {
        {
            Name = "Root",
            Shape = "Block",
            Size = Vector3.new(4, 1, 4),
            CFrame = CFrame.new(0, 0.5, 0),
            Color = Color3.fromRGB(120, 90, 60),
            Material = Enum.Material.Wood,
            Anchored = true,
            CanCollide = true,
        },
    },
}

return Blueprint
