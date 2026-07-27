local serverStorage = game:GetService('ServerStorage')
local players = game:GetService('Players')
local floor = workspace:WaitForChild('Baseplate') :: BasePart

function spawnOrb()
    local orb = serverStorage:WaitForChild('Orb'):Clone() :: Model

    local x = math.random(floor.Position.X - floor.Size.X / 2, floor.Position.X + floor.Size.X / 2)
	local z = math.random(floor.Position.Z - floor.Size.Z / 2, floor.Position.Z + floor.Size.Z / 2)

    local part = orb:WaitForChild('Part') :: BasePart

    orb:PivotTo(CFrame.new(x, 3, z))

    orb.Parent = workspace

    local touched = false
    part.Touched:Connect(function (hit)
        if touched then return end
        local character = hit.Parent
        local player = character:FindFirstChild('Humanoid') :: Humanoid

        if player then player.WalkSpeed += 2 end

        orb:Destroy()
        touched = true
    end)
end

while true do
    task.wait(math.random(0,3))
    spawnOrb()
end