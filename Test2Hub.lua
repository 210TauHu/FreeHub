local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "TauHu210Hub"

-- Nút Open tròn
local OpenBtn = Instance.new("TextButton", ScreenGui)
OpenBtn.Size = UDim2.new(0, 50, 0, 50)
OpenBtn.Position = UDim2.new(0, 20, 0, 100)
OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenBtn.Text = "Open"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)
OpenBtn.Draggable = true

-- Khung chính (Giống ảnh Min Gaming)
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 450, 0, 300)
Main.Position = UDim2.new(0.5, -225, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

-- Top bar
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
local Title = Instance.new("TextLabel", TopBar)
Title.Text = "TauHu210 Hub | Blox Fruit"
Title.Size = UDim2.new(1, -30, 1, 0)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.BackgroundTransparency = 1

-- Tab List bên trái
local TabList = Instance.new("ScrollingFrame", Main)
TabList.Size = UDim2.new(0, 130, 1, -30)
TabList.Position = UDim2.new(0, 0, 0, 30)
TabList.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

-- Container chứa tính năng bên phải
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, -130, 1, -30)
Content.Position = UDim2.new(0, 130, 0, 30)
Content.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

-- Hàm thêm tab và nút
local function AddTab(name, features)
    local btn = Instance.new("TextButton", TabList)
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    
    btn.MouseButton1Click:Connect(function()
        for _, child in pairs(Content:GetChildren()) do child:Destroy() end
        for _, feat in pairs(features) do
            local fBtn = Instance.new("TextButton", Content)
            fBtn.Size = UDim2.new(1, -10, 0, 35)
            fBtn.Text = feat
            fBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            fBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            fBtn.MouseButton1Click:Connect(function() print("Executing: " .. feat) end)
        end
    end)
end

-- Thêm Tabs tính năng
AddTab("Game", {"Farm", "Auto Nhận Nhiệm Vụ", "Auto Sang Đảo Mới"})
AddTab("Anti-Ban", {"Kích hoạt bảo mật"})

-- Điều khiển
OpenBtn.MouseButton1Click:Connect(function() Main.Visible = true end)
CloseBtn.MouseButton1Click:Connect(function() Main.Visible = false end)
openBtn.MouseButton2Click:Connecr(Freeze()Main(Ui).visible-fule(end)

