--!strict

-- Tutorial funnel event names. Server should send analytics when each step is reached.
local TutorialFunnel = {
	Spawned = "Tutorial_Spawned",
	Moved = "Tutorial_FirstMovement",
	Interacted = "Tutorial_FirstInteraction",
	AcceptedQuest = "Tutorial_AcceptedQuest",
	CompletedQuest = "Tutorial_CompletedQuest",
	ReceivedReward = "Tutorial_ReceivedReward",
	SawNextGoal = "Tutorial_SawNextGoal",
}

return TutorialFunnel
