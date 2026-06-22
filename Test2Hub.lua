
local sg = Instance.new("ScreenGui", game.CoreGui)

-- 1. NÚT OPEN HÌNH TRÒN NHỎ
local openBtn = Instance.new("TextButton", sg)
openBtn.Size = UDim2.new(0, 45, 0, 45)
openBtn.Position = UDim2.new(0, 15, 0, 55)
openBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openBtn.Text = "Open"
openBtn.Font = Enum.Font.SourceSansBold
openBtn.TextSize = 14
openBtn.Active = true
openBtn.Draggable = true

local openCorner = Instance.new("UICorner", openBtn)
openCorner.CornerRadius = UDim.new(1, 0)

-- 2. KHUNG CHÍNH (Full đen)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 350, 0, 220)
main.Position = UDim2.new(0.3, 0, 0.3, 0)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

local topBar = Instance.new("Frame", main)
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
topBar.BorderSizePixel = 0

local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "TauHu210 v1.0"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton", topBar)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 18

-- TABS
local tabContainer = Instance.new("Frame", main)
tabContainer.Size = UDim2.new(0, 80, 1, -30)
tabContainer.Position = UDim2.new(0, 0, 0, 30)
tabContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
tabContainer.BorderSizePixel = 0

local pageContainer = Instance.new("Frame", main)
pageContainer.Size = UDim2.new(1, -90, 1, -40)
pageContainer.Position = UDim2.new(0, 85, 0, 35)
pageContainer.BackgroundTransparency = 1

local pages = {}
local tabNames = {"Home", "Game", "Ui", "Rifery"}

for i, name in ipairs(tabNames) do
    local tabBtn = Instance.new("TextButton", tabContainer)
    tabBtn.Size = UDim2.new(1, -10, 0, 30)
    tabBtn.Position = UDim2.new(0, 5, 0, (i-1) * 35 + 5)
    tabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabBtn.Text = name
    Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 4)
    
    local page = Instance.new("Frame", pageContainer)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = (i == 1)
    pages[name] = page
    
    tabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(pages) do p.Visible = false end
        page.Visible = true
    end)
end

-- TÍNH NĂNG FLY TRONG TAB GAME
local speedInput = Instance.new("TextBox", pages["Game"])
speedInput.Size = UDim2.new(0, 150, 0, 30)
speedInput.Position = UDim2.new(0.5, -75, 0.2, 0)
speedInput.Text = "50"
local flyBtn = Instance.new("TextButton", pages["Game"])
flyBtn.Size = UDim2.new(0, 100, 0, 30)
flyBtn.Position = UDim2.new(0.5, -105, 0.6, 0)
flyBtn.Text = "Fly"
flyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
local unflyBtn = Instance.new("TextButton", pages["Game"])
unflyBtn.Size = UDim2.new(0, 100, 0, 30)
unflyBtn.Position = UDim2.new(0.5, 5, 0.6, 0)
unflyBtn.Text = "Unfly"
unflyBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)

local flying = false
flyBtn.MouseButton1Click:Connect(function()
    flying = true
    local hum = game.Players.LocalPlayer.Character.Humanoid
    local speed = tonumber(speedInput.Text) or 50
    local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
    bv.Velocity = Vector3.new(0, speed, 0)
    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    spawn(function()
        while flying do wait()
            bv.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * speed
        end
        bv:Destroy()
    end)
end)

unflyBtn.MouseButton1Click:Connect(function() flying = false end)

-- ĐIỀU KHIỂN
openBtn.MouseButton1Click:Connect(function() main.Visible = true end)
closeBtn.MouseButton1Click:Connect(function() main.Visible = false end)
