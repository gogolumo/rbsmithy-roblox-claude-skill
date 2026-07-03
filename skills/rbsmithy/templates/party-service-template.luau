--!strict

export type Party = {
	Id: string,
	LeaderUserId: number,
	Members: { number },
	CreatedAt: number,
}

local PartyService = {}
local parties: { [string]: Party } = {}

function PartyService.Create(leader: Player): Party
	local party = {
		Id = tostring(leader.UserId) .. "_" .. tostring(os.time()),
		LeaderUserId = leader.UserId,
		Members = { leader.UserId },
		CreatedAt = os.time(),
	}
	parties[party.Id] = party
	return party
end

return PartyService
