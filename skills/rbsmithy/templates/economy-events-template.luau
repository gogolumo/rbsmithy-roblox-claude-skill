--!strict
-- ServerScriptService/Services/EconomyAnalytics.server.luau
-- Logs resource sources and sinks. Keep this server-only.

local AnalyticsService = game:GetService("AnalyticsService")
local RunService = game:GetService("RunService")

local EconomyAnalytics = {}

type Flow = "Source" | "Sink"

local function toFlowType(flow: Flow): Enum.AnalyticsEconomyFlowType
	if flow == "Source" then
		return Enum.AnalyticsEconomyFlowType.Source
	end
	return Enum.AnalyticsEconomyFlowType.Sink
end

function EconomyAnalytics.LogCurrency(player: Player, flow: Flow, currencyType: string, amount: number, endingBalance: number, transactionType: string, itemSku: string?)
	if RunService:IsStudio() then
		print("[Economy:Studio]", flow, currencyType, amount, endingBalance, transactionType, itemSku)
		return
	end

	local ok, err = pcall(function()
		AnalyticsService:LogEconomyEvent(
			player,
			toFlowType(flow),
			currencyType,
			amount,
			endingBalance,
			transactionType,
			itemSku or ""
		)
	end)

	if not ok then
		warn("[EconomyAnalytics] Failed:", err)
	end
end

return EconomyAnalytics
