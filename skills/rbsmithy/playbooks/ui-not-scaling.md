# UI Not Scaling Playbook

## Checklist

- Is ScreenGui under StarterGui?
- Are frames using Scale instead of only Offset?
- Is UIScale used at root when needed?
- Are safe area/topbar insets considered?
- Are UIListLayout/UIPadding constraints fighting manual positions?
- Are modal screens and HUD screens active at the same time?

## Fix style

Claude should provide:

- hierarchy;
- responsive sizing rules;
- safe area frame;
- UIScale strategy;
- desktop/mobile test steps.
