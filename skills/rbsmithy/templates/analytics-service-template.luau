--!strict
-- ServerScriptService/Services/GameAnalyticsService.server.luau
-- Central wrapper for Roblox AnalyticsService calls.
-- Analytics should not be allowed to break gameplay.

local AnalyticsService = game:GetService("AnalyticsService")
local RunService = game:GetService("RunService")

local GameAnalyticsService = {}

local function safeCall(callback: () -> ())
	local ok, err = pcall(callback)
	if not ok then
		warn("[Analytics] Failed to log event:", err)
	end
end

function GameAnalyticsService.LogCustom(player: Player, eventName: string, value: number?, customFields: {[string]: string}?)
	if RunService:IsStudio() then
		print("[Analytics:Studio]", eventName, value, customFields)
		return
	end

	safeCall(function()
		if value ~= nil and customFields ~= nil then
			AnalyticsService:LogCustomEvent(player, eventName, value, customFields)
		elseif value ~= nil then
			AnalyticsService:LogCustomEvent(player, eventName, value)
		else
			AnalyticsService:LogCustomEvent(player, eventName)
		end
	end)
end

function GameAnalyticsService.LogQuestStarted(player: Player, questId: string)
	GameAnalyticsService.LogCustom(player, "QuestStarted", 1, {
		[Enum.AnalyticsCustomFieldKeys.CustomField01.Name] = questId,
	})
end

function GameAnalyticsService.LogQuestCompleted(player: Player, questId: string, durationSeconds: number)
	GameAnalyticsService.LogCustom(player, "QuestCompleted", durationSeconds, {
		[Enum.AnalyticsCustomFieldKeys.CustomField01.Name] = questId,
	})
end

return GameAnalyticsService
