local gs = function(service)
	return game:GetService(service)
end

local lp = gs("Players").LocalPlayer
local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
local pos = lp.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
local ME = game.Players.LocalPlayer.Character.HumanoidRootPart
local Mouse = game:GetService('Players').LocalPlayer:GetMouse()
local CurrentSlot = game.Players.LocalPlayer:WaitForChild("CurrentSaveSlot").Value
local ScriptLoadOrSave = false
local CurrentlySavingOrLoading = game.Players.LocalPlayer:WaitForChild("CurrentlySavingOrLoading")
local mouse = game.Players.LocalPlayer:GetMouse()

local function notify(title, content, duration)
	WindUI:Notify({
		Title = title,
		Content = content,
		Icon = "info",
		IconThemed = true,
		Duration = duration or 5,
	})
end

local dyzh = {
	axedupe = false,
	soltnumber = "1",
	waterwalk = false,
	awaysday = false,
	awaysdnight = false,
	nofog = false,
	axeflying = false,
	playernamedied = "",
	tptree = "",
	moneyaoumt = 1,
	moneytoplayername = "",
	donationRecipient = tostring(game.Players.LocalPlayer),
	autodropae = false,
	farAxeEquip = nil,
	cuttreeselect = "Generic",
	autofarm = false,
	PlankToBlueprint = nil,
	plankModel = nil,
	blueprintModel = nil,
	saymege = "",
	autosay = false,
	saymount = 1,
	sayfast = false,
	autofarm1 = false,
	bringamount = 1,
	bringtree = false,
	dxmz = "",
	color = 0,
	zlwjia = "",
	mtwjia = nil,
	zix = 1,
	zlz = 3,
	axeFling = nil,
	itemtoopen = "",
	openItem = nil,
	car = nil,
	load = false,
	autobuyamount = 1,
	autopick = false,
	loaddupeaxewaittime = 3.1,
	walkspeed = 16,
	JumpPower = 50,
	pickupaxeamount = 1,
	whthmose = false,
	itemset = nil,
	LoneCaveAxeDetection = nil,
	cuttree = false,
	LoneCaveCharacterAddedDetection = nil,
	LoneCaveDeathDetection = nil,
	lovecavecutcframe = nil,
	lovecavepast = nil,
	zlmt = nil,
	shuzhe = false,
	modwood = false,
	tchonmt = nil,
	cskais = false,
	dledetree = false,
	delereeset = nil,
	treecutset = nil,
	autobuyset = nil,
	wood = 7,
	cswjia = nil,
	boxOpenConnection = nil,
	autobuystop = false,
	dropdown = {},
	autocsdx = nil,
	kuangxiu = nil,
	xzemuban = false,
	daiwp = false,
	stopcar = false
}

spawn(function()
	while task.wait() do
		game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text = "德与中山付费脚本"
		game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.TextColor3 =
			Color3.fromRGB(255, 255, 255)
		wait(1)
		game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text =
			"德与中山牛逼"
		game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.TextColor3 =
			Color3.fromRGB(255, 255, 255)
		wait(1)
		game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text =
			"优质良心的脚本"
		game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.TextColor3 =
			Color3.fromRGB(255, 255, 255)
		wait(1)
		game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text = "谢谢您使用"
		game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.TextColor3 =
			Color3.fromRGB(255, 255, 255)
		wait(1)
		game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text = lp.Name
		game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.TextColor3 =
			Color3.fromRGB(255, 255, 255)
		wait(1)
	end
end)
game:GetService("Workspace").Stores.WoodRUs.Parts.OPEN24HOURS.SurfaceGui.TextLabel.Text = "主作者:深渊";
game:GetService("Workspace").Stores.WoodRUs.Parts.OPEN24HOURS.SurfaceGui.TextLabel.TextColor3 =
	Color3.fromRGB(255, 255, 255)
game:GetService("Workspace").Stores.WoodRUs.Parts.SELLWOOD.SurfaceGui.TextLabel.Text = "作者:各大脚本作者";
game:GetService("Workspace").Stores.WoodRUs.Parts.SELLWOOD.SurfaceGui.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
game:GetService("Workspace").Stores.WoodRUs.Parts.WOODDROPOFF.SurfaceGui.TextLabel.Text = "感谢使用德与中山";
game:GetService("Workspace").Stores.WoodRUs.Parts.WOODDROPOFF.SurfaceGui.TextLabel.TextColor3 =
	Color3.fromRGB(255, 255, 255)

local function carTeleport(cframe)
	if game.Players.LocalPlayer.Character then
		local Character = game.Players.LocalPlayer.Character
		if Character.Humanoid.SeatPart ~= nil then
			local Car = Character.Humanoid.SeatPart.Parent
			spawn(function()
				for i = 1, 5 do
					wait()
					Car:SetPrimaryPartCFrame(cframe *
						CFrame.Angles(math.rad(Character.HumanoidRootPart.Orientation.x),
							math.rad(Character.HumanoidRootPart.Orientation.y), 0))
					game.ReplicatedStorage.Interaction.ClientRequestOwnership:FireServer(Car.Main)
					game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Car.Main)
				end
			end)
		end
	end
end

local function Teleport(GetCFrame)
	lp.Character:FindFirstChild("HumanoidRootPart").CFrame = GetCFrame
end

local function Light(value)
	if value then
		local light = Instance.new('PointLight', lp.Character.Head)
		light.Name = 'dyzh'
		light.Range = 150
		light.Brightness = 1.7
	else
		pcall(function()
			lp.Character.Head.dyzh:remove();
		end);
	end
end

local function getTools()
	lp.Character.Humanoid:UnequipTools()
	local tools = {}
	for _, v in pairs(lp.Backpack:GetChildren()) do
		if v.Name ~= "BlueprintTool" then
			table.insert(tools, v)
		end
	end
	return tools
end

local function getToolStats(toolName)
	if typeof(toolName) ~= "string" then
		toolName = toolName.ToolName.Value
	end
	return require(gs("ReplicatedStorage").AxeClasses['AxeClass_' .. toolName]).new()
end

local getTool = function()
	return lp.Character:FindFirstChild("Tool") or lp.Backpack:FindFirstChild("Tool")
end

local function getBestAxe(treeClass)
	local tools = getTools()
	if #tools == 0 then
		notify("提示", "你需要斧头", 4)
		return false
	end
	local toolStats = {}
	local tool
	for _, v in next, tools do
		if treeClass == "LoneCave" and v.ToolName.Value == "EndTimesAxe" then
			tool = v
			break
		end
		local axeStats = getToolStats(v)
		if axeStats.SpecialTrees and axeStats.SpecialTrees[treeClass] then
			for i, v in next, axeStats.SpecialTrees[treeClass] do
				axeStats[i] = v
			end
		end
		table.insert(toolStats, {
			tool = v,
			damage = axeStats.Damage
		})
	end
	if not tool and treeClass == "LoneCave" then
		notify("提示", "你需要末日斧头", 4)
		return false
	end
	table.sort(toolStats, function(a, b)
		return a.damage > b.damage
	end)
	return true, tool or toolStats[1].tool
end

local function cutPart(event, section, height, tool, treeClass)
	local axeStats = getToolStats(tool)
	if axeStats.SpecialTrees and axeStats.SpecialTrees[treeClass] then
		for i, v in next, axeStats.SpecialTrees[treeClass] do
			axeStats[i] = v
		end
	end
	game:GetService 'ReplicatedStorage'.Interaction.RemoteProxy:FireServer(event, {
		tool = tool,
		faceVector = Vector3.new(-1, 0, 0),
		height = height or 0.3,
		sectionId = section or 1,
		hitPoints = axeStats.Damage,
		cooldown = axeStats.SwingCooldown,
		cuttingClass = "Axe"
	})
end

local treeListener = function(treeClass, callback)
	local childAdded
	childAdded = workspace.LogModels.ChildAdded:Connect(function(child)
		local owner = child:WaitForChild("Owner")
		if owner.Value == lp and child.TreeClass.Value == treeClass then
			childAdded:Disconnect()
			callback(child)
		end
	end)
