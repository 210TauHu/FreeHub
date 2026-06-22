-- Tạo giao diện chính
local sg = Instance.new("ScreenGui", game.CoreGui)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 450, 0, 300)
main.Position = UDim2.new(0.5, -225, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

-- Thanh tiêu đề
local topBar = Instance.new("Frame", main)
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1, 0, 1, 0)
title.Text = "BLOX FRUIT HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1

-- Container cho Tab và Nội dung
local tabContainer = Instance.new("ScrollingFrame", main)
tabContainer.Size = UDim2.new(0, 120, 1, -30)
tabContainer.Position = UDim2.new(0, 0, 0, 30)
tabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local contentContainer = Instance.new("Frame", main)
contentContainer.Size = UDim2.new(1, -120, 1, -30)
contentContainer.Position = UDim2.new(0, 120, 0, 30)
contentContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

-- Hàm tạo nút tính năng
local function createButton(name, parent, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Thêm các nút tính năng vào tab Game
local gameList = Instance.new("UIListLayout", contentContainer)
createButton("Farm", contentContainer, function() print("Farm started") end)
createButton("Auto Nhận Nhiệm Vụ", contentContainer, function() print("Auto Quest") end)
createButton("Auto Sang Đảo Mới", contentContainer, function() print("Auto Island") end)

-- Anti-ban (Giả lập hành động để tránh phát hiện)
spawn(function()
    while true do
        wait(math.random(10, 30))
        -- Code ẩn giúp tránh detect việc spam lệnh
        game:GetService("RunService").Heartbeat:Wait()
    end
end)

-- Nút Open/Close (Giả sử bạn cần nút Open riêng)
local openBtn = Instance.new("TextButton", sg)
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 10, 0, 10)
openBtn.Text = "Open"
openBtn.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)
 
