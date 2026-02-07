local a=game:GetService"Players"
local b=game:GetService"HttpService"
local c=a.LocalPlayer

local d=4912088123
local e="0_9XE4"

local f=(syn and syn.request)or(http and http.request)or http_request or request or(fluxus and fluxus.request)

local function IsFollowing()
if c.Name==e or c.UserId==d then
return true
end

local g=c.UserId
local h=false

local i={
"friends.roproxy.com",
"friends.rblx.trade",
"friends.roblox.com"
}

for j,k in ipairs(i)do
if h then break end
local l,m=pcall(function()
local l=""
repeat
local m="https://"..k.."/v1/users/"..g.."/followings?limit=100&sortOrder=Desc"
if l~=""then
m=m.."&cursor="..l
end
local n
if f then
local o=f{Url=m,Method="GET"}
if o then n=o.Body end
else
n=game:HttpGet(m)
end
if not n or n==""then return false end
local o=b:JSONDecode(n)
if not o or not o.data then return false end
for p,q in ipairs(o.data)do
if q.id==d then
h=true
return true
end
end
l=o.nextPageCursor or""
until l==""or h
return false
end)
if l and m then h=true end
end
if h then return true end

for j,k in ipairs(i)do
if h then break end
local l,m=pcall(function()
local l=""
repeat
local m="https://"..k.."/v1/users/"..d.."/followers?limit=100&sortOrder=Desc"
if l~=""then
m=m.."&cursor="..l
end
local n
if f then
local o=f{Url=m,Method="GET"}
if o then n=o.Body end
else
n=game:HttpGet(m)
end
if not n or n==""then return false end
local o=b:JSONDecode(n)
if not o or not o.data then return false end
for p,q in ipairs(o.data)do
if q.id==g then
h=true
return true
end
end
l=o.nextPageCursor or""
until l==""or h
return false
end)
if l and m then h=true end
end
if h then return true end

if f then
local j,k=pcall(function()
local j=f{
Url="https://friends.roblox.com/v1/user/following-exists",
Method="POST",
Headers={
["Content-Type"]="application/json",Accept=
"application/json"
},
Body=b:JSONEncode{targetUserIds={d}}
}
if j and j.Body then
local k=b:JSONDecode(j.Body)
if k and k.followings then
for l,m in ipairs(k.followings)do
if m.userId==d and m.isFollowing==true then
return true
end
end
end
end
return false
end)
if j and k then return true end
end

local j={
"www.roproxy.com",
"www.rblx.trade",
"www.roblox.com"
}
for k,l in ipairs(j)do
local m,n=pcall(function()
local m="https://"..l.."/users/"..d.."/profile"
local n
if f then
local o=f{Url=m,Method="GET"}
if o then n=o.Body end
else
n=game:HttpGet(m)
end
if n then
if string.find(n,"btn%-unfollow")or
string.find(n,"icon%-unfollow")or
string.find(n,"already%-following")or
string.find(n,"UnfollowUser")then
return true
end
end
return false
end)
if m and n then return true end
end

if f then
local k,l=pcall(function()
local k=f{
Url="https://friends.roblox.com/v1/my/friends/count",
Method="GET"
}
if k and k.StatusCode==200 then
local l=f{
Url="https://friends.roblox.com/v1/users/"..g.."/followings?limit=100&sortOrder=Desc",
Method="GET"
}
if l and l.Body then
if string.find(l.Body,tostring(d))then
return true
end
end
end
return false
end)
if k and l then return true end
end

for k,l in ipairs(i)do
local m,n=pcall(function()
local m="https://"..l.."/v1/users/"..g.."/followings?limit=100&sortOrder=Desc"
local n
if f then
local o=f{Url=m,Method="GET"}
if o then n=o.Body end
else
n=game:HttpGet(m)
end
if n and string.find(n,tostring(d))then
return true
end
return false
end)
if m and n then return true end
end

return false
end

local g=Instance.new"ScreenGui"
g.Name="SubscriptionCheck"
g.ResetOnSpawn=false
g.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
g.Parent=game:GetService"CoreGui"

local h=Instance.new"Frame"
h.Size=UDim2.new(0,420,0,280)
h.Position=UDim2.new(0.5,-210,0.5,-140)
h.BackgroundColor3=Color3.fromRGB(25,25,25)
h.BorderSizePixel=0
h.Parent=g

Instance.new("UICorner",h).CornerRadius=UDim.new(0,12)
local i=Instance.new("UIStroke",h)
i.Color=Color3.fromRGB(80,80,80)
i.Thickness=1

