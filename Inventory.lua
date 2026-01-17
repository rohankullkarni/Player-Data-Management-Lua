--variables
local DataStoreService = game:GetService("DataStoreService")
playerData = DataStoreService:GetDataStore("PlayerData")
local rs = game.ReplicatedStorage:WaitForChild("RemoteEvents").CharacterSignalFromLeaderboard
local rs2 = game.ReplicatedStorage:WaitForChild("RemoteEvents").CharacterFromLeaderboardBindable





game.Players.PlayerAdded:Connect(function(player)
	--start with the leaderboard

	local inventoryfolder = Instance.new("Folder")
	inventoryfolder.Name = "inventoryfolder"
	inventoryfolder.Parent = player

	local inventorytype = Instance.new("IntValue")
	inventorytype.Name = "inventorytype"
	inventorytype.Parent = inventoryfolder



	--getting the data here (you can add as many coloumns as you want)

	local playerUserId = 'Player_'..player.UserId
	local Data = playerData:GetAsync(playerUserId)
	print("data got")
	if Data then
		--add as many as you want here 
		inventorytype.Value = Data['inventorytype']
		rs:FireClient(player,inventorytype.Value)
		rs2:Fire(player,inventorytype.Value)
	else
		inventorytype.Value = 0 
		rs:FireClient(player,0)
		rs2:Fire(player,0)
		

	end

end)



--saving player Data
--Creating a table
local function playerstats(player)
	local player_stats = {}
	for _,stat in pairs(player.inventoryfolder:GetChildren()) do
		player_stats[stat.Name] = stat.Value 
	end
	return player_stats
end
--storing the table
local function OnPlayerExit(player)
	local player_stats =  playerstats(player)
	local success , err = pcall (function()
		local playerUserId = 'Player_'.. player.UserId
		playerData:SetAsync(playerUserId,player_stats)
		print("data saved")

	end)

	if not success then
		warn("Could not save data")
		print("no data saved")

	end
end

game.Players.PlayerRemoving:Connect(OnPlayerExit)