end

local getBiggestTree = function(treeClass)
	for _, v in next, workspace:children() do
		if tostring(v) == "TreeRegion" then
			for _, g in next, v:children() do
				if g:FindFirstChild("TreeClass") and tostring(g.TreeClass.Value) == treeClass and
					g:FindFirstChild("Owner") then
					if g.Owner.Value == nil or tostring(g.Owner.Value) == tostring(game.Players.LocalPlayer) then
						if #g:children() > 5 and g:FindFirstChild("WoodSection") then
							for h, j in next, g:children() do
								if j:FindFirstChild("ID") and j.ID.Value == 1 and j.Size.Y > .5 then
									return j;
								end
							end
						end
					end
				end
			end
		end
	end
	return false;
end

local function bringTree(treeClass)
	local success, data = getBestAxe(treeClass)
	if not success then
		return
	end

	local axeStats = getToolStats(data)
	local treeCut = false

	treeListener(treeClass, function(tree)
		tree:WaitForChild('Owner', 60)
		tree.PrimaryPart = tree:FindFirstChild("WoodSection")
		treeCut = true

		task.spawn(function()
			for i = 1, 60 do
				game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(tree)
				game["Run Service"].Heartbeat:wait()
			end
		end)

		task.wait(0.1)
		tree.PrimaryPart = tree.WoodSection
		spawn(function()
			for i = 1, 60 do
				tree.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
				tree:PivotTo(dyzh.treecutset)
				game["Run Service"].Heartbeat:wait()
			end
		end)

		wait(0.5)
		if treeClass == "LoneCave" then
			lp.Character.Head:Destroy()
			lp.CharacterAdded:Wait()
			wait(2)
		end

		Teleport(dyzh.treecutset)
	end)

	if treeClass == "LoneCave" then
		local GM = game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint
		GM:Clone().Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		GM:Destroy()
	end

	local tree = getBiggestTree(treeClass)
	if not tree then
		notify("提示", "没有找到树", 3)
		return
	end

	spawn(function()
		repeat
			Teleport(tree.CFrame + Vector3.new(3, 3, 0))
			cutPart(tree.Parent.CutEvent, 1, 0.3, data, treeClass)
			game["Run Service"].Heartbeat:wait()
		until treeCut
	end)
end

local function droptool(Position)
	local aQ = game.Players.LocalPlayer.Character;
	if aQ:FindFirstChildOfClass "Tool" then
		local y = aQ:FindFirstChildOfClass "Tool"
		if y:FindFirstChild("ToolName") then
			game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(y, "Drop tool", Position or
				game.Players.LocalPlayer.Character.Head.CFrame)
		end
	end
	for a, b in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if b.Name == "Tool" and b.ClassName == "Tool" then
			game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(b, "Drop tool", lp.Character:FindFirstChild("HumanoidRootPart").Position)
		end
	end
end

local function GetTree()
	local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	for i, v in next, game:GetService("Workspace").LogModels:GetChildren() do
		if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
			if not v.PrimaryPart then
				v.PrimaryPart = v:FindFirstChild("WoodSection")
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
				v:FindFirstChild("WoodSection").CFrame.p)
			spawn(function()
				for i = 1, 50 do
					game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
					task.wait()
				end
			end)
			for i = 1, 50 do
				task.wait()
				v:PivotTo(OldPos)
			end
			task.wait()
		end
	end
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
end

local function getPlanks()
	local plankList = {};
	for _, plank in next, game:GetService('Workspace').PlayerModels:children() do
		if plank:FindFirstChild('WoodSection') and plank:FindFirstChild('Owner') and plank.Owner.Value ==
			game:GetService('Players').LocalPlayer and not table.find(plankList, plank) then
			table.insert(plankList, plank)
		end
	end
	return plankList;
end

local function GetLog()
	local logFolder = getPlanks();
	local oldPos = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame;
	for _, log in next, logFolder do
		if log:FindFirstChild('WoodSection') then

			spawn(function()
				for i = 1, 20 do

					game:GetService('ReplicatedStorage').Interaction.ClientIsDragging:FireServer(log);
					task.wait();
				end
			end)
			wait(0.18)
			if not log.PrimaryPart then
				log.PrimaryPart = log.WoodSection;
			end
			log:SetPrimaryPartCFrame(oldPos);
		end
	end
end

local GetShopID = {
	["WoodRus"] = {
		["Character"] = workspace.Stores.WoodRUs.Thom,
		["Name"] = "Thom",
		["ID"] = tonumber(7)
	},
	["FurnitureStore"] = {
		["Character"] = workspace.Stores.FurnitureStore.Corey,
		["Name"] = "Corey",
		["ID"] = tonumber(8)
	},
	["CarStore"] = {
		["Character"] = workspace.Stores.CarStore.Jenny,
		["Name"] = "Jenny",
		["ID"] = tonumber(9)
	},
	["ShackShop"] = {
		["Character"] = workspace.Stores.ShackShop.Bob,
		["Name"] = "Bob",
		["ID"] = tonumber(10)
	},
	["FineArt"] = {
		["Character"] = workspace.Stores.FineArt.Timothy,
		["Name"] = "Timothy",
		["ID"] = tonumber(11)
	},
	["LogicStore"] = {
		["Character"] = workspace.Stores.LogicStore.Lincoln,
		["Name"] = "Lincoln",
		["ID"] = tonumber(12)
	}
}

local BuyItem = function(m)
	game.ReplicatedStorage.NPCDialog.PlayerChatted:InvokeServer(m, "ConfirmPurchase")
end

local function finditem(o)
	for e, h in next, workspace.Stores:children() do
		if h.Name == "ShopItems" and h:FindFirstChild "Box" then
			for i, j in next, h:children() do
				if j.BoxItemName.Value == o then
					for i, w in next, h:children() do
						if w.BoxItemName.Value == "Bed1" or w.BoxItemName.Value == "Seat_Couch" then
							local ID = GetShopID.FurnitureStore.ID
							local Cashier = game.Workspace.Stores.FurnitureStore.Corey.HumanoidRootPart.CFrame
							local Counter = game.Workspace.Stores.FurnitureStore.Counter.CFrame + Vector3.new(0, .4, 0)
						elseif w.BoxItemName.Value == "Sawmill" or w.BoxItemName.Value == "Sawmill2" then
							local ID = GetShopID.WoodRus.ID
							local Cashier = game.Workspace.Stores.WoodRUs.Thom.HumanoidRootPart.CFrame
							local Counter = game.Workspace.Stores.WoodRUs.Counter.CFrame + Vector3.new(0, .4, 0)
						elseif w.BoxItemName.Value == "Trailer2" or w.BoxItemName.Value == "UtilityTruck2" then
							local ID = GetShopID.CarStore.ID
							local Cashier = game.Workspace.Stores.CarStore.Jenny.HumanoidRootPart.CFrame
							local Counter = game.Workspace.Stores.CarStore.Counter.CFrame + Vector3.new(0, .4, 0)
						elseif w.BoxItemName.Value == "CanOfWorms" or w.BoxItemName.Value == "Dynamite" then
							local ID = GetShopID.ShackShop.ID
							local Cashier = game.Workspace.Stores.ShackShop.Bob.HumanoidRootPart.CFrame
							local Counter = game.Workspace.Stores.ShackShop.Counter.CFrame + Vector3.new(0, .4, 0)
						elseif w.BoxItemName.Value == "Painting1" or w.BoxItemName.Value == "Painting2" then
							local ID = GetShopID.FineArt.ID
							local Cashier = game.Workspace.Stores.FineArt.Timothy.HumanoidRootPart.CFrame
							local Counter = game.Workspace.Stores.FineArt.Counter.CFrame + Vector3.new(0, .4, 0)
						elseif w.BoxItemName.Value == "GateXOR" or w.BoxItemName.Value == "NeonWireOrange" then
							local  ID = GetShopID.LogicStore.ID
							local Cashier = game.Workspace.Stores.LogicStore.Lincoln.HumanoidRootPart.CFrame
							local Counter = game.Workspace.Stores.LogicStore.Counter.CFrame + Vector3.new(0, .4, 0)Counter = game.Workspace.Stores.LogicStore.Counter.CFrame + Vector3.new(0, .4, 0)
						end
					end
				end
			end
		end
	end
