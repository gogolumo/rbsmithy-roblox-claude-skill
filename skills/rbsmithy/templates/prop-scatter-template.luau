--!strict

local PropScatter = {}

function PropScatter.Scatter(folder: Instance, propTemplate: Instance, positions: { Vector3 }, maxCount: number)
	local count = math.min(#positions, maxCount)
	for i = 1, count do
		local clone = propTemplate:Clone()
		clone:PivotTo(CFrame.new(positions[i]))
		clone.Parent = folder
	end
end

return PropScatter
