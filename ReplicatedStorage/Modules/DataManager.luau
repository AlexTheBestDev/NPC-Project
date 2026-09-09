local DataManager = {}

local DataStoreService = game:GetService("DataStoreService")
local storecoins = DataStoreService:GetDataStore("Coins")
local storenpcs = DataStoreService:GetDataStore("NPCs")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UpdateCoins = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("UpdateCoins")
local UpdateNPCs = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("UpdateNPCs")


function DataManager.ManageCoins(player, amount)
	storecoins:IncrementAsync(tostring(player.UserId), amount)
	local coins = storecoins:GetAsync(tostring(player.UserId))
	UpdateCoins:FireClient(player, coins)
end


function DataManager.GetCoins(player)
	local coins = storecoins:GetAsync(tostring(player.UserId))
	return coins
end



function DataManager.AddNpc(player, npc)
	local NPCs = storenpcs:UpdateAsync(tostring(player.UserId), function(OldData)
		local Data = OldData or {}
		Data[npc] = (Data[npc] or 0) + 1
		return Data
	end)
	UpdateNPCs:FireClient(player, NPCs)


end


local IncomePerSec = {}

function DataManager.AddIncome(player, amount)
	IncomePerSec[player] = (IncomePerSec[player] or 0) + amount
end

function DataManager.GetIncome(player)
	return IncomePerSec[player] or 0
end


return DataManager
