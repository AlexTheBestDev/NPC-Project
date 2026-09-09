local UI = script.Parent
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UpdateCoins = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("UpdateCoins")

UpdateCoins.OnClientEvent:Connect(function(Coins)
	UI.Text = "Coins:".. Coins
end)
