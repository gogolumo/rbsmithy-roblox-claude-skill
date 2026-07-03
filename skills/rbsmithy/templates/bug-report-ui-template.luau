--!strict

-- StarterGui/DevBugReport/BugReportController.client.luau
-- Minimal placeholder. Build real UI in Studio or generate it from your UI kit.

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local BugReportController = {}

function BugReportController.Submit(note: string)
	-- TODO: send sanitized note and context to server bug report remote.
	print("Bug report from", player.UserId, note)
end

return BugReportController
