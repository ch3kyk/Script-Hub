local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

local TARGET_USER_ID = 4912088123
local TARGET_USERNAME = "0_9XE4"

local SCRIPT_VERSION = "1.5"
local ChangelogEntries = {
    { version = "1.5", added = { "Local-Player section (Settings)", "Inf Zoom, Noclip Zoom, Full Bright", "FOV Changer" } },
    { version = "1.4", changed = { "TARGET_USER_ID → 4912088123" }, added = { "Subscription system", "Theme dropdown (Settings)", "Animated backdrop on inject", "Particles on subscription window" } },
    { version = "1.3", changed = { "Vertex, WhyHub, Ywxoscripts, Vape v4, DanHub, Srv9, Issue of items, Project Stark [BEST]" }, added = { "Argon Hub X (Blade Ball)" } },
    { version = "1.2", added = { "MM2: Spark Hub, Praixe Hub, By me", "Ronix, Project Stark (Blade Ball)" } }
}

local httpRequest = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request)

local function IsFollowing()
    if LocalPlayer.Name == TARGET_USERNAME or LocalPlayer.UserId == TARGET_USER_ID then
        return true
    end

    local myId = LocalPlayer.UserId
    local found = false

    local proxies = {
        "friends.roproxy.com",
        "friends.rblx.trade", 
        "friends.roblox.com"
    }

    for _, proxy in ipairs(proxies) do
        if found then break end
        local success, result = pcall(function()
            local cursor = ""
            repeat
                local url = "https://" .. proxy .. "/v1/users/" .. myId .. "/followings?limit=100&sortOrder=Desc"
                if cursor ~= "" then
                    url = url .. "&cursor=" .. cursor
                end
                local response
                if httpRequest then
                    local resp = httpRequest({Url = url, Method = "GET"})
                    if resp then response = resp.Body end
                else
                    response = game:HttpGet(url)
                end
                if not response or response == "" then return false end
                local data = HttpService:JSONDecode(response)
                if not data or not data.data then return false end
                for _, user in ipairs(data.data) do
                    if user.id == TARGET_USER_ID then
                        found = true
                        return true
                    end
                end
                cursor = data.nextPageCursor or ""
            until cursor == "" or found
            return false
        end)
        if success and result then found = true end
    end
    if found then return true end

    for _, proxy in ipairs(proxies) do
        if found then break end
        local success, result = pcall(function()
            local cursor = ""
            repeat
                local url = "https://" .. proxy .. "/v1/users/" .. TARGET_USER_ID .. "/followers?limit=100&sortOrder=Desc"
                if cursor ~= "" then
                    url = url .. "&cursor=" .. cursor
                end
                local response
                if httpRequest then
                    local resp = httpRequest({Url = url, Method = "GET"})
                    if resp then response = resp.Body end
                else
                    response = game:HttpGet(url)
                end
                if not response or response == "" then return false end
                local data = HttpService:JSONDecode(response)
                if not data or not data.data then return false end
                for _, user in ipairs(data.data) do
                    if user.id == myId then
                        found = true
                        return true
                    end
                end
                cursor = data.nextPageCursor or ""
            until cursor == "" or found
            return false
        end)
        if success and result then found = true end
    end
    if found then return true end

    if httpRequest then
        local success, result = pcall(function()
            local resp = httpRequest({
                Url = "https://friends.roblox.com/v1/user/following-exists",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Accept"] = "application/json"
                },
                Body = HttpService:JSONEncode({targetUserIds = {TARGET_USER_ID}})
            })
            if resp and resp.Body then
                local data = HttpService:JSONDecode(resp.Body)
                if data and data.followings then
                    for _, entry in ipairs(data.followings) do
                        if entry.userId == TARGET_USER_ID and entry.isFollowing == true then
                            return true
                        end
                    end
                end
            end
            return false
        end)
        if success and result then return true end
    end

    local profileProxies = {
        "www.roproxy.com",
        "www.rblx.trade",
        "www.roblox.com"
    }
    for _, proxy in ipairs(profileProxies) do
        local success, result = pcall(function()
            local url = "https://" .. proxy .. "/users/" .. TARGET_USER_ID .. "/profile"
            local response
            if httpRequest then
                local resp = httpRequest({Url = url, Method = "GET"})
                if resp then response = resp.Body end
            else
                response = game:HttpGet(url)
            end
            if response then
                if string.find(response, "btn%-unfollow") or 
                   string.find(response, "icon%-unfollow") or
                   string.find(response, "already%-following") or
                   string.find(response, "UnfollowUser") then
                    return true
                end
            end
            return false
        end)
        if success and result then return true end
    end

    if httpRequest then
        local success, result = pcall(function()
            local resp = httpRequest({
                Url = "https://friends.roblox.com/v1/my/friends/count",
                Method = "GET"
            })
            if resp and resp.StatusCode == 200 then
                local resp2 = httpRequest({
                    Url = "https://friends.roblox.com/v1/users/" .. myId .. "/followings?limit=100&sortOrder=Desc",
                    Method = "GET"
                })
                if resp2 and resp2.Body then
                    if string.find(resp2.Body, tostring(TARGET_USER_ID)) then
                        return true
                    end
                end
            end
            return false
        end)
        if success and result then return true end
    end

    for _, proxy in ipairs(proxies) do
        local success, result = pcall(function()
            local url = "https://" .. proxy .. "/v1/users/" .. myId .. "/followings?limit=100&sortOrder=Desc"
            local response
            if httpRequest then
                local resp = httpRequest({Url = url, Method = "GET"})
                if resp then response = resp.Body end
            else
                response = game:HttpGet(url)
            end
            if response and string.find(response, tostring(TARGET_USER_ID)) then
                return true
            end
            return false
        end)
        if success and result then return true end
    end

    return false
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SubscriptionCheck"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

