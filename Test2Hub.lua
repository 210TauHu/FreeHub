local sg = Instance.new("ScreenGui", game.CoreGui)

-- 1. NÚT OPEN HÌNH TRÒN NHỎ (Để bật/tắt giao diện)
local openBtn = Instance.new("TextButton", sg)
openBtn.Size = UDim2.new(0, 45, 0, 45)
openBtn.Position = UDim2.new(0, 15, 0, 15)
openBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Màu đen
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openBtn.Text = "Open"
openBtn.Font = Enum.Font.SourceSansBold
openBtn.TextSize = 14
openBtn.Active = true
openBtn.Draggable = true

-- Bo tròn nút Open thành hình tròn
local openCorner = Instance.new("UICorner", openBtn)
openCorner.CornerRadius = UDim.new(1, 0)

-- Viền cho nút Open
local openStroke = Instance.new("UIStroke", openBtn)
openStroke.Color = Color3.fromRGB(255, 255, 255)
openStroke.Thickness = 1.5

-- 2. KHUNG CHÍNH (Giao diện Hub cuốn sách full đen)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 350, 0, 220)
main.Position = UDim2.new(0.3, 0, 0.3, 0)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Full đen nền chính
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Visible = true -- Mặc định hiện khi chạy script

-- Viền mỏng cho toàn bộ Hub nhìn cho nét
local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = Color3.fromRGB(40, 40, 40)
mainStroke.Thickness = 1

-- Thanh trên cùng (Màu đen - Chứa tên góc trái)
local topBar = Instance.new("Frame", main)
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25) -- Thanh trên màu đen
topBar.BorderSizePixel = 0

local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1, -10, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0) -- Dịch lề vào một chút
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "TauHu210 v1.0"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left -- ÉP TÊN SANG GÓC TRÁI CHUẨN BÀI

-- Gáy sách chứa các Tab lướt (Bên trái)
local tabContainer = Instance.new("Frame", main)
tabContainer.Size = UDim2.new(0, 80, 1, -30)
tabContainer.Position = UDim2.new(0, 0, 0, 30)
tabContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 18) -- Đen tối hơn
tabContainer.BorderSizePixel = 0

-- Trang sách chứa nội dung (Bên phải)
local pageContainer = Instance.new("Frame", main)
pageContainer.Size = UDim2.new(1, -90, 1, -40)
pageContainer.Position = UDim2.new(0, 85, 0, 35)
pageContainer.BackgroundColor3 = Color3.fromRGB(22, 22, 22) -- Đen xám nhẹ
pageContainer.BorderSizePixel = 0

-- Các trang nội dung tương ứng khi lướt tab
local pages = {}
local tabNames = {"Home", "Game", "Ui", "Rifery"}

for i, name in ipairs(tabNames) do
    -- Nút Tab ở gáy sách bên trái
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
    
    -- Trang nội dung bên phải
    local page = Instance.new("Frame", pageContainer)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = (i == 1) -- Hiện trang đầu tiên (Home)
    pages[name] = page
    
    -- Hiệu ứng click lướt chuyển tab
    tabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(pages) do p.Visible = false end
        page.Visible = true
    end)
end

-- [Nội dung hiển thị mặc định của các trang]