end

local function autobuyv2(o)
	local item = nil
	local ltem = nil

	item = finditem(o)

	if item == nil then
		notify("德与中山", "没有找到商品或者没有刷新，请你等待", 4)
		repeat
			task.wait()
			item = finditem(o)
		until item ~= nil
	end

	ltem = item[1]

	Teleport(ltem.Main.CFrame)
	task.wait()

	game:GetService('RunService').Stepped:wait()
	for e = 1, 15 do
		game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(ltem)
		ltem:PivotTo(item[4])
		game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(ltem)
		game:GetService('RunService').Stepped:wait()
	end
	Teleport(item[4] + Vector3.new(5, 0, 5))

	repeat
		BuyItem(item[3])
		game:GetService('RunService').Stepped:wait()
	until tostring(ltem.Parent) ~= "ShopItems"

	return o
end

local function autobuy(o, r)
	dyzh.autocsdx = game.Workspace.PlayerModels.ChildAdded:Connect(function(v)
		v:WaitForChild('Owner', 60)
		if v.Owner.Value == lp then
			for i = 1, 20 do
				game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
				v:PivotTo(dyzh.autobuyset)
				game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
				game:GetService('RunService').Stepped:wait()
			end
		end
	end)
	for e = 1, r do
		if dyzh.autobuystop == false then
			autobuyv2(o)
			task.wait()
		end
	end
	spawn(function()
		wait(1)
		dyzh.autocsdx:Disconnect()
		dyzh.autocsdx = nil
	end)
	return o, r
end

local function getCFrame(part)
	local part = part or (lp.Character and lp.Character.HumanoidRootPart)
	if not part then
		return
	end
	return part.CFrame
end

local function getPosition(part)
	return getCFrame(part).Position
end

--UI
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local function getDeviceType()
	local UserInputService = game:GetService("UserInputService")
	if UserInputService.TouchEnabled then
		if UserInputService.KeyboardEnabled then
			return "平板"
		else
			return "手机"
		end
	else
		return "电脑"
	end
end

local deviceType = getDeviceType()
local uiSize, uiPosition

if deviceType == "手机" then
	uiSize = UDim2.fromOffset(500, 400)
elseif deviceType == "平板" then
	uiSize = UDim2.fromOffset(550, 450)
else
	uiSize = UDim2.fromOffset(600, 500)
end
uiPosition = UDim2.new(0.5, 0, 0.5, 0)

WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

local playerName = lp.Name
local displayName = lp.DisplayName

WindUI:Notify({
	Title = "德与中山",
	Content = "德与中山--伐木加载完成",
	Duration = 2
})

local Window = WindUI:CreateWindow({
	Title = "德与中山--伐木大亨",
	Icon = "crown",
	Author = "联邦各大脚本作者",
	Folder = "OrangeCHub",
	Size = uiSize,
	Position = uiPosition,
	Theme = "Dark",
	Transparent = true,
	User = {
		Enabled = true,
		Anonymous = false,
		Username = playerName,
		DisplayName = displayName,
		UserId = game.Players.LocalPlayer.UserId,
		ThumbnailType = "AvatarBust",
		Callback = function()
			WindUI:Notify({
				Title = "用户信息",
				Content = "玩家:" .. game.Players.LocalPlayer.Name,
				Duration = 3
			})
		end
	},
	SideBarWidth = deviceType == "手机" and 150 or 180,
	ScrollBarEnabled = true
})

Window:CreateTopbarButton("theme-switcher", "moon", function()
	WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark")
	WindUI:Notify({
		Title = "提示",
		Content = "当前主题: "..WindUI:GetCurrentTheme(),
		Duration = 2
	})
end, 990)

Window:EditOpenButton({
	Title = "打开德与中山-伐木大亨",
	Icon = "crown",
})

local Tab1 = Window:Section({ Title = "玩家功能", Opened = false })
local Tab = Window:Section({ Title = "主要功能", Opened = false })
local Tab2 = Window:Section({ Title = "环境", Opened = false })
local Tab3 = Window:Section({ Title = "自动购买", Opened = false })


local Announcement = Tab1:Tab({ Title = "公告", Icon = "megaphone" })
local Section3 = Tab1:Tab({ Title = "玩家", Icon = "user" })
local Sectioncs = Tab1:Tab({ Title = "传送", Icon = "cable" })
local Sectionqccs = Tab1:Tab({ Title = "汽车传送", Icon = "car" })
local SectionAxe = Tab:Tab({ Title = "斧头", Icon = "axe" })
local Sectionjd = Tab:Tab({ Title = "基地", Icon = "square-dashed-top-solid" })
local Sectionchuanson = Tab:Tab({ Title = "传送东西", Icon = "stretch-horizontal" })
local Sectionzhengli = Tab:Tab({ Title = "整理", Icon = "codesandbox" })
local Section5 = Tab:Tab({ Title = "木头", Icon = "tree-pine" })
local Sectionhuanjin = Tab2:Tab({ Title = "环境", Icon = "sun" })
local Sectionautobuy = Tab3:Tab({ Title = "自动购买", Icon = "shopping-cart" })


Announcement:Paragraph({
	Title = "欢迎尊贵的用户",
	Desc = "此脚本会一直更新 感谢白名单使用者",
	Image = "info",
	ImageSize = 15
})

Announcement:Paragraph({
	Title = "玩家",
	Desc = "尊敬的用户: " .. lp.Name .. "欢迎使用",
	Image = "user",
	ImageSize = 12
})

Announcement:Paragraph({
	Title = "设备",
	Desc = "你的使用设备: " .. deviceType,
	Image = "gamepad",
	ImageSize = 12
})

Announcement:Paragraph({
	Title = "设备",
	Desc = "你的注入器: " .. identifyexecutor(),
	Image = "syringe",
	ImageSize = 12
})
Section3:Slider({
	Title = "玩家速度",
	Desc = "玩家的速度",
	Step = 1,
	Value = {
		Min = 16,
		Max = 200,
		Default = 16,
	},
	Callback = function(value)
		spawn(function()
			while task.wait() do
				lp.Character.Humanoid.WalkSpeed = value
			end
		end)
	end
})

Section3:Slider({
	Title = "玩家跳跃高度",
	Desc = "玩家的跳跃高度",
	Step = 1,
	Value = {
		Min = 50,
		Max = 200,
		Default = 50,
	},
	Callback = function(value)
		spawn(function()
			while task.wait() do
				lp.Character.Humanoid.JumpPower = value
			end
		end)
	end
})

Section3:Slider({
	Title = "玩家高度",
	Desc = "玩家的高度",
	Step = 1,
	Value = {
		Min = 0,
		Max = 120,
		Default = 0,
	},
	Callback = function(value)
		lp.Character.Humanoid.HipHeight = value
	end
})

Section3:Toggle({
	Title = "自身发光",
	Desc = "光",
	Value = false,
	Callback = function(state)
		if state then
			Light(true)     
		else
			Light()       
		end
	end
})

Section3:Button({
	Title = "点击传送",
	Desc = "工具",
	Locked = false,
	Callback = function()
		mouse = game.Players.LocalPlayer:GetMouse()
		local tool = Instance.new("Tool")
		tool.RequiresHandle = false
		tool.Name = "点击传送工具"
		tool.Activated:connect(function()
			local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
			pos = CFrame.new(pos.X, pos.Y, pos.Z)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
		end)
		tool.Parent = game.Players.LocalPlayer.Backpack
	end
})