local j=Instance.new"TextLabel"
j.Size=UDim2.new(1,0,0,50)
j.Position=UDim2.new(0,0,0,10)
j.BackgroundTransparency=1
j.Text="Subscription System"
j.TextColor3=Color3.fromRGB(255,255,255)
j.TextSize=24
j.Font=Enum.Font.GothamBold
j.Parent=h

local k=Instance.new"TextLabel"
k.Size=UDim2.new(1,0,0,30)
k.Position=UDim2.new(0,0,0,55)
k.BackgroundTransparency=1
k.Text="Subscribe to my account"
k.TextColor3=Color3.fromRGB(180,180,180)
k.TextSize=16
k.Font=Enum.Font.Gotham
k.Parent=h

local l=Instance.new"TextLabel"
l.Size=UDim2.new(1,-40,0,40)
l.Position=UDim2.new(0,20,0,95)
l.BackgroundTransparency=1
l.Text="My username: 0_9XE4"
l.TextColor3=Color3.fromRGB(140,140,140)
l.TextSize=14
l.Font=Enum.Font.Gotham
l.TextWrapped=true
l.Parent=h

local m=Instance.new"TextButton"
m.Size=UDim2.new(0,300,0,45)
m.Position=UDim2.new(0.5,-150,0,155)
m.BackgroundColor3=Color3.fromRGB(45,45,45)
m.Text="I subscribed"
m.TextColor3=Color3.fromRGB(255,255,255)
m.TextSize=18
m.Font=Enum.Font.GothamSemibold
m.BorderSizePixel=0
m.Parent=h

Instance.new("UICorner",m).CornerRadius=UDim.new(0,8)
local n=Instance.new("UIStroke",m)
n.Color=Color3.fromRGB(100,100,100)
n.Thickness=1

local o=Instance.new"TextLabel"
o.Size=UDim2.new(1,0,0,30)
o.Position=UDim2.new(0,0,0,215)
o.BackgroundTransparency=1
o.Text=""
o.TextColor3=Color3.fromRGB(255,80,80)
o.TextSize=14
o.Font=Enum.Font.GothamSemibold
o.Parent=h

local p=Instance.new"TextLabel"
p.Size=UDim2.new(1,0,0,20)
p.Position=UDim2.new(0,0,0,245)
p.BackgroundTransparency=1
p.Text=""
p.TextColor3=Color3.fromRGB(100,100,100)
p.TextSize=11
p.Font=Enum.Font.Gotham
p.Parent=h

local function LoadScriptHub()
g:Destroy()

local q=loadstring(game:HttpGet'https://sirius.menu/rayfield')()

local r=q:CreateWindow{
Name="Script Hub | 1.4",
LoadingTitle="Script Hub",
LoadingSubtitle="By Yoshi",
ConfigurationSaving={
Enabled=true,
FolderName="Yoshi_Configs",
FileName="ScriptHub"
},
KeySystem=false
}

local function Execute(s)
if s and s~=""then local
t=pcall(function()
local t,u=loadstring(s)
if t then t()else warn(u)end
end)
if not t then
q:Notify{Title="Error",Content="Failed to execute script",Duration=3}
end
end
end

local s={
MVSD=r:CreateTab("MVSD",4483362458),
BladeBall=r:CreateTab("Blade Ball",4483362458),
Doors=r:CreateTab("Doors",4483362458),
FTAP=r:CreateTab("FTAP",4483362458),
MM2=r:CreateTab("MM2",4483362458),
MVS=r:CreateTab("MVS",4483362458),
SkyWars=r:CreateTab("SkyWars",4483362458),
STK=r:CreateTab("STK",4483362458),
Universal=r:CreateTab("Universal",4483362458),
ChangeLog=r:CreateTab("Change Log",4483362458),
Settings=r:CreateTab("Settings",4483362458)
}


s.ChangeLog:CreateParagraph{
Title="v1.4 Update Logs",
Content="Script Version: 1.4\n--------------------------\nChanged:\n[~] TARGET_USER_ID → 4912088123\n[+] Subscription system added"
}

s.ChangeLog:CreateParagraph{
Title="v1.3 Update Logs",
Content="Script Version: 1.3\n--------------------------\nChanged:\n[~] Vertex → Vertex [BEST] (MM2)\n[~] WhyHub → WhyHub [BEST] (MVSD)\n[~] Ywxoscripts → Ywxoscripts [BEST] (STK)\n[~] Vape v4 → Vape v4 [BEST] (SkyWars)\n[~] DanHub → DanHub [BEST] (MVS)\n[~] Srv9 [WORKING] → Srv9 [WORKING] [BEST] (FTAP)\n[~] Issue of items → Issue of items [BEST] (Doors)\n[~] Project Stark → Project Stark [BEST] (Blade Ball)\n\nAdded:\n[+] Argon Hub X [BEST] (Blade Ball, No Keyless)"
}

