# Mobile controls system blueprint

## Purpose
Make core gameplay playable on touch devices.

## Client responsibilities
- Create touch buttons for critical actions.
- Keep buttons outside safe-area conflicts.
- Hide buttons when irrelevant.
- Scale UI by screen size.

## Server responsibilities
- Treat mobile input like any other client intent.
- Validate action state and cooldown.

## Common mistakes
- tiny buttons;
- buttons under topbar;
- keyboard-only tutorials;
- hover-dependent UI.
