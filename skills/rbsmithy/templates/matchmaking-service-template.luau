--!strict
-- ServerScriptService/Services/MatchmakingService.server.luau

local Players = game:GetService("Players")

local MatchmakingService = {}

local queued: {[number]: boolean} = {}

function MatchmakingService.JoinQueue(player: Player)
	if queued[player.UserId] then
		return false, "AlreadyQueued"
	end

	queued[player.UserId] = true
	-- TODO: write a short-lived MemoryStore queue entry.
	return true, "Queued"
end

function MatchmakingService.LeaveQueue(player: Player)
	queued[player.UserId] = nil
	-- TODO: mark queue entry cancelled or let TTL expire depending on design.
	return true
end

Players.PlayerRemoving:Connect(function(player)
	queued[player.UserId] = nil
end)

return MatchmakingService
