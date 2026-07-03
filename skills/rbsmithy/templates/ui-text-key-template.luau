--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalizationKeys = require(ReplicatedStorage.Shared.Localization.LocalizationKeys)
local Localization = require(ReplicatedStorage.Shared.Localization.Localization)

local function applyButtonText(button: TextButton)
    button.Text = Localization.get(LocalizationKeys.MenuPlay)
end

return applyButtonText
