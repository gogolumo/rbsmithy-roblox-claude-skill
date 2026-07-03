# Feature Plan: <Feature Name>

## Goal

Describe the player-facing feature in one or two sentences.

## Project assumption

- Project type: Studio-only / Rojo / hybrid
- Existing systems touched:
- New systems required:

## Server authority

The server owns:

- 

The client owns:

- 

Shared modules own:

- 

## State model

```text
StateName:
- field: type, owner, persistence
```

## Remotes

```text
Remote: <Name>
Direction: Client -> Server / Server -> Client
Transport: RemoteEvent / RemoteFunction
Payload:
Validation:
Response:
```

## Files / Studio placement

```text
ServerScriptService/...
ReplicatedStorage/...
StarterPlayer/StarterPlayerScripts/...
StarterGui/...
```

## Implementation steps

1. 
2. 
3. 

## Manual test steps

1. Test in Play Solo.
2. Test with two players in Studio multiplayer test.
3. Test invalid input / spam behavior.
4. Test respawn/rejoin behavior if relevant.

## Likely failure cases

- 

## Done when

-