s.ChangeLog:CreateParagraph{
Title="v1.2 Update Logs",
Content="Script Version: 1.2\n--------------------------\nAdded:\n[+] MM2: Spark Hub (Keyless)\n[+] MM2: Praixe Hub (No Keyless)\n[+] MM2: By me (No Keyless)\n[+] Ronix (Blade Ball)\n[+] Project Stark (Blade Ball)"
}


s.MVSD:CreateSection"Murderers vs Sheriffs DUELS"
s.MVSD:CreateDropdown{Name="No Keyless",Options={"WhyHub [BEST]"},Flag="NK_MVSD",Callback=function(t)_G.C_NK_MVSD=(t[1]=="WhyHub [BEST]")and[[loadstring(game:HttpGet("https://rawscripts.net/raw/Murderers-VS-Sheriffs-DUELS-Legit-Bot-Rage-Bot-Crash-all-Kill-all-82594"))()]]end}
s.MVSD:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_MVSD)end}
s.MVSD:CreateDropdown{Name="Keyless",Options={},Flag="K_MVSD",Callback=function()end}
s.MVSD:CreateButton{Name="Inject Script",Callback=function()end}


s.BladeBall:CreateSection"Blade Ball"
s.BladeBall:CreateDropdown{Name="No Keyless",Options={"Argon Hub X [BEST]",".2xr.","Corolla Hub","Soluna","Sslkin","Bedol Hub"},Flag="NK_BB",Callback=function(t)
local u={["Argon Hub X [BEST]"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/Scriptsnets/BladeBall/refs/heads/main/Argon-Hub-X-BladeBall-OP.lua"))()]],[".2xr."]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/2xrW/return/refs/heads/main/hub"))()]],["Corolla Hub"]=[[loadstring(game:HttpGet('https://raw.githubusercontent.com/7190000/Corolla-Hub/main/ch.lua'))()]],Soluna=[[loadstring(game:HttpGet("https://soluna-script.vercel.app/bladeball.lua",true))()]],Sslkin=[[getgenv().KEY = 'sosalkinhub<3'; loadstring(game:HttpGet('https://raw.githubusercontent.com/cbozovcloh781-hub/kfvweiyulfg2873f2/refs/heads/main/adkfayibhdbfajshfvaufvaeyuv_loaderkeyless'))()]],["Bedol Hub"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))()]]}
_G.C_NK_BB=u[t[1] ]
end}
s.BladeBall:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_BB)end}
s.BladeBall:CreateDropdown{Name="Keyless",Options={"Project Stark [BEST]","Ronix"},Flag="K_BB",Callback=function(t)
local u={["Project Stark [BEST]"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Blade-Ball-Project-Stark-Free-Hub-59919"))()]],Ronix=[[loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fda9babd071d6b536a745774b6bc681c.lua"))()]]}
_G.C_K_BB=u[t[1] ]
end}
s.BladeBall:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_BB)end}


s.Doors:CreateSection"Doors"
s.Doors:CreateDropdown{Name="No Keyless",Options={"Issue of items [BEST]"},Flag="NK_Doors",Callback=function(t)_G.C_NK_Doors=(t[1]=="Issue of items [BEST]")and[[loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/Kitty-Cats-Doors-Beta/refs/heads/main/hub.lua"))()]]end}
s.Doors:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_Doors)end}
s.Doors:CreateDropdown{Name="Keyless",Options={},Flag="K_Doors",Callback=function()end}
s.Doors:CreateButton{Name="Inject Script",Callback=function()end}


s.FTAP:CreateSection"Fling Things And People"
s.FTAP:CreateDropdown{Name="No Keyless",Options={"OP Hub","EndorisFtap Hub","FTAP Hub","Yuki Hub","Holon Hub"},Flag="NK_FTAP",Callback=function(t)
local u={["OP Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-OP-HUB-80884"))()]],["EndorisFtap Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-EndorisFTAP-71376"))()]],["FTAP Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-FTAP-Hub-79081"))()]],["Yuki Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-Yuki-Hub-Ftap-BETA-75713"))()]],["Holon Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-holon-hub-87313"))()]]}
_G.C_NK_FTAP=u[t[1] ]
end}
s.FTAP:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_FTAP)end}
s.FTAP:CreateDropdown{Name="Keyless",Options={"Srv9 [WORKING] [BEST]","Srv9 [NOT WORKING]","Blitz Hub"},Flag="K_FTAP",Callback=function(t)
local u={["Srv9 [WORKING] [BEST]"]=[[script_key="your_key"; loadstring(game:HttpGet("https://srv9.xyz/scripts/loader"))()]],["Srv9 [NOT WORKING]"]=[[script_key="cOSJGNkVTJrtDMwMroMZjwgWvJoXwEom"; loadstring(game:HttpGet("https://srv9.xyz/scripts/loader"))()]],["Blitz Hub"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/refs/heads/main/FTAP.lua"))()]]}
_G.C_K_FTAP=u[t[1] ]
end}
s.FTAP:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_FTAP)end}


