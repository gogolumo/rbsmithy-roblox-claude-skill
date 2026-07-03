# Input system blueprint

## Purpose
Unify keyboard, mouse, touch, and gamepad input.

## Client responsibilities
- Map actions to device-specific inputs.
- Expose high-level actions: Sprint, Interact, Attack, OpenInventory, SailTrim.
- Show matching prompts.

## Server responsibilities
- Validate resulting gameplay requests.
- Enforce cooldowns and state.

## Test matrix
- keyboard/mouse;
- mobile;
- tablet;
- gamepad;
- rebinding assumptions.
