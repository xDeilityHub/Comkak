-- xDeilityHub Test

_G.Scripts_Mode = "Normal"
repeat wait() until game:IsLoaded()

-- wl_setting

spawn(function()
    while wait(10) do
        pcall(function()
            for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                if v.Name == "ScriptEditor" then
                    game.Players.LocalPlayer:Kick("\nDark Dex ;-;\nDon't Open")
                end
            end
        end)
    end
end)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

 game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "xDeility Script",
    Text = "Loading.."
  })

local Config = {
    WindowName = "xDeility Hub | Blox Fruit",
    Color = Color3.fromRGB(205,0,255),
    Keybind = Enum.KeyCode.RightControl
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

-- Source

local placeId = game.PlaceId
if placeId == 2753915549 then
    OldWorld = true
elseif placeId == 4442272183 then
    NewWorld = true
elseif placeId == 7449423635 then
    ThreeWorld = true
end

function HopServer()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
     --[[
     local File = pcall(function()
        AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
     end)
     if not File then
        table.insert(AllIDs, actualHour)
        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
     end
     ]]
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end

    function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end

    Teleport()
    wait(1)
end

local Nonquest = false
function CheckQuest()
    local MyLevel = game.Players.LocalPlayer.Data.Level.Value
    if FastTween then
        if OldWorld then
            if MyLevel == 1 or MyLevel <= 9 then -- Bandit
                Nonquest = false
                Ms = "Bandit [Lv. 5]"
                NameQuest = "BanditQuest1"
                LevelQuest = 1
                NameMon = "Bandit"
                CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
                CFrameMon = CFrame.new(1353.44885, 3.40935516, 1376.92029, 0.776053488, -6.97791975e-08, 0.630666852, 6.99138596e-08, 1, 2.4612488e-08, -0.630666852, 2.49917598e-08, 0.776053488)
            elseif MyLevel == 10 or MyLevel <= 14 then -- Monkey
                Nonquest = false
                Ms = "Monkey [Lv. 14]"
                NameQuest = "JungleQuest"
                LevelQuest = 1
                NameMon = "Monkey"
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-1402.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0, -0.547282517, 0, 0.836947978)
            elseif MyLevel == 15 or MyLevel <= 29 then -- Gorilla
                Nonquest = false
                Ms = "Gorilla [Lv. 20]"
                NameQuest = "JungleQuest"
                LevelQuest = 2
                NameMon = "Gorilla"
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-1256.67676, 11.3350315, -604.959839, 0.641504288, 0, 0.767119467, -0, 1, -0, -0.767119467, 0, 0.641504288)
            elseif MyLevel == 30 or MyLevel <= 89 then -- Galley Captain
                Nonquest = true
                Ms = "Galley Captain [Lv. 650]"
                NameQuest = "FountainQuest"
                LevelQuest = 2
                NameMon = "Galley Captain"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
                CFrameMon = CFrame.new(5782.90186, 94.5326462, 4716.78174, 0.361808896, -1.24757526e-06, -0.932252586, 2.16989656e-06, 1, -4.96097414e-07, 0.932252586, -1.84339774e-06, 0.361808896)
            elseif MyLevel == 90 or MyLevel <= 99 then -- Snow Bandits
                Nonquest = false
                Ms = "Snow Bandit [Lv. 90]"
                NameQuest = "SnowQuest"
                LevelQuest = 1
                NameMon = "Snow Bandits"
                CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
                CFrameMon = CFrame.new(1412.92346, 55.3503647, -1260.62036, -0.246266365, -0.0169920288, -0.969053388, 0.000432241941, 0.999844253, -0.0176417865, 0.969202161, -0.00476344163, -0.246220857)
            elseif MyLevel == 100 or MyLevel <= 119 then -- Snowman
                Nonquest = false
                Ms = "Snowman [Lv. 100]"
                NameQuest = "SnowQuest"
                LevelQuest = 2
                NameMon = "Snowman"
                CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
                CFrameMon = CFrame.new(1376.86401, 97.2779999, -1396.93115, -0.986755967, 7.71178321e-08, -0.162211925, 7.71531674e-08, 1, 6.08143536e-09, 0.162211925, -6.51427134e-09, -0.986755967)
            elseif MyLevel == 120 or MyLevel <= 149 then -- Chief Petty Officer
                Nonquest = false
                Ms = "Chief Petty Officer [Lv. 120]"
                NameQuest = "MarineQuest2"
                LevelQuest = 1
                NameMon = "Chief Petty Officer"
                CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643, 4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
            elseif MyLevel == 150 or MyLevel <= 174 then -- Sky Bandit
                Nonquest = false
                Ms = "Sky Bandit [Lv. 150]"
                NameQuest = "SkyQuest"
                LevelQuest = 1
                NameMon = "Sky Bandit"
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-4959.51367, 365.39267, -2974.56812, 0.964867651, 7.74418396e-08, 0.262737453, -6.95931988e-08, 1, -3.91783708e-08, -0.262737453, 1.95171506e-08, 0.964867651)
            elseif MyLevel == 175 or MyLevel <= 189 then -- Dark Master
                Nonquest = false
                Ms = "Dark Master [Lv. 175]"
                NameQuest = "SkyQuest"
                LevelQuest = 2
                NameMon = "Dark Master"
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-5079.98096, 376.477356, -2194.17139, 0.465965867, -3.69776352e-08, 0.884802461, 3.40249851e-09, 1, 4.00000886e-08, -0.884802461, -1.56281423e-08, 0.465965867)
            elseif MyLevel == 190 or MyLevel <= 209 then
                Nonquest = false
                Ms = "Prisoner [Lv. 190]"
                LevelQuest = 1
                NameQuest = "PrisonerQuest"
                NameMon = "Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0, 0.474995494, 0, 0.879988372)
            elseif MyLevel == 210 or MyLevel <= 249 then
                Nonquest = false
                Ms = "Dangerous Prisoner [Lv. 210]"
                LevelQuest = 2
                NameQuest = "PrisonerQuest"
                NameMon = "Dangerous Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0, 0.474995494, 0, 0.879988372)
            elseif MyLevel == 250 or MyLevel <= 274 then -- Toga Warrior
                Nonquest = false
                Ms = "Toga Warrior [Lv. 250]"
                NameQuest = "ColosseumQuest"
                LevelQuest = 1
                NameMon = "Toga Warrior"
                CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
                CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788, -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
            elseif MyLevel == 275 or MyLevel <= 299 then -- Gladiato
                Nonquest = false
                Ms = "Gladiator [Lv. 275]"
                NameQuest = "ColosseumQuest"
                LevelQuest = 2
                NameMon = "Gladiato"
                CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
                CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572, -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
            elseif MyLevel == 300 or MyLevel <= 329 then -- Military Soldier
                Nonquest = false
                Ms = "Military Soldier [Lv. 300]"
                NameQuest = "MagmaQuest"
                LevelQuest = 1
                NameMon = "Military Soldier"
                CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
                CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
            elseif MyLevel == 330 or MyLevel <= 374 then -- Military Spy
                Nonquest = false
                Ms = "Military Spy [Lv. 325]"
                NameQuest = "MagmaQuest"
                LevelQuest = 2
                NameMon = "Military Spy"
                CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
                CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308, -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
            elseif MyLevel == 375 or MyLevel <= 399 then -- Fishman Warrior
                Nonquest = false
                Ms = "Fishman Warrior [Lv. 375]"
                NameQuest = "FishmanQuest"
                LevelQuest = 1
                NameMon = "Fishman Warrior"
                CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
                CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822, 2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
            elseif MyLevel == 400 or MyLevel <= 449 then -- Fishman Commando
                Nonquest = false
                Ms = "Fishman Commando [Lv. 400]"
                NameQuest = "FishmanQuest"
                LevelQuest = 2
                NameMon = "Fishman Commando"
                CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504)
                CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.916871)
            elseif MyLevel == 450 or MyLevel <= 474 then 
                Nonquest = false
                Ms = "God's Guard [Lv. 450]"
                NameQuest = "SkyExp1Quest"
                LevelQuest = 1
                NameMon = "God's Guards"
                CFrameQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105)
                CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.925427)
            elseif MyLevel == 475 or MyLevel <= 524 then 
                Nonquest = false
                Ms = "Shanda [Lv. 475]"
                NameQuest = "SkyExp1Quest"
                LevelQuest = 2
                NameMon = "Shandas"
                CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
                CFrameMon = CFrame.new(-7904.57373, 5584.37646, -459.62973, 0.65171206, 5.11171692e-08, 0.758466363, -4.76232476e-09, 1, -6.33034247e-08, -0.758466363, 3.76435416e-08, 0.65171206)
            elseif MyLevel == 525 or MyLevel <= 549 then -- Royal Squad
                Nonquest = false
                Ms = "Royal Squad [Lv. 525]"
                NameQuest = "SkyExp2Quest"
                LevelQuest = 1
                NameMon = "Royal Squad"
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-7555.04199, 5606.90479, -1303.24744, -0.896107852, -9.6057462e-10, -0.443836004, -4.24974544e-09, 1, 6.41599973e-09, 0.443836004, 7.63560326e-09, -0.896107852)
            elseif MyLevel == 550 or MyLevel <= 624 then -- Royal Soldier
                Nonquest = false
                Ms = "Royal Soldier [Lv. 550]"
                NameQuest = "SkyExp2Quest"
                LevelQuest = 2
                NameMon = "Royal Soldier"
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-7837.31152, 5649.65186, -1791.08582, -0.716008604, 0.0104285581, -0.698013008, 5.02521061e-06, 0.99988848, 0.0149335321, 0.69809103, 0.0106890313, -0.715928733)
            elseif MyLevel == 625 or MyLevel <= 649 then -- Galley Pirate
                Nonquest = false
                Ms = "Galley Pirate [Lv. 625]"
                NameQuest = "FountainQuest"
                LevelQuest = 1
                NameMon = "Galley Pirate"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
                CFrameMon = CFrame.new(5569.80518, 38.5269432, 3849.01196, 0.896460414, 3.98027495e-08, 0.443124533, -1.34262139e-08, 1, -6.26611296e-08, -0.443124533, 5.02237434e-08, 0.896460414)
            elseif MyLevel >= 650 then -- Galley Captain
                Nonquest = false
                Ms = "Galley Captain [Lv. 650]"
                NameQuest = "FountainQuest"
                LevelQuest = 2
                NameMon = "Galley Captain"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
                CFrameMon = CFrame.new(5782.90186, 94.5326462, 4716.78174, 0.361808896, -1.24757526e-06, -0.932252586, 2.16989656e-06, 1, -4.96097414e-07, 0.932252586, -1.84339774e-06, 0.361808896)
            end
        end
        if NewWorld then
            Nonquest = false
            if MyLevel == 700 or MyLevel <= 724 then -- Raider [Lv. 700]
                Ms = "Raider [Lv. 700]"
                NameQuest = "Area1Quest"
                LevelQuest = 1
                NameMon = "Raider"
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
                CFrameMon = CFrame.new(-737.026123, 10.1748352, 2392.57959, 0.272128761, 0, -0.962260842, -0, 1, -0, 0.962260842, 0, 0.272128761)
            elseif MyLevel == 725 or MyLevel <= 774 then -- Mercenary [Lv. 725]
                Ms = "Mercenary [Lv. 725]"
                NameQuest = "Area1Quest"
                LevelQuest = 2
                NameMon = "Mercenary"
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
                CFrameMon = CFrame.new(-1022.21271, 72.9855194, 1891.39148, -0.990782857, 0, -0.135460541, 0, 1, 0, 0.135460541, 0, -0.990782857)
            elseif MyLevel == 775 or MyLevel <= 799 then -- Swan Pirate [Lv. 775]
                Ms = "Swan Pirate [Lv. 775]"
                NameQuest = "Area2Quest"
                LevelQuest = 1
                NameMon = "Swan Pirate"
                CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
                CFrameMon = CFrame.new(976.467651, 111.174057, 1229.1084, 0.00852567982, -4.73897828e-08, -0.999963999, 1.12251888e-08, 1, -4.7295778e-08, 0.999963999, -1.08215579e-08, 0.00852567982)
            elseif MyLevel == 800 or MyLevel <= 874 then -- Factory Staff [Lv. 800]
                Ms = "Factory Staff [Lv. 800]"
                NameQuest = "Area2Quest"
                LevelQuest = 2
                NameMon = "Factory Staff"
                CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
                CFrameMon = CFrame.new(336.74585, 73.1620483, -224.129272, 0.993632793, 3.40154607e-08, 0.112668738, -3.87658332e-08, 1, 3.99718729e-08, -0.112668738, -4.40850592e-08, 0.993632793)
            elseif MyLevel == 875 or MyLevel <= 899 then -- Marine Lieutenant [Lv. 875]
                Ms = "Marine Lieutenant [Lv. 875]"
                NameQuest = "MarineQuest3"
                LevelQuest = 1
                NameMon = "Marine Lieutenant"
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-2842.69922, 72.9919434, -2901.90479, -0.762281299, 0, -0.64724648, 0, 1.00000012, 0, 0.64724648, 0, -0.762281299)
            elseif MyLevel == 900 or MyLevel <= 949 then -- Marine Captain [Lv. 900]
                Ms = "Marine Captain [Lv. 900]"
                NameQuest = "MarineQuest3"
                LevelQuest = 2
                NameMon = "Marine Captain"
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-1814.70313, 72.9919434, -3208.86621, -0.900422215, 7.93464423e-08, -0.435017526, 3.68856199e-08, 1, 1.06050372e-07, 0.435017526, 7.94441988e-08, -0.900422215)
            elseif MyLevel == 950 or MyLevel <= 974 then -- Zombie [Lv. 950]
                Ms = "Zombie [Lv. 950]"
                NameQuest = "ZombieQuest"
                LevelQuest = 1
                NameMon = "Zombie"
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
                CFrameMon = CFrame.new(-5649.23438, 126.0578, -737.773743, 0.355238914, -8.10359282e-08, 0.934775114, 1.65461245e-08, 1, 8.04023372e-08, -0.934775114, -1.3095117e-08, 0.355238914)
            elseif MyLevel == 975 or MyLevel <= 999 then -- Vampire [Lv. 975]
                Ms = "Vampire [Lv. 975]"
                NameQuest = "ZombieQuest"
                LevelQuest = 2
                NameMon = "Vampire"
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
                CFrameMon = CFrame.new(-6030.32031, 0.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945, -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
            elseif MyLevel == 1000 or MyLevel <= 1049 then -- Snow Trooper [Lv. 1000] **
                Ms = "Snow Trooper [Lv. 1000]"
                NameQuest = "SnowMountainQuest"
                LevelQuest = 1
                NameMon = "Snow Trooper"
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
                CFrameMon = CFrame.new(621.003418, 391.361053, -5335.43604, 0.481644779, 0, 0.876366913, 0, 1, 0, -0.876366913, 0, 0.481644779)
            elseif MyLevel == 1050 or MyLevel <= 1099 then -- Winter Warrior [Lv. 1050]
                Ms = "Winter Warrior [Lv. 1050]"
                NameQuest = "SnowMountainQuest"
                LevelQuest = 2
                NameMon = "Winter Warrior"
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
                CFrameMon = CFrame.new(1295.62683, 429.447784, -5087.04492, -0.698032081, -8.28980049e-08, -0.71606636, -1.98835952e-08, 1, -9.63858184e-08, 0.71606636, -5.30424877e-08, -0.698032081)
            elseif MyLevel == 1100 or MyLevel <= 1124 then -- Lab Subordinate [Lv. 1100]
                Ms = "Lab Subordinate [Lv. 1100]"
                NameQuest = "IceSideQuest"
                LevelQuest = 1
                NameMon = "Lab Subordinate"
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
                CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936, -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
            elseif MyLevel == 1125 or MyLevel <= 1174 then -- Horned Warrior [Lv. 1125]
                Ms = "Horned Warrior [Lv. 1125]"
                NameQuest = "IceSideQuest"
                LevelQuest = 2
                NameMon = "Horned Warrior"
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
                CFrameMon = CFrame.new(-6401.27979, 15.9775667, -5948.24316, 0.388303697, 0, -0.921531856, 0, 1, 0, 0.921531856, 0, 0.388303697)
            elseif MyLevel == 1175 or MyLevel <= 1199 then -- Magma Ninja [Lv. 1175]
                Ms = "Magma Ninja [Lv. 1175]"
                NameQuest = "FireSideQuest"
                LevelQuest = 1
                NameMon = "Magma Ninja"
                CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-5466.06445, 57.6952019, -5837.42822, -0.988835871, 0, -0.149006829, 0, 1, 0, 0.149006829, 0, -0.988835871)
            elseif MyLevel == 1200 or MyLevel <= 1249 then 
                Ms = "Lava Pirate [Lv. 1200]"
                NameQuest = "FireSideQuest"
                LevelQuest = 2
                NameMon = "Lava Pirate"
                CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
                CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012, -0, -0.98044765, 0, -0.196780294)
            elseif MyLevel == 1250 or MyLevel <= 1274 then 
                Ms = "Ship Deckhand [Lv. 1250]"
                NameQuest = "ShipQuest1"
                LevelQuest = 1
                NameMon = "Ship Deckhand"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
                CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968, 5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
            elseif MyLevel == 1275 or MyLevel <= 1299 then 
                Ms = "Ship Engineer [Lv. 1275]"
                NameQuest = "ShipQuest1"
                LevelQuest = 2
                NameMon = "Ship Engineer"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
                CFrameMon = CFrame.new(921.30249023438, 125.400390625, 32937.34375)
            elseif MyLevel == 1300 or MyLevel <= 1324 then 
                Ms = "Ship Steward [Lv. 1300]"
                NameQuest = "ShipQuest2"
                LevelQuest = 1
                NameMon = "Ship Steward"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
                CFrameMon = CFrame.new(917.96057128906, 136.89932250977, 33343.4140625)
            elseif MyLevel == 1325 or MyLevel <= 1349 then 
                Ms = "Ship Officer [Lv. 1325]"
                NameQuest = "ShipQuest2"
                LevelQuest = 2
                NameMon = "Ship Officer"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
                CFrameMon = CFrame.new(944.44964599609, 181.40081787109, 33278.9453125)
            elseif MyLevel == 1350 or MyLevel <= 1374 then 
                Ms = "Arctic Warrior [Lv. 1350]"
                NameQuest = "FrostQuest"
                LevelQuest = 1
                NameMon = "Arctic Warrior"
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
                CFrameMon = CFrame.new(5878.23486, 81.3886948, -6136.35596, -0.451037169, 2.3908234e-07, 0.892505825, -1.08168464e-07, 1, -3.22542007e-07, -0.892505825, -2.4201924e-07, -0.451037169)
            elseif MyLevel == 1375 or MyLevel <= 1424 then -- Snow Lurker [Lv. 1375]
                Ms = "Snow Lurker [Lv. 1375]"
                NameQuest = "FrostQuest"
                LevelQuest = 2
                NameMon = "Snow Lurker"
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
                CFrameMon = CFrame.new(5513.36865, 60.546711, -6809.94971, -0.958693981, -1.65617333e-08, 0.284439981, -4.07668654e-09, 1, 4.44854642e-08, -0.284439981, 4.14883701e-08, -0.958693981)
            elseif MyLevel == 1425 or MyLevel <= 1449 then -- Sea Soldier [Lv. 1425]
                Ms = "Sea Soldier [Lv. 1425]"
                NameQuest = "ForgottenQuest"
                LevelQuest = 1
                NameMon = "Sea Soldier"
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
                CFrameMon = CFrame.new(-3115.78223, 63.8785706, -9808.38574, -0.913427353, 3.11199457e-08, 0.407000452, 7.79564235e-09, 1, -5.89660658e-08, -0.407000452, -5.06883708e-08, -0.913427353)
            elseif MyLevel >= 1450 then -- Water Fighter [Lv. 1450]
                Ms = "Water Fighter [Lv. 1450]"
                NameQuest = "ForgottenQuest"
                LevelQuest = 2
                NameMon = "Water Fighter"
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
                CFrameMon = CFrame.new(-3212.99683, 263.809296, -10551.8799, 0.742111444, -5.59139615e-08, -0.670276582, 1.69155214e-08, 1, -6.46908234e-08, 0.670276582, 3.66697037e-08, 0.742111444)
            end
        end
        if ThreeWorld then
            if MyLevel >= 1500 and MyLevel <= 1524 then -- Pirate Millionaire [Lv. 1500]
                Ms = "Pirate Millionaire [Lv. 1500]"
                NameQuest = "PiratePortQuest"
                LevelQuest = 1
                NameMon = "Pirate Millionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
            elseif MyLevel >= 1525 and MyLevel <= 1574 then -- Pistol Billionaire [Lv. 1525]
                Ms = "Pistol Billionaire [Lv. 1525]"
                NameQuest = "PiratePortQuest"
                LevelQuest = 2
                NameMon = "Pistol Billionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
            elseif MyLevel >= 1575 and MyLevel <= 1599 then -- Dragon Crew Warrior [Lv. 1575]
                Ms = "Dragon Crew Warrior [Lv. 1575]"
                NameQuest = "AmazonQuest"
                LevelQuest = 1
                NameMon = "Dragon Crew Warrior"
                CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
                CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
            elseif MyLevel >= 1600 and MyLevel <= 1624 then -- Dragon Crew Archer [Lv. 1600]
                Ms = "Dragon Crew Archer [Lv. 1600]"
                NameQuest = "AmazonQuest"
                LevelQuest = 2
                NameMon = "Dragon Crew Archer"
                CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
                CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
            elseif MyLevel >= 1625 and MyLevel <= 1649 then -- Female Islander [Lv. 1625]
                Ms = "Female Islander [Lv. 1625]"
                NameQuest = "AmazonQuest2"
                LevelQuest = 1
                NameMon = "Female Islander"
                CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(4770.4990234375, 758.95520019531, 1069.8680419922)
            elseif MyLevel >= 1650 and MyLevel <= 1699 then -- Giant Islander [Lv. 1650]
                Ms = "Giant Islander [Lv. 1650]"
                NameQuest = "AmazonQuest2"
                LevelQuest = 2
                NameMon = "Giant Islander"
                CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
            elseif MyLevel >= 1700 and MyLevel <= 1724 then -- Marine Commodore [Lv. 1700]
                Ms = "Marine Commodore [Lv. 1700]"
                NameQuest = "MarineTreeIsland"
                LevelQuest = 1
                NameMon = "Marine Commodore"
                CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
                CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
            elseif MyLevel >= 1725 and MyLevel <= 1774 then -- Marine Rear Admiral [Lv. 1725]
                Ms = "Marine Rear Admiral [Lv. 1725]"
                NameQuest = "MarineTreeIsland"
                LevelQuest = 2
                NameMon = "Marine Rear Admiral"
                CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
                CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
            elseif MyLevel >= 1775 and MyLevel <= 1799 then -- Fishman Raider [Lv. 1775]
                Ms = "Fishman Raider [Lv. 1775]"
                NameQuest = "DeepForestIsland3"
                LevelQuest = 1
                NameMon = "Fishman Raider"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
            elseif MyLevel >= 1800 and MyLevel <= 1824 then -- Fishman Captain [Lv. 1800]
                Ms = "Fishman Captain [Lv. 1800]"
                NameQuest = "DeepForestIsland3"
                LevelQuest = 2
                NameMon = "Fishman Captain"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
            elseif MyLevel >= 1825 and MyLevel <= 1849 then -- Forest Pirate [Lv. 1825]
                Ms = "Forest Pirate [Lv. 1825]"
                NameQuest = "DeepForestIsland"
                LevelQuest = 1
                NameMon = "Forest Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
                CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
            elseif MyLevel >= 1850 and MyLevel <= 1899 then -- Mythological Pirate [Lv. 1850]
                Ms = "Mythological Pirate [Lv. 1850]"
                NameQuest = "DeepForestIsland"
                LevelQuest = 2
                NameMon = "Mythological Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
                CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
            elseif MyLevel >= 1900 and MyLevel <= 1924 then -- Jungle Pirate [Lv. 1900]
                Ms = "Jungle Pirate [Lv. 1900]"
                NameQuest = "DeepForestIsland2"
                LevelQuest = 1
                NameMon = "Jungle Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
                CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
            elseif MyLevel >= 1925 and MyLevel <= 1974 then -- Musketeer Pirate [Lv. 1925]
                Ms = "Musketeer Pirate [Lv. 1925]"
                NameQuest = "DeepForestIsland2"
                LevelQuest = 2
                NameMon = "Musketeer Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
                CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
            elseif MyLevel >= 1975 and MyLevel <= 1999 then
                Ms = "Reborn Skeleton [Lv. 1975]"
                NameQuest = "HauntedQuest1"
                LevelQuest = 1
                NameMon = "Reborn Skeleton"
                CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
                CFrameMon = CFrame.new(-8817.880859375, 191.16761779785, 6298.6557617188)
            elseif MyLevel >= 2000 and MyLevel <= 2024 then
                Ms = "Living Zombie [Lv. 2000]"
                NameQuest = "HauntedQuest1"
                LevelQuest = 2
                NameMon = "Living Zombie"
                CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
                CFrameMon = CFrame.new(-10125.234375, 183.94705200195, 6242.013671875)
            elseif MyLevel >= 2025 and MyLevel <= 2049  then
                Ms = "Demonic Soul [Lv. 2025]"
                NameQuest = "HauntedQuest2"
                LevelQuest = 1
                NameMon = "Demonic Soul"
                CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
            elseif MyLevel >= 2050 and MyLevel <= 2074 then
                Ms = "Posessed Mummy [Lv. 2050]"
                NameQuest = "HauntedQuest2"
                LevelQuest = 2
                NameMon = "Posessed Mummy"
                CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)    
            elseif MyLevel >= 2075 and MyLevel <= 2099 then
                Ms = "Peanut Scout [Lv. 2075]"
                NameQuest = "NutsIslandQuest"
                LevelQuest = 1
                NameMon = "Peanut Scout"
                CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
                CFrameMon = CFrame.new(-2098.07544, 192.611862, -10248.8867, 0.983392298, -9.57031787e-08, 0.181492642, 8.7276355e-08, 1, 5.44169616e-08, -0.181492642, -3.76732068e-08, 0.983392298)
            elseif MyLevel >= 2100 and MyLevel <= 2124 then
                Ms = "Peanut President [Lv. 2100]"
                NameQuest = "NutsIslandQuest"
                LevelQuest = 2
                NameMon = "Peanut President"
                CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
                CFrameMon = CFrame.new(-1876.95959, 192.610947, -10542.2939, 0.0553516336, -2.83836812e-08, 0.998466909, -6.89634405e-10, 1, 2.84654931e-08, -0.998466909, -2.26418861e-09, 0.0553516336)
            elseif MyLevel >= 2125 and MyLevel <= 2149 then
                Ms = "Ice Cream Chef [Lv. 2125]"
                NameQuest = "IceCreamIslandQuest"
                LevelQuest = 1
                NameMon = "Ice Cream Chef"
                CFrameQuest = CFrame.new(-820.404358, 65.8453293, -10965.5654, 0.822534859, 5.24448502e-08, -0.568714678, -2.08336317e-08, 1, 6.20846663e-08, 0.568714678, -3.92184099e-08, 0.822534859)
                CFrameMon = CFrame.new(-821.614075, 208.39537, -10990.7617, -0.870096624, 3.18909272e-08, 0.492881238, -1.8357893e-08, 1, -9.71107568e-08, -0.492881238, -9.35439957e-08, -0.870096624)
            elseif MyLevel >= 2150 and MyLevel <= 2199 then 
                Ms = "Ice Cream Commander [Lv. 2150]"
                NameQuest = "IceCreamIslandQuest"
                LevelQuest = 2
                NameMon = "Ice Cream Commander"
                CFrameQuest = CFrame.new(-819.376526, 67.4634171, -10967.2832)
                CFrameMon = CFrame.new(-610.11669921875, 208.26904296875, -11253.686523438)
            elseif MyLevel >= 2200 and MyLevel <= 2224 then 
                Ms = "Cookie Crafter [Lv. 2200]"
                NameQuest = "CakeQuest1"
                LevelQuest = 1
                NameMon = "Cookie Crafter"
                CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
                CFrameMon = CFrame.new(-2286.684326171875, 146.5656280517578, -12226.8818359375)
            elseif MyLevel >= 2225 and MyLevel <= 2249 then 
                Ms = "Cake Guard [Lv. 2225]"
                NameQuest = "CakeQuest1"
                LevelQuest = 2
                NameMon = "Cake Guard"
                CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
                CFrameMon = CFrame.new(-1817.9747314453125, 209.5632781982422, -12288.9228515625)
            elseif MyLevel >= 2250 and MyLevel <= 2274 then 
                Ms = "Baking Staff [Lv. 2250]"
                NameQuest = "CakeQuest2"
                LevelQuest = 1
                NameMon = "Baking Staff"
                CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
                CFrameMon = CFrame.new(-1818.347900390625, 93.41275787353516, -12887.66015625)
            elseif MyLevel >= 2275 then 
                Ms = "Head Baker [Lv. 2275]"
                NameQuest = "CakeQuest2"
                LevelQuest = 2
                NameMon = "Head Baker"
                CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
                CFrameMon = CFrame.new(-2288.795166015625, 106.9419174194336, -12811.111328125)
            end
        end
    else
        if OldWorld then
            if MyLevel == 1 or MyLevel <= 9 then -- Bandit
                Nonquest = false
                Ms = "Bandit [Lv. 5]"
                NameQuest = "BanditQuest1"
                LevelQuest = 1
                NameMon = "Bandit"
                CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
                CFrameMon = CFrame.new(1353.44885, 3.40935516, 1376.92029, 0.776053488, -6.97791975e-08, 0.630666852, 6.99138596e-08, 1, 2.4612488e-08, -0.630666852, 2.49917598e-08, 0.776053488)
            elseif MyLevel == 10 or MyLevel <= 14 then -- Monkey
                Nonquest = false
                Ms = "Monkey [Lv. 14]"
                NameQuest = "JungleQuest"
                LevelQuest = 1
                NameMon = "Monkey"
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-1402.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0, -0.547282517, 0, 0.836947978)
            elseif MyLevel == 15 or MyLevel <= 29 then -- Gorilla
                Nonquest = false
                Ms = "Gorilla [Lv. 20]"
                NameQuest = "JungleQuest"
                LevelQuest = 2
                NameMon = "Gorilla"
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-1267.89001, 66.2034225, -531.818115, -0.813996196, -5.25169774e-08, -0.580869019, -5.58769671e-08, 1, -1.21082593e-08, 0.580869019, 2.26011476e-08, -0.813996196)
            elseif MyLevel >= 30 and MyLevel <= 40-1 then
                Nonquest = false
                Ms = "Pirate [Lv. 35]"
                NameQuest = "BuggyQuest1"
                LevelQuest = 1
                NameMon = "Pirate"
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(-1169.5365, 5.09531212, 3933.84082, -0.971822679, -3.73200315e-09, 0.235713184, -4.16762763e-10, 1, 1.41145424e-08, -0.235713184, 1.3618596e-08, -0.971822679)
            elseif MyLevel >= 40 and MyLevel <= 60-1 then
                Nonquest = false
                Ms = "Brute [Lv. 45]"
                NameQuest = "BuggyQuest1"
                LevelQuest = 2
                NameMon = "Brute"
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(-1165.09985, 15.1531372, 4363.51514, -0.962800264, 1.17564889e-06, 0.270213336, 2.60172015e-07, 1, -3.4237969e-06, -0.270213336, -3.22613073e-06, -0.962800264)
            elseif MyLevel >= 60 and MyLevel <= 75-1 then
                Nonquest = false
                Ms = "Desert Bandit [Lv. 60]"
                NameQuest = "DesertQuest"
                LevelQuest = 1
                NameMon = "Desert Bandit"
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
                CFrameMon = CFrame.new(932.788818, 6.8503746, 4488.24609, -0.998625934, 3.08948351e-08, 0.0524050146, 2.79967303e-08, 1, -5.60361286e-08, -0.0524050146, -5.44919629e-08, -0.998625934)
            elseif MyLevel >= 75 and MyLevel <= 90-1 then
                Nonquest = false
                Ms = "Desert Officer [Lv. 70]"
                NameQuest = "DesertQuest"
                LevelQuest = 2
                NameMon = "Desert Officer"
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
                CFrameMon = CFrame.new(1617.07886, 1.5542295, 4295.54932, -0.997540116, -2.26287735e-08, -0.070099175, -1.69377223e-08, 1, -8.17798806e-08, 0.070099175, -8.03913949e-08, -0.997540116)
            elseif MyLevel == 90 or MyLevel <= 99 then -- Snow Bandits
                Nonquest = false
                Ms = "Snow Bandit [Lv. 90]"
                NameQuest = "SnowQuest"
                LevelQuest = 1
                NameMon = "Snow Bandits"
                CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
                CFrameMon = CFrame.new(1412.92346, 55.3503647, -1260.62036, -0.246266365, -0.0169920288, -0.969053388, 0.000432241941, 0.999844253, -0.0176417865, 0.969202161, -0.00476344163, -0.246220857)
            elseif MyLevel == 100 or MyLevel <= 119 then -- Snowman
                Nonquest = false
                Ms = "Snowman [Lv. 100]"
                NameQuest = "SnowQuest"
                LevelQuest = 2
                NameMon = "Snowman"
                CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
                CFrameMon = CFrame.new(1376.86401, 97.2779999, -1396.93115, -0.986755967, 7.71178321e-08, -0.162211925, 7.71531674e-08, 1, 6.08143536e-09, 0.162211925, -6.51427134e-09, -0.986755967)
            elseif MyLevel == 120 or MyLevel <= 149 then -- Chief Petty Officer
                Nonquest = false
                Ms = "Chief Petty Officer [Lv. 120]"
                NameQuest = "MarineQuest2"
                LevelQuest = 1
                NameMon = "Chief Petty Officer"
                CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643, 4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
            elseif MyLevel == 150 or MyLevel <= 174 then -- Sky Bandit
                Nonquest = false
                Ms = "Sky Bandit [Lv. 150]"
                NameQuest = "SkyQuest"
                LevelQuest = 1
                NameMon = "Sky Bandit"
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-4959.51367, 365.39267, -2974.56812, 0.964867651, 7.74418396e-08, 0.262737453, -6.95931988e-08, 1, -3.91783708e-08, -0.262737453, 1.95171506e-08, 0.964867651)
            elseif MyLevel == 175 or MyLevel <= 189 then -- Dark Master
                Nonquest = false
                Ms = "Dark Master [Lv. 175]"
                NameQuest = "SkyQuest"
                LevelQuest = 2
                NameMon = "Dark Master"
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-5079.98096, 376.477356, -2194.17139, 0.465965867, -3.69776352e-08, 0.884802461, 3.40249851e-09, 1, 4.00000886e-08, -0.884802461, -1.56281423e-08, 0.465965867)
            elseif MyLevel == 190 or MyLevel <= 209 then
                Nonquest = false
                Ms = "Prisoner [Lv. 190]"
                LevelQuest = 1
                NameQuest = "PrisonerQuest"
                NameMon = "Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0, 0.474995494, 0, 0.879988372)
            elseif MyLevel == 210 or MyLevel <= 249 then
                Nonquest = false
                Ms = "Dangerous Prisoner [Lv. 210]"
                LevelQuest = 2
                NameQuest = "PrisonerQuest"
                NameMon = "Dangerous Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0, 0.474995494, 0, 0.879988372)
            elseif MyLevel == 250 or MyLevel <= 274 then -- Toga Warrior
                Nonquest = false
                Ms = "Toga Warrior [Lv. 250]"
                NameQuest = "ColosseumQuest"
                LevelQuest = 1
                NameMon = "Toga Warrior"
                CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
                CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788, -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
            elseif MyLevel == 275 or MyLevel <= 299 then -- Gladiato
                Nonquest = false
                Ms = "Gladiator [Lv. 275]"
                NameQuest = "ColosseumQuest"
                LevelQuest = 2
                NameMon = "Gladiato"
                CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
                CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572, -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
            elseif MyLevel == 300 or MyLevel <= 329 then -- Military Soldier
                Nonquest = false
                Ms = "Military Soldier [Lv. 300]"
                NameQuest = "MagmaQuest"
                LevelQuest = 1
                NameMon = "Military Soldier"
                CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
                CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
            elseif MyLevel == 330 or MyLevel <= 374 then -- Military Spy
                Nonquest = false
                Ms = "Military Spy [Lv. 325]"
                NameQuest = "MagmaQuest"
                LevelQuest = 2
                NameMon = "Military Spy"
                CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
                CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308, -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
            elseif MyLevel == 375 or MyLevel <= 399 then -- Fishman Warrior
                Nonquest = false
                Ms = "Fishman Warrior [Lv. 375]"
                NameQuest = "FishmanQuest"
                LevelQuest = 1
                NameMon = "Fishman Warrior"
                CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
                CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822, 2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
            elseif MyLevel == 400 or MyLevel <= 449 then -- Fishman Commando
                Nonquest = false
                Ms = "Fishman Commando [Lv. 400]"
                NameQuest = "FishmanQuest"
                LevelQuest = 2
                NameMon = "Fishman Commando"
                CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504)
                CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.916871)
            elseif MyLevel == 450 or MyLevel <= 474 then 
                Nonquest = false
                Ms = "God's Guard [Lv. 450]"
                NameQuest = "SkyExp1Quest"
                LevelQuest = 1
                NameMon = "God's Guards"
                CFrameQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105)
                CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.925427)
            elseif MyLevel == 475 or MyLevel <= 524 then 
                Nonquest = false
                Ms = "Shanda [Lv. 475]"
                NameQuest = "SkyExp1Quest"
                LevelQuest = 2
                NameMon = "Shandas"
                CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
                CFrameMon = CFrame.new(-7904.57373, 5584.37646, -459.62973, 0.65171206, 5.11171692e-08, 0.758466363, -4.76232476e-09, 1, -6.33034247e-08, -0.758466363, 3.76435416e-08, 0.65171206)
            elseif MyLevel == 525 or MyLevel <= 549 then -- Royal Squad
                Nonquest = false
                Ms = "Royal Squad [Lv. 525]"
                NameQuest = "SkyExp2Quest"
                LevelQuest = 1
                NameMon = "Royal Squad"
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-7555.04199, 5606.90479, -1303.24744, -0.896107852, -9.6057462e-10, -0.443836004, -4.24974544e-09, 1, 6.41599973e-09, 0.443836004, 7.63560326e-09, -0.896107852)
            elseif MyLevel == 550 or MyLevel <= 624 then -- Royal Soldier
                Nonquest = false
                Ms = "Royal Soldier [Lv. 550]"
                NameQuest = "SkyExp2Quest"
                LevelQuest = 2
                NameMon = "Royal Soldier"
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-7837.31152, 5649.65186, -1791.08582, -0.716008604, 0.0104285581, -0.698013008, 5.02521061e-06, 0.99988848, 0.0149335321, 0.69809103, 0.0106890313, -0.715928733)
            elseif MyLevel == 625 or MyLevel <= 649 then -- Galley Pirate
                Nonquest = false
                Ms = "Galley Pirate [Lv. 625]"
                NameQuest = "FountainQuest"
                LevelQuest = 1
                NameMon = "Galley Pirate"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
                CFrameMon = CFrame.new(5569.80518, 38.5269432, 3849.01196, 0.896460414, 3.98027495e-08, 0.443124533, -1.34262139e-08, 1, -6.26611296e-08, -0.443124533, 5.02237434e-08, 0.896460414)
            elseif MyLevel >= 650 then -- Galley Captain
                Nonquest = false
                Ms = "Galley Captain [Lv. 650]"
                NameQuest = "FountainQuest"
                LevelQuest = 2
                NameMon = "Galley Captain"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
                CFrameMon = CFrame.new(5782.90186, 94.5326462, 4716.78174, 0.361808896, -1.24757526e-06, -0.932252586, 2.16989656e-06, 1, -4.96097414e-07, 0.932252586, -1.84339774e-06, 0.361808896)
            end
        end
        if NewWorld then
            Nonquest = false
            if MyLevel == 700 or MyLevel <= 724 then -- Raider [Lv. 700]
                Ms = "Raider [Lv. 700]"
                NameQuest = "Area1Quest"
                LevelQuest = 1
                NameMon = "Raider"
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
                CFrameMon = CFrame.new(-737.026123, 10.1748352, 2392.57959, 0.272128761, 0, -0.962260842, -0, 1, -0, 0.962260842, 0, 0.272128761)
            elseif MyLevel == 725 or MyLevel <= 774 then -- Mercenary [Lv. 725]
                Ms = "Mercenary [Lv. 725]"
                NameQuest = "Area1Quest"
                LevelQuest = 2
                NameMon = "Mercenary"
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
                CFrameMon = CFrame.new(-1022.21271, 72.9855194, 1891.39148, -0.990782857, 0, -0.135460541, 0, 1, 0, 0.135460541, 0, -0.990782857)
            elseif MyLevel == 775 or MyLevel <= 799 then -- Swan Pirate [Lv. 775]
                Ms = "Swan Pirate [Lv. 775]"
                NameQuest = "Area2Quest"
                LevelQuest = 1
                NameMon = "Swan Pirate"
                CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
                CFrameMon = CFrame.new(976.467651, 111.174057, 1229.1084, 0.00852567982, -4.73897828e-08, -0.999963999, 1.12251888e-08, 1, -4.7295778e-08, 0.999963999, -1.08215579e-08, 0.00852567982)
            elseif MyLevel == 800 or MyLevel <= 874 then -- Factory Staff [Lv. 800]
                Ms = "Factory Staff [Lv. 800]"
                NameQuest = "Area2Quest"
                LevelQuest = 2
                NameMon = "Factory Staff"
                CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
                CFrameMon = CFrame.new(336.74585, 73.1620483, -224.129272, 0.993632793, 3.40154607e-08, 0.112668738, -3.87658332e-08, 1, 3.99718729e-08, -0.112668738, -4.40850592e-08, 0.993632793)
            elseif MyLevel == 875 or MyLevel <= 899 then -- Marine Lieutenant [Lv. 875]
                Ms = "Marine Lieutenant [Lv. 875]"
                NameQuest = "MarineQuest3"
                LevelQuest = 1
                NameMon = "Marine Lieutenant"
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-2842.69922, 72.9919434, -2901.90479, -0.762281299, 0, -0.64724648, 0, 1.00000012, 0, 0.64724648, 0, -0.762281299)
            elseif MyLevel == 900 or MyLevel <= 949 then -- Marine Captain [Lv. 900]
                Ms = "Marine Captain [Lv. 900]"
                NameQuest = "MarineQuest3"
                LevelQuest = 2
                NameMon = "Marine Captain"
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-1814.70313, 72.9919434, -3208.86621, -0.900422215, 7.93464423e-08, -0.435017526, 3.68856199e-08, 1, 1.06050372e-07, 0.435017526, 7.94441988e-08, -0.900422215)
            elseif MyLevel == 950 or MyLevel <= 974 then -- Zombie [Lv. 950]
                Ms = "Zombie [Lv. 950]"
                NameQuest = "ZombieQuest"
                LevelQuest = 1
                NameMon = "Zombie"
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
                CFrameMon = CFrame.new(-5649.23438, 126.0578, -737.773743, 0.355238914, -8.10359282e-08, 0.934775114, 1.65461245e-08, 1, 8.04023372e-08, -0.934775114, -1.3095117e-08, 0.355238914)
            elseif MyLevel == 975 or MyLevel <= 999 then -- Vampire [Lv. 975]
                Ms = "Vampire [Lv. 975]"
                NameQuest = "ZombieQuest"
                LevelQuest = 2
                NameMon = "Vampire"
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
                CFrameMon = CFrame.new(-6030.32031, 0.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945, -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
            elseif MyLevel == 1000 or MyLevel <= 1049 then -- Snow Trooper [Lv. 1000] **
                Ms = "Snow Trooper [Lv. 1000]"
                NameQuest = "SnowMountainQuest"
                LevelQuest = 1
                NameMon = "Snow Trooper"
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
                CFrameMon = CFrame.new(621.003418, 391.361053, -5335.43604, 0.481644779, 0, 0.876366913, 0, 1, 0, -0.876366913, 0, 0.481644779)
            elseif MyLevel == 1050 or MyLevel <= 1099 then -- Winter Warrior [Lv. 1050]
                Ms = "Winter Warrior [Lv. 1050]"
                NameQuest = "SnowMountainQuest"
                LevelQuest = 2
                NameMon = "Winter Warrior"
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
                CFrameMon = CFrame.new(1295.62683, 429.447784, -5087.04492, -0.698032081, -8.28980049e-08, -0.71606636, -1.98835952e-08, 1, -9.63858184e-08, 0.71606636, -5.30424877e-08, -0.698032081)
            elseif MyLevel == 1100 or MyLevel <= 1124 then -- Lab Subordinate [Lv. 1100]
                Ms = "Lab Subordinate [Lv. 1100]"
                NameQuest = "IceSideQuest"
                LevelQuest = 1
                NameMon = "Lab Subordinate"
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
                CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936, -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
            elseif MyLevel == 1125 or MyLevel <= 1174 then -- Horned Warrior [Lv. 1125]
                Ms = "Horned Warrior [Lv. 1125]"
                NameQuest = "IceSideQuest"
                LevelQuest = 2
                NameMon = "Horned Warrior"
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
                CFrameMon = CFrame.new(-6401.27979, 15.9775667, -5948.24316, 0.388303697, 0, -0.921531856, 0, 1, 0, 0.921531856, 0, 0.388303697)
            elseif MyLevel == 1175 or MyLevel <= 1199 then -- Magma Ninja [Lv. 1175]
                Ms = "Magma Ninja [Lv. 1175]"
                NameQuest = "FireSideQuest"
                LevelQuest = 1
                NameMon = "Magma Ninja"
                CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-5466.06445, 57.6952019, -5837.42822, -0.988835871, 0, -0.149006829, 0, 1, 0, 0.149006829, 0, -0.988835871)
            elseif MyLevel == 1200 or MyLevel <= 1249 then 
                Ms = "Lava Pirate [Lv. 1200]"
                NameQuest = "FireSideQuest"
                LevelQuest = 2
                NameMon = "Lava Pirate"
                CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
                CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012, -0, -0.98044765, 0, -0.196780294)
            elseif MyLevel == 1250 or MyLevel <= 1274 then 
                Ms = "Ship Deckhand [Lv. 1250]"
                NameQuest = "ShipQuest1"
                LevelQuest = 1
                NameMon = "Ship Deckhand"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
                CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968, 5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
            elseif MyLevel == 1275 or MyLevel <= 1299 then 
                Ms = "Ship Engineer [Lv. 1275]"
                NameQuest = "ShipQuest1"
                LevelQuest = 2
                NameMon = "Ship Engineer"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
                CFrameMon = CFrame.new(921.30249023438, 125.400390625, 32937.34375)
            elseif MyLevel == 1300 or MyLevel <= 1324 then 
                Ms = "Ship Steward [Lv. 1300]"
                NameQuest = "ShipQuest2"
                LevelQuest = 1
                NameMon = "Ship Steward"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
                CFrameMon = CFrame.new(917.96057128906, 136.89932250977, 33343.4140625)
            elseif MyLevel == 1325 or MyLevel <= 1349 then 
                Ms = "Ship Officer [Lv. 1325]"
                NameQuest = "ShipQuest2"
                LevelQuest = 2
                NameMon = "Ship Officer"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
                CFrameMon = CFrame.new(944.44964599609, 181.40081787109, 33278.9453125)
            elseif MyLevel == 1350 or MyLevel <= 1374 then 
                Ms = "Arctic Warrior [Lv. 1350]"
                NameQuest = "FrostQuest"
                LevelQuest = 1
                NameMon = "Arctic Warrior"
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
                CFrameMon = CFrame.new(5878.23486, 81.3886948, -6136.35596, -0.451037169, 2.3908234e-07, 0.892505825, -1.08168464e-07, 1, -3.22542007e-07, -0.892505825, -2.4201924e-07, -0.451037169)
            elseif MyLevel == 1375 or MyLevel <= 1424 then -- Snow Lurker [Lv. 1375]
                Ms = "Snow Lurker [Lv. 1375]"
                NameQuest = "FrostQuest"
                LevelQuest = 2
                NameMon = "Snow Lurker"
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
                CFrameMon = CFrame.new(5513.36865, 60.546711, -6809.94971, -0.958693981, -1.65617333e-08, 0.284439981, -4.07668654e-09, 1, 4.44854642e-08, -0.284439981, 4.14883701e-08, -0.958693981)
            elseif MyLevel == 1425 or MyLevel <= 1449 then -- Sea Soldier [Lv. 1425]
                Ms = "Sea Soldier [Lv. 1425]"
                NameQuest = "ForgottenQuest"
                LevelQuest = 1
                NameMon = "Sea Soldier"
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
                CFrameMon = CFrame.new(-3115.78223, 63.8785706, -9808.38574, -0.913427353, 3.11199457e-08, 0.407000452, 7.79564235e-09, 1, -5.89660658e-08, -0.407000452, -5.06883708e-08, -0.913427353)
            elseif MyLevel >= 1450 then -- Water Fighter [Lv. 1450]
                Ms = "Water Fighter [Lv. 1450]"
                NameQuest = "ForgottenQuest"
                LevelQuest = 2
                NameMon = "Water Fighter"
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
                CFrameMon = CFrame.new(-3212.99683, 263.809296, -10551.8799, 0.742111444, -5.59139615e-08, -0.670276582, 1.69155214e-08, 1, -6.46908234e-08, 0.670276582, 3.66697037e-08, 0.742111444)
            end
        end
        if ThreeWorld then
            if MyLevel >= 1500 and MyLevel <= 1524 then -- Pirate Millionaire [Lv. 1500]
                Ms = "Pirate Millionaire [Lv. 1500]"
                NameQuest = "PiratePortQuest"
                LevelQuest = 1
                NameMon = "Pirate Millionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
            elseif MyLevel >= 1525 and MyLevel <= 1574 then -- Pistol Billionaire [Lv. 1525]
                Ms = "Pistol Billionaire [Lv. 1525]"
                NameQuest = "PiratePortQuest"
                LevelQuest = 2
                NameMon = "Pistol Billionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
            elseif MyLevel >= 1575 and MyLevel <= 1599 then -- Dragon Crew Warrior [Lv. 1575]
                Ms = "Dragon Crew Warrior [Lv. 1575]"
                NameQuest = "AmazonQuest"
                LevelQuest = 1
                NameMon = "Dragon Crew Warrior"
                CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
                CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
            elseif MyLevel >= 1600 and MyLevel <= 1624 then -- Dragon Crew Archer [Lv. 1600]
                Ms = "Dragon Crew Archer [Lv. 1600]"
                NameQuest = "AmazonQuest"
                LevelQuest = 2
                NameMon = "Dragon Crew Archer"
                CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
                CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
            elseif MyLevel >= 1625 and MyLevel <= 1649 then -- Female Islander [Lv. 1625]
                Ms = "Female Islander [Lv. 1625]"
                NameQuest = "AmazonQuest2"
                LevelQuest = 1
                NameMon = "Female Islander"
                CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(4770.4990234375, 758.95520019531, 1069.8680419922)
            elseif MyLevel >= 1650 and MyLevel <= 1699 then -- Giant Islander [Lv. 1650]
                Ms = "Giant Islander [Lv. 1650]"
                NameQuest = "AmazonQuest2"
                LevelQuest = 2
                NameMon = "Giant Islander"
                CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
            elseif MyLevel >= 1700 and MyLevel <= 1724 then -- Marine Commodore [Lv. 1700]
                Ms = "Marine Commodore [Lv. 1700]"
                NameQuest = "MarineTreeIsland"
                LevelQuest = 1
                NameMon = "Marine Commodore"
                CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
                CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
            elseif MyLevel >= 1725 and MyLevel <= 1774 then -- Marine Rear Admiral [Lv. 1725]
                Ms = "Marine Rear Admiral [Lv. 1725]"
                NameQuest = "MarineTreeIsland"
                LevelQuest = 2
                NameMon = "Marine Rear Admiral"
                CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
                CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
            elseif MyLevel >= 1775 and MyLevel <= 1799 then -- Fishman Raider [Lv. 1775]
                Ms = "Fishman Raider [Lv. 1775]"
                NameQuest = "DeepForestIsland3"
                LevelQuest = 1
                NameMon = "Fishman Raider"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
            elseif MyLevel >= 1800 and MyLevel <= 1824 then -- Fishman Captain [Lv. 1800]
                Ms = "Fishman Captain [Lv. 1800]"
                NameQuest = "DeepForestIsland3"
                LevelQuest = 2
                NameMon = "Fishman Captain"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
            elseif MyLevel >= 1825 and MyLevel <= 1849 then -- Forest Pirate [Lv. 1825]
                Ms = "Forest Pirate [Lv. 1825]"
                NameQuest = "DeepForestIsland"
                LevelQuest = 1
                NameMon = "Forest Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
                CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
            elseif MyLevel >= 1850 and MyLevel <= 1899 then -- Mythological Pirate [Lv. 1850]
                Ms = "Mythological Pirate [Lv. 1850]"
                NameQuest = "DeepForestIsland"
                LevelQuest = 2
                NameMon = "Mythological Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
                CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
            elseif MyLevel >= 1900 and MyLevel <= 1924 then -- Jungle Pirate [Lv. 1900]
                Ms = "Jungle Pirate [Lv. 1900]"
                NameQuest = "DeepForestIsland2"
                LevelQuest = 1
                NameMon = "Jungle Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
                CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
            elseif MyLevel >= 1925 and MyLevel <= 1974 then -- Musketeer Pirate [Lv. 1925]
                Ms = "Musketeer Pirate [Lv. 1925]"
                NameQuest = "DeepForestIsland2"
                LevelQuest = 2
                NameMon = "Musketeer Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
                CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
            elseif MyLevel >= 1975 and MyLevel <= 1999 then
                Ms = "Reborn Skeleton [Lv. 1975]"
                NameQuest = "HauntedQuest1"
                LevelQuest = 1
                NameMon = "Reborn Skeleton"
                CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
                CFrameMon = CFrame.new(-8817.880859375, 191.16761779785, 6298.6557617188)
            elseif MyLevel >= 2000 and MyLevel <= 2024 then
                Ms = "Living Zombie [Lv. 2000]"
                NameQuest = "HauntedQuest1"
                LevelQuest = 2
                NameMon = "Living Zombie"
                CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
                CFrameMon = CFrame.new(-10125.234375, 183.94705200195, 6242.013671875)
            elseif MyLevel >= 2025 and MyLevel <= 2049  then
                Ms = "Demonic Soul [Lv. 2025]"
                NameQuest = "HauntedQuest2"
                LevelQuest = 1
                NameMon = "Demonic Soul"
                CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
            elseif MyLevel >= 2050 and MyLevel <= 2074 then
                Ms = "Posessed Mummy [Lv. 2050]"
                NameQuest = "HauntedQuest2"
                LevelQuest = 2
                NameMon = "Posessed Mummy"
                CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)    
            elseif MyLevel >= 2075 and MyLevel <= 2099 then
                Ms = "Peanut Scout [Lv. 2075]"
                NameQuest = "NutsIslandQuest"
                LevelQuest = 1
                NameMon = "Peanut Scout"
                CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
                CFrameMon = CFrame.new(-2098.07544, 192.611862, -10248.8867, 0.983392298, -9.57031787e-08, 0.181492642, 8.7276355e-08, 1, 5.44169616e-08, -0.181492642, -3.76732068e-08, 0.983392298)
            elseif MyLevel >= 2100 and MyLevel <= 2124 then
                Ms = "Peanut President [Lv. 2100]"
                NameQuest = "NutsIslandQuest"
                LevelQuest = 2
                NameMon = "Peanut President"
                CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
                CFrameMon = CFrame.new(-1876.95959, 192.610947, -10542.2939, 0.0553516336, -2.83836812e-08, 0.998466909, -6.89634405e-10, 1, 2.84654931e-08, -0.998466909, -2.26418861e-09, 0.0553516336)
            elseif MyLevel >= 2125 and MyLevel <= 2149 then
                Ms = "Ice Cream Chef [Lv. 2125]"
                NameQuest = "IceCreamIslandQuest"
                LevelQuest = 1
                NameMon = "Ice Cream Chef"
                CFrameQuest = CFrame.new(-820.404358, 65.8453293, -10965.5654, 0.822534859, 5.24448502e-08, -0.568714678, -2.08336317e-08, 1, 6.20846663e-08, 0.568714678, -3.92184099e-08, 0.822534859)
                CFrameMon = CFrame.new(-821.614075, 208.39537, -10990.7617, -0.870096624, 3.18909272e-08, 0.492881238, -1.8357893e-08, 1, -9.71107568e-08, -0.492881238, -9.35439957e-08, -0.870096624)
            elseif MyLevel >= 2150 and MyLevel <= 2199 then 
                Ms = "Ice Cream Commander [Lv. 2150]"
                NameQuest = "IceCreamIslandQuest"
                LevelQuest = 2
                NameMon = "Ice Cream Commander"
                CFrameQuest = CFrame.new(-819.376526, 67.4634171, -10967.2832)
                CFrameMon = CFrame.new(-610.11669921875, 208.26904296875, -11253.686523438)
            elseif MyLevel >= 2200 and MyLevel <= 2224 then 
                Ms = "Cookie Crafter [Lv. 2200]"
                NameQuest = "CakeQuest1"
                LevelQuest = 1
                NameMon = "Cookie Crafter"
                CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
                CFrameMon = CFrame.new(-2286.684326171875, 146.5656280517578, -12226.8818359375)
            elseif MyLevel >= 2225 and MyLevel <= 2249 then 
                Ms = "Cake Guard [Lv. 2225]"
                NameQuest = "CakeQuest1"
                LevelQuest = 2
                NameMon = "Cake Guard"
                CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
                CFrameMon = CFrame.new(-1817.9747314453125, 209.5632781982422, -12288.9228515625)
            elseif MyLevel >= 2250 and MyLevel <= 2274 then 
                Ms = "Baking Staff [Lv. 2250]"
                NameQuest = "CakeQuest2"
                LevelQuest = 1
                NameMon = "Baking Staff"
                CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
                CFrameMon = CFrame.new(-1818.347900390625, 93.41275787353516, -12887.66015625)
            elseif MyLevel >= 2275 then 
                Ms = "Head Baker [Lv. 2275]"
                NameQuest = "CakeQuest2"
                LevelQuest = 2
                NameMon = "Head Baker"
                CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
                CFrameMon = CFrame.new(-2288.795166015625, 106.9419174194336, -12811.111328125)
            end
        end
    end
