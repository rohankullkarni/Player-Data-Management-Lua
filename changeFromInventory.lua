local rs = game.ReplicatedStorage.RemoteEvents:WaitForChild("CharacterFromLeaderboardBindable")
local rs2 = game.ReplicatedStorage.RemoteEvents:WaitForChild("CharacterSignalFromLeaderboard")
local CharList = game.ServerStorage.Characters
local CharacterSave = game.StarterPlayer.CharacterSave
local DataStoreService = game:GetService("DataStoreService")
playerData = DataStoreService:GetDataStore("PlayerData")

local function playerstats(player)
    local player_stats = {}
    for _, stat in pairs(player.inventoryfolder:GetChildren()) do
        player_stats[stat.Name] = stat.Value
    end
    return player_stats
end

rs.Event:Connect(function(player, Value)
    print(Value)
    for i, char in pairs(CharacterSave:GetChildren()) do
        char:Destroy()
    end

    for i, chars in pairs(CharList:GetChildren()) do
        if chars.Name == tostring(Value) then
            print("value found")
            local clone = chars:Clone()
            clone.Parent = CharacterSave

        end
    end

    local player_stats = playerstats(player)
    local success, err = pcall(function()
        local playerUserId = 'Player_' .. player.UserId
        playerData:SetAsync(playerUserId, player_stats)
        print("data saved")

    end)

    if not success then
        warn("Could not save data")
        print("no data saved")

    end

end)

rs2.OnServerEvent:Connect(function(player, Value)
    print(Value)
    print("client recieved")
    for i, char in pairs(CharacterSave:GetChildren()) do
        char:Destroy()
    end
    print("im here")
    for i, chars in pairs(CharList:GetChildren()) do
        print("here here here")
        if chars.Name == tostring(Value) then
            print("value found")
            chars:Clone().Parent = CharacterSave
            rs2:FireClient(player, Value)

        end
    end
    print("im still here")

    local player_stats = playerstats(player)
    local success, err = pcall(function()
        local playerUserId = 'Player_' .. player.UserId
        playerData:SetAsync(playerUserId, player_stats)
        print("data saved")

    end)

    if not success then
        warn("Could not save data")
        print("no data saved")

    end

end)
