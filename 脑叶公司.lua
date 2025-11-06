local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera
local TweenService = cloneref(game:GetService("TweenService"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local RunService = cloneref(game:GetService("RunService"))
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

game:GetService("TextChatService").ChatWindowConfiguration.Enabled = true

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

LOL = LOL or {}
LOL.list = LOL.list or {}

local setting = {
    aw = false,
    AL = {},
    kill = false,
    ab = false,
}

for _, v in next, Players:GetPlayers() do
    if v ~= LocalPlayer then
        table.insert(LOL.list, v.Name)
    end
end

LocalPlayer.Idled:Connect(
    function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):ClickButton2(Vector2.new())
    end
)

local kill
kill = hookmetamethod(game:GetService("ReplicatedStorage").Assets.RemoteEvents.ToolDamageEvent, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if setting.kill and method == "FireServer" then
        args[2] = math.huge
        return kill(self, unpack(args))
    end
    return kill(self, ...)
end)
local bestAttribute = nil
local highestAverage = 0
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/SUNXIAOCHUAN-DEV/uiui/refs/heads/main/德与中山"))()

local Window =
    WindUI:CreateWindow(
    {
        Title = "脑叶公司",
        Icon = "crown",
        IconThemed = true,
        Author = "作者 | 联邦各大制作人",
        Folder = "CloudHub",
        Size = UDim2.fromOffset(300, 270),
        Transparent = true,
        Theme = "Dark",
        User = {
            Enabled = true,
            Callback = function()
                print("clicked")
            end,
            Anonymous = false
        },
        SideBarWidth = 200,
        HideSearchBar = true,
        ScrollBarEnabled = true
    }
)

Window:SetToggleKey(Enum.KeyCode.F)

Window:EditOpenButton(
    {
        Title = "打开UI",
        Icon = "monitor",
        CornerRadius = UDim.new(0, 16),
        StrokeThickness = 2,
        Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
        Draggable = true
    }
)

MainSection =
    Window:Section(
    {
        Title = "主要",
        Opened = true
    }
)

local Main = MainSection:Tab({Title = "主要功能", Icon = "Sword"})

Main:Button(
    {
        Title = "点击解锁所有异想体",
        Desc = "Unlock All Imaginations",
        Callback = function()
            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "LockedFrame" then
                    v:Destroy()
                end
            end

            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "RequirerResearchLabel" then
                    v:Destroy()
                end
            end
        end
    }
)
Main:Slider(
    {
        Title = "修改武器攻击间隔",
        Desc = "Attack Speed Value",
        Value = {
            Min = 0,
            Max = 50,
            Default = 16
        },
        Callback = function(Value)
            Character.CharStats.AttackSpeed.Value = Value
        end
    }
)
Main:Input(
    {
        Title = "修改武器最大伤害",
        Callback = function(Value)
            for _,v in next,LocalPlayer.Backpack:GetChildren() do
                if v:IsA("Tool") and v:FindFirstChild("SettingValues") then
                    v.SettingValues.MaxDamageValue.Value = Value
                end
            end
            for _,v in next,Character:GetChildren() do
                if v:IsA("Tool") and v:FindFirstChild("SettingValues") then
                    v.SettingValues.MaxDamageValue.Value = Value
                end
            end
        end
    }
)
Main:Input(
    {
        Title = "修改武器最小伤害",
        Callback = function(Value)
            for _,v in next,LocalPlayer.Backpack:GetChildren() do
                if v:IsA("Tool") and v:FindFirstChild("SettingValues") then
                    v.SettingValues.MinDamageValue.Value = Value
                end
            end
            for _,v in next,Character:GetChildren() do
                if v:IsA("Tool") and v:FindFirstChild("SettingValues") then
                    v.SettingValues.MinDamageValue.Value = Value
                end
            end
        end
    }
)
Main:Toggle(
    {
        Title = "开启自动工作",
        Image = "bird",
        Value = false,
        Callback = function(state)
            setting.aw = state
            task.spawn(function()
                while setting.aw and task.wait() do
                    if Character then
                        for _,v in next, workspace.Abnormalities:GetChildren() do
                            local data = require(v.Abnormality.AbnormalityModule)
                            for i,rates in next,data.WorkSuccessRates do
                                local sum = 0
                                for _, rate in ipairs(rates) do
                                    sum = sum + rate
                                end
                                local average = sum / #rates
                                if average > highestAverage then
                                    highestAverage = average
                                    bestAttribute = i
                                end
                            end
                            game:GetService("ReplicatedStorage").Assets.RemoteEvents.WorkEvent:FireServer(v.WorkTablet, bestAttribute)
                        end
                    end
                end
            end)
        end
    }
)
Main:Toggle(
    {
        Title = "自动格挡",
        Image = "bird",
        Value = false,
        Callback = function(state)
            setting.ab = state
            LocalPlayer.PlayerGui.GameplayGui.GameplayFrame.ParryBarHolder.ParryBar:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                if setting.ab and LocalPlayer.PlayerGui.GameplayGui.GameplayFrame.ParryBarHolder.ParryBar.AbsoluteSize.X > 126.470 then
                    game:GetService("ReplicatedStorage").Assets.RemoteEvents.ToolModuleEvent:FireServer(
                        "BlockEvent",
                        game:GetService("Players").LocalPlayer.Character,
                        true
                    )
                end
            end)
        end
    }
)
Main:Toggle(
    {
        Title = "秒杀",
        Image = "bird",
        Value = false,
        Callback = function(state)
            setting.kill = state
        end
    }
)
local SelectPlayer = Main:Dropdown(
    {
        Title = "选择玩家",
        Values = LOL.list,
        Value = "未选择",
        Callback = function(option)
            LOL.sp = option
        end
    }
)

Main:Button(
    {
        Title = "传送玩家",
        Desc = "Teleport player",
        Callback = function()
            if LOL.sp and LOL.sp ~= "未选择" then
                local targetPlayer = Players:FindFirstChild(LOL.sp) -- 添加了targetPlayer的定义
                if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        end
    }
)

Players.PlayerAdded:Connect(
    function(s)
        if s ~= LocalPlayer then
            table.insert(LOL.list, s.Name)
            SelectPlayer:Refresh(LOL.list)
        end
    end
)

Players.PlayerRemoving:Connect(
    function(s)
        if s ~= LocalPlayer then
            for aI, aJ in ipairs(LOL.list) do
                if aJ == s.Name then
                    table.remove(LOL.list, aI)
                    SelectPlayer:Refresh(LOL.list)
                    break
                end
            end
        end
    end
)