end
CheckQuest()

SelectBoss = ""
function CheckQuestBoss()
    -- Old World
    if SelectBoss == "Saber Expert [Lv. 200] [Boss]" then
        MsBoss = "Saber Expert [Lv. 200] [Boss]"
        NameQuestBoss = ""
        LevelQuestBoss = 3
        NameBoss = ""
        CFrameQuestBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
        CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
    elseif SelectBoss == "The Saw [Lv. 100] [Boss]" then
        MsBoss = "The Saw [Lv. 100] [Boss]"
        NameQuestBoss = ""
        LevelQuestBoss = 3
        NameBoss = ""
        CFrameQuestBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854)
        CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854, -0.290192783, 6.88365773e-08, 0.956968188, 6.98413629e-08, 1, -5.07531119e-08, -0.956968188, 5.21077759e-08, -0.290192783)
    elseif SelectBoss == "Greybeard [Lv. 750] [Raid Boss]" then
        MsBoss = "Greybeard [Lv. 750] [Raid Boss]"
        NameQuestBoss = ""
        LevelQuestBoss = 3
        NameBoss = ""
        CFrameQuestBoss = CFrame.new(-4955.72949, 80.8163834, 4305.82666)
        CFrameBoss = CFrame.new(-4955.72949, 80.8163834, 4305.82666, -0.433646321, -1.03394289e-08, 0.901083171, -3.0443168e-08, 1, -3.17633075e-09, -0.901083171, -2.88092288e-08, -0.433646321)
    elseif SelectBoss == "Mob Leader [Lv. 120] [Boss]" then
        MsBoss = "Mob Leader [Lv. 120] [Boss]"
        NameQuestBoss = ""
        LevelQuestBoss = 3
        NameBoss = ""
        CFrameQuestBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043)
        CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.92824)
    
    elseif SelectBoss == "The Gorilla King [Lv. 25] [Boss]" then
        MsBoss = "The Gorilla King [Lv. 25] [Boss]"
        NameQuestBoss = "JungleQuest"
        LevelQuestBoss = 3
        NameBoss = "The Gorilla King"
        CFrameQuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
        CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
    elseif SelectBoss == "Bobby [Lv. 55] [Boss]" then
        MsBoss = "Bobby [Lv. 55] [Boss]"
        NameQuestBoss = "BuggyQuest1"
        LevelQuestBoss = 3
        NameBoss = "Bobby"
        CFrameQuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
        CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
    elseif SelectBoss == "Yeti [Lv. 110] [Boss]" then
        MsBoss = "Yeti [Lv. 110] [Boss]"
        NameQuestBoss = "SnowQuest"
        LevelQuestBoss = 3
        NameBoss = "Yeti"
        CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
        CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
    elseif SelectBoss == "Vice Admiral [Lv. 130] [Boss]" then
        MsBoss = "Vice Admiral [Lv. 130] [Boss]"
        NameQuestBoss = "MarineQuest2"
        LevelQuestBoss = 2
        NameBoss = "Vice Admiral"
        CFrameQuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
        CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
    elseif SelectBoss == "Warden [Lv. 175] [Boss]" then
        MsBoss = "Warden [Lv. 175] [Boss]"
        NameQuestBoss = "ImpelQuest"
        LevelQuestBoss = 1
        NameBoss = "Warden"
        CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
        CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
    elseif SelectBoss == "Chief Warden [Lv. 200] [Boss]" then
        MsBoss = "Chief Warden [Lv. 200] [Boss]"
        NameQuestBoss = "ImpelQuest"
        LevelQuestBoss = 2
        NameBoss = "Chief Warden"
        CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
        CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
    elseif SelectBoss == "Swan [Lv. 225] [Boss]" then
        MsBoss = "Swan [Lv. 225] [Boss]"
        NameQuestBoss = "ImpelQuest"
        LevelQuestBoss = 3
        NameBoss = "Swan"
        CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
        CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
    elseif SelectBoss == "Magma Admiral [Lv. 350] [Boss]" then
        MsBoss = "Magma Admiral [Lv. 350] [Boss]"
        NameQuestBoss = "MagmaQuest"
        LevelQuestBoss = 3
        NameBoss = "Magma Admiral"
        CFrameQuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
        CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
    elseif SelectBoss == "Fishman Lord [Lv. 425] [Boss]" then
        MsBoss = "Fishman Lord [Lv. 425] [Boss]"
        NameQuestBoss = "FishmanQuest"
        LevelQuestBoss = 3
        NameBoss = "Fishman Lord"
        CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
        CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
    elseif SelectBoss == "Wysper [Lv. 500] [Boss]" then
        MsBoss = "Wysper [Lv. 500] [Boss]"
        NameQuestBoss = "SkyExp1Quest"
        LevelQuestBoss = 3
        NameBoss = "Wysper"
        CFrameQuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
        CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
    elseif SelectBoss == "Thunder God [Lv. 575] [Boss]" then
        MsBoss = "Thunder God [Lv. 575] [Boss]"
        NameQuestBoss = "SkyExp2Quest"
        LevelQuestBoss = 3
        NameBoss = "Thunder God"
        CFrameQuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706, -0.0361216255, -1.16895912e-07, 0.999347389, 1.44533963e-09, 1, 1.17024491e-07, -0.999347389, 5.6715117e-09, -0.0361216255)
        CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
    elseif SelectBoss == "Cyborg [Lv. 675] [Boss]" then
        MsBoss = "Cyborg [Lv. 675] [Boss]"
        NameQuestBoss = "FountainQuest"
        LevelQuestBoss = 3
        NameBoss = "Cyborg"
        CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
        CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
    
        -- New World
    elseif SelectBoss == "Don Swan [Lv. 1000] [Boss]" then
        MsBoss = "Don Swan [Lv. 1000] [Boss]"
        NameQuestBoss = ""
        LevelQuestBoss = 3
        NameBoss = "Don Swan"
        CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
    
    elseif SelectBoss == "Diamond [Lv. 750] [Boss]" then
        MsBoss = "Diamond [Lv. 750] [Boss]"
        NameQuestBoss = "Area1Quest"
        LevelQuestBoss = 3
        NameBoss = "Diamond"
        CFrameQuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
        CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
    elseif SelectBoss == "Jeremy [Lv. 850] [Boss]" then
        MsBoss = "Jeremy [Lv. 850] [Boss]"
        NameQuestBoss = "Area2Quest"
        LevelQuestBoss = 3
        NameBoss = "Jeremy"
        CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
        CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
    elseif SelectBoss == "Fajita [Lv. 925] [Boss]" then
        MsBoss = "Fajita [Lv. 925] [Boss]"
        NameQuestBoss = "MarineQuest3"
        LevelQuestBoss = 3
        NameBoss = "Fajita"
        CFrameQuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
        CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
    elseif SelectBoss == "Smoke Admiral [Lv. 1150] [Boss]" then
        MsBoss = "Smoke Admiral [Lv. 1150] [Boss]"
        NameQuestBoss = "IceSideQuest"
        LevelQuestBoss = 3
        NameBoss = "Smoke Admiral"
        CFrameQuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
        CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
    elseif SelectBoss == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
        MsBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
        NameQuestBoss = "FrostQuest"
        LevelQuestBoss = 3
        NameBoss = "Awakened Ice Admiral"
        CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
        CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
    elseif SelectBoss == "Tide Keeper [Lv. 1475] [Boss]" then
        MsBoss = "Tide Keeper [Lv. 1475] [Boss]"
        NameQuestBoss = "ForgottenQuest"             
        LevelQuestBoss = 3
        NameBoss = "Tide Keeper"
        CFrameQuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
        CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
    
    elseif SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" then
        MsBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
        NameQuestBoss = ""
        LevelQuestBoss = 3
        NameBoss = "Cursed Captain"
        CFrameQuestBoss = CFrame.new(916.928589, 181.092773, 33422)
        CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
    elseif SelectBoss == "Darkbeard [Lv. 1000] [Raid Boss]" then
        MsBoss = "Darkbeard [Lv. 1000] [Raid Boss]"
        NameQuestBoss = ""
        LevelQuestBoss = 3
        NameBoss = "Darkbeard"
        CFrameQuestBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777)
        CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777, -0.976951957, 4.97356325e-08, 0.213458836, 4.57335361e-08, 1, -2.36868622e-08, -0.213458836, -1.33787044e-08, -0.976951957)
    elseif SelectBoss == "Order [Lv. 1250] [Raid Boss]" then
        MsBoss = "Order [Lv. 1250] [Raid Boss]"
        NameQuestBoss = ""
        LevelQuestBoss = 3
        NameBoss = "Order"
        CFrameQuestBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584)
        CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584, -0.380726993, 7.41463495e-08, 0.924687505, 5.85604774e-08, 1, -5.60738549e-08, -0.924687505, 3.28013137e-08, -0.380726993)
    
        -- Thire World
    elseif SelectBoss == "Stone [Lv. 1550] [Boss]" then
        MsBoss = "Stone [Lv. 1550] [Boss]"
        NameQuestBoss = "PiratePortQuest"             
        LevelQuestBoss = 3
        NameBoss = "Stone"
        CFrameQuestBoss = CFrame.new(-290, 44, 5577)
        CFrameBoss = CFrame.new(-1085, 40, 6779)
    elseif SelectBoss == "Island Empress [Lv. 1675] [Boss]" then
        MsBoss = "Island Empress [Lv. 1675] [Boss]"
        NameQuestBoss = "AmazonQuest2"             
        LevelQuestBoss = 3
        NameBoss = "Island Empress"
        CFrameQuestBoss = CFrame.new(5443, 602, 752)
        CFrameBoss = CFrame.new(5659, 602, 244)
    elseif SelectBoss == "Kilo Admiral [Lv. 1750] [Boss]" then
        MsBoss = "Kilo Admiral [Lv. 1750] [Boss]"
        NameQuestBoss = "MarineTreeIsland"             
        LevelQuestBoss = 3
        NameBoss = "Kilo Admiral"
        CFrameQuestBoss = CFrame.new(2178, 29, -6737)
        CFrameBoss =CFrame.new(2846, 433, -7100)
    elseif SelectBoss == "Captain Elephant [Lv. 1875] [Boss]" then
        MsBoss = "Captain Elephant [Lv. 1875] [Boss]"
        NameQuestBoss = "DeepForestIsland"             
        LevelQuestBoss = 3
        NameBoss = "Captain Elephant"
        CFrameQuestBoss = CFrame.new(-13232, 333, -7631)
        CFrameBoss = CFrame.new(-13221, 325, -8405)
    elseif SelectBoss == "Beautiful Pirate [Lv. 1950] [Boss]" then
        MsBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
        NameQuestBoss = "DeepForestIsland2"             
        LevelQuestBoss = 3
        NameBoss = "Beautiful Pirate"
        CFrameQuestBoss = CFrame.new(-12686, 391, -9902)
        CFrameBoss = CFrame.new(5182, 23, -20)
    elseif SelectBoss == "Cake Queen [Lv. 2175] [Boss]" then
        MsBoss = "Cake Queen [Lv. 2175] [Boss]"
        NameQuestBoss = "IceCreamIslandQuest"             
        LevelQuestBoss = 3
        NameBoss = "Cake Queen"
        CFrameQuestBoss = CFrame.new(-716, 382, -11010)
        CFrameBoss = CFrame.new(-821, 66, -10965)

    elseif SelectBoss == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
        MsBoss = "rip_indra True Form [Lv. 5000] [Raid Boss]"
        LevelQuestBoss = 3
        NameQuestBoss = ""
        NameBoss = "rip_indra True Form"
        CFrameQuestBoss = CFrame.new(-5359, 424, -2735)
        CFrameBoss = CFrame.new(-5359, 424, -2735)
    elseif SelectBoss == "Longma [Lv. 2000] [Boss]" then
        MsBoss = "Longma [Lv. 2000] [Boss]"

        LevelQuestBoss = 3
        NameQuestBoss = ""
        NameBoss = "Longma"

        CFrameQuestBoss = CFrame.new(-10248.3936, 353.79129, -9306.34473)
        CFrameBoss = CFrame.new(-10248.3936, 353.79129, -9306.34473)
    elseif SelectBoss == "Soul Reaper [Lv. 2100] [Raid Boss]" then
        MsBoss = "Soul Reaper [Lv. 2100] [Raid Boss]"
        LevelQuestBoss = 3
        NameQuestBoss = ""
        NameBoss = "Soul Reaper"
        CFrameQuestBoss = CFrame.new(-9515.62109, 315.925537, 6691.12012)
        CFrameBoss = CFrame.new(-9515.62109, 315.925537, 6691.12012)
    end
