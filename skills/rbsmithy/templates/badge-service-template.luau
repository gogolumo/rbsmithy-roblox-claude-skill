--!strict

local BadgeService = game:GetService("BadgeService")

local BadgeAwarder = {}

function BadgeAwarder.TryAward(player: Player, badgeId: number): boolean
	local ok, hasBadge = pcall(function()
		return BadgeService:UserHasBadgeAsync(player.UserId, badgeId)
	end)
	if not ok or hasBadge then
		return false
	end

	local awarded = pcall(function()
		BadgeService:AwardBadge(player.UserId, badgeId)
	end)
	return awarded
end

return BadgeAwarder
