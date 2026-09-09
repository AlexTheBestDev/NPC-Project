local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataLoader = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("DataLoader"))
local BaseManager = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("BaseManager"))



Players.PlayerAdded:Connect(function(player)
	BaseManager.SetBase(player)
	print("Base set for player"..player.Name)
	DataLoader.LoadCoins(player)
	DataLoader.LoadNPCs(player)
end)
