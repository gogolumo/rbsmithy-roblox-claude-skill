--!strict

-- Optional ECS component template. Replace with the ECS library conventions used by the project.

export type Health = {
    current: number,
    max: number,
}

return {
    Name = "Health",
    Default = { current = 100, max = 100 } :: Health,
}
