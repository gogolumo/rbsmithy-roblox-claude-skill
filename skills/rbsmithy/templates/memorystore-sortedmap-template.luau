--!strict
-- ServerScriptService/Services/TemporaryLeaderboard.server.luau

local MemoryStoreService = game:GetService("MemoryStoreService")

local TemporaryLeaderboard = {}

local MAP_NAME = "event_leaderboard_v1"
local ENTRY_TTL_SECONDS = 60 * 60 * 24

local sortedMap = MemoryStoreService:GetSortedMap(MAP_NAME)

function TemporaryLeaderboard.SetScore(userId: number, score: number)
	local key = tostring(userId)
	local ok, err = pcall(function()
		sortedMap:SetAsync(key, { userId = userId, score = score }, ENTRY_TTL_SECONDS, score)
	end)
	if not ok then
		warn("[TemporaryLeaderboard] SetScore failed:", err)
		return false
	end
	return true
end

function TemporaryLeaderboard.GetTop(count: number)
	local ok, result = pcall(function()
		return sortedMap:GetRangeAsync(Enum.SortDirection.Descending, count)
	end)
	if not ok then
		warn("[TemporaryLeaderboard] GetTop failed:", result)
		return {}
	end
	return result
end

return TemporaryLeaderboard
