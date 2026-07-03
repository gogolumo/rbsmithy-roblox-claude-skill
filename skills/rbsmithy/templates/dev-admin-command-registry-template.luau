--!strict

local AdminCommands = {
	teleportIsland = {
		Permission = "Developer",
		Description = "Teleport a developer to an island for testing.",
		Args = { "islandId: string" },
	},
	spawnShip = {
		Permission = "Developer",
		Description = "Spawn a test ship.",
		Args = { "shipId: string" },
	},
}

return AdminCommands
