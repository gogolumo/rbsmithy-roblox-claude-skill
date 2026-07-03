--!strict

local ClientErrorReporter = {}

function ClientErrorReporter.Wrap(source: string, callback: () -> ())
	local ok, err = xpcall(callback, debug.traceback)
	if not ok then
		warn("Client error in", source, err)
		-- TODO: send sanitized summary to server with rate limit.
	end
end

return ClientErrorReporter