--传送
Sectioncs:Dropdown({
	Title = "传送到地点",
	Desc = "传送",
	Values = {'出生点', '木材反斗城', '土地商店', '桥', '码头', '椰子岛', '洞穴', '鲨鱼斧合成',
		'火山', '沼泽', '家具店', '盒子车行', '连锁逻辑店', '鲍勃的小店', '画廊', '雪山',
		'灵视神殿', '怪人', '小绿盒', '滑雪小屋', '黄金木洞穴', '小鸟斧头', "灯塔", '回家'},
	Value = "请选择",
	Multi = false,
	AllowNone = false,
	Callback = function(b)
		if b == '木材反斗城' then
			Teleport(CFrame.new(270, 4, 60));
		elseif b == '出生点' then
			Teleport(CFrame.new(174, 10.5, 66));
		elseif b == '土地商店' then
			Teleport(CFrame.new(270, 3, -98));
		elseif b == '桥' then
			Teleport(CFrame.new(112, 37, -892));
		elseif b == '码头' then
			Teleport(CFrame.new(1136, 0, -206));
		elseif b == '椰子岛' then
			Teleport(CFrame.new(2614, -4, -34));
		elseif b == '洞穴' then
			Teleport(CFrame.new(3590, -177, 415));
		elseif b == '火山' then
			Teleport(CFrame.new(-1588, 623, 1069));
		elseif b == '沼泽' then
			Teleport(CFrame.new(-1216, 131, -822));
		elseif b == '家具店' then
			Teleport(CFrame.new(486, 3, -1722));
		elseif b == '盒子车行' then
			carTeleport(CFrame.new(509, 3, -1458));
		elseif b == '雪山' then
			Teleport(CFrame.new(1487, 415, 3259));
		elseif b == '连锁逻辑店' then
			Teleport(CFrame.new(4615, 7, -794));
		elseif b == '鲍勃的小店' then
			Teleport(CFrame.new(292, 8, -2544));
		elseif b == '画廊' then
			Teleport(CFrame.new(5217, -166, 721));
		elseif b == '灵视神殿' then
			Teleport(CFrame.new(-1608, 195, 928));
		elseif b == '怪人' then
			Teleport(CFrame.new(1071, 16, 1141));
		elseif b == '小绿盒' then
			Teleport(CFrame.new(-1667, 349, 1474));
		elseif b == '滑雪小屋' then
			Teleport(CFrame.new(1244, 59, 2290));
		elseif b == '黄金木洞穴' then
			Teleport(CFrame.new(-1080, -5, -942));
		elseif b == '鲨鱼斧合成' then
			Teleport(CFrame.new(330.259735, 45.7998505, 1943.30823, 0.972010553, -8.07546598e-08, 0.234937176,
				7.63610259e-08, 1, 2.77986647e-08, -0.234937176, -9.08055142e-09, 0.972010553))
		elseif b == '小鸟斧头' then
			Teleport(CFrame.new(4813.1, 33.5, -978.8));
		elseif b == '灯塔' then
			Teleport(CFrame.new(1464.8, 356.3, 3257.2));
		else
			if b == '回家' then
				for i, v in pairs(game.Workspace.Properties:GetChildren()) do
					if v.Owner.Value == game.Players.LocalPlayer then
						Teleport(v.OriginSquare.CFrame + Vector3.new(0, 10, 0))
					end
				end
			end
		end
	end
})

Sectioncs:Dropdown({
	Title = "传送到树",
	Desc = "传送",
	Values = {"普通树", "沼泽黄金", "樱花", "蓝木", "冰木", "火山木", "橡木", "巧克力木", "白桦木",
		"黄金木", "雪地松", "僵尸木", "大巧克力树", "椰子树", "幻影木"},
	Value = "请选择",
	Multi = false,
	AllowNone = false,
	Callback = function(b)
		if b == '普通树' then
			dyzh.tptree = "Generic"
		elseif b == '沼泽黄金' then
			dyzh.tptree = "GoldSwampy"
		elseif b == '樱花' then
			dyzh.tptree = "Cherry"
		elseif b == '蓝木' then
			dyzh.tptree = "CaveCrawler"
		elseif b == '冰木' then
			dyzh.tptree = "Frost"
		elseif b == '火山木' then
			dyzh.tptree = "Volcano"
		elseif b == '橡木' then
			dyzh.tptree = "Oak"
		elseif b == '巧克力木' then
			dyzh.tptree = "Walnut"
		elseif b == '白桦木' then
			dyzh.tptree = "Birch"
		elseif b == '黄金木' then
			dyzh.tptree = "SnowGlow"
		elseif b == '雪地松' then
			dyzh.tptree = "Pine"
		elseif b == '僵尸木' then
			dyzh.tptree = "GreenSwampy"
		elseif b == '大巧克力树' then
			dyzh.tptree = "Koa"
		elseif b == '椰子树' then
			dyzh.tptree = "Palm"
		elseif b == '幻影木' then
			dyzh.tptree = "LoneCave"
		end
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "TreeRegion" then
				for j, k in ipairs(v:GetChildren()) do
					if k:FindFirstChild("TreeClass") and k.TreeClass.Value == dyzh.tptree then
						game.Players.LocalPlayer.Character:MoveTo(k.WoodSection.Position)
						break
					end
				end
			end
		end
	end
})

Sectionqccs:Dropdown({
	Title = "汽车传送到地点",
	Desc = "汽车传送",
	Values = {'出生点', '木材反斗城', '土地商店', '桥', '码头', '椰子岛', '洞穴', '鲨鱼斧合成',
		'火山', '沼泽', '家具店', '盒子车行', '连锁逻辑店', '鲍勃的小店', '画廊', '雪山',
		'灵视神殿', '怪人', '小绿盒', '滑雪小屋', '黄金木洞穴', '小鸟斧头', "灯塔", '回家'},
	Value = "请选择",
	Multi = false,
	AllowNone = false,
	Callback = function(b)
		if b == '木材反斗城' then
			carTeleport(CFrame.new(270, 4, 60));
		elseif b == '出生点' then
			carTeleport(CFrame.new(174, 10.5, 66));
		elseif b == '土地商店' then
			carTeleport(CFrame.new(270, 3, -98));
		elseif b == '桥' then
			carTeleport(CFrame.new(112, 37, -892));
		elseif b == '码头' then
			carTeleport(CFrame.new(1136, 0, -206));
		elseif b == '椰子岛' then
			carTeleport(CFrame.new(2614, -4, -34));
		elseif b == '洞穴' then
			carTeleport(CFrame.new(3590, -177, 415));
		elseif b == '火山' then
			carTeleport(CFrame.new(-1588, 623, 1069));
		elseif b == '沼泽' then
			carTeleport(CFrame.new(-1216, 131, -822));
		elseif b == '家具店' then
			carTeleport(CFrame.new(486, 3, -1722));
		elseif b == '盒子车行' then
			carTeleport(CFrame.new(509, 3, -1458));
		elseif b == '雪山' then
			carTeleport(CFrame.new(1487, 415, 3259));
		elseif b == '连锁逻辑店' then
			carTeleport(CFrame.new(4615, 7, -794));
		elseif b == '鲍勃的小店' then
			carTeleport(CFrame.new(292, 8, -2544));
		elseif b == '画廊' then
			carTeleport(CFrame.new(5217, -166, 721));
		elseif b == '灵视神殿' then
			carTeleport(CFrame.new(-1608, 195, 928));
		elseif b == '怪人' then
			carTeleport(CFrame.new(1071, 16, 1141));
		elseif b == '小绿盒' then
			carTeleport(CFrame.new(-1667, 349, 1474));
		elseif b == '滑雪小屋' then
			carTeleport(CFrame.new(1244, 59, 2290));
		elseif b == '黄金木洞穴' then
			carTeleport(CFrame.new(-1080, -5, -942));
		elseif b == '鲨鱼斧合成' then
			carTeleport(CFrame.new(330.259735, 45.7998505, 1943.30823, 0.972010553, -8.07546598e-08, 0.234937176,
				7.63610259e-08, 1, 2.77986647e-08, -0.234937176, -9.08055142e-09, 0.972010553))
		elseif b == '小鸟斧头' then
			carTeleport(CFrame.new(4813.1, 33.5, -978.8));
		elseif b == '灯塔' then
			carTeleport(CFrame.new(1464.8, 356.3, 3257.2));
		else
			if b == '回家' then
				for i, v in pairs(game.Workspace.Properties:GetChildren()) do
					if v.Owner.Value == game.Players.LocalPlayer then
						carTeleport(v.OriginSquare.CFrame + Vector3.new(0, 10, 0))
					end
				end
			end
		end
	end
})
--斧头
SectionAxe:Button({
	Title = "掉落所有斧头",
	Desc = "自动",
	Callback = function()
		droptool(lp.Character:FindFirstChild("HumanoidRootPart").Position)
	end
})
SectionAxe:Button({
	Title = "捡起所有斧头",
	Desc = "自动",
	Callback = function()
		for a, b in pairs(workspace.PlayerModels:GetChildren()) do
			if b:FindFirstChild("Owner") and b.Owner.Value == game.Players.LocalPlayer.Name then
				if b:FindFirstChild("Type") and b.Type.Value == "Tool" then
					game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(b, 'Pick up tool')

				end
			end
		end
	end
})

