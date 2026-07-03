--!strict

-- Optional ECS system template. Adapt to the ECS library used by the project.

local function HealthRegenSystem(world, deltaTime: number)
    -- Iterate entities with Health and Regen components.
    -- Keep server authority for gameplay state.
end

return HealthRegenSystem
