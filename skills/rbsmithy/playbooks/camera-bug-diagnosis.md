# Camera Bug Diagnosis Playbook

Use this for dialogue cameras, NPC focus cameras, ship cameras, and cutscenes.

## Checklist

- Is code running in a LocalScript?
- Is `CurrentCamera` available?
- Is CameraType restored after exit?
- Is the target part valid: Head, HumanoidRootPart, PrimaryPart?
- Is CFrame offset computed relative to the NPC or world incorrectly?
- Is the player/NPC rotated by the same script that positions the camera?
- Is another script fighting for camera control?

## Fix style

Claude should prefer stable helper functions:

```lua
local function getFocusPart(model: Model): BasePart?
    return model:FindFirstChild("Head") :: BasePart?
        or model:FindFirstChild("HumanoidRootPart") :: BasePart?
        or model.PrimaryPart
end
```

Then compute camera from the focus part with a fixed readable offset.