local run = false
SectionAxe:Toggle({
	Title = "自动丢弃斧头",
	Desc = "自动",
	Value = false,
	Callback = function(state)
		run = state
		if state then
			while run do
				droptool(lp.Character:FindFirstChild("HumanoidRootPart").Position)
				task.wait(0.1)
			end       
		end
	end
})

local run1 = false
SectionAxe:Toggle({
	Title = "自动捡起斧头",
	Desc = "自动",
	Value = false,
	Callback = function(state)
		run1 = state
		if state then
			while run1 do
				for a, b in pairs(workspace.PlayerModels:GetChildren()) do
					if b:FindFirstChild("Owner") and b.Owner.Value == game.Players.LocalPlayer.Name then
						if b:FindFirstChild("Type") and b.Type.Value == "Tool" then
							game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(b, 'Pick up tool')
						end
					end
				end
				task.wait(0.1)
			end       
		end
	end
})
--基地
Sectionjd:Button({
	Title = "点击土地免费获得",
	Desc = "点击一个土地",
	Callback = function()
		local freeland = nil
		WindUI:Notify({
			Title = "德与中山",
			Content = "点击一块土地",
			Icon = "tree-pine",
			IconThemed = true,
			Duration = 5,
		})

		if ClickToSelectClick then
			ClickToSelectClick:Disconnect()
		end

		ClickToSelectClick = Mouse.Button1Up:Connect(function()
			local Clicked = Mouse.Target  
			if Clicked and Clicked.Parent and tostring(Clicked.Parent.Name) == "Property" then
				local v = Clicked.Parent        
				if v:FindFirstChild("Owner") and v.Owner.Value == nil then
					game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(v, v.OriginSquare.OriginCFrame.Value.p + Vector3.new(0, 3, 0))
					wait(0.5)
					freeland = true
					ClickToSelectClick:Disconnect()
				else
					WindUI:Notify({
						Title = "德与中山",
						Content = "这块土地有主人了",
						Icon = "tree-pine",
						IconThemed = true,
						Duration = 5,
					})
					ClickToSelectClick:Disconnect()
				end
			end
		end)
	end
})

Sectionjd:Button({
	Title = "免费获得土地",
	Desc = "免费",
	Callback = function()
		for a, b in pairs(workspace.Properties:GetChildren()) do
			if b:FindFirstChild("Owner") and b:FindFirstChild("OriginSquare") and b.Owner.Value == nil then
				game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(
					b,
					b.OriginSquare.OriginCFrame.Value.p + Vector3.new(0, 3, 0)
				)
				wait(0.5)

				Instance.new('RemoteEvent', game:GetService('ReplicatedStorage').Interaction).Name = "Ban"

				for i, v in pairs(game.Workspace.Properties:GetChildren()) do
					if v.Owner.Value == game.Players.LocalPlayer then
						game.Players.LocalPlayer.Character.Humanoid.Jump = true
						wait(0.1)
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
							v.OriginSquare.CFrame + Vector3.new(0, 10, 0)
						game.Players.LocalPlayer.Character.Humanoid.Jump = true
						wait(0.1)
					end
				end
			end
		end
	end
})

Sectionjd:Button({
	Title = "最大土地",
	Desc = "免费",
	Callback = function()
		for i, v in pairs(game:GetService("Workspace").Properties:GetChildren()) do
			if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
				local base = v
				local square = v.OriginSquare
			end
		end
		local function makebase(pos)
			game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(base, pos)
		end
		local spos = square.Position
		makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z))
		makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z))
		makebase(CFrame.new(spos.X, spos.Y, spos.Z + 40))
		makebase(CFrame.new(spos.X, spos.Y, spos.Z - 40))
		makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z + 40))
		makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z - 40))
		makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z + 40))
		makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z - 40))
		makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z))
		makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z))
		makebase(CFrame.new(spos.X, spos.Y, spos.Z + 80))
		makebase(CFrame.new(spos.X, spos.Y, spos.Z - 80))
		makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z + 80))
		makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z - 80))
		makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z + 80))
		makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z - 80))
		makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z + 80))
		makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z + 80))
		makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z + 40))
		makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z - 40))
		makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z + 40))
		makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z - 40))
		makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z - 80))
		makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z - 80))
	end
})
--传送物品

Sectionchuanson:Button({
	Title = "放置传送点",
	Desc = "传送点",
	Callback = function()
		for _, part in pairs(workspace:GetChildren()) do
			if part.Name == "waypoint" then
				part:Destroy()
			end        
		end

		local waypoint = Instance.new("Part")
		waypoint.Name = "waypoint"
		waypoint.BrickColor = BrickColor.new("Bright red")
		waypoint.Material = Enum.Material.Neon
		waypoint.Shape = "Ball"
		waypoint.Transparency = 0.7
		waypoint.Size = Vector3.new(2, 2, 2)
		waypoint.Anchored = true
		waypoint.CanCollide = false        
		waypoint.Position = hrp.Position + Vector3.new(0, 3, 0)
		waypoint.Parent = workspace

		WindUI:Notify({
			Title = "放置传送点",
			Content = "放置完成",
			Icon = "notepad-text",
			IconThemed = true,
			Duration = 5  
		})        
	end
})


--木头
Section5:Toggle({
	Title = "拖拽器",
	Desc = "拖拽",
	Value = false,
	Callback = function(state)
		if state then
			workspace.ChildAdded:connect(function(Dragger)
				if tostring(Dragger) == 'Dragger' then
					local BodyGyro = Dragger:WaitForChild 'BodyGyro'
					local BodyPosition = Dragger:WaitForChild 'BodyPosition'
					repeat
						game:GetService 'RunService'.Stepped:wait()
					until workspace:FindFirstChild 'Dragger'
					BodyPosition.P = 120000
					BodyPosition.D = 1000
					BodyPosition.maxForce = Vector3.new(1, 1, 1) * 1000000
					BodyGyro.maxTorque = Vector3.new(1, 1, 1) * 200
					BodyGyro.P = 1200
					BodyGyro.D = 140
				end
			end)
		else
			workspace.ChildAdded:connect(function(Dragger)
				if tostring(Dragger) == 'Dragger' then
					local BodyGyro = Dragger:WaitForChild 'BodyGyro'
					local BodyPosition = Dragger:WaitForChild 'BodyPosition'
					repeat
						game:GetService 'RunService'.Stepped:wait()
					until workspace:FindFirstChild 'Dragger'
					BodyPosition.P = 10000
					BodyPosition.D = 800
					BodyPosition.maxForce = Vector3.new(17000, 17000, 17000)
					BodyGyro.maxTorque = Vector3.new(200, 200, 200)
					BodyGyro.P = 1200
					BodyGyro.D = 140
				end
			end)
		end
	end
})
Section5:Button({
	Title = "传送木头",
	Desc = "传送所有你的木头",
	Callback = function()
		GetTree()
	end
})

