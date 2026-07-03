--!strict
-- CreatorStoreManifest.luau
-- Keep approved Creator Store assets in one place. Do not scatter raw asset IDs through gameplay scripts.

export type AssetEntry = {
    name: string,
    assetId: number,
    assetType: "Model" | "Mesh" | "Decal" | "Audio" | "Plugin" | "Other",
    source: "Creator Store" | "Owned Upload" | "Procedural" | "Placeholder",
    creator: string?,
    usage: string,
    reviewStatus: "placeholder" | "candidate" | "approved" | "rejected",
    scriptsAllowed: boolean,
    permissionNotes: string?,
    cleanupNotes: { string }?,
}

export type AssetKit = {
    style: string,
    status: "draft" | "review" | "approved",
    assets: { AssetEntry },
}

local CreatorStoreManifest: { [string]: AssetKit } = {
    ExampleCoastalVillageKit = {
        style = "stylized low-poly coastal village",
        status = "draft",
        assets = {
            {
                name = "Example Dock Pack",
                assetId = 0, -- Replace after manual Creator Store review.
                assetType = "Model",
                source = "Creator Store",
                creator = nil,
                usage = "dock blockout and decoration",
                reviewStatus = "placeholder",
                scriptsAllowed = false,
                permissionNotes = "Verify this asset can be used by the experience creator/group.",
                cleanupNotes = {
                    "Inspect all descendants",
                    "Remove or review scripts",
                    "Check collision",
                    "Set pivot",
                    "Rename hierarchy",
                },
            },
        },
    },
}

return CreatorStoreManifest
