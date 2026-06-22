local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.IgnoreGuiInset = true

-- Khung hình vuông nhỏ
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0

-- Viền nhấp nháy cầu vồng (Sử dụng UIStroke)
local Stroke = Instance.new("UIStroke", MainFrame)
Stroke.Thickness = 4
spawn(function()
    while MainFrame.Parent do
        Stroke.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.1)
    end
end)

-- Chữ ban đầu
local StatusText = Instance.new("TextLabel", MainFrame)
StatusText.Size = UDim2.new(1, 0, 0.4, 0)
StatusText.Position = UDim2.new(0, 0, 0.1, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Do you want to use this Script?"
StatusText.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusText.TextScaled = true

-- Nút Accept và Cancel
local function CreateBtn(name, pos, color)
    local b = Instance.new("TextButton", MainFrame)
    b.Size = UDim2.new(0, 100, 0, 40)
    b.Position = pos
    b.BackgroundColor3 = color
    b.Text = name
    return b
end

local btnAccept = CreateBtn("Accept", UDim2.new(0.2, -50, 0.7, 0), Color3.fromRGB(50, 200, 50))
local btnCancel = CreateBtn("Cancel", UDim2.new(0.8, -50, 0.7, 0), Color3.fromRGB(255, 50, 50))

-- Xử lý nút
btnAccept.MouseButton1Click:Connect(function()
    StatusText.Text = "Thank you"
    btnAccept:Destroy()
    btnCancel:Destroy()
    
    local btnFinal = Instance.new("TextButton", MainFrame)
    btnFinal.Size = UDim2.new(0, 150, 0, 40)
    btnFinal.Position = UDim2.new(0.5, -75, 0.7, 0)
    btnFinal.Text = "Click here"
    btnFinal.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    
    btnFinal.MouseButton1Click:Connect(function()
        game:GetService("Players").LocalPlayer:Kick("\n[System] \nLỗi: 267 \nMua Prenium mà chơi t, Thằng Nhà Nghèo")
    end)
end)

btnCancel.MouseButton1Click:Connect(function()
    game:GetService("Players").LocalPlayer:Kick("\n[CẢNH BÁO] \nYour account delete \nLỗi: 267")
end)
