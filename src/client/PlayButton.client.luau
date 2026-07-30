local players = game:GetService('Players')
local lighting = game:GetService('Lighting')

local blur = lighting:WaitForChild('Blur') :: BlurEffect
local player = players.LocalPlayer
local playerGui = player:WaitForChild('PlayerGui')

local screenGui = playerGui:WaitForChild('ScreenGui') :: ScreenGui
local playButton = playerGui:WaitForChild('ScreenGui'):WaitForChild('Frame'):WaitForChild('TextButton') :: TextButton

playButton.MouseEnter:Connect(function()
	playButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end)

playButton.MouseLeave:Connect(function ()
    playButton.BackgroundColor3 = Color3.fromRGB(162,27,27)
end)

playButton.MouseButton1Click:Connect(function()
    screenGui.Enabled = false
    blur.Enabled = false
end)