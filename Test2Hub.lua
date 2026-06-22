-- Tạo GUI full đen che toàn màn hình
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.IgnoreGuiInset = true

local BlackFrame = Instance.new("Frame", ScreenGui)
BlackFrame.Size = UDim2.new(1, 0, 1, 0)
BlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

-- Chữ giữa màn hình
local StatusText = Instance.new("TextLabel", BlackFrame)
StatusText.Size = UDim2.new(1, 0, 1, 0)
StatusText.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusText.TextSize = 40
StatusText.Font = Enum.Font.GothamBold
StatusText.BackgroundTransparency = 1

-- 1. Đang Tải Dữ Liệu
StatusText.Text = "Đang Tải Dữ Liệu"
wait(3)

-- 2. Chữ nhấp nháy cầu vồng
spawn(function()
    while true do
        StatusText.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.1)
    end
end)
StatusText.Text = "Đang Tải Dữ Liệu"
wait(5)

-- 3. Sắp Thành Công
StatusText.Text = "Sắp Thành Công"

-- 3 thông báo góc phải
local Notification = game:GetService("StarterGui")
wait(1)
Notification:SetCore("SendNotification", {Title = "Tau Hu Hub", Text = "Hãy chờ thêm 3s", Duration = 2})
wait(1)
Notification:SetCore("SendNotification", {Title = "Tau Hu Hub", Text = "Xin lỗi Tau Hu Hub đang bị Delay", Duration = 2})
wait(1)
Notification:SetCore("SendNotification", {Title = "Tau Hu Hub", Text = "Thành công", Duration = 2})

-- Hiện chữ Thành Công giữa màn hình
StatusText.Text = "Thành Công"
wait(2)

-- Kick với mã lỗi
game:GetService("Players").LocalPlayer:Kick("\n[Tau Hu Security] \nLỗi: 267 \nNghe Có Cái Lồn Nha Cưng")

