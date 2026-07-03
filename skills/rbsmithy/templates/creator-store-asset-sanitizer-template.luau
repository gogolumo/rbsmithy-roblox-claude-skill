--!strict
-- CreatorStoreAssetSanitizer.luau
-- Basic review helper. This does not replace human review.

local CreatorStoreAssetSanitizer = {}

export type Report = {
    scripts: { string },
    remotes: { string },
    parts: number,
    meshParts: number,
    unions: number,
    warnings: { string },
}

function CreatorStoreAssetSanitizer.scan(root: Instance): Report
    local report: Report = {
        scripts = {},
        remotes = {},
        parts = 0,
        meshParts = 0,
        unions = 0,
        warnings = {},
    }

    for _, descendant in root:GetDescendants() do
        if descendant:IsA("Script") or descendant:IsA("LocalScript") or descendant:IsA("ModuleScript") then
            table.insert(report.scripts, descendant:GetFullName())
        elseif descendant:IsA("RemoteEvent") or descendant:IsA("RemoteFunction") then
            table.insert(report.remotes, descendant:GetFullName())
        elseif descendant:IsA("MeshPart") then
            report.meshParts += 1
        elseif descendant:IsA("UnionOperation") then
            report.unions += 1
        elseif descendant:IsA("BasePart") then
            report.parts += 1
        end
    end

    if #report.scripts > 0 then
        table.insert(report.warnings, "Model contains scripts. Review or remove before production use.")
    end

    if #report.remotes > 0 then
        table.insert(report.warnings, "Model contains remotes. Review networking behavior before production use.")
    end

    if report.parts + report.meshParts + report.unions > 500 then
        table.insert(report.warnings, "Model may be heavy. Test performance before duplicating it.")
    end

    return report
end

return CreatorStoreAssetSanitizer
