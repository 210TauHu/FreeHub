-- Neural Net Visualization (Giữ lại từ trước)
-- [Code Neural Net cũ vẫn hoạt động ở background]

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "TauHuLoader"
ScreenGui.IgnoreGuiInset = true

-- Bảng thông báo khởi động
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 250)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 20)

-- Ảnh nền (ID bạn cung cấp)
local Image = Instance.new("ImageLabel", MainFrame)
Image.Size = UDim2.new(1, 0, 1, 0)
Image.Image = "rbxassetid://85494695213917"
Image.BackgroundTransparency = 1

-- Tiêu đề
local Label = Instance.new("TextLabel", MainFrame)
Label.Size = UDim2.new(1, 0, 0.2, 0)
Label.Position = UDim2.new(0, 0, 0.1, 0)
Label.BackgroundTransparency = 1
Label.Text = "Tau Hu Đang Khởi Động"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.Font = Enum.Font.GothamBold

-- Nút Continue
local ContinueBtn = Instance.new("TextButton", MainFrame)
ContinueBtn.Size = UDim2.new(0, 120, 0, 40)
ContinueBtn.Position = UDim2.new(0.2, 0, 0.7, 0)
ContinueBtn.Text = "Continue"
ContinueBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
ContinueBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", ContinueBtn)

-- Nút Cancel
local CancelBtn = Instance.new("TextButton", MainFrame)
CancelBtn.Size = UDim2.new(0, 120, 0, 40)
CancelBtn.Position = UDim2.new(0.6, 0, 0.7, 0)
CancelBtn.Text = "Cancel"
CancelBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
CancelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", CancelBtn)

-- Logic Kick
ContinueBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Kick("Cút Đi Thằng Lồn")
end)

CancelBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Kick("Cút đi Con Lồn")
end)