Section5:Button({
	Title = "传送木板",
	Desc = "传送所有你的木板",
	Callback = function()
		GetLog()
	end
})

Section5:Button({
	Title = "卖木头",
	Desc = "卖你的木头",
	Callback = function()
		local oldpos = lp.Character.HumanoidRootPart.CFrame
		for i, v in next, game:GetService("Workspace").LogModels:GetChildren() do
			if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
				Teleport(v.WoodSection.CFrame)
				spawn(function()
					for i2, v2 in next, v:GetChildren() do
						if v2.Name == "WoodSection" then
							local FreezeWood = Instance.new("BodyVelocity", v2)
							FreezeWood.Velocity = Vector3.new(0, 0, 0)
							FreezeWood.P = 100000
							spawn(function()
								for i = 1, 50 do
									game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
									v:PivotTo(CFrame.new(314.54, -0.5, 86.823))
									v2.CFrame = CFrame.new(314.54, -0.5, 86.823)
									game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
									game:GetService("RunService").Heartbeat:wait()
								end
							end)
							task.wait(1)
						end
					end
				end)
				task.wait(2)
			end
		end
		Teleport(oldpos)
	end
})

Section5:Button({
	Title = "卖木板",
	Desc = "卖你的木板",
	Callback = function()
		for _, Plank in pairs(game.Workspace.PlayerModels:GetChildren()) do
			if Plank.Name == "Plank" and Plank:FindFirstChild("Owner") then
				if Plank.Owner.Value == game.Players.LocalPlayer then
					for i, v in pairs(Plank:GetChildren()) do
						if v.Name == "WoodSection" then
							spawn(function()
								for i = 1, 100 do
									wait()
									v.CFrame = CFrame.new(Vector3.new(315, -0.296, 85.791)) *
										CFrame.Angles(math.rad(90), 0, 0)
								end
							end)
						end
					end
					spawn(function()
						for i = 1, 100 do
							wait()
							game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Plank)
						end
					end)
				end
			end
		end
	end
})


Section5:Divider()

Section5:Dropdown({
	Title = "树列表",
	Desc = "带来树列表",
	Values = {"普通树", '幻影木', "沼泽黄金", "樱花", "蓝木", "冰木", "火山木", "橡木", "巧克力木",
		"白桦木", "黄金木", "雪地松", "僵尸木", "大巧克力树", "椰子树", '南瓜木', '幽灵木'},
	Value = "选择树",
	Callback = function(b)
		if b == '普通树' then
			dyzh.cuttreeselect = "Generic"
		elseif b == '沼泽黄金' then
			dyzh.cuttreeselect = "GoldSwampy"
		elseif b == '樱花' then
			dyzh.cuttreeselect = "Cherry"
		elseif b == '蓝木' then
			dyzh.cuttreeselect = "CaveCrawler"
		elseif b == '冰木' then
			dyzh.cuttreeselect = "Frost"
		elseif b == '火山木' then
			dyzh.cuttreeselect = "Volcano"
		elseif b == '橡木' then
			dyzh.cuttreeselect = "Oak"
		elseif b == '巧克力木' then
			dyzh.cuttreeselect = "Walnut"
		elseif b == '白桦木' then
			dyzh.cuttreeselect = "Birch"
		elseif b == '黄金木' then
			dyzh.cuttreeselect = "SnowGlow"
		elseif b == '雪地松' then
			dyzh.cuttreeselect = "Pine"
		elseif b == '僵尸木' then
			dyzh.cuttreeselect = "GreenSwampy"
		elseif b == '大巧克力树' then
			dyzh.cuttreeselect = "Koa"
		elseif b == '椰子树' then
			dyzh.cuttreeselect = "Palm"
		elseif b == '幽灵木' then
			dyzh.cuttreeselect = "Spooky"
		elseif b == '南瓜木' then
			dyzh.cuttreeselect = "SpookyNeon"
		elseif b == '幻影木' then
			dyzh.cuttreeselect = "LoneCave"
		end
	end
})

Section5:Input({
	Title = "带来树数量",
	Desc = "数量",
	Value = "1",
	Placeholder = "数量",
	Callback = function(text)
		dyzh.bringamount = tonumber(text)
	end
})


Section5:Button({
	Title = "带来树",
	Desc = "带来",
	Callback = function()
		dyzh.bringtree = true
		dyzh.treecutset = lp.Character.HumanoidRootPart.CFrame
		task.wait(0.2)
		for i = 1, dyzh.bringamount do
			if dyzh.bringtree == true then
				task.wait()
				bringTree(dyzh.cuttreeselect)
			end
		end
		task.wait()   
	end
})

--环境
Sectionhuanjin:Toggle({
	Title = "永久白天",
	Desc = "永远",
	Value = false,
	Callback = function(state)
		if state then
			dyzh.awaysday = true
			while task.wait() do
				if dyzh.awaysday == true then
					game:GetService('Lighting').TimeOfDay = ('12:00:00');
				end
			end
		else
			dyzh.awaysday = false
		end
	end
})

Sectionhuanjin:Toggle({
	Title = "永久黑天",
	Desc = "永远",
	Value = false,
	Callback = function(state)
		if state then
			dyzh.awaysdnight = true
			while task.wait() do
				if dyzh.awaysdnight == true then
					game:GetService('Lighting').TimeOfDay = ('2:00:00');
				end
			end
		else
			dyzh.awaysdnight = false
		end
	end
})

Sectionhuanjin:Toggle({
	Title = "去除阴影",
	Desc = "阴影",
	Value = false,
	Callback = function(state)
		if state then
			game:GetService("Lighting").GlobalShadows = false
		else
			game:GetService("Lighting").GlobalShadows = true
		end
	end
})

Sectionhuanjin:Button({
	Title = "圣诞节地图",
	Desc = "地图",
	Callback = function()
		for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
			if v.Name == "Ground" then
				v.BrickColor = BrickColor.new("White")
				v.Material = "Sand"
			end
			if v.Name == "Slate" then
				v.BrickColor = BrickColor.new("White")
			end
			if v.Name == "LeafPart" then
				v.BrickColor = BrickColor.new("White")
				v.Material = "Sand"
			end
			if v.Name == "Sand" then
				v.BrickColor = BrickColor.new("White")
			end
		end
	end
})

Sectionhuanjin:Button({
	Title = "秋天地图",
	Desc = "地图",
	Callback = function()
		for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
			if v.Name == "Ground" then
				v.BrickColor = BrickColor.new("Burnt Sienna")
				v.Material = "Sand"
			end
			if v.Name == "Slate" then
				v.BrickColor = BrickColor.new("Burnt Sienna")
			end
			if v.Name == "LeafPart" then
				v.BrickColor = BrickColor.new("Burnt Sienna")
				v.Material = "Sand"
			end
		end
	end
})

Sectionhuanjin:Button({
	Title = "万圣节地图",
	Desc = "地图",
	Callback = function()
		loadstring(game:HttpGet 'https://raw.githubusercontent.com/silentben8x/Silent/main/Halloween')()
	end
})

Sectionhuanjin:Button({
	Title = "糖果地图",
	Desc = "地图",
	Callback = function()
		loadstring(game:HttpGet'https://raw.githubusercontent.com/silentben9x/silentwinningmain/main/Willy%20Wonker%20Map%20Theme')()
	end
})

Sectionhuanjin:Button({
	Title = "删除灵视神殿石头",
	Desc = "地图",
	Callback = function()
		workspace.Region_Mountainside.BoulderRegen.Boulder:Destroy()
		workspace.Region_Mountainside.Door.Door:Destroy()
	end
})

