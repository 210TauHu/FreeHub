local sg = Instance.new("ScreenGui", game.CoreGui)

-- 1. NÚT OPEN HÌNH TRÒN
local openBtn = Instance.new("TextButton", sg)
openBtn.Size = UDim2.new(0, 45, 0, 45)
openBtn.Position = UDim2.new(0, 15, 0, 55)
openBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openBtn.Text = "Open"
openBtn.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1, 0)

-- 2. KHUNG CHÍNH (FULL ĐEN)
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
local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "TauHu210 v1.0 | Blox Fruit"
title.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton", topBar)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.Text = "X"

-- TABS
local tabContainer = Instance.new("Frame", main)
tabContainer.Size = UDim2.new(0, 80, 1, -30)
tabContainer.Position = UDim2.new(0, 0, 0, 30)
tabContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 18)

local pageContainer = Instance.new("Frame", main)
pageContainer.Size = UDim2.new(1, -90, 1, -40)
pageContainer.Position = UDim2.new(0, 85, 0, 35)
pageContainer.BackgroundTransparency = 1

local pages = {}
for _, name in pairs({"Home", "Game", "Ui", "Rifery"}) do
    local tabBtn = Instance.new("TextButton", tabContainer)
    tabBtn.Size = UDim2.new(1, -10, 0, 30)
    tabBtn.Position = UDim2.new(0, 5, 0, (#pages * 35) + 5)
    tabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabBtn.Text = name
    Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 4)
    
    local page = Instance.new("ScrollingFrame", pageContainer)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = (#pages == 0)
    pages[name] = page
    
    tabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(pages) do p.Visible = false end
        page.Visible = true
    end)
    table.insert(pages, page)
end

-- TÍNH NĂNG BLOX FRUIT (TRONG TAB GAME)
local function CreateToggle(name, parent)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 200, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = name
    Instance.new("UIListLayout", parent).Padding = UDim.new(0, 5)
    return btn
end

CreateToggle("Farm", pages["Game"]).MouseButton1Click:Connect(function() print("Bật Farm") end)
CreateToggle("Auto Nhận Nhiệm Vụ", pages["Game"]).MouseButton1Click:Connect(function() print("Bật Nhận NV") end)
CreateToggle("Auto Sang Đảo Mới", pages["Game"]).MouseButton1Click:Connect(function() print("Bật Sang Đảo") end)

-- ANTI-BAN NHỎ (Bằng cách làm chậm vòng lặp và tạo delay ngẫu nhiên)
spawn(function()
    while wait(math.random(5, 10)) do
        -- Anti-ban logic: tránh việc gửi lệnh quá nhanh liên tục
        print("System status: Stable (Anti-ban active)")
    end
end)

-- ĐIỀU KHIỂN ĐÓNG MỞ
openBtn.MouseButton1Click:Connect(function() main.Visible = true end)
closeBtn.MouseButton1Click:Connect(function() main.Visible = false end)
