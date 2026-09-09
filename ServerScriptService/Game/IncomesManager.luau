local players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataManager = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("DataManager"))


while true do
	task.wait(1)
	for _, player in ipairs(players:GetPlayers()) do
		local Income = DataManager.GetIncome(player)
		if Income > 0 then
			DataManager.ManageCoins(player, Income)
		end
	end
end
