--!strict

export type NPCAnimationState = "Idle" | "Walk" | "Talk" | "Gesture" | "Alert"

local NPCAnimationStateMachine = {}
NPCAnimationStateMachine.__index = NPCAnimationStateMachine

function NPCAnimationStateMachine.new(animationController)
    return setmetatable({
        _controller = animationController,
        _state = "Idle" :: NPCAnimationState,
    }, NPCAnimationStateMachine)
end

function NPCAnimationStateMachine:SetState(nextState: NPCAnimationState)
    if self._state == nextState then
        return
    end
    self._state = nextState
    self._controller:StopAll(0.15)
    self._controller:Play(nextState, 0.15)
end

return NPCAnimationStateMachine
