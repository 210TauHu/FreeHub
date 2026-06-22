local sg = Instance.new("ScreenGui", game.CoreGui)

-- 1. NÚT OPEN HÌNH TRÒN NHỎ (Để bấm HIỆN UI)
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

local openStroke = Instance.new("UIStroke", openBtn)
openStroke.Color = Color3.fromRGB(255, 255, 255)
openStroke.Thickness = 1.5

-- 2. KHUNG CHÍNH (Giao diện Hub cuốn sách full đen)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 350, 0, 220)
main.Position = UDim2.new(0.3, 0, 0.3, 0)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Visible = true 

local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = Color3.fromRGB(40, 40, 40)
mainStroke.Thickness = 1

-- Thanh trên cùng (Chứa tên bên trái và dấu X bên phải)
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

-- NÚT X ĐỂ ẨN UI (Nằm góc phải thanh topBar)
local closeBtn = Instance.new("TextButton", topBar)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 18

-- Gáy sách chứa các Tab lướt (Bên trái)
local tabContainer = Instance.new("Frame", main)
tabContainer.Size = UDim2.new(0, 80, 1, -30)
tabContainer.Position = UDim2.new(0, 0, 0, 30)
tabContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
tabContainer.BorderSizePixel = 0

-- Trang sách chứa nội dung (Bên phải)
local pageContainer = Instance.new("Frame", main)
pageContainer.Size = UDim2.new(1, -90, 1, -40)
pageContainer.Position = UDim2.new(0, 85, 0, 35)
pageContainer.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
pageContainer.BorderSizePixel = 0

-- Các trang nội dung tương ứng khi lướt tab
local pages = {}
local tabNames = {"Home", "Game", "Ui", "Rifery"}

for i, name in ipairs(tabNames) do
    local tabBtn = Instance.new("TextButton", tabContainer)
    tabBtn.Size = UDim2.new(1, -10, 0, 30)
    tabBtn.Position = UDim2.new(0, 5, 0, (i-1) * 35 + 5)
    tabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tabBtn.TextColor3 = Color3.fromRGB(230, 230, 230)
    tabBtn.Text = name
    tabBtn.Font = Enum.Font.SourceSansBold
    tabBtn.TextSize = 13
    
    local btnCorner = Instance.new("UICorner", tabBtn)
    btnCorner.CornerRadius = UDim.new(0, 4)
    
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

-- [NỘI DUNG TRANG HOME]
local homeTxt = Instance.new("TextLabel", pages["Home"])
homeTxt.Size = UDim2.new(1, 0, 1, 0)
homeTxt.BackgroundTransparency = 1
homeTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
homeTxt.Text = "Trang Home"
homeTxt.Font = Enum.Font.SourceSansBold
homeTxt.TextSize = 16


-- ==========================================================
-- [NỘI DUNG TRANG GAME - TÍNH NĂNG FLY CHỈNH TỐC ĐỘ]
local gamePage = pages["Game"]

-- Ô Nhập Tốc Độ Bay (TextBox)
local speedInput = Instance.new("TextBox", gamePage)
speedInput.Size = UDim2.new(0, 200, 0, 30)
speedInput.Position = UDim2.new(0.5, -100, 0.15, 0)
speedInput.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
speedInput.Text = "50" -- Tốc độ bay mặc định
speedInput.PlaceholderText = "Nhập tốc độ bay..."
speedInput.Font = Enum.Font.SourceSans
speedInput.TextSize = 14

local speedCorner = Instance.new("UICorner", speedInput)
speedCorner.CornerRadius = UDim.new(0, 4)

local speedLabel = Instance.new("TextLabel", gamePage)
speedLabel.Size = UDim2.new(0, 200, 0, 20)
speedLabel.Position = UDim2.new(0.5, -100, 0, 0)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
speedLabel.Text = "Tốc độ bay (Speed):"
speedLabel.Font = Enum.Font.SourceSansBold
speedLabel.TextSize = 12

-- Nút Bật Bay (Fly Button)
local flyBtn = Instance.new("TextButton", gamePage)
flyBtn.Size = UDim2.new(0, 95, 0, 35)
flyBtn.Position = UDim2.new(0.5, -100, 0.45, 0)
 
