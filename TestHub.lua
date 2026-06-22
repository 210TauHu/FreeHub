 local sg = Instance.new("ScreenGui", game.CoreGui)
 local main = Instance.new("Frame", sg)
 main.Size = UDim2.new(0, 140, 0, 90)
 main.Position = UDim2.new(0, 10, 0, 150)
 main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
 main.BorderSizePixel = 2
 main.BorderColor3 = Color3.fromRGB(255, 0, 0)
 
 local title = Instance.new("TextLabel", main)
 title.Size = UDim2.new(1, 0, 0, 30)
 title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
 title.TextColor3 = Color3.fromRGB(255, 255, 255)
 title.Text = "NOCLIP MENU"
 title.Font = Enum.Font.SourceSansBold
 title.TextSize = 14
 
 local btn = Instance.new("TextButton", main)
 btn.Size = UDim2.new(1, -20, 0, 40)
 btn.Position = UDim2.new(0, 10, 0, 40)
 btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
 btn.TextColor3 = Color3.fromRGB(255, 255, 255)
 btn.Text = "OFF"
 btn.Font = Enum.Font.SourceSansBold
 btn.TextSize = 18
 
 local noclip = false
 btn.MouseButton1Click:Connect(function()
 noclip = not noclip
 if noclip then
 btn.Text = "ON"
 btn.BackgroundColor3 = Color3.fromRGB(0, 210, 0)
 else
 btn.Text = "OFF"
 btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
 end
 end)
 
 game:GetService("RunService").Stepped:Connect(function()
 if noclip then
 local char = game.Players.LocalPlayer.Character
 if char then
 for _, part in pairs(char:GetDescendants()) do
 if part:IsA("BasePart") then
 part.CanCollide = false
 end
 end
 end
 end
 end)