Sectionhuanjin:Toggle({
	Title = "删除岩浆",
	Desc = "地图",
	Value = false,
	Callback = function(state)
		for i, v in pairs(game.Workspace.Region_Volcano:GetDescendants()) do
			if v.Name == "TouchInterest" then
				v:Destroy()
			elseif v.Name == "Lava" then
				for n, k in pairs(v:GetChildren()) do
					if k:IsA("Part") then
						if state == true then
							k.Transparency = 1
						else
							k.Transparency = 0
						end
					end
				end
			end
		end
	end
})

Sectionhuanjin:Toggle({
	Title = "删除水",
	Desc = "地图",
	Value = false,
	Callback = function(state)
		for _, v in pairs(game.Workspace.Water:GetChildren()) do
			if v.Name == "Water" then
				if state then
					v.Transparency = 1;
				else
					v.Transparency = 0;
				end
			end
		end
	end
})

Sectionhuanjin:Toggle({
	Title = "去除雾",
	Desc = "地图",
	Value = false,
	Callback = function(state)
		if state then
			dyzh.nofog = true
			while task.wait() do
				if dyzh.nofog == true then
					game:GetService('Lighting').FogEnd = 1000000;
				end
			end
		else
			dyzh.nofog = false
		end
	end
})

Sectionhuanjin:Toggle({
	Title = "水上行走",
	Desc = "地图",
	Value = false,
	Callback = function(state)
		for i, v in next, game.workspace.Water:children() do
			if v.ClassName == 'Part' then
				dyzh.waterwalk, v.CanCollide = state, state;
			end
		end
		for i, v in next, game:GetService('Workspace').Bridge.VerticalLiftBridge.WaterModel:children() do
			if v:IsA('BasePart') then
				v.CanCollide = state;
			end
		end
	end
})

