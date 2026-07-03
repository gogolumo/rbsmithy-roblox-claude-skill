--!strict
-- ReplicatedStorage/Shared/Monetization/ProductCatalog.luau
-- Keep IDs centralized. Do not scatter product IDs across UI scripts.

local ProductCatalog = {}

export type Product = {
	Id: number,
	Name: string,
	Kind: "GamePass" | "DeveloperProduct" | "Subscription" | "Cosmetic",
	RewardKey: string,
	Description: string,
	FairnessNote: string,
}

ProductCatalog.Products = {
	ExampleCosmetic = {
		Id = 0, -- replace with real Roblox product/game pass id
		Name = "Example Cosmetic",
		Kind = "DeveloperProduct",
		RewardKey = "cosmetic_example",
		Description = "Example cosmetic product.",
		FairnessNote = "Cosmetic only; no gameplay advantage.",
	} :: Product,
}

return ProductCatalog