end
CheckQuestBoss()

do -- Init
    task = task or getrenv().task;
    fastSpawn,fastWait,delay = task.spawn,task.wait,task.delay
end

function SlowtoTarget(CFgo)

    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/250, Enum.EasingStyle.Linear)
    local tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
    tween:Play()

end

function MytoTarget(CFgo)
    local tweenfunc = {}
    if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude <= 20 then
        pcall(function()
            tween:Cancel()

            game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = CFgo

            return
        end)
    end
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/275, Enum.EasingStyle.Linear)
    local tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
    tween:Play()

    function tweenfunc:Stop()
        tween:Cancel()
    end 

    if not tween then return tween end
    return tweenfunc
end

function toTarget(targetPos, targetCFrame)
    if FastTween then
        Distance = (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
        if Distance < 1000 then
            Speed = 325
        elseif Distance >= 1000 then
            Speed = 300
        end
    else
        Distance = (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
        if Distance < 1000 then
            Speed = 275
        elseif Distance >= 1000 then
            Speed = 250
        end
    end
    local tweenfunc = {}

    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude/Speed, Enum.EasingStyle.Linear)
    local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
    tween:Play()

    function tweenfunc:Stop()
        tween:Cancel()
    end 

    if StatsBypass == "Bypassed" and UseTP then
        tween:Cancel()
        game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"].CFrame = targetCFrame
    end
    if not tween then return tween end
    return tweenfunc
end

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    StatsBypass = "NoBypassTP"
end)
spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
                if StatsBypass == "Bypassing" or StatsBypass == "Bypassed" then
                    game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(15, false)
                else
                    game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(15, true)
                end
            end
        end)
    end
