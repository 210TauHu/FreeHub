-- Tạo GUI chính
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.IgnoreGuiInset = true
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Khung ảnh nền ban đầu
local ImageFrame = Instance.new("ImageLabel", ScreenGui)
ImageFrame.Size = UDim2.new(1, 0, 1, 0)
ImageFrame.BackgroundTransparency = 1
ImageFrame.Image = "rbxassetid://118502927291477"
ImageFrame.ScaleType = Enum.ScaleType.Fit

local StatusText = Instance.new("TextLabel", ImageFrame)
StatusText.Size = UDim2.new(1, 0, 1, 0)
StatusText.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusText.TextSize = 40
StatusText.Font = Enum.Font.GothamBold
StatusText.Text = "Đang Tải Dữ Liệu"

wait(3)
StatusText.Text = "Sắp Thành Công"
wait(2)

-- Thông báo dồn dập
local Notification = game:GetService("StarterGui")
Notification:SetCore("SendNotification", {Title = "Tau Hu Hub", Text = "Hãy chờ thêm 3s", Duration = 2})
wait(1)
Notification:SetCore("SendNotification", {Title = "Tau Hu Hub", Text = "Xin lỗi Tau Hu Hub đang bị Delay", Duration = 2})
wait(1)
Notification:SetCore("SendNotification", {Title = "Tau Hu Hub", Text = "Thành công", Duration = 2})

StatusText.Text = "Thành Công"
wait(2)

-- Đếm ngược và Reset liên tục
for i = 3, 1, -1 do
    StatusText.Text = tostring(i)
    -- Ép nhân vật reset liên tục trong lúc đếm
    spawn(function()
        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.Health = 0
        end
    end)
    wait(1)
end

-- Hiện ảnh kinh dị full màn hình
local ScaryImage = Instance.new("ImageLabel", ScreenGui)
ScaryImage.Size = UDim2.new(1, 0, 1, 0)
ScaryImage.Image = "rbxassetid://1200000001" -- THAY ID ẢNH KINH DỊ VÀO ĐÂY
ScaryImage.ZIndex = 10
StatusText.Visible = false -- Ẩn chữ

-- Giữ ảnh hiện 2s rồi Kick
wait(2)
Player:Kick("\n[Tau Hu Security] \nLỗi: 267 \nTao Nói Rồi Thằng Cặc Bé")
