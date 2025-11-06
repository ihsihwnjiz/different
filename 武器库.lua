local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/SUNXIAOCHUAN-DEV/-/refs/heads/main/乱码牛逼"))()

WindUI:Popup({
    Title = "尊贵的"..game.Players.LocalPlayer.DisplayName.."用户",
    Icon = "sparkles",
    IconThemed = true,
    Content = "欢迎使用此脚本",
    Buttons = {
        {
            Title = "取消",
            --Icon = "",
            Callback = function() end,
            Variant = "Secondary", -- Primary, Secondary, Tertiary
        },
        {
            Title = "执行",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary", -- Primary, Secondary, Tertiary
        }
    }
})

repeat task.wait() until Confirmed

local Window =
    WindUI:CreateWindow(
    {
        Title = "武器库",
        Icon = "door-open",
        IconThemed = true,
        Author = "联邦众人制作",
        Folder = "CloudHub",
        Size = UDim2.fromOffset(300, 350), -- Increased size for new features
        Transparent = false,
        Theme = "Dark",
        User = {
            Enabled = false,
            Callback = function()
                print("clicked")
            end,
            Anonymous = false
        },
        SideBarWidth = 200,
        ScrollBarEnabled = false
})


local AimbotTab = MainSection:Tab({Title = "自瞄",Icon = "star",})
local range = MainSection:Tab({Title = "范围",Icon = "star",})
local info = MainSection:Tab({Title = "信息",Icon = "star",}) 