end)

function Click()
    local VirtualUser = game:GetService('VirtualUser')
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end

function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end      

spawn(function()
    while wait() do
        for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                if v.ToolTip == "Sword" then
                    SelectToolWeaponSword = v.Name
                end
            end
        end
        for i ,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                if v.ToolTip == "Sword" then
                    SelectToolWeaponSword = v.Name
                end
            end
        end
    end
end)

-- Get Weapon Gun
spawn(function()
    while wait() do
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
            if v:IsA("Tool") then
                if v:FindFirstChild("RemoteFunctionShoot") then 
                    SelectToolWeaponGun = v.Name
                end
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
            if v:IsA("Tool") then
                if v:FindFirstChild("RemoteFunctionShoot") then 
                    SelectToolWeaponGun = v.Name
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if sethiddenproperty then
            sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",99999999999)
        end 
        if setscriptable then
            setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
            game.Players.LocalPlayer.SimulationRadius = math.huge * math.huge, math.huge * math.huge * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0
        end
    end
end)

function TP(P)
    NoClip = true
    Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 10 then
        Speed = 1000
    elseif Distance < 170 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
        Speed = 350
    elseif Distance < 1000 then
        Speed = 350
    elseif Distance >= 1000 then
        Speed = 250
    end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P}
    ):Play()
    NoClip = false
end

