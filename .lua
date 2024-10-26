
repeat task.wait() until game:GetService("Players")
repeat task.wait() until game:GetService("Players").LocalPlayer

for _, v1 in pairs(game.Workspace:GetDescendants()) do
	if v1:IsA("ProximityPrompt") then
		v1.HoldDuration = 0
	end
end

wait(1.9)

config = {
	starts = true,
	LockMoney = 100000,
}

local _v1 = function(c)
	game:GetService("VirtualInputManager"):SendKeyEvent(true, c, false, game)
	game:GetService("VirtualInputManager"):SendKeyEvent(false, c, false, game)
end

local _v2 = function()
	local player = game:GetService("Players").LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local bodyClip = humanoidRootPart:FindFirstChild("BodyClip")
	if not bodyClip then
		local Noclip = Instance.new("BodyVelocity")
		Noclip.Name = "BodyClip"
		Noclip.MaxForce = Vector3.new(100000, 100000, 100000) 
		Noclip.Parent = humanoidRootPart
	end
end

task.spawn(function()
	while task.wait(.22) do
		pcall(function()
			local _Coins = game:GetService("Players").LocalPlayer.leaderstats.Cash
			if _Coins.Value >= config.LockMoney then 
				game:GetService("Players").LocalPlayer:Kick("Lock Money")
			end
			local positions = {}
			for _, v1 in pairs(game.Workspace.Models["ที่ฟาร์มผัก"]["ฟาร์ม"]:GetDescendants()) do
				if v1.Name == "Green Plant" then
					table.insert(positions, v1.CFrame * CFrame.new(0, -2.75, 0))
				end
			end
			for _, v_ in pairs(positions) do
				if not game:GetService("Players").LocalPlayer.Character then break end
				_v2()
				game:GetService("Players").LocalPlayer.Character:PivotTo(v_)
				local _O = game.Workspace.Models["ที่ฟาร์มผัก"]["ฟาร์ม"]["ผักฟาร์ม"]["Green Plant"]["RobPart"]["Attachment"]:FindFirstChild("ProximityPrompt")
				if _O then
					_v1("E")
				else
					print("ProximityPrompt not found")
				end
				task.wait(.1)
			end
		end)
	end
end)
