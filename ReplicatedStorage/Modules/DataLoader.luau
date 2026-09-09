local DataLoader = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BaseManager = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("BaseManager"))
local DataManager = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("DataManager"))
local NpcData = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("NpcData"))
local UpdateCoins = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("UpdateCoins")
local UpdateNPCs = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("UpdateNPCs")
local DataStoreService = game:GetService("DataStoreService")
local storecoins = DataStoreService:GetDataStore("Coins")
local storenpcs = DataStoreService:GetDataStore("NPCs")

function DataLoader.LoadCoins(player)
	local Coins = storecoins:GetAsync(tostring(player.UserId))
	if Coins == nil then
		storecoins:SetAsync(tostring(player.UserId),0)
		Coins = 0
	end
	UpdateCoins:FireClient(player, Coins)
	
end




function DataLoader.LoadNpcStats(NPC, Name)
	local NPCData = NpcData.NPCs[Name]
	local NpcStats = NPC:WaitForChild("Head"):WaitForChild("NpcStats")
	local NpcMoney = NpcStats:WaitForChild("NpcMoney")
	local NpcPrice = NpcStats:WaitForChild("NpcPrice")
	local NpcRarity = NpcStats:WaitForChild("NpcRarity")
	local NpcName = NpcStats:WaitForChild("NpcName")
	NpcName.Text = "NPC: "..Name
	NpcMoney.Text = "Money per second: "..NPCData.MoneyPerSec
	NpcPrice.Text = "Price: "..NPCData.Price
	NpcRarity.Text = "Rarity: "..NPCData.Rarity

end

function DataLoader.LoadNPCs(player)
	local NPCs = storenpcs:GetAsync(tostring(player.UserId))
	if NPCs == nil then
		storenpcs:SetAsync(tostring(player.UserId),{})
		NPCs = {}
	end

    for npc, quantity in pairs(NPCs) do
		for i = 1, quantity do
			local base = BaseManager.GetBase(player)
			if not base then return end
			local slot = BaseManager.GetFreeSlot(base)
			if not slot then return end
			local NPC = ReplicatedStorage:WaitForChild("NPCs"):WaitForChild(npc)
			local NpcClone = NPC:Clone()
			NpcClone.Parent = workspace
			local SlotPoint = slot:WaitForChild("Attachment")
			NpcClone:PivotTo(CFrame.new(SlotPoint.WorldPosition))
			NpcClone.HumanoidRootPart.Anchored = true
			slot:SetAttribute("Occupied", true)
			NpcClone:SetAttribute("Loaded", true)
			local ProximityPrompt = NpcClone:WaitForChild("ProximityPrompt")
			ProximityPrompt:Destroy()
			local MoneyPerSec = NpcData.NPCs[npc].MoneyPerSec
			DataManager.AddIncome(player, MoneyPerSec)
			local humanoid = NpcClone:WaitForChild("Humanoid")
			local rootPart = NpcClone:WaitForChild("HumanoidRootPart")
			local animator = humanoid:WaitForChild("Animator")
			local IdleAnimation = Instance.new("Animation")
			IdleAnimation.AnimationId = "rbxassetid://125637416885308"
			local IdleAnim = animator:LoadAnimation(IdleAnimation)
			IdleAnim.Looped = true
			IdleAnim:Play()
			DataLoader.LoadNpcStats(NpcClone, npc)
		end
	end
	
end



return DataLoader
