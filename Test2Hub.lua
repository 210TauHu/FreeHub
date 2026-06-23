local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "TauHuLoader"
ScreenGui.IgnoreGuiInset = true

-- Bảng chính (bo tròn)
local MainFrame = Instance.new("ImageLabel", ScreenGui)
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.Image = "rbxassetid://85494695213917" -- ID ảnh nền bạn đưa
MainFrame.ScaleType = Enum.ScaleType.Slice
MainFrame.SliceCenter = Rect.new(10, 10, 10, 10)
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 20)

-- Thông báo góc dưới (như bạn yêu cầu)
local LoadingLabel = Instance.new("TextLabel", MainFrame)
LoadingLabel.Size = UDim2.new(1, -20, 0, 30)
LoadingLabel.Position = UDim2.new(0.02, 0, 0.85, 0)
LoadingLabel.BackgroundTransparency = 1
LoadingLabel.Text = "Tau Hu Đang Khởi Động"
LoadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingLabel.Font = Enum.Font.GothamBold
LoadingLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Container chứa nút để xếp ngay ngắn
local BtnContainer = Instance.new("Frame", MainFrame)
BtnContainer.Size = UDim2.new(1, 0, 0, 60)
BtnContainer.Position = UDim2.new(0, 0, 0.55, 0)
BtnContainer.BackgroundTransparency = 1

-- Nút Continue (Xanh)
local ContinueBtn = Instance.new("TextButton", BtnContainer)
ContinueBtn.Size = UDim2.new(0, 150, 0, 50)
ContinueBtn.Position = UDim2.new(0.2, -75, 0, 0)
ContinueBtn.Text = "Continue"
ContinueBtn.BackgroundColor3 = Color3.fromRGB(75, 181, 67)
ContinueBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ContinueBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", ContinueBtn).CornerRadius = UDim.new(0, 10)

-- Nút Cancel (Đỏ)
local CancelBtn = Instance.new("TextButton", BtnContainer)
CancelBtn.Size = UDim2.new(0, 150, 0, 50)
CancelBtn.Position = UDim2.new(0.8, -75, 0, 0)
CancelBtn.Text = "Cancel"
CancelBtn.BackgroundColor3 = Color3.fromRGB(197, 60, 60)
CancelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CancelBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", CancelBtn).CornerRadius = UDim.new(0, 10)

-- Logic
ContinueBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Kick("Cút Đi Thằng Lồn")
end)

CancelBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Kick("Cút đi Con Lồn")
end)
