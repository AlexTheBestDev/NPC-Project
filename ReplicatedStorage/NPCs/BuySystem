local Npc = script.Parent
local ProximityPrompt = Npc:WaitForChild("ProximityPrompt")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataManager = require (ReplicatedStorage:WaitForChild("Modules"):WaitForChild("DataManager"))
local BaseManager = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("BaseManager"))
local NpcData = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("NpcData"))
local humanoid = Npc:WaitForChild("Humanoid")
local RootPart = Npc:WaitForChild("HumanoidRootPart")
local Animator = humanoid:WaitForChild("Animator")




ProximityPrompt.Triggered:Connect(function(player)
	
	DataManager.GetCoins(player)
	local price = NpcData.NPCs[Npc.Name].Price
	local coins = DataManager.GetCoins(player)
	if coins < price then
		return
	else
		DataManager.ManageCoins(player, -price)
	end


	Npc:SetAttribute("Bought",true)
	DataManager.AddNpc(player, Npc.Name)
	ProximityPrompt:Destroy()

	
	local base = BaseManager.GetBase(player)
	if not base then return end
	local WalkAnimation = Instance.new("Animation")
	WalkAnimation.AnimationId = "rbxassetid://93431007947651"
	local WalkAnim = Animator:LoadAnimation(WalkAnimation)
	WalkAnim.Looped = true
	local destination = base.Collector
	
	WalkAnim:Play()
	repeat
		humanoid:MoveTo(destination.Position)
		local reached = humanoid.MoveToFinished:Wait()
	until reached
	WalkAnim:Stop()
	
    local slot = BaseManager.GetFreeSlot(base)
	if not slot then return end
	slot:SetAttribute("Occupied", true)
	local SlotPoint = slot:WaitForChild("Attachment")
	
	Npc:PivotTo(CFrame.new(SlotPoint.WorldPosition))
	
    local IdleAnimation = Instance.new("Animation")
	IdleAnimation.AnimationId = "rbxassetid://125637416885308"
	local IdleAnim = Animator:LoadAnimation(IdleAnimation)
	IdleAnim.Looped = true
	IdleAnim:Play()
	
	local MoneyPerSec = NpcData.NPCs[Npc.Name].MoneyPerSec
	DataManager.AddIncome(player, MoneyPerSec)
	
	
end)
