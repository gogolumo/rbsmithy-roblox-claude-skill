# Remote Not Firing Playbook

## Checklist

- Is the RemoteEvent in ReplicatedStorage or another replicated location?
- Do server and client use the same path and name?
- Is it a RemoteEvent but code calls RemoteFunction methods, or opposite?
- Is the LocalScript running from a valid client container?
- Is the Script running on the server?
- For `OnServerEvent`, did the server handler include the `player` first argument?
- Is the remote created by Rojo and synced before play?

## Output format

1. Most likely cause.
2. Path check.
3. Corrected client code.
4. Corrected server code.
5. Studio test steps.
