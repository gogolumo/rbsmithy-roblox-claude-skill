--!strict

export type AnimationControllerHandle = {
    Play: (self: AnimationControllerHandle, key: string, fadeTime: number?) -> (),
    StopAll: (self: AnimationControllerHandle, fadeTime: number?) -> (),
    Destroy: (self: AnimationControllerHandle) -> (),
}

local AnimationController = {}
AnimationController.__index = AnimationController

function AnimationController.new(animator: Animator, registry: {[string]: string}): AnimationControllerHandle
    local self = setmetatable({}, AnimationController)
    self._animator = animator
    self._registry = registry
    self._tracks = {} :: {[string]: AnimationTrack}
    return self :: any
end

function AnimationController:Play(key: string, fadeTime: number?)
    local id = self._registry[key]
    if not id then
        warn(`Missing animation key: {key}`)
        return
    end

    local track = self._tracks[key]
    if not track then
        local animation = Instance.new("Animation")
        animation.AnimationId = id
        track = self._animator:LoadAnimation(animation)
        self._tracks[key] = track
    end

    track:Play(fadeTime or 0.1)
end

function AnimationController:StopAll(fadeTime: number?)
    for _, track in self._tracks do
        track:Stop(fadeTime or 0.1)
    end
end

function AnimationController:Destroy()
    self:StopAll(0)
    table.clear(self._tracks)
end

return AnimationController
