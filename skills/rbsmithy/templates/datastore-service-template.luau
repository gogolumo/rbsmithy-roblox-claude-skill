--!strict
-- File: ServerScriptService/Services/DataService.lua
-- Purpose: Safer player data loading/saving template with defaults, migrations, retries, and shutdown saves.

local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local DataService = {}

local DATASTORE_NAME = "PlayerData_v1"
local CURRENT_VERSION = 1
local MAX_RETRIES = 4

export type PlayerData = {
    Version: number,
    Coins: number,
    Inventory: { string },
    Quests: { [string]: string },
    Settings: {
        Music: boolean,
        CameraShake: boolean,
    },
}

type ProfileState = {
    Loaded: boolean,
    Dirty: boolean,
    Data: PlayerData?,
}

local store = DataStoreService:GetDataStore(DATASTORE_NAME)
local profiles: { [Player]: ProfileState } = {}

local DEFAULT_DATA: PlayerData = {
    Version = CURRENT_VERSION,
    Coins = 0,
    Inventory = {},
    Quests = {},
    Settings = {
        Music = true,
        CameraShake = true,
    },
}

local function deepCopy<T>(value: T): T
    if type(value) ~= "table" then
        return value
    end

    local result = {}
    for key, child in pairs(value :: any) do
        result[key] = deepCopy(child)
    end
    return result :: any
end

local function mergeDefaults(data: any, defaults: any): any
    for key, defaultValue in pairs(defaults) do
        if data[key] == nil then
            data[key] = deepCopy(defaultValue)
        elseif type(defaultValue) == "table" and type(data[key]) == "table" then
            mergeDefaults(data[key], defaultValue)
        end
    end
    return data
end

local function migrate(data: any): PlayerData
    data.Version = data.Version or 0

    -- Add future migrations here.
    -- if data.Version < 2 then
    --     data.NewField = true
    --     data.Version = 2
    -- end

    data.Version = CURRENT_VERSION
    return mergeDefaults(data, DEFAULT_DATA) :: PlayerData
end

local function getKey(player: Player): string
    return `player_{player.UserId}`
end

local function retry<T>(callback: () -> T): (boolean, T?)
    for attempt = 1, MAX_RETRIES do
        local ok, result = pcall(callback)
        if ok then
            return true, result
        end

        warn(`DataStore attempt {attempt} failed: {result}`)
        task.wait(math.min(2 ^ attempt, 10))
    end

    return false, nil
end

function DataService.GetData(player: Player): PlayerData?
    local profile = profiles[player]
    if not profile or not profile.Loaded then
        return nil
    end
    return profile.Data
end

function DataService.MarkDirty(player: Player): ()
    local profile = profiles[player]
    if profile and profile.Loaded then
        profile.Dirty = true
    end
end

function DataService.LoadPlayer(player: Player): boolean
    profiles[player] = {
        Loaded = false,
        Dirty = false,
        Data = nil,
    }

    local key = getKey(player)
    local ok, stored = retry(function()
        return store:GetAsync(key)
    end)

    if not ok then
        warn(`Failed to load data for {player.UserId}; refusing to create save-over-default session.`)
        player:Kick("Your data could not be loaded safely. Please rejoin in a moment.")
        return false
    end

    local data: PlayerData
    if stored == nil then
        data = deepCopy(DEFAULT_DATA)
    elseif type(stored) == "table" then
        data = migrate(stored)
    else
        warn(`Invalid data shape for {player.UserId}; refusing to continue.`)
        player:Kick("Your data looks corrupted. Please contact support.")
        return false
    end

    profiles[player] = {
        Loaded = true,
        Dirty = false,
        Data = data,
    }

    return true
end

function DataService.SavePlayer(player: Player): boolean
    local profile = profiles[player]
    if not profile or not profile.Loaded or not profile.Data then
        return false
    end

    local dataToSave = deepCopy(profile.Data)
    local key = getKey(player)

    local ok = retry(function()
        store:UpdateAsync(key, function(_oldValue)
            return dataToSave
        end)
        return true
    end)

    if ok then
        profile.Dirty = false
        return true
    end

    warn(`Failed to save data for {player.UserId}`)
    return false
end

function DataService.Start(): ()
    Players.PlayerAdded:Connect(function(player: Player)
        DataService.LoadPlayer(player)
    end)

    Players.PlayerRemoving:Connect(function(player: Player)
        DataService.SavePlayer(player)
        profiles[player] = nil
    end)

    task.spawn(function()
        while true do
            task.wait(120)
            for player, profile in profiles do
                if profile.Loaded and profile.Dirty then
                    DataService.SavePlayer(player)
                end
            end
        end
    end)

    game:BindToClose(function()
        for player in profiles do
            DataService.SavePlayer(player)
        end
    end)
end

return DataService
