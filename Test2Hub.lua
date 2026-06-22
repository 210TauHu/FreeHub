local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- Open Button
local OpenBtn = Instance.new("TextButton")
OpenBtn.Parent = ScreenGui
OpenBtn.Size = UDim2.new(0,120,0,45)
OpenBtn.Position = UDim2.new(0,29,0.5,-20)
OpenBtn.BackgroundColor3 = Color3.fromRGB(40,45,40)
OpenBtn.TextColor3 = Color3.new(1,1,1)
OpenBtn.Text = "Open"
OpenBtn.Visible = true

-- Main Frame
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,450,0,450)
Main.Position = UDim2.new(0.5,-225,0.5,-125)
Main.BackgroundColor3 = Color3.fromRGB(25,25,25)
Main.BorderSizePixel = 0

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Parent = Main
TopBar.Size = UDim2.new(1,0,0,35)
TopBar.BackgroundColor3 = Color3.fromRGB(35,35,35)
TopBar.BorderSizePixel = 0

-- Username
local Username = Instance.new("TextLabel")
Username.Parent = TopBar
Username.Size = UDim2.new(0.7,0,1,0)
Username.Position = UDim2.new(0,10,0,0)
Username.BackgroundTransparency = 1
Username.TextColor3 = Color3.new(1,1,1)
Username.TextXAlignment = Enum.TextXAlignment.Left
Username.Text = Player.Name
Username.Font = Enum.Font.SourceSansBold
Username.TextSize = 22

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.Size = UDim2.new(0,35,0,35)
CloseBtn.Position = UDim2.new(1,-40,0,0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 20

-- Content
local Content = Instance.new("Frame")
Content.Parent = Main
Content.Size = UDim2.new(1,0,1,-35)
Content.Position = UDim2.new(0,0,0,35)
Content.BackgroundColor3 = Color3.fromRGB(20,20,20)
Content.BorderSizePixel = 0

-- Close/Open
CloseBtn.MouseButton1Click:Connect(function()
	Main.Visible = false
	OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
	Main.Visible = true
	OpenBtn.Visible = false
end)

-- Drag System
local dragging = false
local dragStart
local startPos

TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)
