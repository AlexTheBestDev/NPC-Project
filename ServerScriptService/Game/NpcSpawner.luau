local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NpcSpawner = workspace:WaitForChild("NpcSpawner")
local NPC1 = ReplicatedStorage:WaitForChild("NPCs"):WaitForChild("NPC1")
local NPC2 = ReplicatedStorage:WaitForChild("NPCs"):WaitForChild("NPC2")
local NPC3 = ReplicatedStorage:WaitForChild("NPCs"):WaitForChild("NPC3")
local NPC4 = ReplicatedStorage:WaitForChild("NPCs"):WaitForChild("NPC4")
local NPC5 = ReplicatedStorage:WaitForChild("NPCs"):WaitForChild("NPC5")
local NpcData = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("NpcData"))
local DataLoader = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("DataLoader"))




local function spawnNPC()
	
	local function ShowNpcStats(Npc, Name)
		DataLoader.LoadNpcStats(Npc, Name)
	end
	local chance = math.random(1, 100)
	if chance <= 50 then
		local NpcCopy1 = NPC1:Clone()
		NpcCopy1.Parent = workspace
		NpcCopy1:PivotTo(NpcSpawner.CFrame)
		NpcCopy1.ProximityPrompt.ActionText = "Buy ".."("..NpcData.NPCs.NPC1.Price..")"
		ShowNpcStats(NpcCopy1, "NPC1")
	elseif chance <= 75 then
		local NpcCopy2 = NPC2:Clone()
		NpcCopy2.Parent = workspace
		NpcCopy2:PivotTo(NpcSpawner.CFrame)
		NpcCopy2.ProximityPrompt.ActionText = "Buy ".."("..NpcData.NPCs.NPC2.Price..")"
		ShowNpcStats(NpcCopy2, "NPC2")
	elseif chance <= 85 then
		local NpcCopy3 = NPC3:Clone()
		NpcCopy3.Parent = workspace
		NpcCopy3:PivotTo(NpcSpawner.CFrame)
		NpcCopy3.ProximityPrompt.ActionText = "Buy ".."("..NpcData.NPCs.NPC3.Price..")"
		ShowNpcStats(NpcCopy3, "NPC3")
	elseif chance <= 95 then
		local NpcCopy4 = NPC4:Clone()
		NpcCopy4.Parent = workspace
		NpcCopy4:PivotTo(NpcSpawner.CFrame)
		NpcCopy4.ProximityPrompt.ActionText = "Buy ".."("..NpcData.NPCs.NPC4.Price..")"
		ShowNpcStats(NpcCopy4, "NPC4")
	else
		local NpcCopy5 = NPC5:Clone()
		NpcCopy5.Parent = workspace
		NpcCopy5:PivotTo(NpcSpawner.CFrame)
		NpcCopy5.ProximityPrompt.ActionText = "Buy ".."("..NpcData.NPCs.NPC5.Price..")"
		ShowNpcStats(NpcCopy5, "NPC5")
	end
end

while true do
	task.wait(5)
	spawnNPC()
end
