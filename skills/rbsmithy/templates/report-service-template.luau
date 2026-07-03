--!strict
-- ServerScriptService/Services/ReportService.server.luau
-- Minimal in-game report intake. Prefer Roblox platform reporting for serious issues.

local ReportService = {}

local lastReportAt: {[number]: number} = {}
local COOLDOWN_SECONDS = 30

export type ReportPayload = {
	reportedUserId: number,
	reason: string,
	context: string?,
}

function ReportService.SubmitReport(reporter: Player, payload: ReportPayload): (boolean, string)
	local now = os.clock()
	local last = lastReportAt[reporter.UserId] or 0
	if now - last < COOLDOWN_SECONDS then
		return false, "RateLimited"
	end

	if typeof(payload.reportedUserId) ~= "number" or typeof(payload.reason) ~= "string" then
		return false, "InvalidPayload"
	end

	lastReportAt[reporter.UserId] = now
	warn("[Report]", reporter.UserId, payload.reportedUserId, payload.reason, payload.context)
	-- TODO: store minimal moderation record server-side if needed.
	return true, "Submitted"
end

return ReportService
