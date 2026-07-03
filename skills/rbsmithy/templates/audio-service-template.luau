--!strict

local Debris = game:GetService("Debris")

local AudioService = {}

function AudioService.playOneShot(parent: Instance, soundId: string, volume: number?)
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Volume = volume or 0.6
    sound.Parent = parent
    sound:Play()
    Debris:AddItem(sound, 10)
    return sound
end

return AudioService
