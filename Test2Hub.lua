local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "VisualEffect"
ScreenGui.IgnoreGuiInset = true

-- 1. Hiệu ứng nhấp nháy mạnh bạo (5 giây)
local f = Instance.new("Frame", ScreenGui)
f.Size = UDim2.new(1, 0, 1, 0)
f.BackgroundColor3 = Color3.new(0, 0, 0)
spawn(function()
    for i = 1, 20 do -- Tốc độ nhấp nháy cực nhanh
        f.Visible = not f.Visible
        wait(0.25)
    end
    f:Destroy()
end)

-- Thông báo Unknown ở góc dưới bên phải
local Notify = Instance.new("TextLabel", ScreenGui)
Notify.Size = UDim2.new(0, 200, 0, 50)
Notify.Position = UDim2.new(1, -210, 1, -60)
Notify.BackgroundTransparency = 1
Notify.Text = "Unknown"
Notify.TextColor3 = Color3.fromRGB(255, 255, 255)
Notify.Font = Enum.Font.GothamBold

-- 2. Chấm đen to gấp 10 lần (40x40 pixel)
spawn(function()
    wait(5) -- Đợi xong phần nhấp nháy
    for i = 1, 100 do 
        local dot = Instance.new("Frame", ScreenGui)
        dot.Size = UDim2.new(0, 90, 0, 70) -- Kích thước 40x40
        dot.Position = UDim2.new(math.random(), 0, math.random(), 0)
        dot.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        wait(0.05)
    end
    
    -- 3. Kick game sau 5 giây tiếp theo
    wait(9)
    game.Players.LocalPlayer:Kick("Script hết Hạn 6 Năm Rồi Cu")
end)