local BackdropFrame = Instance.new("Frame")
BackdropFrame.Name = "Backdrop"
BackdropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
BackdropFrame.Size = UDim2.new(2, 0, 2, 0)
BackdropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
BackdropFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BackdropFrame.BackgroundTransparency = 1
BackdropFrame.BorderSizePixel = 0
BackdropFrame.ZIndex = 0
BackdropFrame.Parent = ScreenGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 280)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local Stroke = Instance.new("UIStroke", MainFrame)
Stroke.Color = Color3.fromRGB(80, 80, 80)
Stroke.Thickness = 1

local ParticleLayer = Instance.new("Frame")
ParticleLayer.Name = "Particles"
ParticleLayer.Size = UDim2.new(1, 0, 1, 0)
ParticleLayer.Position = UDim2.new(0, 0, 0, 0)
ParticleLayer.BackgroundTransparency = 1
ParticleLayer.ClipsDescendants = true
ParticleLayer.ZIndex = 0
ParticleLayer.Parent = MainFrame
local ParticleList = {}
for i = 1, 28 do
    local p = Instance.new("Frame")
    p.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
    p.Position = UDim2.new(0, math.random(0, 420), 0, math.random(0, 280))
    p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    p.BorderSizePixel = 0
    p.ZIndex = 0
    local c = Instance.new("UICorner", p)
    c.CornerRadius = UDim.new(1, 0)
    p.BackgroundTransparency = math.random(40, 85) / 100
    p.Parent = ParticleLayer
    ParticleList[#ParticleList + 1] = {
        gui = p,
        x = p.Position.X.Offset + math.random() * 420,
        y = p.Position.Y.Offset + math.random() * 280,
        vy = -0.4 - math.random() * 0.6,
        vx = (math.random() - 0.5) * 0.3
    }
end
RunService.RenderStepped:Connect(function()
    if not ParticleLayer.Parent then return end
    for _, p in ipairs(ParticleList) do
        p.x = p.x + p.vx
        p.y = p.y + p.vy
        if p.y < -4 then p.y = 284 end
        if p.y > 284 then p.y = -4 end
        if p.x < -4 then p.x = 424 end
        if p.x > 424 then p.x = -4 end
        p.gui.Position = UDim2.new(0, math.floor(p.x), 0, math.floor(p.y))
    end
end)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "Subscription System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 30)
Subtitle.Position = UDim2.new(0, 0, 0, 55)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Subscribe to my account"
Subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
Subtitle.TextSize = 16
Subtitle.Font = Enum.Font.Gotham
Subtitle.Parent = MainFrame

local Note = Instance.new("TextLabel")
Note.Size = UDim2.new(1, -40, 0, 40)
Note.Position = UDim2.new(0, 20, 0, 95)
Note.BackgroundTransparency = 1
Note.Text = "My username: 0_9XE4"
Note.TextColor3 = Color3.fromRGB(140, 140, 140)
Note.TextSize = 14
Note.Font = Enum.Font.Gotham
Note.TextWrapped = true
Note.Parent = MainFrame