AimbotTab:Button({
        Title = "自瞄",
        Desc = "加载自瞄菜单",
        Locked = false,
        Callback = function()
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
            local StarterGui = game:GetService("StarterGui")
            local RunService = game:GetService("RunService")
            local TweenService = game:GetService("TweenService")
            local UserInputService = game:GetService("UserInputService")
            local VirtualInputManager = game:GetService("VirtualInputManager")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Camera = game:GetService('Workspace').CurrentCamera

            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Humanoid
            local HumanoidRootPart

            local function SafeDebugPrint(message)
                print("[DEBUG] " .. message)
            end

            local function InitializeHumanoid()
                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                if character then
                    Humanoid = character:FindFirstChild("Humanoid")
                    if Humanoid then
                        HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                        if not HumanoidRootPart then
                            SafeDebugPrint("HumanoidRootPart not found for " .. LocalPlayer.Name)
                        else
                            SafeDebugPrint("HumanoidRootPart initialized for " .. LocalPlayer.Name)
                        end
                    else
                        SafeDebugPrint("Humanoid not found for " .. LocalPlayer.Name)
                    end
                end
            end

            if LocalPlayer.Character then
                InitializeHumanoid()
            end

            LocalPlayer.CharacterAdded:Connect(InitializeHumanoid)

            local kenConfiguration = {
                Main = {
                    Combat = {
                        AttackAura = false,
                        AutoParry = false
                    },
                    Farm = {
                        KillFarm = false,
                        AutoUltimate = true
                    }
                },
                Player = {
                    Character = {
                        OverwriteProperties = false,
                        WalkSpeed = 50,
                        JumpPower = 50
                    }
                }
            }

            local Functions = {}

            function Functions.BestTarget(MaxDistance)
                MaxDistance = MaxDistance or math.huge
                local Target = nil
                local MinKills = math.huge

                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                        local rootPart = v.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                            local kills = v:GetAttribute("Kills") or 0

                            if distance < MaxDistance and kills < MinKills then
                                Target = v
                                MaxDistance = distance
                                MinKills = kills
                            end
                        end
                    end
                end

                SafeDebugPrint("Best target found: " .. (Target and Target.Name or "None"))
                return Target
            end

            function Functions.UseAbility(Ability)
                if not LocalPlayer.Character then
                    return
                end
                local Tool = LocalPlayer.Backpack:FindFirstChild(Ability)
                if Tool then
                    SafeDebugPrint("Using ability: " .. Ability)
                    LocalPlayer.Character.Communicate:FireServer(
                        {
                            Tool = Tool,
                            Goal = "Console Move",
                            ToolName = tostring(Ability)
                        }
                    )
                else
                    SafeDebugPrint("Ability not found: " .. Ability)
                end
            end

            function Functions.RandomAbility()
                if not LocalPlayer.PlayerGui:FindFirstChild("Hotbar") then
                    return nil
                end
                local Hotbar = LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar
                local Abilities = {}

                for _, v in pairs(Hotbar:GetChildren()) do
                    if v.ClassName ~= "UIListLayout" and v.Visible and v.Base.ToolName.Text ~= "N/A" and not v.Base:FindFirstChild("Cooldown") then
                        table.insert(Abilities, v)
                    end
                end

                if #Abilities > 0 then
                    local RandomAbility = Abilities[math.random(1, #Abilities)]
                    return RandomAbility.Base.ToolName.Text
                else
                    SafeDebugPrint("No available abilities")
                    return nil
                end
            end

            function Functions.ActivateUltimate()
                local UltimateBar = LocalPlayer:GetAttribute("Ultimate") or 0
                if UltimateBar >= 100 then
                    LocalPlayer.Character.Communicate:FireServer(
                        {
                            MoveDirection = Vector3.new(0, 0, 0),
                            Key = Enum.KeyCode.G,
                            Goal = "KeyPress"
                        }
                    )
                    SafeDebugPrint("Ultimate activated")
                else
                    SafeDebugPrint("Ultimate not ready: " .. UltimateBar .. "%")
                end
            end

            function Functions.TeleportUnderPlayer(player)
                if not player.Character then
                    return
                end
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if rootPart and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local targetCFrame = rootPart.CFrame * CFrame.new(0, -5, 0)
                    LocalPlayer.Character:SetPrimaryPartCFrame(targetCFrame)
                    SafeDebugPrint("Teleported under player: " .. player.Name)
                else
                    SafeDebugPrint("Failed to teleport under player: " .. player.Name)
                end
            end

local Camera = workspace.CurrentCamera
local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer
local RunService = cloneref(game:GetService("RunService"))
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")
local AimbotTable = {
    Enabled = false,
    TargetPart = "Head",
    TargetType = "Player",
    FriendCheck = false,
    TeamCheck = false,
    WallCheck = false,
    AliveCheck = false
}
AimbotTab:Toggle({
    Title = "开启自瞄",
    Image = "bird",
    Value = AimbotTable.Enabled,
    Callback = function(state)
        AimbotTable.Enabled = state
        if AimbotTable.Enabled then
            RunService.RenderStepped:Connect(function()
                local Character = LocalPlayer.Character
                if not Character then return end
                
                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                if not HumanoidRootPart then return end
                
                local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                if not Humanoid then return end
                
                if not AimbotTable.Enabled then return end

                local closestTarget = nil
                local closestDistance = math.huge
                
                if AimbotTable.TargetType == "Player" then
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player == LocalPlayer then continue end
                        if AimbotTable.FriendCheck and LocalPlayer:IsFriendsWith(player.UserId) then continue end
                        if AimbotTable.TeamCheck and player.Team == LocalPlayer.Team then continue end
                        
                        local targetCharacter = player.Character
                        if not targetCharacter then continue end
                        
                        if AimbotTable.AliveCheck then
                            local targetHumanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
                            if not targetHumanoid or targetHumanoid.Health <= 0 then continue end
                        end
                        
                        local targetPart = targetCharacter:FindFirstChild(AimbotTable.TargetPart)
                        if not targetPart then continue end
                        
                        if AimbotTable.WallCheck then
                            local raycastParams = RaycastParams.new()
                            raycastParams.FilterDescendantsInstances = {Character, targetCharacter}
                            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                            
                            local raycastResult = workspace:Raycast(HumanoidRootPart.Position, (targetPart.Position - HumanoidRootPart.Position).Unit * 1000, raycastParams)
                            if raycastResult and raycastResult.Instance ~= targetPart then continue end
                        end
                        
                        local distance = (targetPart.Position - HumanoidRootPart.Position).Magnitude
                        if distance < closestDistance then
                            closestDistance = distance
                            closestTarget = targetPart
                        end
                    end
                else
                    for _, npc in ipairs(workspace:GetDescendants()) do
                        if npc:FindFirstChild("HumanoidRootPart") and not Players:GetPlayerFromCharacter(npc) then
                            local targetCharacter = npc
                            local targetPart = targetCharacter:FindFirstChild(AimbotTable.TargetPart)
                            if not targetPart then continue end
                            
                            if AimbotTable.WallCheck then
                                local raycastParams = RaycastParams.new()
                                raycastParams.FilterDescendantsInstances = {Character, targetCharacter}
                                raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                                
                                local raycastResult = workspace:Raycast(HumanoidRootPart.Position, (targetPart.Position - HumanoidRootPart.Position).Unit * 1000, raycastParams)
                                if raycastResult and raycastResult.Instance ~= targetPart then continue end
                            end
                            
                            local distance = (targetPart.Position - HumanoidRootPart.Position).Magnitude
                            if distance < closestDistance then
                                closestDistance = distance
                                closestTarget = targetPart
                            end
                        end
                    end
                end
                
                if closestTarget then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, closestTarget.Position)
                end
            end)
        end
    end
})


AimbotTab:Dropdown({
    Title = "瞄准部位",
    Values = {"Head", "HumanoidRootPart"},
    Value = "未选择",
    Callback = function(value)
        AimbotTable.TargetPart = value
    end
})

AimbotTab:Dropdown({
    Title = "瞄准目标",
    Values = {"NPC", "Player"},
    Value = "未选择",
    Callback = function(value)
        AimbotTable.TargetType = value
    end
})

AimbotTab:Toggle({
    Title = "好友验证",
    Image = "bird",
    Value = AimbotTable.FriendCheck,
    Callback = function(state)
        AimbotTable.FriendCheck = state
    end
})

AimbotTab:Toggle({
    Title = "队伍验证",
    Image = "bird",
    Value = AimbotTable.TeamCheck,
    Callback = function(state)
        AimbotTable.TeamCheck = state
    end
})

AimbotTab:Toggle({
    Title = "墙体检测",
    Image = "bird",
    Value = AimbotTable.WallCheck,
    Callback = function(state)
        AimbotTable.WallCheck = state
    end
})

AimbotTab:Toggle({
    Title = "存活检测",
    Image = "bird",
    Value = AimbotTable.AliveCheck,
    Callback = function(state)
        AimbotTable.AliveCheck = state
    end
})
Aimbot:Button({
       Title = "宙斯自瞄",
       Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()
end
})

Aimbot:Button({
      Title = "英文自瞄",
      Callback = function()
loadstring(game:HttpGet("https://rentry.co/n55gmtpi/raw", true))()
end
})

Aimbot:Button({
        Title = "自瞄50",
        Callback = function()
loadstring(game:HttpGet("https://pastefy.app/b3uXjRF6/raw",false))()
end
})

Aimbot:Button({
        Title = "自瞄100",
        Callback = function()
loadstring(game:HttpGet("https://pastefy.app/tQrd2r0L/raw",false))()
end
})

Aimbot:Button({
        Title = "自瞄150",
        Callback = function()
loadstring(game:HttpGet("https://pastefy.app/UOQWFvGp/raw",false))()
end
})

Aimbot:Button({
        Title = "自瞄200",
        Callback = function()
loadstring(game:HttpGet("https://pastefy.app/b5CuDuer/raw",false))()
end
})

Aimbot:Button({
        Title = "自瞄250",
        Callback = function()
loadstring(game:HttpGet("https://pastefy.app/p2huH7eF/raw",false))()
end
})

Aimbot:Button({
        Title = "自瞄300",
        Callback = function()
loadstring(game:HttpGet("https://pastefy.app/nIyVhrvV/raw",false))()
end
})

Aimbot:Button({
        Title = "自瞄350",
        Callback = function()
loadstring(game:HttpGet("https://pastefy.app/pnjKHMvV/raw",false))()
end
})

Aimbot:Button({
        Title = "自瞄400",
        Callback = function()
loadstring(game:HttpGet("https://pastefy.app/LQuP7sjj/raw",false))()
end
})

Aimbot:Button({
        Title = "自瞄600",
        Callback = function()
loadstring(game:HttpGet("https://pastefy.app/WmcEe2HB/raw",false))()
end
})

Aimbot:Button({
        Title = "自瞄全屏",
        Callback = function()
loadstring(game:HttpGet("https://pastefy.app/n5LhGGgf/raw",false))()
end
})

Aimbot:Button({
      Title = "阿尔子追",
      Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/sgbs/main/%E4%B8%81%E4%B8%81%20%E6%B1%89%E5%8C%96%E8%87%AA%E7%9E%84.txt"))()
end
})

Aimbot:Button({
      Title = "俄州子追",
      Callback = function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/ClasiniZukov/e7547e7b48fa90d10eb7f85bd3569147/raw/f95cd3561a3bb3ac6172a14eb74233625b52e757/gistfile1.txt"))()
end
})
end
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

getgenv().HitboxConfig = {
    Size = 15,
    Transparency = 0.9,
    Active = false,
    TeamCheck = false,
    Color = "红色",
    DefaultSize = Vector3.new(2, 2, 1),
    DefaultTransparency = 1,
    DefaultMaterial = "Plastic",
    UpdateInterval = 0.1
}

local ColorMap = {
    ["红色"] = Color3.fromRGB(255, 0, 0),
    ["蓝色"] = Color3.fromRGB(0, 0, 255),
    ["黄色"] = Color3.fromRGB(255, 255, 0),
    ["绿色"] = Color3.fromRGB(0, 255, 0),
    ["青色"] = Color3.fromRGB(0, 255, 255),
    ["橙色"] = Color3.fromRGB(255, 165, 0),
    ["紫色"] = Color3.fromRGB(128, 0, 128),
    ["白色"] = Color3.fromRGB(255, 255, 255),
    ["黑色"] = Color3.fromRGB(0, 0, 0)
}

local playerCharacters = {}
local heartbeatConnection = nil

local function onCharacterAdded(player, character)
    playerCharacters[player] = character
    
    local humanoid = character:WaitForChild("Humanoid")
    local rootPart = character:WaitForChild("HumanoidRootPart")
   
    if not getgenv().HitboxConfig.Active then
        rootPart.Size = HitboxConfig.DefaultSize
        rootPart.Transparency = HitboxConfig.DefaultTransparency
        rootPart.Material = HitboxConfig.DefaultMaterial
        rootPart.CanCollide = false
    end
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        onCharacterAdded(player, character)
    end)
    if player.Character then
        task.spawn(onCharacterAdded, player, player.Character)
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    task.spawn(onPlayerAdded, player)
end
Players.PlayerAdded:Connect(onPlayerAdded)

local function UpdateHitboxes()
    for player, character in pairs(playerCharacters) do
        if player == Players.LocalPlayer then continue end
        
        if getgenv().HitboxConfig.TeamCheck and player.Team == Players.LocalPlayer.Team then
            continue 
        end

        pcall(function()
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if not rootPart then return end

            if getgenv().HitboxConfig.Active then
                rootPart.Size = Vector3.new(HitboxConfig.Size, HitboxConfig.Size, HitboxConfig.Size)
                rootPart.Transparency = HitboxConfig.Transparency
                rootPart.Color = ColorMap[HitboxConfig.Color] or Color3.fromRGB(255, 0, 0)
                rootPart.Material = "Neon"
                rootPart.CanCollide = false
            else
                rootPart.Size = HitboxConfig.DefaultSize
                rootPart.Transparency = HitboxConfig.DefaultTransparency
                rootPart.Material = HitboxConfig.DefaultMaterial
                rootPart.CanCollide = false
            end
        end)
    end
end

range:Button({
        Title = "范围",
        Desc = "加载范围菜单",
        Locked = false,
        Callback = function()
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
            local StarterGui = game:GetService("StarterGui")
            local RunService = game:GetService("RunService")
            local TweenService = game:GetService("TweenService")
            local UserInputService = game:GetService("UserInputService")
            local VirtualInputManager = game:GetService("VirtualInputManager")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Camera = game:GetService('Workspace').CurrentCamera

            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Humanoid
            local HumanoidRootPart

            local function SafeDebugPrint(message)
                print("[DEBUG] " .. message)
            end

            local function InitializeHumanoid()
                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                if character then
                    Humanoid = character:FindFirstChild("Humanoid")
                    if Humanoid then
                        HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                        if not HumanoidRootPart then
                            SafeDebugPrint("HumanoidRootPart not found for " .. LocalPlayer.Name)
                        else
                            SafeDebugPrint("HumanoidRootPart initialized for " .. LocalPlayer.Name)
                        end
                    else
                        SafeDebugPrint("Humanoid not found for " .. LocalPlayer.Name)
                    end
                end
            end

            if LocalPlayer.Character then
                InitializeHumanoid()
            end

            LocalPlayer.CharacterAdded:Connect(InitializeHumanoid)

            local kenConfiguration = {
                Main = {
                    Combat = {
                        AttackAura = false,
                        AutoParry = false
                    },
                    Farm = {
                        KillFarm = false,
                        AutoUltimate = true
                    }
                },
                Player = {
                    Character = {
                        OverwriteProperties = false,
                        WalkSpeed = 50,
                        JumpPower = 50
                    }
                }
            }

            local Functions = {}

            function Functions.BestTarget(MaxDistance)
                MaxDistance = MaxDistance or math.huge
                local Target = nil
                local MinKills = math.huge

                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                        local rootPart = v.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                            local kills = v:GetAttribute("Kills") or 0

                            if distance < MaxDistance and kills < MinKills then
                                Target = v
                                MaxDistance = distance
                                MinKills = kills
                            end
                        end
                    end
                end

                SafeDebugPrint("Best target found: " .. (Target and Target.Name or "None"))
                return Target
            end

            function Functions.UseAbility(Ability)
                if not LocalPlayer.Character then
                    return
                end
                local Tool = LocalPlayer.Backpack:FindFirstChild(Ability)
                if Tool then
                    SafeDebugPrint("Using ability: " .. Ability)
                    LocalPlayer.Character.Communicate:FireServer(
                        {
                            Tool = Tool,
                            Goal = "Console Move",
                            ToolName = tostring(Ability)
                        }
                    )
                else
                    SafeDebugPrint("Ability not found: " .. Ability)
                end
            end

            function Functions.RandomAbility()
                if not LocalPlayer.PlayerGui:FindFirstChild("Hotbar") then
                    return nil
                end
                local Hotbar = LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar
                local Abilities = {}

                for _, v in pairs(Hotbar:GetChildren()) do
                    if v.ClassName ~= "UIListLayout" and v.Visible and v.Base.ToolName.Text ~= "N/A" and not v.Base:FindFirstChild("Cooldown") then
                        table.insert(Abilities, v)
                    end
                end

                if #Abilities > 0 then
                    local RandomAbility = Abilities[math.random(1, #Abilities)]
                    return RandomAbility.Base.ToolName.Text
                else
                    SafeDebugPrint("No available abilities")
                    return nil
                end
            end

            function Functions.ActivateUltimate()
                local UltimateBar = LocalPlayer:GetAttribute("Ultimate") or 0
                if UltimateBar >= 100 then
                    LocalPlayer.Character.Communicate:FireServer(
                        {
                            MoveDirection = Vector3.new(0, 0, 0),
                            Key = Enum.KeyCode.G,
                            Goal = "KeyPress"
                        }
                    )
                    SafeDebugPrint("Ultimate activated")
                else
                    SafeDebugPrint("Ultimate not ready: " .. UltimateBar .. "%")
                end
            end

            function Functions.TeleportUnderPlayer(player)
                if not player.Character then
                    return
                end
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if rootPart and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local targetCFrame = rootPart.CFrame * CFrame.new(0, -5, 0)
                    LocalPlayer.Character:SetPrimaryPartCFrame(targetCFrame)
                    SafeDebugPrint("Teleported under player: " .. player.Name)
                else
                    SafeDebugPrint("Failed to teleport under player: " .. player.Name)
                end
            end



range:Toggle({
     Title = "开启/关闭范围", 
     Description = "HitboxStatus", 
     Icon = "bird",
     Type = "Checkbox",
     Locked = false, 
     Callback = function(state)
    getgenv().HitboxConfig.Active = state

    if heartbeatConnection then
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end

    if state then
        heartbeatConnection = RunService.Heartbeat:Connect(function()
            UpdateHitboxes()
            task.wait(HitboxConfig.UpdateInterval)
        end)
        UpdateHitboxes()
    else
        UpdateHitboxes()
    end
end
})

range:Input({
      Title = "范围大小设置",
      Callback =  function(value)
    local num = tonumber(value)
    if num and num > 0 then
        getgenv().HitboxConfig.Size = num
        if getgenv().HitboxConfig.Active then
            UpdateHitboxes()
        end
    end
end
})

range:Input({
     Title = "范围透明度设置(0-1)",
     Callback =  function(value)
    local num = tonumber(value)
    if num and num >= 0 and num <= 1 then
        getgenv().HitboxConfig.Transparency = num
        if getgenv().HitboxConfig.Active then
            UpdateHitboxes()
        end
    end
end
})

range:Toggle({
     Title = "队伍检测", 
     Description = "TeamCheck",
     Icon = "bird",
     Type = "Checkbox", 
     Locked = false, 
     Callback = function(state)
    getgenv().HitboxConfig.TeamCheck = state
    if getgenv().HitboxConfig.Active then
        UpdateHitboxes()
    end
end
})

range:Dropdown({
     Title = "选择范围颜色", 
     Description = "HitboxColor", 
     Values = {"红色","蓝色","黄色","绿色","青色","橙色","紫色","白色","黑色"}, 
     Callback = function(value)
    if ColorMap[value] then
        getgenv().HitboxConfig.Color = value
        if getgenv().HitboxConfig.Active then
            UpdateHitboxes()
        end
    end
end
})

range:Button({
     Title = "范围",
     Callback = function()
    _G.HeadSize = 15
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
end
})

range:Input({
     Title = "自定义范围",
     Callback =  function(Value)
   _G.HeadSize = Value
    _G.Disabled = true 
   game:GetService('RunService').RenderStepped:connect(function()
    if _G.Disabled then
    for i,v in next, game:GetService('Players'):GetPlayers() do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then 
    pcall(function()
    v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) 
   v.Character.HumanoidRootPart.Transparency = 0.7 
   v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
    v.Character.HumanoidRootPart.Material = "Neon"
    v.Character.HumanoidRootPart.CanCollide = false
    end)
    end 
   end 
   end
    end)
end
})

range:Button({
    Title = "普通范围",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()
end
})

range:Button({
      Title = "中等范围",
      Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()
end
})

range:Button({
     Title = "全图范围",
     Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/KKY9EpZU"))()
end
})

range:Button({
     Title = "终极范围",
     Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/CAQ9x4A7"))()
end
})
end
})

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local infoOptions = {
    "服务器当前人数", 
    "当前时间",
    "游戏时间",
    "账号年龄",
    "注入器",
    "用户名",
    "服务器名称",
    "服务器ID",
    "用户ID",
    "客户端ID",
    "游玩时间" 
}

local selectedInfo = "游玩时间"

info:Dropdown({
    Title = "选择查看信息",
    Values = infoOptions,
    Value = selectedInfo,
    Callback = function(option)
        selectedInfo = option
        updateInfoDisplay()
    end
})

local infoDisplay = info:Paragraph({
    Title = "信息显示",
    Desc = "请选择要查看的信息",
    Image = "save",
    ImageSize = 20,
    Color = "White"
})

local function updateInfoDisplay()
    if selectedInfo == "服务器当前人数" then
        infoDisplay:SetDesc(tostring(#Players:GetChildren()))
        infoDisplay:SetTitle("服务器当前人数")
    elseif selectedInfo == "当前时间" then
        infoDisplay:SetDesc(os.date("%Y-%m-%d %H:%M:%S"))
        infoDisplay:SetTitle("当前时间")
    elseif selectedInfo == "游戏时间" then
        infoDisplay:SetDesc(tostring(tick()))
        infoDisplay:SetTitle("游戏时间")
    elseif selectedInfo == "账号年龄" then
        infoDisplay:SetDesc(tostring(player.AccountAge).."天")
        infoDisplay:SetTitle("账号年龄")
    elseif selectedInfo == "注入器" then
        infoDisplay:SetDesc(identifyexecutor() or "未知")
        infoDisplay:SetTitle("注入器")
    elseif selectedInfo == "用户名" then
        infoDisplay:SetDesc(player.Name)
        infoDisplay:SetTitle("用户名")
    elseif selectedInfo == "服务器名称" then
        infoDisplay:SetDesc(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
        infoDisplay:SetTitle("服务器名称")
    elseif selectedInfo == "服务器ID" then
        infoDisplay:SetDesc(tostring(game.PlaceId))
        infoDisplay:SetTitle("服务器ID")
    elseif selectedInfo == "用户ID" then
        infoDisplay:SetDesc(tostring(player.UserId))
        infoDisplay:SetTitle("用户ID")
    elseif selectedInfo == "客户端ID" then
        infoDisplay:SetDesc(game:GetService("RbxAnalyticsService"):GetClientId())
        infoDisplay:SetTitle("客户端ID")
    elseif selectedInfo == "游玩时间" then
        local playTime = player.PlayTime or 0 
        local hours = math.floor(playTime / 3600)
        local minutes = math.floor((playTime % 3600) / 60)
        local seconds = math.floor(playTime % 60)
        local formattedTime = string.format("%d小时 %d分钟 %d秒", hours, minutes, seconds)
        
        infoDisplay:SetDesc(formattedTime)
        infoDisplay:SetTitle("游玩时间")
    end
end

spawn(function()
    while wait(1) do
        if selectedInfo == "您的Kdnor" or 
           selectedInfo == "服务器当前人数" or 
           selectedInfo == "当前时间" or 
           selectedInfo == "您的金钱" or 
           selectedInfo == "游戏时间" or
           selectedInfo == "游玩时间" then 
            updateInfoDisplay()
        end
    end
end)
