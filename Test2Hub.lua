-- Tạo GUI chính
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.IgnoreGuiInset = true
ScreenGui.Name = "TauHuTroll"

-- Khung ảnh nền
local ImageFrame = Instance.new("ImageLabel", ScreenGui)
ImageFrame.Size = UDim2.new(1, 0, 1, 0)
ImageFrame.BackgroundTransparency = 1
ImageFrame.Image = "rbxassetid://118502927291477"
ImageFrame.ScaleType = Enum.ScaleType.Fit

-- Chữ trạng thái
local StatusText = Instance.new("TextLabel", ImageFrame)
StatusText.Size = UDim2.new(1, 0, 1, 0)
StatusText.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusText.TextSize = 40
StatusText.Font = Enum.Font.GothamBold
StatusText.BackgroundTransparency = 1

-- 1. Đang Tải Dữ Liệu
StatusText.Text = "Đang Tải Dữ Liệu"
wait(3)

-- 2. Chữ cầu vồng
spawn(function()
    while ScreenGui.Parent do
        StatusText.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.1)
    end
end)
wait(5)

-- 3. Sắp Thành Công
StatusText.Text = "Sắp Thành Công"
wait(2)

-- 4. 3 thông báo góc phải
local Notification = game:GetService("StarterGui")
Notification:SetCore("SendNotification", {Title = "Tau Hu Hub", Text = "Hãy chờ thêm 3s", Duration = 2})
wait(1)
Notification:SetCore("SendNotification", {Title = "Tau Hu Hub", Text = "Xin lỗi Tau Hu Hub đang bị Delay", Duration = 2})
wait(1)
Notification:SetCore("SendNotification", {Title = "Tau Hu Hub", Text = "Thành công", Duration = 2})

StatusText.Text = "Thành Công"
wait(2)

-- 5. Đếm ngược 3s trước khi kick
for i = 3, 1, -1 do
    StatusText.Text = tostring(i)
    wait(1)
end

-- 6. Kick
game:GetService("Players").LocalPlayer:Kick("\n[Tau Hu Security] \nLỗi: 267 \nNghe Có Cái Lồn Nha Cưng")