local CameraShakeInstanceSet = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.CameraShaker.CameraShakeInstance)
function AutoFarm(NameMonster,RemoteQuestGet,LevelQuestGet,TextQuestName,WaitMonSpawnCFrame,NPCQuestCFrame,FarmMode)
    local AutoFarmfunc = {}

    function AutoFarmfunc:Update(NewNameMonster,NewRemoteQuestGet,NewLevelQuestGet,NewTextQuestName,NewWaitMonSpawnCFrame,NewNPCQuestCFrame)
        NameMonster = NewNameMonster
        RemoteQuestGet = NewRemoteQuestGet
        LevelQuestGet = NewLevelQuestGet
        TextQuestName = NewTextQuestName
        WaitMonSpawnCFrame = NewWaitMonSpawnCFrame
        NPCQuestCFrame = NewNPCQuestCFrame
    end
    function AutoFarmfunc:UpdateFarmMode(NewFarmMode)
        FarmMode = NewFarmMode
    end
    function AutoFarmfunc:Start()
        farm = true
    end
    function AutoFarmfunc:Stop()
        farm = false
    end

    spawn(function()
        while true do
            if farm then
                if FarmMode == "AutoFarmLevel" then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and Nonquest == false then
                        Usefastattack = false
                        StartMagnetAutoFarmLevel= false
                        Questtween = toTarget(NPCQuestCFrame.Position,NPCQuestCFrame)
                        if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Questtween then Questtween:Stop() end wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                        elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Questtween then Questtween:Stop() end wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                        elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                            if Questtween then Questtween:Stop() end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                            if Questtween then Questtween:Stop() end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                        elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 100 then
                            if Questtween then Questtween:Stop() end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
                            wait(.9)
                            local string_1 = "StartQuest";
                            local string_2 = NameQuest;
                            local number_1 = LevelQuest;
                            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                            Target:InvokeServer(string_1, string_2, number_1);
                            local string_1 = "SetSpawnPoint";
                            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                            Target:InvokeServer(string_1);
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true or Nonquest == true then
                        if Nonquest == true then
                            local string_1 = "SetSpawnPoint";
                            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                            Target:InvokeServer(string_1);
                        end
                        if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if farm and v.Name == Ms and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or Nonquest == true then
                                        repeat wait()
                                            pcall(function()
                                                if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                                                    Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                                        EquipWeapon(SelectToolWeapon)
                                                        if Farmtween then Farmtween:Stop() end
                                                        PosMon = v.HumanoidRootPart.CFrame
                                                        StartMagnetAutoFarmLevel = true
                                                        Usefastattack = true
                                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                            local args = {
                                                                [1] = "Buso"
                                                            }
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                        end
                                                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                                                            local vim = game:service('VirtualInputManager')
                                                            vim:SendKeyEvent(true, "V", false, game)
                                                            vim:SendKeyEvent(false, "V", false, game)
                                                        end
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 14)
                                                        Click()
                                                    end
                                                end
                                            end)
                                        until (not farm or not v.Parent or v.Humanoid.Health <= 0) or (not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) and Nonquest == false) or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and Nonquest == false)
                                        if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) and Nonquest == false then
                                            game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                                        end
                                        Usefastattack = false
                                        StartMagnetAutoFarmLevel= false
                                    else
                                        game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                                    end 
                                end
                            end
                        else
                            if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) and Nonquest == false then
                                game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                            end
                            Usefastattack = false
                            StartMagnetAutoFarmLevel= false
                            Modstween = toTarget(CFrameMon.Position,CFrameMon)
                            if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                            elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                            elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                            elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                            elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                            end
                        end
                    end
                elseif FarmMode == "AutoFarmGun" then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        Usefastattack = false
                        StartMagnetAutoFarmLevel= false
                        Questtween = toTarget(NPCQuestCFrame.Position,NPCQuestCFrame) wait(.1)
                        if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Questtween then Questtween:Stop() end wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                        elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Questtween then Questtween:Stop() end wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                        elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                            if Questtween then Questtween:Stop() end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                            if Questtween then Questtween:Stop() end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                        elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                            if Questtween then Questtween:Stop() end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
                            wait(1)
                            local string_1 = "StartQuest";
                            local string_2 = NameQuest;
                            local number_1 = LevelQuest;
                            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                            Target:InvokeServer(string_1, string_2, number_1);
                            local string_1 = "SetSpawnPoint";
                            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                            Target:InvokeServer(string_1);
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if farm and v.Name == Ms and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        repeat wait()
                                            Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                                EquipWeapon(SelectToolWeapon)
                                                if Farmtween then Farmtween:Stop() end
                                                if Modstween then Modstween:Stop() end
                                                PosMon = v.HumanoidRootPart.CFrame
                                                StartMagnetAutoFarmLevel= true
                                                Usefastattack = true
                                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                    local args = {
                                                        [1] = "Buso"
                                                    }
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                end
                                                HealthMin = v.Humanoid.MaxHealth*Persen/100
                                                PosMonGun = v.HumanoidRootPart.CFrame
                                                if v.Humanoid.Health <= HealthMin and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                                    EquipWeapon(SelectToolWeaponGun)
                                                    -- v.HumanoidRootPart.CanCollide = false
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
                                                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectToolWeaponGun) and game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectToolWeaponGun):FindFirstChild("RemoteFunctionShoot") then
                                                        tool = game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun]
                                                        v17 = workspace:FindPartOnRayWithIgnoreList(Ray.new(tool.Handle.CFrame.p, (v.HumanoidRootPart.Position - tool.Handle.CFrame.p).unit * 100), { game.Players.LocalPlayer.Character, workspace._WorldOrigin });
                                                        game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectToolWeaponGun).RemoteFunctionShoot:InvokeServer(v.HumanoidRootPart.Position, (ReplicatedStorage_Util.Other.hrpFromPart(v17)));
                                                    end 
                                                else
                                                    EquipWeapon(SelectToolWeapon)
                                                    Usefastattack = true
                                                    PosMonGun = v.HumanoidRootPart.CFrame
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
                                                    Click()
                                                    StartMagnetAutoFarmLevel = true
                                                end
                                            end
                                        until not farm or not v.Parent or v.Humanoid.Health <= 0 or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                                        end
                                        Usefastattack = false
                                        StartMagnetAutoFarmLevel= false
                                    else
                                        game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                                    end 
                                end
                            end
                        else
                            if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                            end
                            Usefastattack = false
                            StartMagnetAutoFarmLevel= false
                            Modstween = toTarget(CFrameMon.Position,CFrameMon)
                            if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                            elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                            elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                            elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                            elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                            end 
                        end
                    end
                elseif FarmMode == "AutoFarmDevilfruit" then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        Usefastattack = false
                        StartMagnetAutoFarmLevel= false
                        Questtween = toTarget(NPCQuestCFrame.Position,NPCQuestCFrame) wait(.1)
                        if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Questtween then Questtween:Stop() end wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                        elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Questtween then Questtween:Stop() end wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                        elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                            if Questtween then Questtween:Stop() end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                            if Questtween then Questtween:Stop() end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                        elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                            if Questtween then Questtween:Stop() end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
                            wait(1)
                            local string_1 = "StartQuest";
                            local string_2 = NameQuest;
                            local number_1 = LevelQuest;
                            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                            Target:InvokeServer(string_1, string_2, number_1);
                            local string_1 = "SetSpawnPoint";
                            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                            Target:InvokeServer(string_1);
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if farm and v.Name == Ms and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        repeat wait()
                                            Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
                                            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                                    if Farmtween then Farmtween:Stop() end
                                                    StartMagnetAutoFarmLevel= true
                                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                        local args = {
                                                            [1] = "Buso"
                                                        }
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                    end
                                                    HealthMin = v.Humanoid.MaxHealth*Persen/100
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    if v.Humanoid.Health <= HealthMin and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                                        EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 1)
                                                        DevilFruitMastery = game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value
                                                        PositionSkillMasteryDevilFruit = v.HumanoidRootPart.Position
                                                        UseSkillMasteryDevilFruit = true
                                                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then
                                                            if SkillZ and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                                            end
                                                            if SkillX and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                                            end   
                                                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
                                                            if SkillZ and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= 1 and game.Players.LocalPlayer.Character.HumanoidRootPart.Size == Vector3.new(7.6, 7.676, 3.686) then
                                                            else
                                                                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                                            end
                                                            if SkillX and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                                            end
                                                            if SkillC and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                                                            end  
                                                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                                                            game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = v.HumanoidRootPart.Position
                                                            if SkillZ and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                                            end
                                                            if SkillX and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                                            end
                                                            if SkillC and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                                                            end
                                                            if SkillV and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                                                            end
                                                        end
                                                    else
                                                        UseSkillMasteryDevilFruit = false
                                                        EquipWeapon(SelectToolWeapon)
                                                        Click()
                                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                            local args = {
                                                                [1] = "Buso"
                                                            }
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                        end
                                                        PosMon = v.HumanoidRootPart.CFrame
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 1)
                                                        StartMagnetAutoFarmLevel = true
                                                    end
                                                end
                                            else
                                                if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                                    game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                                                end
                                                StartMagnetAutoFarmLevel= false
                                                Modstween = toTarget(CFrameMon.Position,CFrameMon)
                                                if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                                    if Modstween then Modstween:Stop() end wait(.5)
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                                                elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                                    if Modstween then Modstween:Stop() end wait(.5)
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                                                elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                                                    if Modstween then Modstween:Stop() end wait(.5)
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                                                elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                                                    if Modstween then Modstween:Stop() end wait(.5)
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                                                elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                                    if Modstween then Modstween:Stop() end wait(.5)
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                                                end 
                                            end
                                        until not farm or not v.Parent or v.Humanoid.Health <= 0 or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                                        end
                                        StartMagnetAutoFarmLevel= false
                                    else
                                        game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                                    end 
                                end
                            end
                        else
                            if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                            end
                            StartMagnetAutoFarmLevel= false
                            Modstween = toTarget(CFrameMon.Position,CFrameMon)
                            if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                            elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                            elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                            elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                            elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                            end 
                        end
                    end
                elseif FarmMode == "AutoFarmWeapon" then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        Usefastattack = false
                        StartMagnetAutoFarmLevel= false
                        Questtween = toTarget(NPCQuestCFrame.Position,NPCQuestCFrame) wait(.1)
                        if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Questtween then Questtween:Stop() end wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                        elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Questtween then Questtween:Stop() end wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                        elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                            if Questtween then Questtween:Stop() end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                            if Questtween then Questtween:Stop() end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                        elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                            if Questtween then Questtween:Stop() end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
                            wait(1)
                            local string_1 = "StartQuest";
                            local string_2 = NameQuest;
                            local number_1 = LevelQuest;
                            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                            Target:InvokeServer(string_1, string_2, number_1);
                            local string_1 = "SetSpawnPoint";
                            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                            Target:InvokeServer(string_1);
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if farm and v.Name == Ms and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        repeat wait()
                                            Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame * CFrame.new(0, 40, 1))
                                            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                                    if Farmtween then Farmtween:Stop() end
                                                    StartMagnetAutoFarmLevel= true
                                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                        local args = {
                                                            [1] = "Buso"
                                                        }
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                    end
                                                    HealthMin = v.Humanoid.MaxHealth*Persen/100
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    if v.Humanoid.Health <= HealthMin and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                                        EquipWeapon(SelectToolWeaponSword)
                                                        Click()
                                                        Usefastattack = true
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 1)
                                                        StartMagnetAutoFarmLevel = true
                                                    else
                                                        EquipWeapon(SelectToolWeapon)
                                                        Click()
                                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                            local args = {
                                                                [1] = "Buso"
                                                            }
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                        end
                                                        PosMon = v.HumanoidRootPart.CFrame
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 1)
                                                        StartMagnetAutoFarmLevel = true
                                                        Usefastattack = false
                                                    end
                                                end
                                            else
                                                if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                                    game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                                                end
                                                Usefastattack = false
                                                StartMagnetAutoFarmLevel= false
                                                Modstween = toTarget(CFrameMon.Position,CFrameMon)
                                                if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                                    if Modstween then Modstween:Stop() end wait(.5)
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                                                elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                                    if Modstween then Modstween:Stop() end wait(.5)
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                                                elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                                                    if Modstween then Modstween:Stop() end wait(.5)
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                                                elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                                                    if Modstween then Modstween:Stop() end wait(.5)
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                                                elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                                    if Modstween then Modstween:Stop() end wait(.5)
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                                                end 
                                            end
                                        until not farm or not v.Parent or v.Humanoid.Health <= 0 or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                                        end
                                        StartMagnetAutoFarmLevel= false
                                        Usefastattack = false
                                    else
                                        game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                                    end 
                                end
                            end
                        else
                            if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                            end
                            Usefastattack = false
                            StartMagnetAutoFarmLevel= false
                            Modstween = toTarget(CFrameMon.Position,CFrameMon)
                            if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                            elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                            elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                            elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                            elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                if Modstween then Modstween:Stop() end wait(.5)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                            end 
                        end
                    end
                end
            end
            fastWait(.05)
        end
    end)
    spawn(function()
        game:GetService("RunService").Stepped:Connect(function()
            if farm or TweenIsland or TweenNPC or AutoFarmChest or FramBossSelectHop or AutoNew or Auto_Farm or AutoNew or Factory or Autothird or MasteryDevilFruit or MasteryWeapon or MasteryGun or FramBoss or KillAllBoss or AutoMobAura or Observation or AutoSaber or AutoPole or AutoPoleHOP or AutoQuestBartilo or AutoEvoRace2 or AutoRengoku or AutoFramEctoplasm or AutoBuddySwords or AutoBuddySwords or AutoFarmBone or AutoHallowScythe or AutoSoulReaper or AutoFarmCakePrince or AutoYama or HolyTorch or AutoEliteHunter or AutoHakiRainbow or MusketeeHat or AutoObservationHakiV2 or NextIsland or AutoRaids then
                if not KRNL_LOADED and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    setfflag("HumanoidParallelRemoveNoPhysics", "False")
                    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                else
                    if not game:GetService("Workspace"):FindFirstChild("LOL") then
                        local LOL = Instance.new("Part")
                        LOL.Name = "LOL"
                        LOL.Parent = game.Workspace
                        LOL.Anchored = true
                        LOL.Transparency = 5
                        LOL.Material = "Neon"
                        LOL.Color = Color3.fromRGB(80, 245, 245)
                        LOL.Size = Vector3.new(10,0,10)
                    elseif game:GetService("Workspace"):FindFirstChild("LOL") then
                        game.Workspace["LOL"].CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y - 3.8,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                    end
                end
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
    spawn(function()
        game:GetService("RunService").Heartbeat:Connect(function() CheckQuest()
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if farm and StartMagnetAutoFarmLevel and v.Name ~= "Ice Admiral [Lv. 700] [Boss]" and v.Name ~= "Don Swan [Lv. 3000] [Boss]" and v.Name ~= "Saber Expert [Lv. 200] [Boss]" and v.Name ~= "Longma [Lv. 2000] [Boss]" and (v.HumanoidRootPart.Position-PosMon.Position).magnitude <= 350 then
                    if syn then
                        if isnetworkowner(v.HumanoidRootPart) then
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                            v.Humanoid:ChangeState(11)
                        end
                    else
                        v.HumanoidRootPart.CFrame = PosMon
                        v.Humanoid.JumpPower = 0
                        v.Humanoid.WalkSpeed = 0
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                        v.Humanoid:ChangeState(11)
                    end	
                end
            end
        end)
    end)
    return AutoFarmfunc
end

spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg,false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    if UseSkillMasteryDevilFruit then
                        args[2] = PositionSkillMasteryDevilFruit
                        return old(unpack(args))
                    elseif Skillaimbot then
                        args[2] = AimBotSkillPosition
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end)
end)

local CombatFrameworkROld = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 
local CombatFrameworkR = getupvalues(CombatFrameworkROld)[2]
local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShakerR:Stop()
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            CombatFrameworkR.activeController.hitboxMagnitude = 1
            if Usefastattack then
                if fastattack then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
                        CombatFrameworkR.activeController.timeToNextAttack = 3
                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
                        CombatFrameworkR.activeController.timeToNextAttack = 3
                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
                        CombatFrameworkR.activeController.timeToNextAttack = 4
                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") then
                        CombatFrameworkR.activeController.timeToNextAttack = 3
                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Dragon Breath") then
                        CombatFrameworkR.activeController.timeToNextAttack = 2
                    else
                        CombatFrameworkR.activeController.timeToNextAttack = 0
                    end
                    CombatFrameworkR.activeController.attacking = false
                    CombatFrameworkR.activeController.increment = 1
                    CombatFrameworkR.activeController.blocking = false
                    CombatFrameworkR.activeController.timeToNextBlock = 0
                    game.Players.LocalPlayer.Character.Stun.Value = 0
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    kkii:Stop()
                end
            end
        end)
    end)
end)

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if Usefastattack then
                if fastattack then
                    Click()
                end
            end
        end)
    end)
end)

   spawn(function()
       game:GetService('RunService').Stepped:Connect(function()
           if Usefastattack or fastattack then
               for i, v in pairs(game.Workspace["_WorldOrigin"]:GetChildren()) do
                   if v.Name == "CurvedRing" or v.Name == "SwordSlash" or v.Name == "Sounds" then--or v.Name == "SlashHit"
                       v:Destroy() 
                   end
               end
           end
       end)
   end)

--whitescreen
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local WindowFocusReleasedFunction = function()
	RunService:Set3dRenderingEnabled(false)
	setfpscap(1000)
	return
end

local WindowFocusedFunction = function()
	RunService:Set3dRenderingEnabled(true)
	setfpscap(360)
	return
end

local Initialize = function()
	UserInputService.WindowFocusReleased:Connect(WindowFocusReleasedFunction)
	UserInputService.WindowFocused:Connect(WindowFocusedFunction)
	return
end
Initialize()

local Tab1 = Window:CreateTab("Main")
local Tab2 = Window:CreateTab("Players")
local Tab3 = Window:CreateTab("Dungeon")
local Tab5 = Window:CreateTab("Teleport")
local Tab4 = Window:CreateTab("Miscellaneous")
local Tab10 = Window:CreateTab("Config")

local AutoFarmTab = Tab1:CreateSection("Auto Farm Level")
local Page3 = Tab1:CreateSection("Auto Stats")
local AutoFarmSetting = Tab1:CreateSection("Auto Farm Setting")
local AutoFarmBS = Tab1:CreateSection("Auto Boss")
local AutoFarmM = Tab1:CreateSection("Auto Farm Mastery")
local AutoFarmMS = Tab1:CreateSection("Auto Farm Mastery Setting")
local AutoFarmO = Tab1:CreateSection("Automatics")
local AutoFarmStyles = Tab1:CreateSection("Auto Fighting Styles")

-- Misc 

local Tab3 = Tab2:CreateSection("Player")
local PlayerEspTabs = Tab2:CreateSection("Esp")
local ShopTab = Tab5:CreateSection("Shop")
local page11 = Tab5:CreateSection("Teleport")
local MiscTabs = Tab4:CreateSection("Features")

-- Menu
local Configss = Tab10:CreateSection("List")

-- Auto Farm Tab

local MainAutoFarmFunction = AutoFarm(Ms,NameQuest,LevelQuest,NameMon,CFrameMon,CFrameQuest,"AutoFarmLevel")
spawn(function()
    while true do CheckQuest()
        if Auto_Farm then
            MainAutoFarmFunction:Update(Ms,NameQuest,LevelQuest,NameMon,CFrameMon,CFrameQuest)
        end
        fastWait(.05)
    end
end)

_G.AutoFarm = false
AutoFarmTab:CreateToggle("Auto Farm Level", _G.AutoFarm,function(a)
    Auto_Farm = a
    MainAutoFarmFunction:UpdateFarmMode("AutoFarmLevel")
    if Auto_Farm then
        MainAutoFarmFunction:Start()
    else
        MainAutoFarmFunction:Stop()
    end
end)

