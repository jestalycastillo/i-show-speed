local players = game:GetService('Players')
local floor = workspace.Baseplate :: Part


players.PlayerAdded:Connect(function (player)
    player.CharacterAdded:Connect(function (character)
        character:PivotTo(floor.CFrame + Vector3.new(0,3,0))
    end)
end)