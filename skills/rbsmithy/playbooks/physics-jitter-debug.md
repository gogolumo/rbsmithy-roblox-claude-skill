# Physics Jitter Debug Playbook

## Checklist

- Is more than one script setting CFrame/Velocity/AssemblyLinearVelocity?
- Is network ownership changing unexpectedly?
- Is the model welded correctly?
- Is PrimaryPart set?
- Are constraints fighting direct CFrame movement?
- Is server correcting client movement too aggressively?
- Is the loop using inconsistent dt?

## Fix style

Claude should identify the single movement authority first. Then it should remove competing movement code or split server authority from client smoothing.
