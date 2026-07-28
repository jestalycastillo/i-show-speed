local players = game:GetService('Players')

players.PlayerAdded:Connect(function(player)
    local leaderStats = Instance.new('Folder')
    leaderStats.Name = 'leaderstats'
    leaderStats.Parent = player

    local speed = Instance.new('IntValue')
    speed.Name = 'Speed'
    speed.Value = 0
    speed.Parent = leaderStats
end)
