# Example Debugging Request

## User request

> Fix this Roblox Output error: StarterPlayerScripts.DialogueController:42 attempt to index nil with 'CFrame'. My NPC dialogue camera flies away.

## How Claude should approach it

High-level reasoning:

- This is probably a client camera script bug.
- The controller may be using a missing NPC part, wrong `Head`/`HumanoidRootPart` reference, or bad CFrame math.
- Claude should explain likely cause, provide safer camera code, and include restoration steps for `CameraType`.

## Expected output format

```text
Most likely cause:
Your dialogue camera code is calculating from a nil NPC part or using the wrong direction vector.

Fix:
Use NPC Head or HumanoidRootPart, check existence, then use CFrame.lookAt.
```

## Code/file path style

```text
StarterPlayer/StarterPlayerScripts/Controllers/DialogueCameraController.lua
```

## Test steps

1. Start Play Solo.
2. Walk near NPC.
3. Trigger dialogue.
4. Camera should frame the NPC face from a stable distance.
5. End dialogue.
6. Camera should return to Custom mode.
7. Trigger dialogue twice to check cleanup.
