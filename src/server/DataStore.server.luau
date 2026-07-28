local dataStore = game:GetService('DataStoreService')
local SpeedStore = dataStore:GetDataStore('Speed')

local players = game:GetService('Players')

players.PlayerAdded:Connect(function (player)
    local leaderStats = Instance.new('Folder')
    leaderStats.Name = 'leaderstats'
    leaderStats.Parent = player

    local speed = Instance.new('IntValue')
    speed.Name = 'Speed'
    speed.Parent = leaderStats

    local success, savedSpeed = pcall(function ()
        return SpeedStore:GetAsync(player.UserId)
    end)

    if success and savedSpeed ~= nil then
        speed.Value = savedSpeed
    else
        speed.Value = 2
    end

    player.CharacterAdded:Connect(function (character)
        local humanoid = character:FindFirstChild('Humanoid') :: Humanoid
        humanoid.WalkSpeed = speed.Value
    end)
end)

players.PlayerRemoving:Connect(function (player)
    local speed = player.leaderstats.Speed :: IntValue

    local success, err = pcall(function ()
        return SpeedStore:SetAsync(player.UserId, speed.Value)
    end)

    if not success then
        warn(err)
    end
end)