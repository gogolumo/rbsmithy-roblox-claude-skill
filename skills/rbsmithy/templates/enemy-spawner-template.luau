--!strict

local CollectionService = game:GetService("CollectionService")

export type SpawnerConfig = {
	Tag: string,
	MaxAlive: number,
	RespawnSeconds: number,
	DespawnDistance: number,
}

local EnemySpawner = {}

function EnemySpawner.Start(config: SpawnerConfig)
	for _, zone in CollectionService:GetTagged(config.Tag) do
		-- TODO: spawn enemies server-side, track alive count, clean up on zone removal.
		print("Spawner zone ready", zone:GetFullName())
	end
end

return EnemySpawner
