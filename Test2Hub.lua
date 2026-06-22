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
StatusText.Text = "Đang Tải Dữ Liệu"

wait(3)

-- Chữ cầu vồng
spawn(function()
    while ScreenGui.Parent do
        StatusText.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.1)
    end
end)
wait(5)

StatusText.Text = "Sắp Thành Công"
wait(2)

-- 3 thông báo góc phải
local Notification = game:GetService("StarterGui")
Notification:SetCore("SendNotification", {Title = "Tau Hu Hub", Text = "Hãy chờ thêm 3s", Duration = 2})
wait(1)
Notification:SetCore("SendNotification", {Title = "Tau Hu Hub", Text = "Xin lỗi Tau Hu Hub đang bị Delay", Duration = 2})
wait(1)
Notification:SetCore("SendNotification", {Title = "Tau Hu Hub", Text = "Thành công", Duration = 2})

StatusText.Text = "Thành Công"
wait(2)

-- Đếm ngược 3-2-1
for i = 3, 1, -1 do
    StatusText.Text = tostring(i)
    wait(1)
end

-- Vòng xoay loading giống Youtube khi mất kết nối
StatusText.Text = "" -- Xóa chữ
local Spinner = Instance.new("ImageLabel", ImageFrame)
Spinner.Size = UDim2.new(0, 100, 0, 100)
Spinner.Position = UDim2.new(0.5, -50, 0.5, -50)
Spinner.BackgroundTransparency = 1
Spinner.Image = "rbxassetid://6031280882" -- ID icon xoay tròn chuẩn của Roblox

spawn(function()
    while Spinner.Parent do
        Spinner.Rotation = Spinner.Rotation + 10
        wait(0.05)
    end
end)

wait(3) -- Cho nó xoay 3 giây trước khi kick

-- Kick với câu chửi mới
game:GetService("Players").LocalPlayer:Kick("\n[Tau Hu Security] \nLỗi: 267 \nTao Nói Rồi Thằng Cặc Bé")
