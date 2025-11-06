-- ================  ================
function Antihook()
    return "Hook"
end

hookfunction(Antihook, function()
    return "操你妈"
end)

hookfunction(game.HttpGet, print)

if not isfunctionhooked(Antihook) or not isfunctionhooked(game.HttpGet) then
    game:shutdown("你抓你老妈呀")
    while true do end
end

restorefunction(game.HttpGet)

if isfunctionhooked(game.HttpGet) or isfunctionhooked(request) or isfunctionhooked(tostring) then
    game:shutdown("😂😂😂")
    while true do end
end


local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()


-- ================ 2.Ul背景…… ================
local Window = WindUI:CreateWindow({
        Title = "神秘人",
        Icon = "rbxassetid://4483362748",
        IconTransparency = 0.5,
        IconThemed = true,
        Author = "作者:神秘",
        Folder = "CloudHub",
        Size = UDim2.fromOffset(400, 300),
        Transparent = true,
        User = {
            Enabled = true,
            Callback = function() print("clicked") end,
            Anonymous = false
        },
        SideBarWidth = 200,
        ScrollBarEnabled = true,
    })
    
-- ================ 3.窗口显示 ================
Window:EditOpenButton({
    Title = "神秘",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})


Window:Tag({
    Title = "7891",
    Color = Color3.fromHex("#30ff6a")
})


local Tabs = {
    Main = Window:Section({ Title = "破解版", Opened = true }),
}

local TabHandles = {
    Q = Tabs.Main:Tab({ Title = "德与中山脚本", Icon = "layout-grid" }),
    W = Tabs.Main:Tab({ Title = "Rb脚本破解版", Icon = "lock", Desc = "This tab is locked", Locked = true }),
    E = Tabs.Main:Tab({ Title = "越HB FXM破解版", Icon = "lock", Desc = "This tab is locked", Locked = true }),
    R = Tabs.Main:Tab({ Title = "Alienx破解版", Icon = "lock", Desc = "This tab is locked", Locked = true }),
    T = Tabs.Main:Tab({ Title = "78", Icon = "lock", Desc = "This tab is locked", Locked = true }),
    Y = Tabs.Main:Tab({ Title = "78", Icon = "lock", Desc = "This tab is locked", Locked = true }),
    U = Tabs.Main:Tab({ Title = "78", Icon = "lock", Desc = "This tab is locked", Locked = true }),
}

Paragraph = TabHandles.Q:Paragraph({
    Title = "德与中山破解版使用教程",
    Desc = "这些脚本要在需要的服务器启动，不要在没有用的服务器下使用不了",
    Image = "palette",
    ImageSize = 45,
    Color = "White"
})

Button = TabHandles.Q:Button({
    Title = "木材大亨",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ihsihwnjiz/different/main/%E6%9C%A8%E6%9D%90%E5%A4%A7%E4%BA%A8.lua"))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.Q:Button({
    Title = "武器库",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ihsihwnjiz/different/main/%E6%AD%A6%E5%99%A8%E5%BA%93.lua"))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.Q:Button({
    Title = "生存99夜",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ihsihwnjiz/different/main/%E7%94%9F%E5%AD%9899%E5%A4%A9.lua"))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.Q:Button({
    Title = "种植花园",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ihsihwnjiz/different/main/%E7%A7%8D%E6%A4%8D%E8%8A%B1%E5%9B%AD.lua"))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.Q:Button({
    Title = "终极战场",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ihsihwnjiz/different/main/%E7%BB%88%E6%9E%81%E6%88%98%E5%9C%BA.lua"))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.Q:Button({
    Title = "脑叶公司",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ihsihwnjiz/different/main/%E8%84%91%E5%8F%B6%E5%85%AC%E5%8F%B8.lua"))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.Q:Button({
    Title = "零售大亨",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ihsihwnjiz/different/main/%E9%9B%B6%E5%94%AE%E5%A4%A7%E4%BA%A8.lua"))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.Q:Button({
    Title = "餐厅大亨",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ihsihwnjiz/different/main/%E9%A4%90%E5%8E%85%E5%A4%A7%E4%BA%A83.lua"))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

