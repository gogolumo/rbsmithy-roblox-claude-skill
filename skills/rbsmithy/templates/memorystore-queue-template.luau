--!strict
-- ServerScriptService/Services/MemoryQueueService.server.luau

local MemoryStoreService = game:GetService("MemoryStoreService")

local MemoryQueueService = {}

local QUEUE_NAME = "matchmaking_v1"
local ITEM_TTL_SECONDS = 60

local queue = MemoryStoreService:GetQueue(QUEUE_NAME)

function MemoryQueueService.Enqueue(userId: number, payload: {[string]: any})
	local item = {
		userId = userId,
		payload = payload,
		createdAt = os.time(),
	}

	local ok, err = pcall(function()
		queue:AddAsync(item, ITEM_TTL_SECONDS)
	end)

	if not ok then
		warn("[MemoryQueue] Enqueue failed:", err)
		return false
	end

	return true
end

function MemoryQueueService.ReadBatch(count: number, invisibilityTimeout: number)
	local ok, result = pcall(function()
		return queue:ReadAsync(count, false, invisibilityTimeout)
	end)

	if not ok then
		warn("[MemoryQueue] Read failed:", result)
		return nil
	end

	return result
end

return MemoryQueueService
