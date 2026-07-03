# Ship Movement Debug Playbook

Use this for ships that shake, hover, drift weirdly, snap backward, or ignore sails/anchor.

## Checklist

- Which script owns movement?
- Is there both server CFrame movement and client CFrame movement?
- Is the ship model welded into one assembly?
- Is PrimaryPart set?
- Is anchor state applied to movement math, not just UI?
- Are throttle/rudder/sail trim replicated as input, not full desired position?
- Does movement use dt?
- Is water alignment visual-only or physics-authoritative?

## Recommended output

1. Cause hypothesis.
2. Single-authority movement plan.
3. Minimal code patch.
4. Two-player local server test.
5. Jitter regression test.
