# Report system blueprint

## Purpose
Let players report unsafe behavior or UGC inside the game.

## Server responsibilities
- Receive report intent.
- Rate-limit reports.
- Store minimal required metadata.
- Do not expose reporter identity to reported player.

## Client responsibilities
- Provide report UI.
- Confirm submission.
- Avoid encouraging witch hunts.

## Safety note
Use Roblox platform reporting where possible; in-game reports should support moderation workflow, not replace platform safety systems.
