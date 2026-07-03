-- Paste into Roblox Studio Command Bar after Rojo syncs the modules.
-- This is a dev-only import/review command. Do not run arbitrary asset IDs from players.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Loader = require(ReplicatedStorage.Shared.StudioTools.CreatorStoreAssetLoader)
local Sanitizer = require(ReplicatedStorage.Shared.StudioTools.CreatorStoreAssetSanitizer)

local assetId = 0 -- Replace with reviewed Creator Store asset ID
local model = Loader.loadForReview(assetId, "ReviewedCreatorStoreAsset", false)

if model then
    local report = Sanitizer.scan(model)
    print("Imported asset scan report:")
    print("Parts:", report.parts, "MeshParts:", report.meshParts, "Unions:", report.unions)
    print("Scripts:", #report.scripts, "Remotes:", #report.remotes)
    for _, warning in report.warnings do
        warn(warning)
    end
end
