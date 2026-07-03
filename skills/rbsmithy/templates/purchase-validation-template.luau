--!strict
-- ServerScriptService/Services/PurchaseService.server.luau
-- Skeleton for server-side purchase reward handling.

local MarketplaceService = game:GetService("MarketplaceService")

local ProductCatalog = require(game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Monetization"):WaitForChild("ProductCatalog"))

local PurchaseService = {}

local function grantReward(player: Player, productKey: string): boolean
	-- TODO: grant reward through your profile/inventory service.
	-- Must be idempotent for developer products.
	print("Grant reward", player.UserId, productKey)
	return true
end

function PurchaseService.ProcessReceipt(receiptInfo)
	local player = game:GetService("Players"):GetPlayerByUserId(receiptInfo.PlayerId)
	if not player then
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end

	for productKey, product in pairs(ProductCatalog.Products) do
		if product.Id == receiptInfo.ProductId then
			local granted = grantReward(player, productKey)
			if granted then
				return Enum.ProductPurchaseDecision.PurchaseGranted
			end
			return Enum.ProductPurchaseDecision.NotProcessedYet
		end
	end

	warn("Unknown developer product id", receiptInfo.ProductId)
	return Enum.ProductPurchaseDecision.NotProcessedYet
end

MarketplaceService.ProcessReceipt = PurchaseService.ProcessReceipt

return PurchaseService
