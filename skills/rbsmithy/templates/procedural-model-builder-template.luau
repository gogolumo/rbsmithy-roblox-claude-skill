--!strict
-- File: ReplicatedStorage/Shared/GeneratedModels/ProceduralModelBuilder.lua
-- Rojo path: src/shared/GeneratedModels/ProceduralModelBuilder.luau
-- Purpose: Builds simple procedural Roblox Models from blueprint modules.

local CollectionService = game:GetService("CollectionService")

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

local ProceduralModelBuilder = {}

local function createPart(component: Component): BasePart
    local part: BasePart

    if component.Shape == "Wedge" then
        part = Instance.new("WedgePart")
    else
        local normalPart = Instance.new("Part")
        if component.Shape == "Ball" then
            normalPart.Shape = Enum.PartType.Ball
        elseif component.Shape == "Cylinder" then
            normalPart.Shape = Enum.PartType.Cylinder
        else
            normalPart.Shape = Enum.PartType.Block
        end
        part = normalPart
    end

    part.Name = component.Name
    part.Size = component.Size
    part.CFrame = component.CFrame
    part.Color = component.Color or Color3.fromRGB(180, 180, 180)
    part.Material = component.Material or Enum.Material.SmoothPlastic
    part.Transparency = component.Transparency or 0
    part.Anchored = if component.Anchored == nil then true else component.Anchored
    part.CanCollide = if component.CanCollide == nil then true else component.CanCollide

    if component.Attributes then
        for key, value in pairs(component.Attributes) do
            part:SetAttribute(key, value)
        end
    end

    if component.Tags then
        for _, tag in ipairs(component.Tags) do
            CollectionService:AddTag(part, tag)
        end
    end

    return part
end

function ProceduralModelBuilder.Build(blueprint: Blueprint, parent: Instance, pivot: CFrame?): Model
    local model = Instance.new("Model")
    model.Name = blueprint.Name

    local primaryPart: BasePart? = nil
    local basePivot = pivot or CFrame.identity

    for _, component in ipairs(blueprint.Components) do
        local part = createPart(component)
        part.CFrame = basePivot * component.CFrame
        part.Parent = model

        if blueprint.PrimaryPartName and component.Name == blueprint.PrimaryPartName then
            primaryPart = part
        end
    end

    if primaryPart then
        model.PrimaryPart = primaryPart
    end

    model.Parent = parent
    return model
end

return ProceduralModelBuilder
