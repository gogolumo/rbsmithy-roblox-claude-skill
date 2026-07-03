--!strict

local ErrorTelemetryService = {}
local recent: { [string]: number } = {}

local function key(source: string, message: string): string
	return source .. "::" .. string.sub(message, 1, 120)
end

function ErrorTelemetryService.Report(source: string, message: string, context: { [string]: any }?)
	local k = key(source, message)
	local now = os.clock()
	if recent[k] and now - recent[k] < 10 then
		return
	end
	recent[k] = now
	warn("[ErrorTelemetry]", source, message, context)
end

return ErrorTelemetryService