AutoFarmTab:CreateButton("Redeem All Code",function()
    function UseCode(Text)
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
    end
    UseCode("EXP_5B")
    UseCode("kittgaming")
    UseCode("Sub2Fer999")
    UseCode("Enyu_is_Pro")
    UseCode("Magicbus")
    UseCode("JCWK")
    UseCode("Starcodeheo")
    UseCode("Bluxxy")
    UseCode("fudd10_v2")
    UseCode("FUDD10")
    UseCode("BIGNEWS")
    UseCode("THEGREATACE")
    UseCode("SUB2GAMERROBOT_EXP1")
    UseCode("Sub2OfficialNoobie")
    UseCode("StrawHatMaine")
    UseCode("SUB2NOOBMASTER123")
    UseCode("Sub2Daigrock")
    UseCode("Axiore")
    UseCode("TantaiGaming")
end)

	AutoFarmM:CreateToggle("Auto Farm Devil Fruit Mastery",autofarmmasterybf,function(v)
		if SelectToolWeapon == "" and v then
			VLib:Notification("Select Weapon First")
		else
			MasteryDevilFruit = v
			MainAutoFarmFunction:UpdateFarmMode("AutoFarmDevilfruit")
			if MasteryDevilFruit then
				MainAutoFarmFunction:Start()
			else
				MainAutoFarmFunction:Stop()
			end
		end	
	end)
	AutoFarmM:CreateToggle("Auto Farm Gun Mastery",autofarmmasterybf,function(v)
		if SelectToolWeapon == "" and v then
			VLib:Notification("Select Weapon First")
		else
			MasteryGun = v
			MainAutoFarmFunction:UpdateFarmMode("AutoFarmGun")
			if MasteryGun then
				MainAutoFarmFunction:Start()
			else
				MainAutoFarmFunction:Stop()
			end
		end	
	end)
	AutoFarmM:CreateToggle("Auto Farm Weapon Mastery",autofarmmasterybf,function(v)
		if SelectToolWeapon == "" and v then
			VLib:Notification("Select Weapon First")
		else
			MasteryWeapon = v
			MainAutoFarmFunction:UpdateFarmMode("AutoFarmWeapon")
			if MasteryWeapon then
				MainAutoFarmFunction:Start()
			else
				MainAutoFarmFunction:Stop()
			end
		end	
	end)
	Persen = 15
	AutoFarmM:CreateSlider("Health %", 1,100,Persen,false, function(v)
		Persen = v
	end)

	AutoFarmMS:CreateToggle("Skill Z", true,function(a)
		SkillZ = a
	end)
	AutoFarmMS:CreateToggle("Skill X", true,function(a)
		SkillX = a
	end)
	AutoFarmMS:CreateToggle("Skill C", true,function(a)
		SkillC = a
	end)
	AutoFarmMS:CreateToggle("Skill V", true,function(a)
		SkillV = a
	end)

		Weapon = {}
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
		if v:IsA("Tool") then
			table.insert(Weapon ,v.Name)
		end
	end
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
		if v:IsA("Tool") then
			table.insert(Weapon, v.Name)
		end
	end
	SelectToolWeapon = ""
	local SelectedWeapon = AutoFarmSetting:CreateDropdown("Select Type Weapon",Weapon,"SelectedWeapon",false,function(a)
		SelectToolWeapon = a 
	end)
	AutoFarmSetting:CreateButton("Refrash Weapon", function()
		Weapon = {}
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
			if v:IsA("Tool") then
				table.insert(Weapon ,v.Name)
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
			if v:IsA("Tool") then
				table.insert(Weapon, v.Name)
			end
		end
		SelectedWeapon:Refresh(Weapon,0)
	end)

AutoFarmStyles:CreateToggle("Auto Superhuman",false,function(vu)
    Superhuman = vu
    if vu then
        local args = {
            [1] = "BuyElectro"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end)
AutoFarmStyles:CreateToggle("Auto Fully Superhuman",false,function(vu)
    SuperhumanFull = vu
end)
-- Auto Death Step
AutoFarmStyles:CreateToggle("Auto Death Step",false,function(vu)
    DeathStep = vu
    if vu then
        local args = {
            [1] = "BuyBlackLeg"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end)
-- Auto Dargon Talon
AutoFarmStyles:CreateToggle("Auto Dragon Talon", false,function(vu)
    DargonTalon = vu
    if vu then
        local args = {
            [1] = "BlackbeardReward",
            [2] = "DragonClaw",
            [3] = "2"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end)
-- Auto Electric clow
AutoFarmStyles:CreateToggle("Auto Electric Clow", false,function(vu)
    Electricclow = vu
    if vu then
        local args = {
            [1] = "BuyElectro"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end)
spawn(function()
    while wait(.25) do
        if Superhuman or SuperhumanFull and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then 
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
                local args = {
                    [1] = "BuyElectro"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end   
            if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                SelectToolWeapon = "Superhuman"
            end  
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299  then
                SelectToolWeapon = "Black Leg"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299  then
                SelectToolWeapon = "Electro"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299  then
                SelectToolWeapon = "Fishman Karate"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299  then
                SelectToolWeapon = "Dragon Claw"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300  then
                local args = {
                    [1] = "BuyFishmanKarate"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300  then
                local args = {
                    [1] = "BuyFishmanKarate"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 100  then
                local args = {
                    [1] = "BuyBlackLeg"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300  then
                local args = {
                    [1] = "BuyBlackLeg"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300  then
                if SuperhumanFull and game.Players.LocalPlayer.Data.Fragments.Value < 1500 then
                    RaidsSelected = "Flame"
                    AutoRaids = true
                    RaidsArua = true
                else
                    AutoRaids = false
                    RaidsArua = false
                    local args = {
                        [1] = "BlackbeardReward",
                        [2] = "DragonClaw",
                        [3] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300  then
                if SuperhumanFull and game.Players.LocalPlayer.Data.Fragments.Value < 1500 then
                    RaidsSelected = "Flame"
                    AutoRaids = true
                    RaidsArua = true
                else
                    AutoRaids = false
                    RaidsArua = false
                    local args = {
                        [1] = "BlackbeardReward",
                        [2] = "DragonClaw",
                        [3] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300  then
                local args = {
                    [1] = "BuySuperhuman"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300  then
                local args = {
                    [1] = "BuySuperhuman"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end 
        end
        if DeathStep and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 400 then
                local args = {
                    [1] = "BuyDeathStep"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                SelectToolWeapon = "Death Step"
            end  
            if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 400 then
                local args = {
                    [1] = "BuyDeathStep"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                
                SelectToolWeapon = "Death Step"
            end  
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value < 400 then
                SelectToolWeapon = "Black Leg"
            end 
        end
        if DargonTalon and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                SelectToolWeapon = "Dragon Claw"
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value <= 399 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                SelectToolWeapon = "Dragon Claw"
            end

            if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                SelectToolWeapon = "Dragon Claw"
                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 3 then
                    local string_1 = "Bones";
                    local string_2 = "Buy";
                    local number_1 = 1;
                    local number_2 = 1;
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1, string_2, number_1, number_2);

                    local string_1 = "BuyDragonTalon";
                    local bool_1 = true;
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1, bool_1);
                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 1 then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
                else
                    local string_1 = "BuyDragonTalon";
                    local bool_1 = true;
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1, bool_1);
                    local string_1 = "BuyDragonTalon";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1);
                end 
            end
        end
        if Electricclow and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value < 400 then
                SelectToolWeapon = "Electro"
            end  
            if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value < 400 then
                SelectToolWeapon = "Electro"
            end  
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
                local v175 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true);
                if v175 == 4 then
                    local v176 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
                    if v176 == nil then
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12548, 337, -7481)
                    end
                else
                    local string_1 = "BuyElectricClaw";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1);
                end
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                local v175 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true);
                if v175 == 4 then
                    local v176 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
                    if v176 == nil then
                        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12548, 337, -7481)
                    end
                else
                    local string_1 = "BuyElectricClaw";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1);
                end
            end
        end
    end
end)

	AutoQuestBoss = true
	function CheckQuestBoss()
		-- Old World
		if SelectBoss == "Saber Expert [Lv. 200] [Boss]" then
			MsBoss = "Saber Expert [Lv. 200] [Boss]"
			CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
		elseif SelectBoss == "The Saw [Lv. 100] [Boss]" then
			MsBoss = "The Saw [Lv. 100] [Boss]"
			CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854, -0.290192783, 6.88365773e-08, 0.956968188, 6.98413629e-08, 1, -5.07531119e-08, -0.956968188, 5.21077759e-08, -0.290192783)
		elseif SelectBoss == "Greybeard [Lv. 750] [Raid Boss]" then
			MsBoss = "Greybeard [Lv. 750] [Raid Boss]"
			CFrameBoss = CFrame.new(-4955.72949, 80.8163834, 4305.82666, -0.433646321, -1.03394289e-08, 0.901083171, -3.0443168e-08, 1, -3.17633075e-09, -0.901083171, -2.88092288e-08, -0.433646321)
		elseif SelectBoss == "The Gorilla King [Lv. 25] [Boss]" then
			MsBoss = "The Gorilla King [Lv. 25] [Boss]"
			NameQuestBoss = "JungleQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
			CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
		elseif SelectBoss == "Bobby [Lv. 55] [Boss]" then
			MsBoss = "Bobby [Lv. 55] [Boss]"
			NameQuestBoss = "BuggyQuest1"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
			CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
		elseif SelectBoss == "Yeti [Lv. 110] [Boss]" then
			MsBoss = "Yeti [Lv. 110] [Boss]"
			NameQuestBoss = "SnowQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
			CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
		elseif SelectBoss == "Mob Leader [Lv. 120] [Boss]" then
			MsBoss = "Mob Leader [Lv. 120] [Boss]"
			CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.92824)
		elseif SelectBoss == "Vice Admiral [Lv. 130] [Boss]" then
			MsBoss = "Vice Admiral [Lv. 130] [Boss]"
			NameQuestBoss = "MarineQuest2"
			LevelQuestBoss = 2
			CFrameQuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
			CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
		elseif SelectBoss == "Warden [Lv. 175] [Boss]" then
			MsBoss = "Warden [Lv. 175] [Boss]"
			NameQuestBoss = "ImpelQuest"
			LevelQuestBoss = 1
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif SelectBoss == "Chief Warden [Lv. 200] [Boss]" then
			MsBoss = "Chief Warden [Lv. 200] [Boss]"
			NameQuestBoss = "ImpelQuest"
			LevelQuestBoss = 2
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif SelectBoss == "Swan [Lv. 225] [Boss]" then
			MsBoss = "Swan [Lv. 225] [Boss]"
			NameQuestBoss = "ImpelQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif SelectBoss == "Magma Admiral [Lv. 350] [Boss]" then
			MsBoss = "Magma Admiral [Lv. 350] [Boss]"
			NameQuestBoss = "MagmaQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
			CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
		elseif SelectBoss == "Fishman Lord [Lv. 425] [Boss]" then
			MsBoss = "Fishman Lord [Lv. 425] [Boss]"
			NameQuestBoss = "FishmanQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
			CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
		elseif SelectBoss == "Wysper [Lv. 500] [Boss]" then
			MsBoss = "Wysper [Lv. 500] [Boss]"
			NameQuestBoss = "SkyExp1Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
			CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
		elseif SelectBoss == "Thunder God [Lv. 575] [Boss]" then
			MsBoss = "Thunder God [Lv. 575] [Boss]"
			NameQuestBoss = "SkyExp2Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706, -0.0361216255, -1.16895912e-07, 0.999347389, 1.44533963e-09, 1, 1.17024491e-07, -0.999347389, 5.6715117e-09, -0.0361216255)
			CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
		elseif SelectBoss == "Cyborg [Lv. 675] [Boss]" then
			MsBoss = "Cyborg [Lv. 675] [Boss]"
			NameQuestBoss = "FountainQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
			CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
		-- New World
		elseif SelectBoss == "Diamond [Lv. 750] [Boss]" then
			MsBoss = "Diamond [Lv. 750] [Boss]"
			NameQuestBoss = "Area1Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
			CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
		elseif SelectBoss == "Jeremy [Lv. 850] [Boss]" then
			MsBoss = "Jeremy [Lv. 850] [Boss]"
			NameQuestBoss = "Area2Quest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
			CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
		elseif SelectBoss == "Fajita [Lv. 925] [Boss]" then
			MsBoss = "Fajita [Lv. 925] [Boss]"
			NameQuestBoss = "MarineQuest3"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
			CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
		elseif SelectBoss == "Don Swan [Lv. 1000] [Boss]" then
			MsBoss = "Don Swan [Lv. 1000] [Boss]"
			CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
		elseif SelectBoss == "Smoke Admiral [Lv. 1150] [Boss]" then
			MsBoss = "Smoke Admiral [Lv. 1150] [Boss]"
			NameQuestBoss = "IceSideQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
			CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
		elseif SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" then
			MsBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
			CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
			elseif SelectBoss == "Darkbeard [Lv. 1000] [Raid Boss]" then
			MsBoss = "Darkbeard [Lv. 1000] [Raid Boss]"
			CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777, -0.976951957, 4.97356325e-08, 0.213458836, 4.57335361e-08, 1, -2.36868622e-08, -0.213458836, -1.33787044e-08, -0.976951957)
			elseif SelectBoss == "Order [Lv. 1250] [Raid Boss]" then
			MsBoss = "Order [Lv. 1250] [Raid Boss]"
			CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584, -0.380726993, 7.41463495e-08, 0.924687505, 5.85604774e-08, 1, -5.60738549e-08, -0.924687505, 3.28013137e-08, -0.380726993)
		elseif SelectBoss == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
			MsBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
			NameQuestBoss = "FrostQuest"
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
			CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
		elseif SelectBoss == "Tide Keeper [Lv. 1475] [Boss]" then
			MsBoss = "Tide Keeper [Lv. 1475] [Boss]"
			NameQuestBoss = "ForgottenQuest"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
			CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
		-- Thire World
		elseif SelectBoss == "Stone [Lv. 1550] [Boss]" then
			MsBoss = "Stone [Lv. 1550] [Boss]"
			NameQuestBoss = "PiratePortQuest"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-290, 44, 5577)
			CFrameBoss = CFrame.new(-1085, 40, 6779)
		elseif SelectBoss == "Island Empress [Lv. 1675] [Boss]" then
			MsBoss = "Island Empress [Lv. 1675] [Boss]"
			NameQuestBoss = "AmazonQuest2"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(5443, 602, 752)
			CFrameBoss = CFrame.new(5659, 602, 244)
		elseif SelectBoss == "Kilo Admiral [Lv. 1750] [Boss]" then
			MsBoss = "Kilo Admiral [Lv. 1750] [Boss]"
			NameQuestBoss = "MarineTreeIsland"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(2178, 29, -6737)
			CFrameBoss =CFrame.new(2846, 433, -7100)
		elseif SelectBoss == "Captain Elephant [Lv. 1875] [Boss]" then
			MsBoss = "Captain Elephant [Lv. 1875] [Boss]"
			NameQuestBoss = "DeepForestIsland"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-13232, 333, -7631)
			CFrameBoss = CFrame.new(-13221, 325, -8405)
		elseif SelectBoss == "Beautiful Pirate [Lv. 1950] [Boss]" then
			MsBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
			NameQuestBoss = "DeepForestIsland2"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-12686, 391, -9902)
			CFrameBoss = CFrame.new(5182, 23, -20)
		elseif SelectBoss == "Cake Queen [Lv. 2175] [Boss]" then
			MsBoss = "Cake Queen [Lv. 2175] [Boss]"
			NameQuestBoss = "IceCreamIslandQuest"             
			LevelQuestBoss = 3
			CFrameQuestBoss = CFrame.new(-716, 382, -11010)
			CFrameBoss = CFrame.new(-821, 66, -10965)
		elseif SelectBoss == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
			MsBoss = "rip_indra True Form [Lv. 5000] [Raid Boss]"
			CFrameBoss = CFrame.new(-5359, 424, -2735)
		elseif SelectBoss == "Longma [Lv. 2000] [Boss]" then
			MsBoss = "Longma [Lv. 2000] [Boss]"
			CFrameBoss = CFrame.new(-10248.3936, 353.79129, -9306.34473)
		elseif SelectBoss == "Soul Reaper [Lv. 2100] [Raid Boss]" then
			MsBoss = "Soul Reaper [Lv. 2100] [Raid Boss]"
			CFrameBoss = CFrame.new(-9515.62109, 315.925537, 6691.12012)
		end
	end
	local Boss = {}
	for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
		if string.find(v.Name, "Boss") then
			if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
			else
				table.insert(Boss, v.Name)
			end
		end
	end
	for i, v in pairs(game.workspace.Enemies:GetChildren()) do
		if string.find(v.Name, "Boss") then
			if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
			else
				table.insert(Boss, v.Name)
			end
		end
	end
	SelectBoss = ""
	local BossName = AutoFarmBS:CreateDropdown("Select Boss",Boss,"SelectBoss",false,function(Value)
		SelectBoss = Value
		Don = false
	end)
	AutoFarmBS:CreateButton("Refresh Boss",function()
		local Boss = {}
		for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
			if string.find(v.Name, "Boss") then
				if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
				else
					table.insert(Boss, v.Name)
				end
			end
		end
		for i, v in pairs(game.workspace.Enemies:GetChildren()) do
			if string.find(v.Name, "Boss") then
				if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
				else
					table.insert(Boss, v.Name)
				end
			end
		end
		BossName:Refresh(Boss,0)
	end)
	
	function AutoFramBoss()
		CheckQuestBoss()
		if MsBoss == "rip_indra True Form [Lv. 5000] [Raid Boss]" or MsBoss == "Order [Lv. 1250] [Raid Boss]" or MsBoss == "Soul Reaper [Lv. 2100] [Raid Boss]" or MsBoss == "Longma [Lv. 2000] [Boss]" or MsBoss == "The Saw [Lv. 100] [Boss]" or MsBoss == "Greybeard [Lv. 750] [Raid Boss]" or MsBoss == "Don Swan [Lv. 1000] [Boss]" or MsBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" or MsBoss == "Saber Expert [Lv. 200] [Boss]" or MsBoss == "Mob Leader [Lv. 120] [Boss]" or MsBoss == "Darkbeard [Lv. 1000] [Raid Boss]" then
			if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if FramBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
						repeat wait() 
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
								Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame)
							elseif v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
								if Farmtween then
									Farmtween:Stop()
								end
								EquipWeapon(SelectToolWeapon)
								Usefastattack = true
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 30)
								Click()
							end
						until not FramBoss or not v.Parent or v.Humanoid.Health <= 0
						Usefastattack = false
					end
				end
			else
				Usefastattack = false
				Questtween = toTarget(CFrameBoss.Position,CFrameBoss)
				if (CFrameBoss.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
					if Questtween then
						Questtween:Stop()
					end
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameBoss
					wait(1)
				end 
			end
		else
			if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				Usefastattack = false
				CheckQuestBoss()
				Questtween = toTarget(CFrameQuestBoss.Position,CFrameQuestBoss)
				if (CFrameQuestBoss.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
					if Questtween then
						Questtween:Stop()
					end
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuestBoss
					wait(1.1)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, LevelQuestBoss)
				end 
			elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then print("Find")
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if FramBoss and v.Name == MsBoss and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
							repeat wait()
								if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
									Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame)
								elseif v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
									EquipWeapon(SelectToolWeapon)
									if Farmtween then
										Farmtween:Stop()
									end
									if Modstween then
										Modstween:Stop()
									end
									Usefastattack = true
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
									Click()
								end
							until not FramBoss or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
							Usefastattack = false
						end
					end
				else
					Usefastattack = false
					Questtween = toTarget(CFrameBoss.Position,CFrameBoss)
					if ThreeWorld and game:GetService("Players").LocalPlayer.Data.Level.Value >= 1925 and MsBoss == "Beautiful Pirate [Lv. 1950] [Boss]" and (CFrameBoss.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude < 500 then
						if Questtween then
							Questtween:Stop()
						end
						local TouchInterest = game:GetService("Workspace").Map.Turtle.Entrance.Door.BossDoor.Hitbox
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TouchInterest.CFrame
						UseTween = false
						wait(.1)
					elseif (CFrameBoss.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
						if Questtween then
							Questtween:Stop()
						end
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameBoss
					end 
				end
			end
		end
	end
	AutoFarmBS:CreateToggle("Auto Farm Boss",false,function(Value)
		local args = {
			[1] = "AbandonQuest"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		FramBoss = Value
	end)
	spawn(function()
		while wait() do
			if FramBoss then
				AutoFramBoss()
			end
		end
	end)

fastattect = true
AutoFarmSetting:CreateToggle("Fast Attack", true,function(a)
    fastattack = a
end)

AutoFarmSetting:CreateToggle("Fast Attack Premium",true,function(Fast)
    _G.PremiumFastAttack = Fast
end)

local Module = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local CombatFramework = debug.getupvalues(Module)[2]
local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)

spawn(function()
    while true do
        if _G.PremiumFastAttack then
            pcall(function()
                CameraShakerR:Stop()
                CombatFramework.activeController.attacking = false
                CombatFramework.activeController.timeToNextAttack = 0
                CombatFramework.activeController.increment = 3
                CombatFramework.activeController.hitboxMagnitude = 100
                CombatFramework.activeController.blocking = false
                CombatFramework.activeController.timeToNextBlock = 0
                CombatFramework.activeController.focusStart = 0
                CombatFramework.activeController.humanoid.AutoRotate = true
            end)
        end
        task.wait()
    end
end)

AutoFarmSetting:CreateToggle("Bring Mob", true,function(Value)
    Magnet = Value  
end)

AutoFarmSetting:CreateToggle("CameraShaker", true, function(State)
    _G.AutoFarmLevel = State
end)

	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)
	AutoFarmSetting:CreateToggle("Anit AFK", true,function(vu)
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
	end)

    AutoFarmSetting:CreateButton("Kaitun Script", function(vu)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xDeilityHub/Comkak/main/Kaitan"))();
    end)

spawn(function()
while wait() do
    Point:Change("Point : "..game.Players.localPlayer.Data.Points.Value)
    Melee:Change("Melee : "..game.Players.localPlayer.Data.Stats.Melee.Level.Value)
    Defense:Change("Defense : "..game.Players.localPlayer.Data.Stats.Defense.Level.Value)
    Sword:Change("Sword : "..game.Players.localPlayer.Data.Stats.Sword.Level.Value)
    Gun:Change("Gun : "..game.Players.localPlayer.Data.Stats.Gun.Level.Value)
    Fruit:Change("Fruit : "..game.Players.localPlayer.Data.Stats["Demon Fruit"].Level.Value)
    if _G.LockLevel == true then
        if game:GetService("Players").LocalPlayer.Data.Level.Value >= _G.Levelclose then
            game:Shutdown()
        end
    elseif _G.LockBeli == true then
        if game:GetService("Players").LocalPlayer.Data.Beli.Value >= _G.LevelcloseBeli then
            game:Shutdown()
        end
    elseif _G.LockFragments == true then
        if game:GetService("Players").LocalPlayer.Data.Fragments.Value >= _G.LevelcloseFragments then
            game:Shutdown()
        end
    end
end
end)

Page3:CreateToggle("Kaitan Only",false,function(value)
_G.Kaitanstat = value
end)
Page3:CreateToggle("Melee",false,function(Value)
_G.Melee = Value    
end)
Page3:CreateToggle("Defense",false,function(value)
_G.Defense = value
end)
Page3:CreateToggle("Sword",false,function(value)
_G.Sword = value
end)
Page3:CreateToggle("Gun",false,function(value)
_G.Gun = value
end)
Page3:CreateToggle("Devil Fruit",false,function(value)
_G.Fruit = value
end)
Page3:CreateToggle("Max Point",false,function(value)
_G.MaxPoint = value
end)
PointStats = 1

Page3:CreateSlider("Point", 1,100,nil,true ,function(value)
PointStats = value
end)

spawn(function()
while wait(.1) do
    pcall(function()
        if _G.Kaitanstat then
            PointStats = game:GetService("Players").LocalPlayer.Data.Points.Value
            if world1 then
                _G.Melee = true
            else
                _G.Defense = true
            end
        end
        if _G.MaxPoint then
            PointStats = game:GetService("Players").LocalPlayer.Data.Points.Value
        end
        if _G.Melee then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee", PointStats)
        end
        if _G.Defense then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense", PointStats)
        end
        if _G.Gun then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Gun", PointStats)
        end
        if _G.Sword then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword", PointStats)
        end
        if _G.Fruit then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Demon Fruit", PointStats)
        end
    end)
end
end)

-- Py

PlayerList = {}
for i,v in pairs(game.Players:GetPlayers()) do  
    table.insert(PlayerList ,v.Name)
end
local Plr = Tab3:CreateDropdown("Select Players",PlayerList,"SelectPlayer",false, function(bool)
    _G.Selected_Player = value
end)

Tab3:CreateButton("Refresh Players", function()
Plr:Clear()
    wait(.1)
    for i,v in pairs(game.Players:GetPlayers()) do
        Plr:Add(v.Name)
    end
end)

WeaponListPlayer = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(WeaponListPlayer, v.Name)
    end
end

local PlrWS = Tab3:CreateDropdown("Select Weapon Players",WeaponListPlayer,"SelectWeaponP",false, function(bool)
_G.SelectWeaponP = value
end)

Tab3:CreateButton("Refresh Weapon", function()
PlrWS:Clear()
    wait(.1)
    for i,v in pairs(game.Players:GetPlayers()) do
        PlrWS:Add(v.Name)
    end
end)

 Tab3:CreateToggle("Spectate Player",nil,function(value)
_G.Spectate = value
    local plr1 = game.Players.LocalPlayer.Character.Humanoid
    local plr2 = game.Players:FindFirstChild(_G.Selected_Player)
    repeat wait()
    game:GetService("Workspace").Camera.CameraSubject = plr2.Character.Humanoid
    until _G.Spectate == false 
    game:GetService("Workspace").Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end)

Tab3:CreateToggle("Teleport",nil,function(value)
_G.TeleportPlayer = value
    pcall(function()
        if _G.TeleportPlayer then
            repeat TP2FF(game.Players:FindFirstChild(_G.Selected_Player).Character.HumanoidRootPart.CFrame) wait() until _G.TeleportPlayer == false
        end
    end)
	_G.Lock = value
		while wait() do
		local g1=game local p1=g1:GetService('Players') local l1=p1.LocalPlayer local c1=l1.Character local h1=c1:FindFirstChild('Humanoid') local h2=c1:FindFirstChild('HumanoidRootPart') local v0=true local v1='BodyVelocity'
	    local x=function() while task.wait() do if _G.Lock then if h2 then if h2:FindFirstChild(v1) then return elseif not h2:FindFirstChild(v1) then local vc=Instance.new(v1, h2) vc.MaxForce=Vector3.new(1, 1, 1)*math.huge vc.Velocity=Vector3.new(0, 0, 0) end end else if h2 then if h2:FindFirstChild(v1) then local aa=h2:FindFirstChild(v1) aa:Destroy() end end end end end spawn(function() pcall(x) end)
	end
end)

 Tab3:CreateToggle("Kill Players ( Melee )",nil,function(value)
_G.AutoKillPlayersMelee = value
	_G.Lock = value
		while wait() do
		local g1=game local p1=g1:GetService('Players') local l1=p1.LocalPlayer local c1=l1.Character local h1=c1:FindFirstChild('Humanoid') local h2=c1:FindFirstChild('HumanoidRootPart') local v0=true local v1='BodyVelocity'
	    local x=function() while task.wait() do if _G.Lock then if h2 then if h2:FindFirstChild(v1) then return elseif not h2:FindFirstChild(v1) then local vc=Instance.new(v1, h2) vc.MaxForce=Vector3.new(1, 1, 1)*math.huge vc.Velocity=Vector3.new(0, 0, 0) end end else if h2 then if h2:FindFirstChild(v1) then local aa=h2:FindFirstChild(v1) aa:Destroy() end end end end end spawn(function() pcall(x) end)
	end
end)
spawn(function()
    while wait() do
        if _G.AutoKillPlayersMelee then
            pcall(function()
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name == _G.Selected_Player then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeaponP)
                            v.Character.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            TP2FF(v.Character.HumanoidRootPart.CFrame * CFrame.new(0,-6.2,0))
                            _G.FastAttack = true
							_G.FastAttack1 = true
                        until v.Character.Humanoid.Helth <= 0 or _G.AutoKillPlayersMelee == false
                    end
                end
            end)
        end
    end
end)

 Tab3:CreateToggle("Kill Players ( Gun )",nil,function(value)
_G.AutoKillPlayersGun = value
	_G.Lock = value
		while wait() do
		local g1=game local p1=g1:GetService('Players') local l1=p1.LocalPlayer local c1=l1.Character local h1=c1:FindFirstChild('Humanoid') local h2=c1:FindFirstChild('HumanoidRootPart') local v0=true local v1='BodyVelocity'
	    local x=function() while task.wait() do if _G.Lock then if h2 then if h2:FindFirstChild(v1) then return elseif not h2:FindFirstChild(v1) then local vc=Instance.new(v1, h2) vc.MaxForce=Vector3.new(1, 1, 1)*math.huge vc.Velocity=Vector3.new(0, 0, 0) end end else if h2 then if h2:FindFirstChild(v1) then local aa=h2:FindFirstChild(v1) aa:Destroy() end end end end end spawn(function() pcall(x) end)
	end
end)