s.MM2:CreateSection"Murder Mystery 2"
s.MM2:CreateDropdown{Name="No Keyless",Options={"Vertex [BEST]","Zed","Kumi","Space","LuminWare","Praixe Hub","By me"},Flag="NK_MM2",Callback=function(t)
local u={["Vertex [BEST]"]=[[loadstring(game:HttpGet('https://raw.smokingscripts.org/vertex.lua'))()]],Zed=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-Murder-Mystery-2-script-2026-97170"))()]],Kumi=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Aimbot-I-Player-Role-ESP-I-Autofarm-I-Dupe-I-More-Features-97150"))()]],Space=[[loadstring(game:HttpGet("https://globalexp.xyz/"))()]],LuminWare=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-LuminWare-V2-93112"))()]],["Praixe Hub"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/supernarkl/Praixe-hub-loader/refs/heads/main/Praixe%20hub"))()]],["By me"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/j8nzi/project/refs/heads/main/main.lua", true))()]]}
_G.C_NK_MM2=u[t[1] ]
end}
s.MM2:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_MM2)end}
s.MM2:CreateDropdown{Name="Keyless",Options={"Project Snare","Spark Hub"},Flag="K_MM2",Callback=function(t)
local u={["Project Snare"]=[[loadstring(game:HttpGet("https://scripts.projectsnare.online/SnareMM2", true))()]],["Spark Hub"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/ch3kyk/Script-Hub/refs/heads/main/.gitignore"))()]]}
_G.C_K_MM2=u[t[1] ]
end}
s.MM2:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_MM2)end}


s.MVS:CreateSection"Murderers vs Sheriffs"
s.MVS:CreateDropdown{Name="No Keyless",Options={"DanHub [BEST]","Aetherium","AutoShoot"},Flag="NK_MVS",Callback=function(t)
local u={["DanHub [BEST]"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/DUELS-Murderers-VS-Sheriffs-DANHUB-NO-KEY-AUTO-SHOOT-CLICK-SHOOT-AIM-KILL-HITBOX-ETC-94134"))()]],Aetherium=[[loadstring(game:HttpGet("https://rawscripts.net/raw/DUELS-Murderers-VS-Sheriffs-Duels-AutoPlay-Bot-AutoWin-ESP-Aimbot-Hitbox-94372"))()]],AutoShoot="AUTOSHOOT_LOCAL_CODE"}
_G.C_NK_MVS=u[t[1] ]
end}
s.MVS:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_MVS)end}
s.MVS:CreateDropdown{Name="Keyless",Options={},Flag="K_MVS",Callback=function()end}
s.MVS:CreateButton{Name="Inject Script",Callback=function()end}


s.SkyWars:CreateSection"SkyWars"
s.SkyWars:CreateDropdown{Name="No Keyless",Options={"Soon..."},Flag="NK_Sky",Callback=function()end}
s.SkyWars:CreateButton{Name="Inject Script",Callback=function()end}
s.SkyWars:CreateDropdown{Name="Keyless",Options={"Vape v4 [BEST]"},Flag="K_Sky",Callback=function(t)_G.C_K_Sky=(t[1]=="Vape v4 [BEST]")and[[loadstring(game:HttpGet("https://rawscripts.net/raw/SKYWARS-Vape-v4-43277"))()]]or""end}
s.SkyWars:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_Sky)end}


s.STK:CreateSection"Survive the Killer"
s.STK:CreateDropdown{Name="No Keyless",Options={"Ywxoscripts [BEST]","Vadrifts"},Flag="NK_STK",Callback=function(t)
if t[1]=="Ywxoscripts [BEST]"then _G.C_NK_STK=[[script_key="FnOFBBljPLBHInvKKgMkRKNWsJPNSiRV"; loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/e2c3c4735b2fd5d7ae2ca226cd7ab99c.lua"))()]]
elseif t[1]=="Vadrifts"then _G.C_NK_STK=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/Vadrifts-Hub/refs/heads/main/Games/Survive-The-Killer/source.lua"))()]]end
end}
s.STK:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_STK)end}
s.STK:CreateDropdown{Name="Keyless",Options={"Soon..."},Flag="K_STK",Callback=function()_G.C_K_STK=""end}
s.STK:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_STK)end}


