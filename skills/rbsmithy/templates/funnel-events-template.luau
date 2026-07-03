--!strict
-- ServerScriptService/Services/FunnelAnalytics.server.luau
-- Verify current Roblox AnalyticsService funnel signature before production use.

local AnalyticsService = game:GetService("AnalyticsService")
local RunService = game:GetService("RunService")

local FunnelAnalytics = {}

function FunnelAnalytics.LogStep(player: Player, funnelName: string, sessionId: string, step: number, stepName: string)
	if RunService:IsStudio() then
		print("[Funnel:Studio]", funnelName, sessionId, step, stepName)
		return
	end

	local ok, err = pcall(function()
		AnalyticsService:LogFunnelStepEvent(player, funnelName, sessionId, step, stepName)
	end)

	if not ok then
		warn("[Funnel] Failed:", err)
	end
end

return FunnelAnalytics
