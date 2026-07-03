--!strict

local TextChatService = game:GetService("TextChatService")

local command = Instance.new("TextChatCommand")
command.Name = "DevTeleportCommand"
command.PrimaryAlias = "/teleportIsland"
command.Parent = TextChatService

command.Triggered:Connect(function(textSource, rawText)
	-- Client-side command trigger only; send a server request that validates developer permission.
	print("Command requested by", textSource.UserId, rawText)
end)
