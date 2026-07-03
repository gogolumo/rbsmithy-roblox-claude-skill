--!strict
-- RBSmithy Roblox Part Model Factory
-- Run from ServerScriptService/DevTools or Studio Command Bar for prototype assets.

local Workspace = game:GetService("Workspace")

local function makePart(name: string, size: Vector3, cf: CFrame, color: Color3, material: Enum.Material, parent: Instance): Part
    local part = Instance.new("Part")
    part.Name = name
    part.Size = size
    part.CFrame = cf
    part.Color = color
    part.Material = material
    part.Anchored = true
    part.CanCollide = true
    part.TopSurface = Enum.SurfaceType.Smooth
    part.BottomSurface = Enum.SurfaceType.Smooth
    part.Parent = parent
    return part
end

local model = Instance.new("Model")
model.Name = "RBSmithy_PrototypeAsset"
model.Parent = Workspace

local primary = Color3.fromRGB(95, 55, 150)

local root = makePart(
    "Root_Blockout",
    Vector3.new(8, 2, 4),
    CFrame.new(0, 3, 0),
    primary,
    Enum.Material.SmoothPlastic,
    model
)

model.PrimaryPart = root

print("Generated RBSmithy prototype asset:", model:GetFullName())
