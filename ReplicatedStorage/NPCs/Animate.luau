local npc = script.Parent
local Loaded = npc:GetAttribute("Loaded")
if Loaded then return end 
local humanoid = npc:WaitForChild("Humanoid")
local rootPart = npc:WaitForChild("HumanoidRootPart")
local animator = humanoid:WaitForChild("Animator")

local WalkAnimation = Instance.new("Animation")
WalkAnimation.AnimationId = "rbxassetid://93431007947651"
local WalkAnim = animator:LoadAnimation(WalkAnimation)
WalkAnim.Looped = true

local destination = rootPart.Position + Vector3.new(0,0,200)


WalkAnim:Play()
repeat
    humanoid:MoveTo(destination)
	local reached = humanoid.MoveToFinished:Wait()
until reached or npc:GetAttribute("Bought")
WalkAnim:Stop()
if not npc:GetAttribute("Bought") then
npc:Destroy()
end 
