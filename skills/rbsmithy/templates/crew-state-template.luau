--!strict

export type CrewRole = "Captain" | "Helm" | "Cannons" | "Scout" | "Crew"

export type CrewMember = {
	UserId: number,
	Role: CrewRole,
}

export type CrewState = {
	ShipId: string,
	Members: { CrewMember },
	VoyageId: string?,
}

return {}
