 -- Hiển thị thông báo (thông qua chat hoặc script notification)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Thông báo",
    Text = "Ngu Thì Chịu",
    Duration = 3
})

-- Đợi 3 giây để thông báo kịp hiện rồi thoát game
wait(3)
game:GetService("Players").LocalPlayer:Kick("Ngu Thì Chịu")
