local BaseManager = {}

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")

function BaseManager.GetBase(player)
	local bases = CollectionService:GetTagged("Base")
	for _, base in pairs(bases) do
		if base:GetAttribute("Owner") == player.UserId then
			return base
		end
	end
	return nil
end

function BaseManager.GetFreeSlot(base)
	local Slots = CollectionService:GetTagged("Slot")
	for _, slot in pairs(Slots) do
		if slot.Parent == base and not slot:GetAttribute("Occupied") then
			return slot
		end
	end
	return nil
end

function BaseManager.SetBase(player)
	
	local bases = CollectionService:GetTagged("Base")
	for _, b in ipairs(bases) do
		if not b:GetAttribute("Owner") then
			b:SetAttribute("Owner", player.UserId)
		local Plot = b:WaitForChild("Plot")
         local AvatarImage = Plot:WaitForChild("SignGui"):WaitForChild("AvatarImage")
         local DisplayName = Plot:WaitForChild("SignGui"):WaitForChild("DisplayNameLabel")
         local Username = Plot:WaitForChild("SignGui"):WaitForChild("UserNameLabel")
         DisplayName.Text = player.DisplayName
         Username.Text = "@" .. player.Name
         AvatarImage.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size100x100)
         return b
		end
	end
	return nil
end

return BaseManager
