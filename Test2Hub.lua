local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.IgnoreGuiInset = true

-- Khung chính xịn hơn
local MainFrame = Instance.new("ImageLabel", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 250)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Image = "rbxassetid://118502927291477" -- Thay ID giao diện xịn của bạn vào đây
MainFrame.ScaleType = Enum.ScaleType.Stretch
MainFrame.BorderSizePixel = 0

-- Viền nhấp nháy cầu vồng cho sang
local Stroke = Instance.new("UIStroke", MainFrame)
Stroke.Thickness = 3
spawn(function()
    while MainFrame.Parent do
        Stroke.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.05)
    end
end)

-- Chữ tiêu đề
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0.3, 0)
Title.Position = UDim2.new(0, 0, 0.1, 0)
Title.BackgroundTransparency = 1
Title.Text = "CELESTIAL HUB | PREMIUM"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22

-- Nút bấm xịn (có bo góc)
local function CreateStyledBtn(name, pos, color)
    local b = Instance.new("TextButton", MainFrame)
    b.Size = UDim2.new(0, 120, 0, 40)
    b.Position = pos
    b.BackgroundColor3 = color
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Text = name
    b.Font = Enum.Font.GothamBold
    local corner = Instance.new("UICorner", b)
    corner.CornerRadius = UDim.new(0, 10)
    return b
end

local btnAccept = CreateStyledBtn("Accept", UDim2.new(0.2, -60, 0.7, 0), Color3.fromRGB(0, 170, 255))
local btnCancel = CreateStyledBtn("Cancel", UDim2.new(0.8, -60, 0.7, 0), Color3.fromRGB(170, 0, 0))

-- Logic troll
btnAccept.MouseButton1Click:Connect(function()
    Title.Text = "Thank you for choosing us!"
    btnAccept:Destroy()
    btnCancel:Destroy()
    
    local btnLoad = Instance.new("TextButton", MainFrame)
    btnLoad.Size = UDim2.new(0, 150, 0, 40)
    btnLoad.Position = UDim2.new(0.5, -75, 0.7, 0)
    btnLoad.Text = "Initialize Script..."
    btnLoad.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
    btnLoad.Font = Enum.Font.GothamBold
    Instance.new("UICorner", btnLoad)
    
    btnLoad.MouseButton1Click:Connect(function()
        game:GetService("Players").LocalPlayer:Kick("\n[System] \nLỗi: 267 \nMua Premium mà dùng, Thằng Nhà Nghèo!")
    end)
end)

btnCancel.MouseButton1Click:Connect(function()
    game:GetService("Players").LocalPlayer:Kick("\n[System] \nLỗi: 267 \nYour account has been deleted for cheating.")
end)

