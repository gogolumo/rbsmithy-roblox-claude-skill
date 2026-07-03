# Character and NPC Facing Bugs Playbook

## Checklist

- Is the root part valid?
- Is the character anchored accidentally?
- Is AutoRotate interfering?
- Is the model PrimaryPart set?
- Is the code using lookAt with same position for origin and target?
- Is server and client both rotating the same character?

## Fix rule

For gameplay-important rotation, server should validate state. For camera-only presentation, client may rotate local visuals where safe.
