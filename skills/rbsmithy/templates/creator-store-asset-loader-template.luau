--!strict
-- CreatorStoreAssetLoader.luau
-- Dev-only helper for loading reviewed Creator Store asset IDs into a review folder.
-- Prefer running this from Studio tooling/Command Bar, not in live gameplay.

local AssetService = game:GetService("AssetService")
local Workspace = game:GetService("Workspace")

local CreatorStoreAssetLoader = {}

local REVIEW_FOLDER_NAME = "ImportedAssetReview"

local function getReviewFolder(): Folder
    local existing = Workspace:FindFirstChild(REVIEW_FOLDER_NAME)
    if existing and existing:IsA("Folder") then
        return existing
    end

    local folder = Instance.new("Folder")
    folder.Name = REVIEW_FOLDER_NAME
    folder.Parent = Workspace
    return folder
end

local function removeScriptsIfNotAllowed(root: Instance, scriptsAllowed: boolean)
    if scriptsAllowed then
        return
    end

    for _, descendant in root:GetDescendants() do
        if descendant:IsA("Script") or descendant:IsA("LocalScript") or descendant:IsA("ModuleScript") then
            descendant:Destroy()
        end
    end
end

function CreatorStoreAssetLoader.loadForReview(assetId: number, displayName: string?, scriptsAllowed: boolean?): Instance?
    assert(typeof(assetId) == "number", "assetId must be a number")

    if assetId <= 0 then
        warn("CreatorStoreAssetLoader: assetId is placeholder or invalid")
        return nil
    end

    local success, result = pcall(function()
        return AssetService:LoadAssetAsync(assetId)
    end)

    if not success then
        warn(`CreatorStoreAssetLoader: failed to load asset {assetId}: {result}`)
        return nil
    end

    local loaded = result :: Instance
    loaded.Name = displayName or (`CreatorStoreAsset_{assetId}`)
    removeScriptsIfNotAllowed(loaded, scriptsAllowed == true)
    loaded.Parent = getReviewFolder()

    return loaded
end

return CreatorStoreAssetLoader
