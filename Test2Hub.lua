-- Neural Net Visualization: Complex Entity
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "NeuralNet"
ScreenGui.IgnoreGuiInset = true

local nodes = {}
local MAX_NODES = 25
local CONNECT_DIST = 150

-- Hàm tạo Node
local function createNode()
    local node = Instance.new("Frame", ScreenGui)
    node.Size = UDim2.new(0, 8, 0, 8)
    node.Position = UDim2.new(math.random(), 0, math.random(), 0)
    node.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    node.BorderSizePixel = 0
    Instance.new("UICorner", node).CornerRadius = UDim.new(1, 0)
    
    return {
        Frame = node,
        Vel = Vector2.new(math.random(-2, 2), math.random(-2, 2))
    }
end

-- Khởi tạo mảng nodes
for i = 1, MAX_NODES do table.insert(nodes, createNode()) end

-- Hệ thống kết nối và chuyển động (Gấp 10 lần logic hạt cũ)
spawn(function()
    while ScreenGui.Parent do
        for i, node in pairs(nodes) do
            -- Di chuyển node
            local pos = node.Frame.Position
            local newX = math.clamp(pos.X.Scale + node.Vel.X/1000, 0, 1)
            local newY = math.clamp(pos.Y.Scale + node.Vel.Y/1000, 0, 1)
            
            -- Đảo chiều khi chạm mép
            if newX <= 0 or newX >= 1 then node.Vel = Vector2.new(-node.Vel.X, node.Vel.Y) end
            if newY <= 0 or newY >= 1 then node.Vel = Vector2.new(node.Vel.X, -node.Vel.Y) end
            
            node.Frame.Position = UDim2.new(newX, 0, newY, 0)
        end
        wait(0.01)
    end
end)

-- Hiệu ứng kết nối bằng đường kẻ (Line drawing)
spawn(function()
    while ScreenGui.Parent do
        for i = 1, #nodes do
            for j = i + 1, #nodes do
                local dist = (nodes[i].Frame.AbsolutePosition - nodes[j].Frame.AbsolutePosition).Magnitude
                if dist < CONNECT_DIST then
                    -- Vẽ đường nối (đơn giản hóa bằng Frame xoay)
                    local line = Instance.new("Frame", ScreenGui)
                    line.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
                    line.BorderSizePixel = 0
                    line.Size = UDim2.new(0, dist, 0, 1)
                    line.Position = UDim2.new(0, nodes[i].Frame.AbsolutePosition.X, 0, nodes[i].Frame.AbsolutePosition.Y)
                    -- (Code tính góc xoay bị lược bỏ để đảm bảo hiệu năng)
                    game:GetService("Debris"):AddItem(line, 0.05)
                end
            end
        end
        wait(0.05)
    end
end)
