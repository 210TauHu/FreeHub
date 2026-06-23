qlocal ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "TauHuLoader"
ScreenGui.IgnoreGuiInset = true

-- Khung nền chứa ảnh
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 20)

local BgImage = Instance.new("ImageLabel", MainFrame)
BgImage.Size = UDim2.new(1, 0, 1, 0)
BgImage.Image = "rbxassetid://85494695213917"
BgImage.BackgroundTransparency = 1

-- Thông báo ở góc dưới cùng bên phải màn hình
local LoadingLabel = Instance.new("TextLabel", ScreenGui)
LoadingLabel.Size = UDim2.new(0, 200, 0, 50)
LoadingLabel.Position = UDim2.new(1, -210, 1, -60)
LoadingLabel.BackgroundTransparency = 1
LoadingLabel.Text = "Tau Hu Đang Khởi Động"
LoadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingLabel.Font = Enum.Font.GothamBold

-- Nút (Căn giữa bảng)
local ContinueBtn = Instance.new("TextButton", MainFrame)
ContinueBtn.Size = UDim2.new(0, 150, 0, 50)
ContinueBtn.Position = UDim2.new(0.35, 0, 0.6, 0)
ContinueBtn.Text = "Continue"
ContinueBtn.BackgroundColor3 = Color3.fromRGB(75, 181, 67)
ContinueBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ContinueBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", ContinueBtn).CornerRadius = UDim.new(0, 10)

local CancelBtn = Instance.new("TextButton", MainFrame)
CancelBtn.Size = UDim2.new(0, 150, 0, 50)
CancelBtn.Position = UDim2.new(0.65, 0, 0.6, 0)
CancelBtn.Text = "Cancel"
CancelBtn.AnchorPoint = Vector2.new(0.5, 0)
CancelBtn.BackgroundColor3 = Color3.fromRGB(197, 60, 60)
CancelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CancelBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", CancelBtn).CornerRadius = UDim.new(0, 10)

-- Logic
ContinueBtn.MouseButton1Click:Connect(function() game.Players.LocalPlayer:Kick("Cút Đi Thằng Lồn") end)
CancelBtn.MouseButton1Click:Connect(function() game.Players.LocalPlayer:Kick("Cút đi Con Lồn") end)
