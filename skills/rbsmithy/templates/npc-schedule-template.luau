--!strict

export type ScheduleEntry = {
	StartHour: number,
	EndHour: number,
	State: string,
	LocationTag: string,
}

local Schedule = {
	{ StartHour = 6, EndHour = 12, State = "Work", LocationTag = "DockWork" },
	{ StartHour = 12, EndHour = 18, State = "Market", LocationTag = "Market" },
	{ StartHour = 18, EndHour = 24, State = "Home", LocationTag = "Home" },
}

return Schedule