local l
Sectionautobuy:Dropdown({
	Title = "物品列表",
	Desc = "购买",
	Values = {'按钮', '控制杆', '电线', '4/4x1木楔', '3/4x1木楔', '2/4x1木楔', '1/4X1木楔', '3/3x1木楔',
		'2/3x1木楔', '1/3x1木楔', '2/2x1木楔', '1/2x1木楔', '1/1x1木楔', '篱笆', '压力板',
		'1/3木楔', '锯木机01', '锯木机02L', '波纹墙角立柱', '传送带', '普通凳子',
		'倾斜传送带', '3/4木楔', '2/3木楔', '光滑的墙', '光滑墙角', '普通锯木厂', '4/4木楔',
		'光滑墙立柱', '篱笆角', '矮篱笆角', '矮波纹墙', '长桌', '矮篱笆', '光滑墙角立柱',
		'破旧锯木厂', '普通门', '矮光滑墙', '工作灯', '弯传送带', '切换传送带', '宽敞门',
		'3/3木楔', '400元小汽车', '波纹墙立柱', '锯木机02', '漏斗式传送带', '小型地板',
		'小型瓷砖', '矮波纹墙角', '波纹墙', '大型地板', '微型瓷砖', '微型地板', '1/1木楔',
		'左转直式传送带', '银斧头', '切割机', '基础斧头', '右转传送带', '普通斧头',
		'转向传送带支架', '传送带支架', '波纹墙角立柱', '楼梯', '陡峭楼梯', '钢斧',
		'标志杆', '梯子', '大型瓷砖', '瓷砖', '硬化斧', '半截门', '木头清扫机',
		'光滑墙立柱', '沙子袋', '小型拖车', '531式拖车', '小汽车XL', '大卡车', '长沙发',
		'洗碗机', '薄柜子', '冰箱', '火炉', '马桶', '双人沙发', '床', '落地灯', '台灯',
		'微型玻璃板', '小型玻璃板', '玻璃板', '大型玻璃板', '玻璃门', '琥珀色冰柱灯串',
		'红色冰柱灯串', '绿色冰柱灯串', '蓝色冰柱灯串', '烟花发射器', '惊悚冰柱灯串',
		'单人沙发', '双人床', '灯泡', '工作台面', '薄工作台面', '带水槽的工作台面',
		'照明灯', '墙灯', '橱柜角', '宽橱柜角', '橱柜', '炸药', '毛毛虫软糖', '未知标题',
		'困扰装饰画', '户外水彩素描', '阴郁的黄昏海景', '北极灯串', '菠萝画',
		'孤独的长颈鹿', '信号维持器', '与门', '异与门', '木材检测器', '按钮', '压力板',
		'OR门', '拉杆', '信号延时器', '信号变换器', '激光', '激光探测器', '舱门',
		'橙色发光线', '绿色发光线', '黄色发光线', '白色发光线', '紫色发光线',
		'红色发光线', '青色发光线', '蓝色发光线', '定时开关'},
	Value = "请选择",
	Multi = false,
	AllowNone = false,
	Callback = function(selected)
		if selected == '按钮' then
			l = 'Button0'
		elseif selected == '控制杆' then
			l = 'Lever0'
		elseif selected == '电线' then
			l = 'Wire'
		elseif selected == '4/4x1木楔' then
			l = 'Wedge1_Thin'
		elseif selected == '3/4x1木楔' then
			l = 'Wedge2_Thin'
		elseif selected == '2/4x1木楔' then
			l = 'Wedge3_Thin'
		elseif selected == '1/4x1木楔' then
			l = 'Wedge4_Thin'
		elseif selected == '3/3x1木楔' then
			l = 'Wedge5_Thin'
		elseif selected == '2/3x1木楔' then
			l = 'Wedge6_Thin'
		elseif selected == '1/3x1木楔' then
			l = 'Wedge7_Thin'
		elseif selected == '2/2x1木楔' then
			l = 'Wedge8_Thin'
		elseif selected == '1/2x1木楔' then
			l = 'Wedge9_Thin'
		elseif selected == '1/1x1木楔' then
			l = 'Wedge10_Thin'
		elseif selected == '篱笆' then
			l = 'Wall3TallThin'
		elseif selected == '压力板' then
			l = 'PressurePlate'
		elseif selected == '1/3木楔' then
			l = 'Wedge7'
		elseif selected == '锯木机01' then
			l = 'Sawmill3'
		elseif selected == '锯木机02L' then
			l = 'Sawmill4L'
		elseif selected == '波纹墙角立柱' then
			l = 'Wall1ShortCorner'
		elseif selected == '传送带' then
			l = 'StraightConveyor'
		elseif selected == '普通凳子' then
			l = 'Chair1'
		elseif selected == '倾斜传送带' then
			l = 'TiltConveyor'
		elseif selected == '3/4木楔' then
			l = 'Wedge2'
		elseif selected == '2/3木楔' then
			l = 'Wedge6'
		elseif selected == '光滑的墙' then
			l = "Wall2"
		elseif selected == '光滑墙角' then
			l = 'Wall2TallCorner'
		elseif selected == '普通锯木厂' then
			l = 'Sawmill2'
		elseif selected == '4/4木楔' then
			l = 'Wedge1'
		elseif selected == '光滑墙立柱' then
			l = 'Wall2Short'
		elseif selected == '篱笆角' then
			l = 'Wall3TallCorner'
		elseif selected == '矮篱笆角' then
			l = 'Wall3Corner'
		elseif selected == '矮波纹墙' then
			l = 'Wall1Thin'
		elseif selected == '长桌' then
			l = 'Table2'
		elseif selected == '矮篱笆' then
			l = 'Wall3'
		elseif selected == '光滑墙角立柱' then
			l = 'Wall2ShortCorner'
		elseif selected == '破旧锯木厂' then
			l = 'Sawmill'
		elseif selected == '普通门' then
			l = 'Door1'
		elseif selected == '矮光滑墙' then
			l = 'Wall2'
		elseif selected == '工作灯' then
			l = 'WorkLight'
		elseif selected == '弯传送带' then
			l = 'TightTurnConveyor'
		elseif selected == '切换传送带' then
			l = 'ConveyorSwitch'
		elseif selected == '宽敞门' then
			l = 'Door3'
		elseif selected == '3/3木楔' then
			l = 'Wedge5'
		elseif selected == '400元小汽车' then
			l = 'UtilityTruck'
		elseif selected == '波纹墙立柱' then
			l = 'Wall1ShortThin'
		elseif selected == '锯木机02' then
			l = 'Sawmill4L'
		elseif selected == '漏斗式传送带' then
			l = 'ConveyorFunnel'
		elseif selected == '小型地板' then
			l = 'Floor1Small'
		elseif selected == '小型瓷砖' then
			l = 'Floor2Small'
		elseif selected == '矮波纹墙角' then
			l = 'Wall1Corner'
		elseif selected == '波纹墙' then
			l = 'Wall1Tall'
		elseif selected == '大型地板' then
			l = 'Floor1Large'
		elseif selected == '微型瓷砖' then
			l = 'Floor2Tiny'
		elseif selected == '微型地板' then
			l = 'Floor1Tiny'
		elseif selected == '1/1木楔' then
			l = 'Wedge10'
		elseif selected == '左转直式传送带' then
			l = 'StraightSwitchConveyorLeft'
		elseif selected == '银斧头' then
			l = 'SilverAxe'
		elseif selected == '切割机' then
			l = 'ChopSaw'
		elseif selected == '基础斧头' then
			l = 'BasicHatchet'
		elseif selected == '右转传送带' then
			l = 'StraightSwitchConveyorRight'
		elseif selected == '普通斧头' then
			l = 'Axe1'
		elseif selected == '转向传送带支架' then
			l = 'TightTurnConveyorSupports'
		elseif selected == '传送带支架' then
			l = 'ConveyorSupports'
		elseif selected == '波纹墙角立柱' then
			l = 'Wall1ShortCorner'
		elseif selected == '楼梯' then
			l = 'Stair2'
		elseif selected == '陡峭楼梯' then
			l = 'Stair1'
		elseif selected == '钢斧' then
			l = 'Axe2'
		elseif selected == '标志杆' then
			l = 'Post'
		elseif selected == '梯子' then
			l = 'Ladder1'
		elseif selected == '大型瓷砖' then
			l = 'Floor2Large'
		elseif selected == '瓷砖' then
			l = 'Floor2'
		elseif selected == '硬化斧' then
			l = 'Axe3'
		elseif selected == '半截门' then
			l = 'Door2'
		elseif selected == '木头清扫机' then
			l = 'LogSweeper'
		elseif selected == '光滑墙立柱' then
			l = 'Wall2ShortThin'
		elseif selected == '沙子袋' then
			l = 'BagOfSand'
		elseif selected == '小型拖车' then
			l = 'SmallTrailer'
		elseif selected == '531式拖车' then
			l = 'Trailer2'
		elseif selected == '小汽车XL' then
			l = 'UtilityTruck2'
		elseif selected == '大卡车' then
			l = 'Pickup1'
		elseif selected == '长沙发' then
			l = 'Seat_Couch'
		elseif selected == '洗碗机' then
			l = 'Dishwasher'
		elseif selected == '薄柜子' then
			l = 'Cabinet1Thin'
		elseif selected == '冰箱' then
			l = 'Refridgerator'
		elseif selected == '火炉' then
			l = 'Stove'
		elseif selected == '马桶' then
			l = 'Toilet'
		elseif selected == '双人沙发' then
			l = 'Seat_Loveseat'
		elseif selected == '床' then
			l = 'Bed1'
		elseif selected == '落地灯' then
			l = 'FloorLamp1'
		elseif selected == '台灯' then
			l = 'Lamp1'
		elseif selected == '微型玻璃板' then
			l = 'GlassPane1'
		elseif selected == '小型玻璃板' then
			l = 'GlassPane2'
		elseif selected == '玻璃板' then
			l = 'GlassPane3'
		elseif selected == '大型玻璃板' then
			l = 'GlassPane4'
		elseif selected == '玻璃门' then
			l = 'GlassDoor1'
		elseif selected == '琥珀色冰柱灯串' then
			l = 'IcicleWireAmber'
		elseif selected == '红色冰柱灯串' then
			l = 'IcicleWireRed'
		elseif selected == '绿色冰柱灯串' then
			l = 'IcicleWireGreen'
		elseif selected == '蓝色冰柱灯串' then
			l = 'IcicleWireBlue'
		elseif selected == '烟花发射器' then
			l = 'FireworkLauncher'
		elseif selected == '惊悚冰柱灯串' then
			l = 'IcicleWireHalloween'
		elseif selected == '单人沙发' then
			l = 'Seat_Armchair'
		elseif selected == '双人床' then
			l = 'Bed2'
		elseif selected == '灯泡' then
			l = 'LightBulb'
		elseif selected == '工作台面' then
			l = 'CounterTop1'
		elseif selected == '薄工作台面' then
			l = 'CounterTop1Thin'
		elseif selected == '带水槽的工作台面' then
			l = 'CounterTop1Sink'
		elseif selected == '照明灯' then
			l = 'WallLight2'
		elseif selected == '墙灯' then
			l = 'WallLight1'
		elseif selected == '橱柜角' then
			l = 'Cabinet1CornerTight'
		elseif selected == '宽橱柜角' then
			l = 'Cabinet1CornerWide'
		elseif selected == '橱柜' then
			l = 'Cabinet1'
		elseif selected == '炸药' then
			l = 'Dynamite'
		elseif selected == '毛毛虫软糖' then
			l = 'CanOfWorms'
		elseif selected == '未知标题' then
			l = 'Painting1'
		elseif selected == '困扰装饰画' then
			l = 'Painting2'
		elseif selected == '户外水彩素描' then
			l = 'Painting3'
		elseif selected == '阴郁的黄昏海景' then
			l = 'Painting6'
		elseif selected == '北极灯串' then
			l = 'Painting7'
		elseif selected == '菠萝画' then
			l = 'Painting8'
		elseif selected == '孤独的长颈鹿' then
			l = 'Painting9'
		elseif selected == '信号维持器' then
			l = 'SignalSustain'
		elseif selected == '与门' then
			l = 'GateAND'
		elseif selected == '异与门' then
			l = 'GateXOR'
		elseif selected == '木材检测器' then
			l = 'WoodChecker'
		elseif selected == 'OR门' then
			l = 'GateOR'
		elseif selected == '拉杆' then
			l = 'Lever0'
		elseif selected == '信号延时器' then
			l = 'SignalDelay'
		elseif selected == '信号变换器' then
			l = 'GateNOT'
		elseif selected == '激光' then
			l = 'Laser'
		elseif selected == '激光探测器' then
			l = 'LaserReceiver'
		elseif selected == '舱门' then
			l = 'Hatch'
		elseif selected == '橙色发光线' then
			l = 'NeonWireOrange'
		elseif selected == '绿色发光线' then
			l = 'NeonWireGreen'
		elseif selected == '黄色发光线' then
			l = 'NeonWireYellow'
		elseif selected == '白色发光线' then
			l = 'NeonWireWhite'
		elseif selected == '紫色发光线' then
			l = 'NeonWireViolet'
		elseif selected == '红色发光线' then
			l = 'NeonWireRed'
		elseif selected == '青色发光线' then
			l = 'NeonWireCyan'
		elseif selected == '蓝色发光线' then
			l = 'NeonWireBlue'
		elseif selected == '定时开关' then
			l = 'ClockSwitch'
		end
	end
})

Sectionautobuy:Input({
	Title = "购买数量",
	Desc = "数量",
	Value = "1",
	Placeholder = "数量",
	Callback = function(text)
		dyzh.autobuyamount = tonumber(text)
	end
})

Sectionautobuy:Button({
	Title = "开始购买",
	Desc = "开始购买",
	Callback = function()
		dyzh.autobuystop = false
		dyzh.autobuyset = lp.Character.HumanoidRootPart.CFrame
		autobuy(l, dyzh.autobuyamount)
		task.wait()
		Teleport(dyzh.autobuyset)
	end
})