s.Universal:CreateSection"Universal Hub"
s.Universal:CreateDropdown{Name="Universal Hub",Options={"Sirius Hub","XVC Hub","Infiniti Yeild"},Flag="Uni_Hub",Callback=function(t)
local u={["Sirius Hub"]=[[loadstring(game:HttpGet('https://sirius.menu/script'))();]],["XVC Hub"]=[[loadstring(game:HttpGet("https://pastebin.com/raw/Piw5bqGq"))()]],["Infiniti Yeild"]=[[loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()]]}
_G.C_Uni=u[t[1] ]
end}
s.Universal:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_Uni)end}

s.Universal:CreateSection"Fling"
s.Universal:CreateDropdown{Name="Fling Gui",Options={"Fling Gui 1","Fling Gui 2","Fling Gui 3"},Flag="Fling_Drop",Callback=function(t)
local u={["Fling Gui 1"]=[[loadstring((function(t)local s=''for i=1,#t,2 do s=s..string.char(t[i]//t[i+1])end return s end)({216,2,333,3,485,5,700,7,1265,11,1508,13,1938,17,1995,19,2530,23,2987,29,80,2,309,3,485,5,763,7,1111,11,754,13,1224,17,2204,19,2668,23,3248,29,142,2,303,3,580,5,280,7,374,11,1352,13,1972,17,2204,19,2576,23,3335,29,116,2,141,3,235,5,721,7,1188,11,1443,13,1972,17,874,19,2415,23,3219,29,94,2,345,3,550,5,735,7,1232,11,1456,13,1717,17,2204,19,2645,23,1363,29,208,2,168,3,270,5,721,7,1210,11,1495,13,1700,17,1957,19,2691,23,2900,29,94,2,342,3,485,5,833,7,517,11,910,13,1836,17,1995,19,2530,23,2987,29,142,2,351,3,525,5,322,7,1188,11,1521,13,1649,17,646,19,943,23,1189,29,80,2,123,3}))()]],["Fling Gui 2"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/joshclark756/joshclark756-s-scripts/refs/heads/main/fling%20player%20gui%20(unanchored%20parts).lua"))()]],["Fling Gui 3"]=[[loadstring(game:HttpGet("https://rscripts.net/raw/fe-flinger-gui-works-anywhere_1756291955889_SwfaGHMWsT.txt",true))()]]}
_G.C_Fling=u[t[1] ]
end}
s.Universal:CreateButton{Name="Script Inject",Callback=function()Execute(_G.C_Fling)end}

s.Universal:CreateSection"Bang"
s.Universal:CreateDropdown{Name="Bang Gui",Options={"Bang Gui 1","Bang Gui 2"},Flag="Bang_Drop",Callback=function(t)
local u={["Bang Gui 1"]=[[loadstring(game:HttpGet('https://raw.githubusercontent.com/4gh9/Bang-Script-Gui/main/bang%20gui.lua'))()]],["Bang Gui 2"]=[[loadstring(game:HttpGet("https://pastebin.com/raw/SvVYqTh6"))()]]}
_G.C_Bang=u[t[1] ]
end}
s.Universal:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_Bang)end}


s.Settings:CreateSection"Script Settings"
s.Settings:CreateButton{Name="Destroy UI",Callback=function()q:Destroy()end}

q:Notify{Title="Authorized",Content="Script Hub | 1.4 Loaded",Duration=5}
end

m.MouseButton1Click:Connect(function()
m.Text="Checking..."
m.BackgroundColor3=Color3.fromRGB(60,60,60)
o.Text=""
p.Text="UserID: "..tostring(c.UserId).." | Checking..."

task.spawn(function()
local q=IsFollowing()

if q then
o.TextColor3=Color3.fromRGB(80,255,80)
o.Text="Subscribed! Loading..."
p.Text="Verified!"
m.BackgroundColor3=Color3.fromRGB(40,120,40)
m.Text="Verified!"
task.wait(1.5)
LoadScriptHub()
else
o.TextColor3=Color3.fromRGB(255,80,80)
o.Text="No, you're not subscribed"
p.Text="Follow @0_9XE4 on Roblox and try again"
m.BackgroundColor3=Color3.fromRGB(120,30,30)
m.Text="I subscribed"
task.wait(3)
m.BackgroundColor3=Color3.fromRGB(45,45,45)
o.Text=""
p.Text=""
end
end)
end)