local SubscribeButton = Instance.new("TextButton")
SubscribeButton.Size = UDim2.new(0, 300, 0, 45)
SubscribeButton.Position = UDim2.new(0.5, -150, 0, 155)
SubscribeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SubscribeButton.Text = "I subscribed"
SubscribeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubscribeButton.TextSize = 18
SubscribeButton.Font = Enum.Font.GothamSemibold
SubscribeButton.BorderSizePixel = 0
SubscribeButton.Parent = MainFrame

Instance.new("UICorner", SubscribeButton).CornerRadius = UDim.new(0, 8)
local BtnStroke = Instance.new("UIStroke", SubscribeButton)
BtnStroke.Color = Color3.fromRGB(100, 100, 100)
BtnStroke.Thickness = 1

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 0, 215)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
StatusLabel.TextSize = 14
StatusLabel.Font = Enum.Font.GothamSemibold
StatusLabel.Parent = MainFrame

local DebugLabel = Instance.new("TextLabel")
DebugLabel.Size = UDim2.new(1, 0, 0, 20)
DebugLabel.Position = UDim2.new(0, 0, 0, 245)
DebugLabel.BackgroundTransparency = 1
DebugLabel.Text = ""
DebugLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
DebugLabel.TextSize = 11
DebugLabel.Font = Enum.Font.Gotham
DebugLabel.Parent = MainFrame

local TweenIn = TweenService:Create(BackdropFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), { BackgroundTransparency = 0.55 })
TweenIn:Play()

