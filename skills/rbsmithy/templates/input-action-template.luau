--!strict
-- StarterPlayer/StarterPlayerScripts/Controllers/InputController.client.luau

local ContextActionService = game:GetService("ContextActionService")

local InputController = {}

local ACTION_SPRINT = "Sprint"

local function onSprintAction(actionName: string, inputState: Enum.UserInputState, inputObject: InputObject)
	if inputState == Enum.UserInputState.Begin then
		print("Sprint begin")
	elseif inputState == Enum.UserInputState.End then
		print("Sprint end")
	end
	return Enum.ContextActionResult.Sink
end

function InputController.Start()
	ContextActionService:BindAction(
		ACTION_SPRINT,
		onSprintAction,
		true,
		Enum.KeyCode.LeftShift,
		Enum.KeyCode.ButtonL3
	)
	ContextActionService:SetTitle(ACTION_SPRINT, "Sprint")
end

function InputController.Stop()
	ContextActionService:UnbindAction(ACTION_SPRINT)
end

InputController.Start()

return InputController