spawn(function()
    while wait() do
        if _G.AutoKillPlayersGun then
            pcall(function()
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name == _G.Selected_Player then
                        repeat task.wait()
                            EquipWeapon(SelectWeaponGun)
                            v.Character.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            TP2FF(v.Character.HumanoidRootPart.CFrame * CFrame.new(0,50,-15))
                        until v.Character.Humanoid.Helth <= 0 or _G.AutoKillPlayersGun == false
                    end
                end
            end)
        end
    end
end)
local Plr = game:GetService('Players').LocalPlayer
local Mouse = Plr:GetMouse()
Mouse.Button1Down:Connect(function()
    if _G.AutoKillGun and game.Players.LocalPlayer.Character:FindFirstChild(SelectWeaponGun) then
        local args = {
        [1] = game.Players:FindFirstChild(_G.Selected_Player).Character.HumanoidRootPart.Position,
        [2] = game.Players:FindFirstChild(_G.Selected_Player).Character.HumanoidRootPart
        }
        game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
    end
end)

 Tab3:CreateToggle("Auto Enabled PVP",nil,function(value)
_G.PVP = value
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.PVP then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end
            end
        end
    end)
end)

 Tab3:CreateToggle("Safe Mode",nil,function(value)
_G.SafeMode = value
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.SafeMode then
                if game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.Health * _G.SafeAt/100 then
                    repeat TP2FF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1000000,0)) wait() until _G.SafeMode == false
                end
            end
        end
    end)
end)

local sldr = Tab3:CreateSlider("Safe Mode %", 0, 100, 20, false , function(t)
_G.SafeAt = value
end)
 Tab3:CreateToggle("Aimbot Gun",nil,function(value)
_G.Aimbot = value
end)

local lp = game:GetService('Players').LocalPlayer
local mouse = lp:GetMouse()
mouse.Button1Down:Connect(function()
    if _G.Aimbot and game.Players.LocalPlayer.Character:FindFirstChild(SelectWeaponGun) then
        local args = {
        [1] = game.Players:FindFirstChild(_G.Selected_Player).Character.HumanoidRootPart.Position,
        [2] = game.Players:FindFirstChild(_G.Selected_Player).Character.HumanoidRootPart
        }
        game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.Aimbot then
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672),workspace.CurrentCamera.CFrame)
            end
        end
    end)
end)
 Tab3:CreateToggle("Aimbot Skill",nil,function(value)
_G.AimBotSkill = value
end)

spawn(function()
    pcall(function()
    local gg = getrawmetatable(game)
    local old = gg.namecall
    setreadonly(gg,false)
    gg.namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                        args[2] = PlayersPosition
                        return old(unpack(args))
                    end
                end
            end
            return old(...)
        end)
    end)
end)

spawn(function()
    while wait() do
        if _G.AimBotSkill and game.Players:FindFirstChild(SelectedKillPlayer) and game.Players:FindFirstChild(SelectedKillPlayer).Character:FindFirstChild("HumanoidRootPart") then
            PlayersPosition = game.Players:FindFirstChild(SelectedKillPlayer).Character:FindFirstChild("HumanoidRootPart").Position
        end
    end
end)
	-- ESP
	function isnil(thing)
		return (thing == nil)
	end
	local function round(n)
		return math.floor(tonumber(n) + 0.5)
	end
	Number = math.random(1, 1000000)
	function UpdatePlayerChams()
		for i,v in pairs(game:GetService'Players':GetChildren()) do
			pcall(function()
				if not isnil(v.Character) then
					if ESPPlayer then
						if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v.Character.Head)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v.Character.Head
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = "GothamBold"
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							if v.Team == game.Players.LocalPlayer.Team then
								name.TextColor3 = Color3.new(0,255,0)
							else
								name.TextColor3 = Color3.new(255,0,0)
							end
						else
							v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
						end
					else
						if v.Character.Head:FindFirstChild('NameEsp'..Number) then
							v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
						end
					end
				end
			end)
		end
	end
	function UpdateChestChams() 
		for i,v in pairs(game.Workspace:GetChildren()) do
			pcall(function()
				if string.find(v.Name,"Chest") then
					if ChestESP then
						if string.find(v.Name,"Chest") then
							if not v:FindFirstChild('NameEsp'..Number) then
								local bill = Instance.new('BillboardGui',v)
								bill.Name = 'NameEsp'..Number
								bill.ExtentsOffset = Vector3.new(0, 1, 0)
								bill.Size = UDim2.new(1,200,1,30)
								bill.Adornee = v
								bill.AlwaysOnTop = true
								local name = Instance.new('TextLabel',bill)
								name.Font = "GothamBold"
								name.FontSize = "Size14"
								name.TextWrapped = true
								name.Size = UDim2.new(1,0,1,0)
								name.TextYAlignment = 'Top'
								name.BackgroundTransparency = 1
								name.TextStrokeTransparency = 0.5
								if v.Name == "Chest1" then
									name.TextColor3 = Color3.fromRGB(109, 109, 109)
									name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
								end
								if v.Name == "Chest2" then
									name.TextColor3 = Color3.fromRGB(173, 158, 21)
									name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
								end
								if v.Name == "Chest3" then
									name.TextColor3 = Color3.fromRGB(85, 255, 255)
									name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
								end
							else
								v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
							end
						end
					else
						if v:FindFirstChild('NameEsp'..Number) then
							v:FindFirstChild('NameEsp'..Number):Destroy()
						end
					end
				end
			end)
		end
	end
	function UpdateDevilChams() 
		for i,v in pairs(game.Workspace:GetChildren()) do
			pcall(function()
				if DevilFruitESP then
					if string.find(v.Name, "Fruit") then   
						if not v.Handle:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v.Handle)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v.Handle
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = "GothamBold"
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							name.TextColor3 = Color3.fromRGB(255, 0, 0)
							name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
						else
							v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
						end
					end
				else
					if v.Handle:FindFirstChild('NameEsp'..Number) then
						v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end)
		end
	end
	function UpdateFlowerChams() 
		for i,v in pairs(game.Workspace:GetChildren()) do
			pcall(function()
				if v.Name == "Flower2" or v.Name == "Flower1" then
					if FlowerESP then 
						if not v:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = "GothamBold"
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							name.TextColor3 = Color3.fromRGB(255, 0, 0)
							if v.Name == "Flower1" then 
								name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
								name.TextColor3 = Color3.fromRGB(0, 0, 255)
							end
							if v.Name == "Flower2" then
								name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
								name.TextColor3 = Color3.fromRGB(255, 0, 0)
							end
						else
							v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
						end
					else
						if v:FindFirstChild('NameEsp'..Number) then
						v:FindFirstChild('NameEsp'..Number):Destroy()
						end
					end
				end   
			end)
		end
	end
	function UpdateRealFruitChams() 
		for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
			if v:IsA("Tool") then
				if RealFruitESP then 
					if not v.Handle:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Handle)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Handle
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = "GothamBold"
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 0, 0)
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
					else
						v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
					end
				else
					if v.Handle:FindFirstChild('NameEsp'..Number) then
						v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end 
			end
		end
		for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
			if v:IsA("Tool") then
				if RealFruitESP then 
					if not v.Handle:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Handle)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Handle
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = "GothamBold"
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 174, 0)
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
					else
						v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
					end
				else
					if v.Handle:FindFirstChild('NameEsp'..Number) then
						v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end 
			end
		end
		for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
			if v:IsA("Tool") then
				if RealFruitESP then 
					if not v.Handle:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Handle)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Handle
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = "GothamBold"
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(251, 255, 0)
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
					else
						v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
					end
				else
					if v.Handle:FindFirstChild('NameEsp'..Number) then
						v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end 
			end
		end
	end
	PlayerEspTabs:CreateToggle("ESP Player",espplyer,function(a)
		ESPPlayer = a
		UpdatePlayerChams()
	end)
	PlayerEspTabs:CreateToggle("ESP Chest",espchest,function(a)
		ChestESP = a
		UpdateChestChams() 
	end)
	PlayerEspTabs:CreateToggle("ESP Devil Fruit",espdevilfruit,function(a)
		DevilFruitESP = a
		UpdateDevilChams() 
	end)
	PlayerEspTabs:CreateToggle("ESP Flower",espflower,function(a)
		FlowerESP = a
		UpdateFlowerChams() 
	end)
	spawn(function()
		while wait() do
			if FlowerESP then
				UpdateFlowerChams() 
			end
			if DevilFruitESP then
				UpdateDevilChams() 
			end
			if ChestESP then
				UpdateChestChams() 
			end
			if ESPPlayer then
				UpdatePlayerChams()
			end
			if RealFruitESP then
				UpdateRealFruitChams()
			end
		end
	end)

function TP2FF(P1)
	Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if Distance < 1000 then
		Speed = 400
	elseif Distance >= 1000 then
		Speed = 250
	end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P1}
    ):Play()
    Clip = true
    wait(Distance/Speed)
    Clip = false
end

page11:CreateButton("Teleport Old World", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end)
page11:CreateButton("Teleport NewWorld", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end)
page11:CreateButton("Teleport Third World", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end)