local function LoadScriptHub()
    ScreenGui:Destroy()

    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
       Name = "Script Hub | " .. SCRIPT_VERSION,
       LoadingTitle = "Script Hub",
       LoadingSubtitle = "By Yoshi",
       ConfigurationSaving = {
          Enabled = true,
          FolderName = "Yoshi_Configs",
          FileName = "ScriptHub"
       },
       KeySystem = false
    })

    local function Execute(code)
        if code and code ~= "" then
            local success, err = pcall(function()
                local func, err = loadstring(code)
                if func then func() else warn(err) end
            end)
            if not success then
                Rayfield:Notify({Title = "Error", Content = "Failed to execute script", Duration = 3})
            end
        end
    end

    local Tabs = {
        MVSD = Window:CreateTab("MVSD", 4483362458),
        BladeBall = Window:CreateTab("Blade Ball", 4483362458),
        Doors = Window:CreateTab("Doors", 4483362458),
        FTAP = Window:CreateTab("FTAP", 4483362458),
        MM2 = Window:CreateTab("MM2", 4483362458),
        MVS = Window:CreateTab("MVS", 4483362458),
        SkyWars = Window:CreateTab("SkyWars", 4483362458),
        STK = Window:CreateTab("STK", 4483362458),
        Universal = Window:CreateTab("Universal", 4483362458),
        ChangeLog = Window:CreateTab("Change Log", 4483362458),
        Settings = Window:CreateTab("Settings", 4483362458)
    }

    --- Change Log ---
    for _, entry in ipairs(ChangelogEntries) do
        local lines = { "Script Version: " .. entry.version, "" }
        if entry.changed and #entry.changed > 0 then
            table.insert(lines, "Changed:")
            for _, s in ipairs(entry.changed) do table.insert(lines, "[~] " .. s) end
        end
        if entry.added and #entry.added > 0 then
            table.insert(lines, "Added:")
            for _, s in ipairs(entry.added) do table.insert(lines, "[+] " .. s) end
        end
        Tabs.ChangeLog:CreateParagraph({ Title = "v" .. entry.version .. " Update Logs", Content = table.concat(lines, "\n") })
    end

    --- MVSD ---
    Tabs.MVSD:CreateSection("Murderers vs Sheriffs DUELS")
    Tabs.MVSD:CreateDropdown({Name = "No Keyless", Options = {"WhyHub [BEST]"}, Flag = "NK_MVSD", Callback = function(Option) _G.C_NK_MVSD = (Option[1] == "WhyHub [BEST]") and [[loadstring(game:HttpGet("https://rawscripts.net/raw/Murderers-VS-Sheriffs-DUELS-Legit-Bot-Rage-Bot-Crash-all-Kill-all-82594"))()]] end})
    Tabs.MVSD:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_NK_MVSD) end})
    Tabs.MVSD:CreateDropdown({Name = "Keyless", Options = {"Soon..."}, Flag = "K_MVSD", Callback = function() end})
    Tabs.MVSD:CreateButton({Name = "Inject Script", Callback = function() end})

    --- Blade Ball ---
    Tabs.BladeBall:CreateSection("Blade Ball")
    Tabs.BladeBall:CreateDropdown({Name = "No Keyless", Options = {"Argon Hub X [BEST]", ".2xr.", "Corolla Hub", "Soluna", "Sslkin", "Bedol Hub"}, Flag = "NK_BB", Callback = function(Option)
        local s = {["Argon Hub X [BEST]"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/Scriptsnets/BladeBall/refs/heads/main/Argon-Hub-X-BladeBall-OP.lua"))()]], [".2xr."] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/2xrW/return/refs/heads/main/hub"))()]], ["Corolla Hub"] = [[loadstring(game:HttpGet('https://raw.githubusercontent.com/7190000/Corolla-Hub/main/ch.lua'))()]], ["Soluna"] = [[loadstring(game:HttpGet("https://soluna-script.vercel.app/bladeball.lua",true))()]], ["Sslkin"] = [[getgenv().KEY = 'sosalkinhub<3'; loadstring(game:HttpGet('https://raw.githubusercontent.com/cbozovcloh781-hub/kfvweiyulfg2873f2/refs/heads/main/adkfayibhdbfajshfvaufvaeyuv_loaderkeyless'))()]], ["Bedol Hub"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))()]]}
        _G.C_NK_BB = s[Option[1]]
    end})
    Tabs.BladeBall:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_NK_BB) end})
    Tabs.BladeBall:CreateDropdown({Name = "Keyless", Options = {"Project Stark [BEST]", "Ronix"}, Flag = "K_BB", Callback = function(Option)
        local s = {["Project Stark [BEST]"] = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Blade-Ball-Project-Stark-Free-Hub-59919"))()]], ["Ronix"] = [[loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fda9babd071d6b536a745774b6bc681c.lua"))()]]}
        _G.C_K_BB = s[Option[1]]
    end})
    Tabs.BladeBall:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_K_BB) end})

    --- Doors ---
    Tabs.Doors:CreateSection("Doors")
    Tabs.Doors:CreateDropdown({Name = "No Keyless", Options = {"Issue of items [BEST]"}, Flag = "NK_Doors", Callback = function(Option) _G.C_NK_Doors = (Option[1] == "Issue of items [BEST]") and [[loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/Kitty-Cats-Doors-Beta/refs/heads/main/hub.lua"))()]] end})
    Tabs.Doors:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_NK_Doors) end})
    Tabs.Doors:CreateDropdown({Name = "Keyless", Options = {"Soon..."}, Flag = "K_Doors", Callback = function() end})
    Tabs.Doors:CreateButton({Name = "Inject Script", Callback = function() end})

    --- FTAP ---
    Tabs.FTAP:CreateSection("Fling Things And People")
    Tabs.FTAP:CreateDropdown({Name = "No Keyless", Options = {"OP Hub", "EndorisFtap Hub", "FTAP Hub", "Yuki Hub", "Holon Hub"}, Flag = "NK_FTAP", Callback = function(Option)
        local s = {["OP Hub"] = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-OP-HUB-80884"))()]], ["EndorisFtap Hub"] = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-EndorisFTAP-71376"))()]], ["FTAP Hub"] = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-FTAP-Hub-79081"))()]], ["Yuki Hub"] = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-Yuki-Hub-Ftap-BETA-75713"))()]], ["Holon Hub"] = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-holon-hub-87313"))()]]}
        _G.C_NK_FTAP = s[Option[1]]
    end})
    Tabs.FTAP:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_NK_FTAP) end})
    Tabs.FTAP:CreateDropdown({Name = "Keyless", Options = {"Srv9 [WORKING] [BEST]", "Srv9 [NOT WORKING]", "Blitz Hub"}, Flag = "K_FTAP", Callback = function(Option)
        local s = {["Srv9 [WORKING] [BEST]"] = [[script_key="your_key"; loadstring(game:HttpGet("https://srv9.xyz/scripts/loader"))()]], ["Srv9 [NOT WORKING]"] = [[script_key="cOSJGNkVTJrtDMwMroMZjwgWvJoXwEom"; loadstring(game:HttpGet("https://srv9.xyz/scripts/loader"))()]], ["Blitz Hub"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/refs/heads/main/FTAP.lua"))()]]}
        _G.C_K_FTAP = s[Option[1]]
    end})
    Tabs.FTAP:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_K_FTAP) end})

    --- MM2 ---
    Tabs.MM2:CreateSection("Murder Mystery 2")
    Tabs.MM2:CreateDropdown({Name = "No Keyless", Options = {"Vertex [BEST]", "Zed", "Kumi", "Space", "LuminWare", "Praixe Hub", "By me"}, Flag = "NK_MM2", Callback = function(Option)
        local s = {["Vertex [BEST]"] = [[loadstring(game:HttpGet('https://raw.smokingscripts.org/vertex.lua'))()]], ["Zed"] = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-Murder-Mystery-2-script-2026-97170"))()]], ["Kumi"] = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Aimbot-I-Player-Role-ESP-I-Autofarm-I-Dupe-I-More-Features-97150"))()]], ["Space"] = [[loadstring(game:HttpGet("https://globalexp.xyz/"))()]], ["LuminWare"] = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-LuminWare-V2-93112"))()]], ["Praixe Hub"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/supernarkl/Praixe-hub-loader/refs/heads/main/Praixe%20hub"))()]], ["By me"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/j8nzi/project/refs/heads/main/main.lua", true))()]]}
        _G.C_NK_MM2 = s[Option[1]]
    end})
    Tabs.MM2:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_NK_MM2) end})
    Tabs.MM2:CreateDropdown({Name = "Keyless", Options = {"Project Snare", "Spark Hub"}, Flag = "K_MM2", Callback = function(Option)
        local s = {["Project Snare"] = [[loadstring(game:HttpGet("https://scripts.projectsnare.online/SnareMM2", true))()]], ["Spark Hub"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/ch3kyk/Script-Hub/refs/heads/main/.gitignore"))()]]}
        _G.C_K_MM2 = s[Option[1]]
    end})
    Tabs.MM2:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_K_MM2) end})

    --- MVS ---
    Tabs.MVS:CreateSection("Murderers vs Sheriffs")
    Tabs.MVS:CreateDropdown({Name = "No Keyless", Options = {"DanHub [BEST]", "Aetherium", "AutoShoot"}, Flag = "NK_MVS", Callback = function(Option)
        local s = {["DanHub [BEST]"] = [[loadstring(game:HttpGet("https://rawscripts.net/raw/DUELS-Murderers-VS-Sheriffs-DANHUB-NO-KEY-AUTO-SHOOT-CLICK-SHOOT-AIM-KILL-HITBOX-ETC-94134"))()]], ["Aetherium"] = [[loadstring(game:HttpGet("https://rawscripts.net/raw/DUELS-Murderers-VS-Sheriffs-Duels-AutoPlay-Bot-AutoWin-ESP-Aimbot-Hitbox-94372"))()]], ["AutoShoot"] = "AUTOSHOOT_LOCAL_CODE"}
        _G.C_NK_MVS = s[Option[1]]
    end})
    Tabs.MVS:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_NK_MVS) end})
    Tabs.MVS:CreateDropdown({Name = "Keyless", Options = {"Soon..."}, Flag = "K_MVS", Callback = function() end})
    Tabs.MVS:CreateButton({Name = "Inject Script", Callback = function() end})

    --- SkyWars ---
    Tabs.SkyWars:CreateSection("SkyWars")
    Tabs.SkyWars:CreateDropdown({Name = "No Keyless", Options = {"Soon..."}, Flag = "NK_Sky", Callback = function() end})
    Tabs.SkyWars:CreateButton({Name = "Inject Script", Callback = function() end})
    Tabs.SkyWars:CreateDropdown({Name = "Keyless", Options = {"Vape v4 [BEST]"}, Flag = "K_Sky", Callback = function(Option) _G.C_K_Sky = (Option[1] == "Vape v4 [BEST]") and [[loadstring(game:HttpGet("https://rawscripts.net/raw/SKYWARS-Vape-v4-43277"))()]] or "" end})
    Tabs.SkyWars:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_K_Sky) end})

    --- STK ---
    Tabs.STK:CreateSection("Survive the Killer")
    Tabs.STK:CreateDropdown({Name = "No Keyless", Options = {"Ywxoscripts [BEST]", "Vadrifts"}, Flag = "NK_STK", Callback = function(Option)
        if Option[1] == "Ywxoscripts [BEST]" then _G.C_NK_STK = [[script_key="FnOFBBljPLBHInvKKgMkRKNWsJPNSiRV"; loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/e2c3c4735b2fd5d7ae2ca226cd7ab99c.lua"))()]]
        elseif Option[1] == "Vadrifts" then _G.C_NK_STK = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/Vadrifts-Hub/refs/heads/main/Games/Survive-The-Killer/source.lua"))()]] end
    end})
    Tabs.STK:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_NK_STK) end})
    Tabs.STK:CreateDropdown({Name = "Keyless", Options = {"Soon..."}, Flag = "K_STK", Callback = function() _G.C_K_STK = "" end})
    Tabs.STK:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_K_STK) end})

    --- Universal ---
    Tabs.Universal:CreateSection("Universal Hub")
    Tabs.Universal:CreateDropdown({Name = "Universal Hub", Options = {"Sirius Hub", "XVC Hub", "Infiniti Yeild"}, Flag = "Uni_Hub", Callback = function(Option)
        local s = {["Sirius Hub"] = [[loadstring(game:HttpGet('https://sirius.menu/script'))();]], ["XVC Hub"] = [[loadstring(game:HttpGet("https://pastebin.com/raw/Piw5bqGq"))()]], ["Infiniti Yeild"] = [[loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()]]}
        _G.C_Uni = s[Option[1]]
    end})
    Tabs.Universal:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_Uni) end})

    Tabs.Universal:CreateSection("Fling")
    Tabs.Universal:CreateDropdown({Name = "Fling Gui", Options = {"Fling Gui 1", "Fling Gui 2", "Fling Gui 3"}, Flag = "Fling_Drop", Callback = function(Option)
        local s = {["Fling Gui 1"] = [[loadstring((function(t)local s=''for i=1,#t,2 do s=s..string.char(t[i]//t[i+1])end return s end)({216,2,333,3,485,5,700,7,1265,11,1508,13,1938,17,1995,19,2530,23,2987,29,80,2,309,3,485,5,763,7,1111,11,754,13,1224,17,2204,19,2668,23,3248,29,142,2,303,3,580,5,280,7,374,11,1352,13,1972,17,2204,19,2576,23,3335,29,116,2,141,3,235,5,721,7,1188,11,1443,13,1972,17,874,19,2415,23,3219,29,94,2,345,3,550,5,735,7,1232,11,1456,13,1717,17,2204,19,2645,23,1363,29,208,2,168,3,270,5,721,7,1210,11,1495,13,1700,17,1957,19,2691,23,2900,29,94,2,342,3,485,5,833,7,517,11,910,13,1836,17,1995,19,2530,23,2987,29,142,2,351,3,525,5,322,7,1188,11,1521,13,1649,17,646,19,943,23,1189,29,80,2,123,3}))()]], ["Fling Gui 2"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/joshclark756/joshclark756-s-scripts/refs/heads/main/fling%20player%20gui%20(unanchored%20parts).lua"))()]], ["Fling Gui 3"] = [[loadstring(game:HttpGet("https://rscripts.net/raw/fe-flinger-gui-works-anywhere_1756291955889_SwfaGHMWsT.txt",true))()]]}
        _G.C_Fling = s[Option[1]]
    end})
    Tabs.Universal:CreateButton({Name = "Script Inject", Callback = function() Execute(_G.C_Fling) end})

    Tabs.Universal:CreateSection("Bang")
    Tabs.Universal:CreateDropdown({Name = "Bang Gui", Options = {"Bang Gui 1", "Bang Gui 2"}, Flag = "Bang_Drop", Callback = function(Option)
        local s = {["Bang Gui 1"] = [[loadstring(game:HttpGet('https://raw.githubusercontent.com/4gh9/Bang-Script-Gui/main/bang%20gui.lua'))()]], ["Bang Gui 2"] = [[loadstring(game:HttpGet("https://pastebin.com/raw/SvVYqTh6"))()]]}
        _G.C_Bang = s[Option[1]]
    end})
    Tabs.Universal:CreateButton({Name = "Inject Script", Callback = function() Execute(_G.C_Bang) end})

    --- Settings ---
    Tabs.Settings:CreateSection("Script Settings")
    local ThemeOptions = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"}
    Tabs.Settings:CreateDropdown({
        Name = "Theme",
        Options = ThemeOptions,
        CurrentOption = {"Default"},
        Flag = "Theme",
        Callback = function(Option)
            local theme = (type(Option) == "table" and Option[1]) or Option
            if theme and type(theme) == "string" and theme ~= "" then
                local ok, err = false, "ModifyTheme not found"
                if type(Window.ModifyTheme) == "function" then
                    ok, err = pcall(Window.ModifyTheme, theme)
                    if not ok then
                        ok, err = pcall(Window.ModifyTheme, Window, theme)
                    end
                end
                if not ok and type(Rayfield.ModifyTheme) == "function" then
                    ok, err = pcall(Rayfield.ModifyTheme, theme)
                    if not ok then
                        ok, err = pcall(Rayfield.ModifyTheme, Rayfield, theme)
                    end
                end
                if ok then
                    Rayfield:Notify({Title = "Theme", Content = "Theme: " .. theme, Duration = 2})
                else
                    Rayfield:Notify({Title = "Theme Error", Content = tostring(err or "ModifyTheme not found"), Duration = 4})
                end
            end
        end
    })
    Tabs.Settings:CreateButton({Name = "Destroy UI", Callback = function() Rayfield:Destroy() end})

    --- Local-Player ---
    Tabs.Settings:CreateSection("Local-Player")

    local infZoomEnabled = false
    local noclipZoomActive = false
    local fovEnabled = false
    local customFOV = 70
    local noclipDesiredDist = 12

    local originalMinZoom = LocalPlayer.CameraMinZoomDistance
    local originalMaxZoom = LocalPlayer.CameraMaxZoomDistance
    local originalBrightness = Lighting.Brightness
    local originalAmbient = Lighting.Ambient
    local originalOutdoorAmbient = Lighting.OutdoorAmbient
    local originalFogEnd = Lighting.FogEnd
    local originalFogStart = Lighting.FogStart
    local originalClockTime = Lighting.ClockTime
    local originalFieldOfView = workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView or 70

    Tabs.Settings:CreateToggle({
        Name = "Inf Zoom",
        CurrentValue = false,
        Flag = "LP_InfZoom",
        Callback = function(Value)
            infZoomEnabled = Value
            if Value then
                LocalPlayer.CameraMinZoomDistance = 0.5
                LocalPlayer.CameraMaxZoomDistance = 9999
            else
                if not noclipZoomActive then
                    LocalPlayer.CameraMinZoomDistance = originalMinZoom
                    LocalPlayer.CameraMaxZoomDistance = originalMaxZoom
                end
            end
        end
    })

    -- Noclip Zoom: камера проходит сквозь все объекты
    local noclipScrollConn = nil
    local noclipBindName = "NoclipZoomBind"

    Tabs.Settings:CreateToggle({
        Name = "Noclip Zoom",
        CurrentValue = false,
        Flag = "LP_NoclipZoom",
        Callback = function(Value)
            noclipZoomActive = Value
            if Value then
                LocalPlayer.CameraMinZoomDistance = 0.5
                LocalPlayer.CameraMaxZoomDistance = 9999

                -- Запоминаем текущую дистанцию камеры как стартовую
                pcall(function()
                    local cam = workspace.CurrentCamera
                    if cam then
                        noclipDesiredDist = (cam.CFrame.Position - cam.Focus.Position).Magnitude
                    end
                end)

                -- Отслеживаем колёсико мыши для изменения дистанции
                if noclipScrollConn then noclipScrollConn:Disconnect() end
                noclipScrollConn = UserInputService.InputChanged:Connect(function(input)
                    if not noclipZoomActive then return end
                    if input.UserInputType == Enum.UserInputType.MouseWheel then
                        local scrollDir = input.Position.Z
                        noclipDesiredDist = math.clamp(noclipDesiredDist - scrollDir * 2, 0.5, 9999)
                    end
                end)

                -- Привязка ПОСЛЕ обновления камеры движком — перезаписываем позицию камеры
                pcall(function() RunService:UnbindFromRenderStep(noclipBindName) end)
                RunService:BindToRenderStep(noclipBindName, Enum.RenderPriority.Camera.Value + 1, function()
                    if not noclipZoomActive then return end
                    local cam = workspace.CurrentCamera
                    if not cam then return end

                    local focusPos = cam.Focus.Position
                    local camPos = cam.CFrame.Position
                    local direction = camPos - focusPos

                    if direction.Magnitude < 0.01 then
                        direction = cam.CFrame.LookVector * -1
                    else
                        direction = direction.Unit
                    end

                    -- Принудительно ставим камеру на желаемую дистанцию, игнорируя коллизию
                    local newPos = focusPos + direction * noclipDesiredDist
                    local rotation = cam.CFrame - cam.CFrame.Position
                    cam.CFrame = CFrame.new(newPos) * rotation
                end)
            else
                -- Отключение
                pcall(function() RunService:UnbindFromRenderStep(noclipBindName) end)
                if noclipScrollConn then
                    noclipScrollConn:Disconnect()
                    noclipScrollConn = nil
                end
                if not infZoomEnabled then
                    LocalPlayer.CameraMinZoomDistance = originalMinZoom
                    LocalPlayer.CameraMaxZoomDistance = originalMaxZoom
                end
            end
        end
    })

    local fullBrightConnection = nil
    Tabs.Settings:CreateToggle({
        Name = "Full Bright",
        CurrentValue = false,
        Flag = "LP_FullBright",
        Callback = function(Value)
            if Value then
                if fullBrightConnection then fullBrightConnection:Disconnect() end
                fullBrightConnection = RunService.RenderStepped:Connect(function()
                    Lighting.Brightness = 2
                    Lighting.ClockTime = 14
                    Lighting.FogEnd = 100000
                    Lighting.FogStart = 0
                    Lighting.GlobalShadows = false
                    Lighting.Ambient = Color3.fromRGB(178, 178, 178)
                    Lighting.OutdoorAmbient = Color3.fromRGB(178, 178, 178)
                end)
            else
                if fullBrightConnection then
                    fullBrightConnection:Disconnect()
                    fullBrightConnection = nil
                end
                Lighting.Brightness = originalBrightness
                Lighting.ClockTime = originalClockTime
                Lighting.FogEnd = originalFogEnd
                Lighting.FogStart = originalFogStart
                Lighting.GlobalShadows = true
                Lighting.Ambient = originalAmbient
                Lighting.OutdoorAmbient = originalOutdoorAmbient
            end
        end
    })

    Tabs.Settings:CreateInput({
        Name = "FOV Changer",
        PlaceholderText = "Enter FOV (30-120)",
        CurrentValue = "",
        Flag = "LP_FOVInput",
        NumbersOnly = true,
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)
            local num = tonumber(Text)
            if num then
                num = math.clamp(num, 30, 120)
                customFOV = num
                if fovEnabled then
                    local camera = workspace.CurrentCamera
                    if camera then
                        camera.FieldOfView = customFOV
                    end
                end
                Rayfield:Notify({Title = "FOV", Content = "FOV set to " .. tostring(math.floor(customFOV)) .. "°", Duration = 2})
            else
                Rayfield:Notify({Title = "FOV", Content = "Enter a number between 30 and 120", Duration = 2})
            end
        end
    })

    local fovConnection = nil
    Tabs.Settings:CreateToggle({
        Name = "FOV Enabled",
        CurrentValue = false,
        Flag = "LP_FOVEnabled",
        Callback = function(Value)
            fovEnabled = Value
            if Value then
                if fovConnection then fovConnection:Disconnect() end
                fovConnection = RunService.RenderStepped:Connect(function()
                    local camera = workspace.CurrentCamera
                    if camera then
                        camera.FieldOfView = customFOV
                    end
                end)
            else
                if fovConnection then
                    fovConnection:Disconnect()
                    fovConnection = nil
                end
                local camera = workspace.CurrentCamera
                if camera then
                    camera.FieldOfView = originalFieldOfView
                end
            end
        end
    })

    Rayfield:Notify({Title = "Authorized", Content = "Script Hub | " .. SCRIPT_VERSION .. " Loaded", Duration = 5})
end

SubscribeButton.MouseButton1Click:Connect(function()
    SubscribeButton.Text = "Checking..."
    SubscribeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    StatusLabel.Text = ""
    DebugLabel.Text = "UserID: " .. tostring(LocalPlayer.UserId) .. " | Checking..."

    task.spawn(function()
        local isFollowing = IsFollowing()

        if isFollowing then
            StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 80)
            StatusLabel.Text = "Subscribed! Loading..."
            DebugLabel.Text = "Verified!"
            SubscribeButton.BackgroundColor3 = Color3.fromRGB(40, 120, 40)
            SubscribeButton.Text = "Verified!"
            task.wait(1.2)
            local tOut = TweenService:Create(BackdropFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad), { BackgroundTransparency = 1 })
            tOut:Play()
            tOut.Completed:Wait()
            LoadScriptHub()
        else
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            StatusLabel.Text = "No, you're not subscribed"
            DebugLabel.Text = "Follow @0_9XE4 on Roblox and try again"
            SubscribeButton.BackgroundColor3 = Color3.fromRGB(120, 30, 30)
            SubscribeButton.Text = "I subscribed"
            task.wait(3)
            SubscribeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            StatusLabel.Text = ""
            DebugLabel.Text = ""
        end
    end)
end)
