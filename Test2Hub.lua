local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "VisualEffect"
ScreenGui.IgnoreGuiInset = true

-- Hàm tạo frame phủ màn hình
local function createOverlay(color)
    local f = Instance.new("Frame", ScreenGui)
    f.Size = UDim2.new(1, 0, 1, 0)
    f.BackgroundColor3 = color
    f.Transparency = 1
    return f
end

-- 1. Hiệu ứng nhấp nháy đen trắng (2-3 giây)
local white = createOverlay(Color3.new(1, 1, 1))
local black = createOverlay(Color3.new(0, 0, 0))

for i = 1, 6 do
    white.Transparency = (i % 2 == 0) and 0 or 1
    black.Transparency = (i % 2 ~= 0) and 0 or 1
    wait(0.4)
end
white.Transparency = 1
black.Transparency = 1

-- 2. Nửa đen nửa trắng
local halfWhite = Instance.new("Frame", ScreenGui)
halfWhite.Size = UDim2.new(0.5, 0, 1, 0)
halfWhite.BackgroundColor3 = Color3.new(1, 1, 1)

local halfBlack = Instance.new("Frame", ScreenGui)
halfBlack.Size = UDim2.new(0.5, 0, 1, 0)
halfBlack.Position = UDim2.new(0.5, 0, 0, 0)
halfBlack.BackgroundColor3 = Color3.new(0, 0, 0)

wait(2) -- Giữ trạng thái này 2 giây
halfWhite:Destroy()
halfBlack:Destroy()

-- 3. Hiệu ứng chấm đen phủ kín màn hình
local DotContainer = Instance.new("Frame", ScreenGui)
DotContainer.Size = UDim2.new(1, 0, 1, 0)
DotContainer.BackgroundTransparency = 1

spawn(function()
    for i = 1, 500 do -- Tạo 500 chấm đen
        local dot = Instance.new("Frame", DotContainer)
        dot.Size = UDim2.new(0, 4, 0, 4)
        dot.Position = UDim2.new(math.random(), 0, math.random(), 0)
        dot.BackgroundColor3 = Color3.new(0, 0, 0)
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        wait(0.01) -- Tốc độ xuất hiện của chấm
    end
end)
