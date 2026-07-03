--!strict

export type NpcState = "Idle" | "Patrol" | "Talk" | "Alert" | "Combat" | "Disabled"

export type NpcBrain = {
	State: NpcState,
	LastUpdate: number,
	AggroRadius: number,
	ThinkInterval: number,
}

local NpcBrain = {}
NpcBrain.__index = NpcBrain

function NpcBrain.new(): NpcBrain
	return setmetatable({
		State = "Idle",
		LastUpdate = 0,
		AggroRadius = 35,
		ThinkInterval = 0.25,
	}, NpcBrain) :: any
end

function NpcBrain:Step(now: number)
	if now - self.LastUpdate < self.ThinkInterval then
		return
	end
	self.LastUpdate = now
	-- TODO: evaluate perception, schedule, dialogue lock, combat target.
end

return NpcBrain
