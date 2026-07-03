--!strict

local IslandBlueprint = {
	Id = "starter_cove",
	DisplayName = "Starter Cove",
	Biome = "WarmCoast",
	BudgetTier = "MVP",
	Landmarks = {
		{ Id = "dock", Kind = "Dock", Position = Vector3.new(0, 5, 0) },
		{ Id = "lighthouse", Kind = "Landmark", Position = Vector3.new(120, 25, -80) },
	},
	SpawnZones = {
		Enemies = { "BeachCrabs" },
		Resources = { "Driftwood", "CopperOre" },
	},
	Performance = {
		MaxDecorativeProps = 250,
		MaxActiveEnemies = 8,
		MobileFallback = true,
	},
}

return IslandBlueprint
