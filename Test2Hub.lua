local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.IgnoreGuiInset = true

-- Vùng đen bao trọn nửa trên màn hình
local BlackFrame = Instance.new("Frame", ScreenGui)
BlackFrame.Size = UDim2.new(1, 0, 0.5, 0)
BlackFrame.Position = UDim2.new(0, 0, 0, 0)
BlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

-- Chữ "Đang Tải Dữ Liệu" (Đã kéo xích lên vị trí mong muốn)
local StatusText = Instance.new("TextLabel", BlackFrame)
StatusText.Size = UDim2.new(1, 0, 0.2, 0)
StatusText.Position = UDim2.new(0, 0, 0.3, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Đang Tải Dữ Liệu"
StatusText.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusText.TextSize = 30
StatusText.Font = Enum.Font.GothamBold

-- Tạo 2 nút
local function CreateButton(text, pos, color)
    local btn = Instance.new("TextButton", BlackFrame)
    btn.Size = UDim2.new(0, 150, 0, 50)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", btn)
    return btn
end

local btnKichHoat = CreateButton("Kích Hoạt", UDim2.new(0.3, -75, 0.6, 0), Color3.fromRGB(255, 50, 50))
local btnThoat = CreateButton("Thoát", UDim2.new(0.7, -75, 0.6, 0), Color3.fromRGB(50, 200, 50))

-- Logic nút
btnKichHoat.MouseButton1Click:Connect(function()
    game:GetService("Players").LocalPlayer:Kick("\n[Tau Hu Security] \nLỗi: 267 \nMua Prenium mà chơi t, Thằng Nhà Nghèo")
end)

btnThoat.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

