local sg = Instance.new("ScreenGui", game.CoreGui)

-- Khung chính (Hình cuốn sách)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 350, 0, 220)
main.Position = UDim2.new(0.3, 0, 0.3, 0)
main.BackgroundColor3 = Color3.fromRGB(35, 25, 20) -- Màu bìa sách gỗ/da cổ điển
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

-- Phần viền đỏ trên đầu (Hiển thị tên)
local topBar = Instance.new("Frame", main)
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromRGB(180, 0, 0) -- Viền đỏ hiện tên TauHu210 v1.0
topBar.BorderSizePixel = 0

local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "TauHu210 v1.0"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16

-- Gáy sách chứa các Tab lướt lướt (Bên trái như hình vẽ)
local tabContainer = Instance.new("Frame", main)
tabContainer.Size = UDim2.new(0, 80, 1, -30)
tabContainer.Position = UDim2.new(0, 0, 0, 30)
tabContainer.BackgroundColor3 = Color3.fromRGB(25, 18, 15) -- Gáy sách tối hơn
tabContainer.BorderSizePixel = 0

-- Trang sách chứa nội dung (Bên phải)
local pageContainer = Instance.new("Frame", main)
pageContainer.Size = UDim2.new(1, -90, 1, -40)
pageContainer.Position = UDim2.new(0, 85, 0, 35)
pageContainer.BackgroundColor3 = Color3.fromRGB(45, 35, 30)
pageContainer.BorderSizePixel = 0

-- Các trang nội dung tương ứng khi lướt tab
local pages = {}
local tabNames = {"Home", "Game", "Ui", "Rifery"}

for i, name in ipairs(tabNames) do
    -- Tạo nút Tab ở gáy sách bên trái
    local tabBtn = Instance.new("TextButton", tabContainer)
    tabBtn.Size = UDim2.new(1, -10, 0, 30)
    tabBtn.Position = UDim2.new(0, 5, 0, (i-1) * 35 + 5)
    tabBtn.BackgroundColor3 = Color3.fromRGB(55, 40, 35)
    tabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabBtn.Text = name
    tabBtn.Font = Enum.Font.SourceSansBold
    tabBtn.TextSize = 14
    
    -- Tạo trang nội dung tương ứng bên phải
    local page = Instance.new("Frame", pageContainer)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = (i == 1) -- Chỉ hiện trang đầu tiên (Home)
    pages[name] = page
    
    -- Hiệu ứng chuyển trang khi bấm vào các tab lướt lướt
    tabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(pages) do p.Visible = false end
        page.Visible = true
    end)
end

-- [Nội dung hiển thị chữ ở các trang để sẵn cho bạn]
local homeTxt = Instance.new("TextLabel", pages["Home"])
homeTxt.Size = UDim2.new(1, 0, 1, 0)
homeTxt.BackgroundTransparency = 1
homeTxt.TextColor3 = Color3.fromRGB(255, 215, 0)
homeTxt.Text = "Trang Home"
homeTxt.Font = Enum.Font.SourceSansBold
homeTxt.TextSize = 16

local gameTxt = Instance.new("TextLabel", pages["Game"])
gameTxt.Size = UDim2.new(1, 0, 1, 0)
gameTxt.BackgroundTransparency = 1
gameTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
gameTxt.Text = "Trang Game"
gameTxt.Font = Enum.Font.SourceSansBold
gameTxt.TextSize = 16

local uiTxt = Instance.new("TextLabel", pages["Ui"])
uiTxt.Size = UDim2.new(1, 0, 1, 0)
uiTxt.BackgroundTransparency = 1
uiTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
uiTxt.Text = "Trang UI"
uiTxt.Font = Enum.Font.SourceSansBold
uiTxt.TextSize = 16

local riferyTxt = Instance.new("TextLabel", pages["Rifery"])
riferyTxt.Size = UDim2.new(1, 0, 1, 0)
riferyTxt.BackgroundTransparency = 1
riferyTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
riferyTxt.Text = "Trang Rifery"
riferyTxt.Font = Enum.Font.SourceSansBold