if OldWorld then
	page11:CreateButton("Start Island",function()
		TP2FF(CFrame.new(1071.2832, 16.3085976, 1426.86792))
	end)
	page11:CreateButton("Marine Start",function()
		TP2FF(CFrame.new(-2573.3374, 6.88881969, 2046.99817))
	end)
	page11:CreateButton("Middle Town",function()
		TP2FF(CFrame.new(-655.824158, 7.88708115, 1436.67908))
	end)
	page11:CreateButton("Jungle",function()
		TP2FF(CFrame.new(-1249.77222, 11.8870859, 341.356476))
	end)
	page11:CreateButton("Pirate Village",function()
		TP2FF(CFrame.new(-1122.34998, 4.78708982, 3855.91992))
	end)
	page11:CreateButton("Desert",function()
		TP2FF(CFrame.new(1094.14587, 6.47350502, 4192.88721))
	end)
	page11:CreateButton("Frozen Village",function()
		TP2FF(CFrame.new(1198.00928, 27.0074959, -1211.73376))
	end)
	page11:CreateButton("MarineFord",function()
		TP2FF(CFrame.new(-4505.375, 20.687294, 4260.55908))
	end)
	page11:CreateButton("Colosseum",function()
		TP2FF(CFrame.new(-1428.35474, 7.38933945, -3014.37305))
	end)
	page11:CreateButton("Sky island 1 ",function()
		TP2FF(CFrame.new(-4970.21875, 717.707275, -2622.35449))
	end)
	page11:CreateButton("Sky island 2 ",function()
		TP2FF(CFrame.new(-4813.0249, 903.708557, -1912.69055))
	end)
	page11:CreateButton("Sky island 3 ",function()
		TP2FF(CFrame.new(-7952.31006, 5545.52832, -320.704956))
	end)
	page11:CreateButton("Sky island 4 ",function()
		TP2FF(CFrame.new(-7793.43896, 5607.22168, -2016.58362))
	end)
	page11:CreateButton("Prison",function()
		TP2FF(CFrame.new(4854.16455, 5.68742752, 740.194641))
	end)
	page11:CreateButton("Magma Village",function()
		TP2FF(CFrame.new(-5231.75879, 8.61593437, 8467.87695))
	end)
	page11:CreateButton("UndeyWater City",function()
		TP2FF(CFrame.new(61163.8516, 11.7796879, 1819.78418))
	end)
	page11:CreateButton("Fountain City",function()
		TP2FF(CFrame.new(5132.7124, 4.53632832, 4037.8562))
	end)
	page11:CreateButton("House Cyborg's",function()
		TP2FF(CFrame.new(6262.72559, 71.3003616, 3998.23047))
	end)
	page11:CreateButton("Shank's Room",function()
		TP2FF(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
	end)
	page11:CreateButton("Mob Island",function()
		TP2FF(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
	end)
end   
if NewWorld then
	page11:CreateButton("Dock",function()
		TP2FF(CFrame.new(82.9490662, 18.0710983, 2834.98779))
	end)
	page11:CreateButton("Kingdom of Rose",function()
		TP2FF(CFrame.new(-394.983521, 118.503128, 1245.8446))
	end)
	page11:CreateButton("Mansion",function()
		TP2FF(CFrame.new(-390.096313, 331.886475, 673.464966))
	end)
	page11:CreateButton("Flamingo Room",function()
		TP2FF(CFrame.new(2302.19019, 15.1778421, 663.811035))
	end)
	page11:CreateButton("Green Zone",function()
		TP2FF(CFrame.new(-2372.14697, 72.9919434, -3166.51416))
	end)
	page11:CreateButton("Cafe",function()
		TP2FF(CFrame.new(-385.250916, 73.0458984, 297.388397))
	end)
	page11:CreateButton("Factroy",function()
		TP2FF(CFrame.new(430.42569, 210.019623, -432.504791))
	end)
	page11:CreateButton("Colosseum",function()
		TP2FF(CFrame.new(-1836.58191, 44.5890656, 1360.30652))
	end)
	page11:CreateButton("Grave Island",function()
		TP2FF(CFrame.new(-5411.47607, 48.8234024, -721.272522))
	end)
	page11:CreateButton("Snow Mountain",function()
		TP2FF(CFrame.new(511.825226, 401.765198, -5380.396))
	end)
	page11:CreateButton("Cold Island",function()
		TP2FF(CFrame.new(-6026.96484, 14.7461271, -5071.96338))
	end)
	page11:CreateButton("Hot Island",function()
		TP2FF(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
	end)
	page11:CreateButton("Cursed Ship",function()
		TP2FF(CFrame.new(902.059143, 124.752518, 33071.8125))
	end)
	page11:CreateButton("Ice Castle",function()
		TP2FF(CFrame.new(5400.40381, 28.21698, -6236.99219))
	end)
	page11:CreateButton("Forgotten Island",function()
		TP2FF(CFrame.new(-3043.31543, 238.881271, -10191.5791))
	end)
	page11:CreateButton("Usoapp Island",function()
		TP2FF(CFrame.new(4748.78857, 8.35370827, 2849.57959))
	end)
	page11:CreateButton("Minisky Island",function()
		TP2FF(CFrame.new(-260.358917, 49325.7031, -35259.3008))
	end)
end
if ThreeWorld then
	page11:CreateButton("Port Towen",function()
		TP2FF(CFrame.new(-610.309692, 57.8323097, 6436.33594))
	end)
	page11:CreateButton("Hydra Island",function()
		TP2FF(CFrame.new(5229.99561, 603.916565, 345.154022))
	end)
	page11:CreateButton("Great Tree",function()
		TP2FF(CFrame.new(2174.94873, 28.7312393, -6728.83154))
	end)
	page11:CreateButton("Castle on the Sea",function()
		TP2FF(CFrame.new(-5477.62842, 313.794739, -2808.4585))
	end)
	page11:CreateButton("Floating Turtle",function()
		TP2FF(CFrame.new(-10919.2998, 331.788452, -8637.57227))
	end)
	page11:CreateButton("Mansion",function()
		TP2FF(CFrame.new(-12553.8125, 332.403961, -7621.91748))
	end)
	page11:CreateButton("Secret Temple",function()
		TP2FF(CFrame.new(5217.35693, 6.56511116, 1100.88159))
	end)
	page11:CreateButton("Friendly Arena",function()
		TP2FF(CFrame.new(5220.28955, 72.8193436, -1450.86304))
	end)
	page11:CreateButton("Beautiful Pirate Domain",function()
		TP2FF(CFrame.new(5310.8095703125, 21.594484329224, 129.39053344727))
	end)
	page11:CreateButton("Teler Park",function()
		TP2FF(CFrame.new(-9512.3623046875, 142.13258361816, 5548.845703125))
	end)
	page11:CreateButton("Ice Cream Island",function()
		TP2FF(CFrame.new(-900.67767333984, 58.971530914307, -10871.236328125))
	end)
	page11:CreateButton("Peanut Island",function()
		TP2FF(CFrame.new(-2045.2473144531, 4.701087474823, -9899.9716796875))
	end)
end

ShopTab:CreateLabel("Abilities",true)
ShopTab:CreateButton("Skyjump [ $10,000 Beli ]",function()
    local args = {
        [1] = "BuyHaki",
        [2] = "Geppo"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Buso Haki [ $25,000 Beli ]",function()
    local args = {
        [1] = "BuyHaki",
        [2] = "Buso"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Observation haki [ $750,000 Beli ]",function()
    local args = {
        [1] = "KenTalk",
        [2] = "Buy"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Soru [ $100,000 Beli ]",function()
    local args = {
        [1] = "BuyHaki",
        [2] = "Soru"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Buy Random Devil Fruit",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
end)
ShopTab:CreateToggle("Auto Random Devil Fruit",false,function(v)
    DevilAutoBuy = v
end)
spawn(function()
    while wait() do 
        if DevilAutoBuy then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
        end
    end
end)

ShopTab:CreateLabel("Fighting Style",true)
ShopTab:CreateButton("Black Leg",function()
    local args = {
        [1] = "BuyBlackLeg"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Electro",function()
    local args = {
        [1] = "BuyElectro"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Fishman Karate",function()
    local args = {
        [1] = "BuyFishmanKarate"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Dragon Claw",function()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "2"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Superhuman",function()
    local args = {
        [1] = "BuySuperhuman"
    }
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Death Step",function()
    local args = {
        [1] = "BuyDeathStep"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Sharkman Karate",function()
    local args = {
        [1] = "BuySharkmanKarate",
        [2] = true
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "BuySharkmanKarate"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Electric Claw",function()
    local string_1 = "BuyElectricClaw";
    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
    Target:InvokeServer(string_1);
end)
ShopTab:CreateButton("Dragon Talon",function()
    local string_1 = "BuyDragonTalon";
    local bool_1 = true;
    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
    Target:InvokeServer(string_1, bool_1);
    local string_1 = "BuyDragonTalon";
    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
    Target:InvokeServer(string_1);
end)

ShopTab:CreateLabel("Sword",true)
ShopTab:CreateButton("Katana [ $1,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Katana"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Cutlass [ $1,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Cutlass"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)  
ShopTab:CreateButton("Dual Katana [ $12,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Dual Katana"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Iron Mace [ $25,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Iron Mace"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Triple Katana [ $60,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Triple Katana"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Pipe [ $100,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Pipe"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Soul Cane [ $750,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Soul Cane"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Dual-Headed Blade [ $400,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Dual-Headed Blade"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Bisento [ $1,200,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Bisento"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Pole v.2 [ 5,000 Fragments )",function()
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
end)
ShopTab:CreateLabel("Gun",true)
ShopTab:CreateButton("Slingshot [ $5,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Slingshot"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Musket [ $8,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Musket"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Flintlock [ $10,500 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Flintlock"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Refined Slingshot [ $30,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Refined Slingshot"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Refined Flintlock [ $65,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Refined Flintlock"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Kabucha [ 1,500 Fragments)",function()
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
end)
ShopTab:CreateLabel("Accessories",true)
ShopTab:CreateButton("Black Cape [ $50,000 Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Black Cape"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Swordsman Hat [ 150k Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Swordsman Hat"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Tomoe Ring [ $500k Beli ]",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Tomoe Ring"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateLabel("Race & etc.",true)
ShopTab:CreateButton("Race Ghoul",function()
    local args = {
        [1] = "Ectoplasm",
        [2] = "BuyCheck",
        [3] = 4
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "Ectoplasm",
        [2] = "Change",
        [3] = 4
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Race Cyborg",function()
    local args = {
        [1] = "CyborgTrainer",
        [2] = "Buy"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Random Race (Use 3K Fragments)",function()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "Reroll",
        [3] = "2"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:CreateButton("Reset Stats (Use 2.5K Fragments)",function()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "Refund",
        [3] = "2"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

-- Misc

    MiscTabs:CreateButton("Server Rejoin",function()
		local ts = game:GetService("TeleportService")
		local p = game:GetService("Players").LocalPlayer
		ts:Teleport(game.PlaceId, p)
	end)
	local function HttpGet(url)
		return game:GetService("HttpService"):JSONDecode(htgetf(url))
	end
	MiscTabs:CreateButton("Server Hop",function()
		local PlaceID = game.PlaceId
		local AllIDs = {}
		local foundAnything = ""
		local actualHour = os.date("!*t").hour
		local Deleted = false
		function TPReturner()
			local Site;
			if foundAnything == "" then
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
			else
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
			end
			local ID = ""
			if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
				foundAnything = Site.nextPageCursor
			end
			local num = 0;
			for i,v in pairs(Site.data) do
				local Possible = true
				ID = tostring(v.id)
				if tonumber(v.maxPlayers) > tonumber(v.playing) then
					for _,Existing in pairs(AllIDs) do
						if num ~= 0 then
							if ID == tostring(Existing) then
								Possible = false
							end
						else
							if tonumber(actualHour) ~= tonumber(Existing) then
								local delFile = pcall(function()
									-- delfile("NotSameServers.json")
									AllIDs = {}
									table.insert(AllIDs, actualHour)
								end)
							end
						end
						num = num + 1
					end
					if Possible == true then
						table.insert(AllIDs, ID)
						wait()
						pcall(function()
							-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
							wait()
							game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
						end)
						wait(4)
					end
				end
			end
		end
		function Teleport() 
			while wait() do
				pcall(function()
					TPReturner()
					if foundAnything ~= "" then
						TPReturner()
					end
				end)
			end
		end
		Teleport()
	end)

	MiscTabs:CreateButton("Server Hop Lower",function()
		local PlaceID = game.PlaceId
		local AllIDs = {}
		local foundAnything = ""
		local actualHour = os.date("!*t").hour
		local Deleted = false
		function TPReturner()
			local Site;
			if foundAnything == "" then
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
			else
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
			end
			local ID = ""
			if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
				foundAnything = Site.nextPageCursor
			end
			local num = 0;
			for i,v in pairs(Site.data) do
				local Possible = true
				ID = tostring(v.id)
				if tonumber(v.maxPlayers) > tonumber(v.playing) then
					for _,Existing in pairs(AllIDs) do
						if num ~= 0 then
							if ID == tostring(Existing) then
								Possible = false
							end
						else
							if tonumber(actualHour) ~= tonumber(Existing) then
								local delFile = pcall(function()
									-- delfile("NotSameServers.json")
									AllIDs = {}
									table.insert(AllIDs, actualHour)
								end)
							end
						end
						num = num + 1
					end
					if Possible == true then
						table.insert(AllIDs, ID)
						wait()
						pcall(function()
							-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
							wait()
							game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
						end)
						wait(4)
					end
				end
			end
		end
		function Teleport() 
			while wait() do
				pcall(function()
					TPReturner()
					if foundAnything ~= "" then
						TPReturner()
					end
				end)
			end
		end
		Teleport()
	end)

MiscTabs:CreateLabel("Misc")

MiscTabs:CreateButton("Max Zoom",function()
        loadstring(game:HttpGet("https://pastebin.com/raw/XXPTpkcZ", true))()

        wait()
        local ui = game:GetService("CoreGui"):FindFirstChild("ScreenGui")
        if ui then
            ui:Destroy()
        end
end)

	local LocalPlayer = game:GetService'Players'.LocalPlayer
	local originalstam = LocalPlayer.Character.Energy.Value
	function infinitestam()
		game:GetService'Players'.LocalPlayer.Character.Energy.Changed:connect(function()
			if InfinitsEnergy then
				LocalPlayer.Character.Energy.Value = originalstam
			end 
		end)
	end
	nododgecool = false
	function NoDodgeCool()
		if nododgecool then
			for i,v in next, getgc() do
				if game.Players.LocalPlayer.Character.Dodge then
					if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Dodge then
						for i2,v2 in next, getupvalues(v) do
							if tostring(v2) == "0.4" then
								repeat wait(.1)
									setupvalue(v,i2,0)
								until not nododgecool
							end
						end
					end
				end
			end
		end
	end
	function NoGeppoCool()
		if noGeppocool then
			for i,v in next, getgc() do
				if game.Players.LocalPlayer.Character.Geppo then
					if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Geppo then
						for i2,v2 in next, getupvalues(v) do
							if tostring(v2) == "0" then
								repeat wait(.1)
									setupvalue(v,i2,0)
								until not noGeppocool
							end
						end
					end
				end
			end
		end
	end
	function NoSoruCool()
		for i, v in pairs(getgc()) do
			if type(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Soru") then
				for i2,v2 in pairs(debug.getupvalues(v)) do
					if type(v2) == 'table' then
						if v2.LastUse then
							repeat wait()
								setupvalue(v, i2, {LastAfter = 0,LastUse = 0})
							until not Sorunocool
						end
					end
				end
			end
		end
	end
	
	MiscTabs:CreateButton("Unlock Fps",function()
		setfpscap(1000)
	end)
	
	MiscTabs:CreateButton("Pro Graphic",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/NightsTimeZ/Donate-Me/main/Thx.lua"))()
	end)

    MiscTabs:CreateButton("Beautiful Mode", function()
        BeautifulMode()
    end)

if _G.BeautifulMode then
	BeautifulMode()
end

MiscTabs:CreateLabel("No Cooldown")
	
	MiscTabs:CreateToggle("Dodge No Cooldown",false,function(Value)
		nododgecool = Value
		NoDodgeCool()
	end)
	MiscTabs:CreateToggle("Soru No Cooldown",false,function(Value)
		Sorunocool = Value
		NoSoruCool()
	end)
	MiscTabs:CreateToggle("Infinits Geppo",false,function(Value)
		noGeppocool = Value
		NoGeppoCool()
	end)
	MiscTabs:CreateToggle("Infinits Energy",infengergy,function(value)
		InfinitsEnergy = value
		infinitestam()
	end)

    MiscTabs:CreateToggle("Infinits Agility",false,function(value)
        InfAbility = value
    end)

spawn(function()
	while wait() do
		if InfAbility then
			InfAb()
		end
	end
end)

function InfAb()
	if InfAbility then
		if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
			local inf = Instance.new("ParticleEmitter")
			inf.Acceleration = Vector3.new(0,0,0)
			inf.Archivable = true
			inf.Drag = 20
			inf.EmissionDirection = Enum.NormalId.Top
			inf.Enabled = true
			inf.Lifetime = NumberRange.new(0.2,0.2)
			inf.LightInfluence = 0
			inf.LockedToPart = true
			inf.Name = "Agility"
			inf.Rate = 500
			local numberKeypoints2 = {
				NumberSequenceKeypoint.new(0, 0);  -- At t=0, size of 0
				NumberSequenceKeypoint.new(1, 4); -- At t=1, size of 10
			}

			inf.Size = NumberSequence.new(numberKeypoints2)
			inf.RotSpeed = NumberRange.new(999, 9999)
			inf.Rotation = NumberRange.new(0, 0)
			inf.Speed = NumberRange.new(30, 30)
			inf.SpreadAngle = Vector2.new(360,360)
			inf.Texture = "rbxassetid://243098098"
			inf.VelocityInheritance = 0
			inf.ZOffset = 2
			inf.Transparency = NumberSequence.new(0)
			inf.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255),Color3.fromRGB(0, 255, 255))
			inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
		end
	else
		if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
			game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
		end
	end
end

	MiscTabs:CreateToggle("Infinits Ken",false,function(Value)
		infobservations = Value
	end)
	spawn(function()
		while wait() do
			if infobservations then
				game.Players.LocalPlayer.VisionRadius.Value = math.huge
			end
		end
	end)

	MiscTabs:CreateToggle("Auto Click",autoclick,function(value)
		AuctoClick = value
	end)
	spawn(function()
		while wait() do
			if AuctoClick then
				Click()
			end
		end
	end)

	MiscTabs:CreateToggle("Fly",false,function(Value)
        _G.Fly = Value
        spawn(function()
            if _G.Fly then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/x7Swiftz/F_L_Y/main/F_L_Y.lua"))()
            end
        end)

    end)

	MiscTabs:CreateToggle("No Clip",false,function(value)
		NoClip = value
	end)
	if game.workspace:FindFirstChild("WaterWalk") then
		game.workspace:FindFirstChild("WaterWalk"):Destroy()
	end
	platform = Instance.new("Part")
	platform.Name = "WaterWalk"
	platform.Size = Vector3.new(math.huge, 1, math.huge)
	platform.Transparency = 1
	platform.Anchored = true
	platform.Parent = game.workspace
	MiscTabs:CreateToggle("Water On Walk",waterwalk,function(value)
		WaterWalk = value
	end)
	spawn(function()
		while wait() do
			if WaterWalk then
				platform.CanCollide = true
				platform.Position = Vector3.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.X,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y * 0 -5, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Z)
			else
				platform.CanCollide = false
				platform.Position = Vector3.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.X,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y * 0 -6, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Z)
			end
		end
	end)

-- Config

local Toggle3 = MiscTabs:CreateToggle("KeyCode Toggle", nil, function(State)
    Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
    Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)
