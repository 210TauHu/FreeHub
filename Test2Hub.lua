local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function onCharacter(character)
	local root = character:WaitForChild("HumanoidRootPart")

	root.Touched:Connect(function(hit)
		local targetCharacter = hit.Parent
		if targetCharacter and targetCharacter ~= character then
			local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")
			local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")

			if targetHumanoid and targetRoot then
				local velocity = Instance.new("BodyVelocity")
				velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				velocity.Velocity = (targetRoot.Position - root.Position).Unit * 500
				velocity.Parent = targetRoot

				game:GetService("Debris"):AddItem(velocity, 0.2)
			end
		end
	end)
end

if player.Character then
	onCharacter(player.Character)
end

player.CharacterAdded:Connect(onCharacter)
