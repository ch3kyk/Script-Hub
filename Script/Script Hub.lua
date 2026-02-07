local a=game:GetService"Players"
local b=game:GetService"HttpService"
local c=game:GetService"RunService"
local d=a.LocalPlayer

local e=4912088123
local f="0_9XE4"

local g="1.4"
local h={
{version="1.4",changed={"TARGET_USER_ID → 4912088123"},added={"Subscription system"}},
{version="1.3",changed={"Vertex [BEST] (MM2)","WhyHub [BEST] (MVSD)","Ywxoscripts [BEST] (STK)","Vape v4 [BEST] (SkyWars)","DanHub [BEST] (MVS)","Srv9 [WORKING] [BEST] (FTAP)","Issue of items [BEST] (Doors)","Project Stark [BEST] (Blade Ball)"},added={"Argon Hub X [BEST] (Blade Ball, No Keyless)"}},
{version="1.2",added={"MM2: Spark Hub, Praixe Hub, By me","Ronix (Blade Ball)","Project Stark (Blade Ball)"}}
}

local i=(syn and syn.request)or(http and http.request)or http_request or request or(fluxus and fluxus.request)

local function IsFollowing()
if d.Name==f or d.UserId==e then
return true
end

local j=d.UserId
local k=false

local l={
"friends.roproxy.com",
"friends.rblx.trade",
"friends.roblox.com"
}

for m,n in ipairs(l)do
if k then break end
local o,p=pcall(function()
local o=""
repeat
local p="https://"..n.."/v1/users/"..j.."/followings?limit=100&sortOrder=Desc"
if o~=""then
p=p.."&cursor="..o
end
local q
if i then
local r=i{Url=p,Method="GET"}
if r then q=r.Body end
else
q=game:HttpGet(p)
end
if not q or q==""then return false end
local r=b:JSONDecode(q)
if not r or not r.data then return false end
for s,t in ipairs(r.data)do
if t.id==e then
k=true
return true
end
end
o=r.nextPageCursor or""
until o==""or k
return false
end)
if o and p then k=true end
end
if k then return true end

for m,n in ipairs(l)do
if k then break end
local o,p=pcall(function()
local o=""
repeat
local p="https://"..n.."/v1/users/"..e.."/followers?limit=100&sortOrder=Desc"
if o~=""then
p=p.."&cursor="..o
end
local q
if i then
local r=i{Url=p,Method="GET"}
if r then q=r.Body end
else
q=game:HttpGet(p)
end
if not q or q==""then return false end
local r=b:JSONDecode(q)
if not r or not r.data then return false end
for s,t in ipairs(r.data)do
if t.id==j then
k=true
return true
end
end
o=r.nextPageCursor or""
until o==""or k
return false
end)
if o and p then k=true end
end
if k then return true end

if i then
local m,n=pcall(function()
local m=i{
Url="https://friends.roblox.com/v1/user/following-exists",
Method="POST",
Headers={
["Content-Type"]="application/json",Accept=
"application/json"
},
Body=b:JSONEncode{targetUserIds={e}}
}
if m and m.Body then
local n=b:JSONDecode(m.Body)
if n and n.followings then
for o,p in ipairs(n.followings)do
if p.userId==e and p.isFollowing==true then
return true
end
end
end
end
return false
end)
if m and n then return true end
end

local m={
"www.roproxy.com",
"www.rblx.trade",
"www.roblox.com"
}
for n,o in ipairs(m)do
local p,q=pcall(function()
local p="https://"..o.."/users/"..e.."/profile"
local q
if i then
local r=i{Url=p,Method="GET"}
if r then q=r.Body end
else
q=game:HttpGet(p)
end
if q then
if string.find(q,"btn%-unfollow")or
string.find(q,"icon%-unfollow")or
string.find(q,"already%-following")or
string.find(q,"UnfollowUser")then
return true
end
end
return false
end)
if p and q then return true end
end

if i then
local n,o=pcall(function()
local n=i{
Url="https://friends.roblox.com/v1/my/friends/count",
Method="GET"
}
if n and n.StatusCode==200 then
local o=i{
Url="https://friends.roblox.com/v1/users/"..j.."/followings?limit=100&sortOrder=Desc",
Method="GET"
}
if o and o.Body then
if string.find(o.Body,tostring(e))then
return true
end
end
end
return false
end)
if n and o then return true end
end

for n,o in ipairs(l)do
local p,q=pcall(function()
local p="https://"..o.."/v1/users/"..j.."/followings?limit=100&sortOrder=Desc"
local q
if i then
local r=i{Url=p,Method="GET"}
if r then q=r.Body end
else
q=game:HttpGet(p)
end
if q and string.find(q,tostring(e))then
return true
end
return false
end)
if p and q then return true end
end

return false
end

local j=Instance.new"ScreenGui"
j.Name="SubscriptionCheck"
j.ResetOnSpawn=false
j.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
j.Parent=game:GetService"CoreGui"

local k=Instance.new"Frame"
k.Size=UDim2.new(0,420,0,280)
k.Position=UDim2.new(0.5,-210,0.5,-140)
k.BackgroundColor3=Color3.fromRGB(25,25,25)
k.BorderSizePixel=0
k.Parent=j

Instance.new("UICorner",k).CornerRadius=UDim.new(0,12)
local l=Instance.new("UIStroke",k)
l.Color=Color3.fromRGB(80,80,80)
l.Thickness=1

local m=Instance.new"Frame"
m.Name="Particles"
m.Size=UDim2.new(1,0,1,0)
m.Position=UDim2.new(0,0,0,0)
m.BackgroundTransparency=1
m.ClipsDescendants=true
m.ZIndex=0
m.Parent=k
local n={}
for o=1,28 do
local p=Instance.new"Frame"
p.Size=UDim2.new(0,math.random(2,4),0,math.random(2,4))
p.Position=UDim2.new(0,math.random(0,420),0,math.random(0,280))
p.BackgroundColor3=Color3.fromRGB(255,255,255)
p.BorderSizePixel=0
p.ZIndex=0
local q=Instance.new("UICorner",p)
q.CornerRadius=UDim.new(1,0)
p.BackgroundTransparency=math.random(40,85)/100
p.Parent=m
n[#n+1]={
gui=p,
x=p.Position.X.Offset+math.random()*420,
y=p.Position.Y.Offset+math.random()*280,
vy=-0.4-math.random()*0.6,
vx=(math.random()-0.5)*0.3
}
end
c.RenderStepped:Connect(function()
if not m.Parent then return end
for o,p in ipairs(n)do
p.x=p.x+p.vx
p.y=p.y+p.vy
if p.y<-4 then p.y=284 end
if p.y>284 then p.y=-4 end
if p.x<-4 then p.x=424 end
if p.x>424 then p.x=-4 end
p.gui.Position=UDim2.new(0,math.floor(p.x),0,math.floor(p.y))
end
end)

local o=Instance.new"TextLabel"
o.Size=UDim2.new(1,0,0,50)
o.Position=UDim2.new(0,0,0,10)
o.BackgroundTransparency=1
o.Text="Subscription System"
o.TextColor3=Color3.fromRGB(255,255,255)
o.TextSize=24
o.Font=Enum.Font.GothamBold
o.Parent=k

local p=Instance.new"TextLabel"
p.Size=UDim2.new(1,0,0,30)
p.Position=UDim2.new(0,0,0,55)
p.BackgroundTransparency=1
p.Text="Subscribe to my account"
p.TextColor3=Color3.fromRGB(180,180,180)
p.TextSize=16
p.Font=Enum.Font.Gotham
p.Parent=k

local q=Instance.new"TextLabel"
q.Size=UDim2.new(1,-40,0,40)
q.Position=UDim2.new(0,20,0,95)
q.BackgroundTransparency=1
q.Text="My username: 0_9XE4"
q.TextColor3=Color3.fromRGB(140,140,140)
q.TextSize=14
q.Font=Enum.Font.Gotham
q.TextWrapped=true
q.Parent=k

local r=Instance.new"TextButton"
r.Size=UDim2.new(0,300,0,45)
r.Position=UDim2.new(0.5,-150,0,155)
r.BackgroundColor3=Color3.fromRGB(45,45,45)
r.Text="I subscribed"
r.TextColor3=Color3.fromRGB(255,255,255)
r.TextSize=18
r.Font=Enum.Font.GothamSemibold
r.BorderSizePixel=0
r.Parent=k

Instance.new("UICorner",r).CornerRadius=UDim.new(0,8)
local s=Instance.new("UIStroke",r)
s.Color=Color3.fromRGB(100,100,100)
s.Thickness=1

local t=Instance.new"TextLabel"
t.Size=UDim2.new(1,0,0,30)
t.Position=UDim2.new(0,0,0,215)
t.BackgroundTransparency=1
t.Text=""
t.TextColor3=Color3.fromRGB(255,80,80)
t.TextSize=14
t.Font=Enum.Font.GothamSemibold
t.Parent=k

local u=Instance.new"TextLabel"
u.Size=UDim2.new(1,0,0,20)
u.Position=UDim2.new(0,0,0,245)
u.BackgroundTransparency=1
u.Text=""
u.TextColor3=Color3.fromRGB(100,100,100)
u.TextSize=11
u.Font=Enum.Font.Gotham
u.Parent=k

local function LoadScriptHub()
j:Destroy()

local v=loadstring(game:HttpGet'https://sirius.menu/rayfield')()

local w=v:CreateWindow{
Name="Script Hub | "..g,
LoadingTitle="Script Hub",
LoadingSubtitle="By Yoshi",
ConfigurationSaving={
Enabled=true,
FolderName="Yoshi_Configs",
FileName="ScriptHub"
},
KeySystem=false
}

local function Execute(x)
if x and x~=""then local
y=pcall(function()
local y,z=loadstring(x)
if y then y()else warn(z)end
end)
if not y then
v:Notify{Title="Error",Content="Failed to execute script",Duration=3}
end
end
end

local x={
MVSD=w:CreateTab("MVSD",4483362458),
BladeBall=w:CreateTab("Blade Ball",4483362458),
Doors=w:CreateTab("Doors",4483362458),
FTAP=w:CreateTab("FTAP",4483362458),
MM2=w:CreateTab("MM2",4483362458),
MVS=w:CreateTab("MVS",4483362458),
SkyWars=w:CreateTab("SkyWars",4483362458),
STK=w:CreateTab("STK",4483362458),
Universal=w:CreateTab("Universal",4483362458),
ChangeLog=w:CreateTab("Change Log",4483362458),
Settings=w:CreateTab("Settings",4483362458)
}


for y,z in ipairs(h)do
local A={"Script Version: "..z.version,""}
if z.changed and#z.changed>0 then
table.insert(A,"Changed:")
for B,C in ipairs(z.changed)do table.insert(A,"[~] "..C)end
end
if z.added and#z.added>0 then
table.insert(A,"Added:")
for B,C in ipairs(z.added)do table.insert(A,"[+] "..C)end
end
x.ChangeLog:CreateParagraph{Title="v"..z.version.." Update Logs",Content=table.concat(A,"\n")}
end


x.MVSD:CreateSection"Murderers vs Sheriffs DUELS"
x.MVSD:CreateDropdown{Name="No Keyless",Options={"WhyHub [BEST]"},Flag="NK_MVSD",Callback=function(y)_G.C_NK_MVSD=(y[1]=="WhyHub [BEST]")and[[loadstring(game:HttpGet("https://rawscripts.net/raw/Murderers-VS-Sheriffs-DUELS-Legit-Bot-Rage-Bot-Crash-all-Kill-all-82594"))()]]end}
x.MVSD:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_MVSD)end}
x.MVSD:CreateDropdown{Name="Keyless",Options={},Flag="K_MVSD",Callback=function()end}
x.MVSD:CreateButton{Name="Inject Script",Callback=function()end}


x.BladeBall:CreateSection"Blade Ball"
x.BladeBall:CreateDropdown{Name="No Keyless",Options={"Argon Hub X [BEST]",".2xr.","Corolla Hub","Soluna","Sslkin","Bedol Hub"},Flag="NK_BB",Callback=function(y)
local z={["Argon Hub X [BEST]"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/Scriptsnets/BladeBall/refs/heads/main/Argon-Hub-X-BladeBall-OP.lua"))()]],[".2xr."]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/2xrW/return/refs/heads/main/hub"))()]],["Corolla Hub"]=[[loadstring(game:HttpGet('https://raw.githubusercontent.com/7190000/Corolla-Hub/main/ch.lua'))()]],Soluna=[[loadstring(game:HttpGet("https://soluna-script.vercel.app/bladeball.lua",true))()]],Sslkin=[[getgenv().KEY = 'sosalkinhub<3'; loadstring(game:HttpGet('https://raw.githubusercontent.com/cbozovcloh781-hub/kfvweiyulfg2873f2/refs/heads/main/adkfayibhdbfajshfvaufvaeyuv_loaderkeyless'))()]],["Bedol Hub"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))()]]}
_G.C_NK_BB=z[y[1] ]
end}
x.BladeBall:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_BB)end}
x.BladeBall:CreateDropdown{Name="Keyless",Options={"Project Stark [BEST]","Ronix"},Flag="K_BB",Callback=function(y)
local z={["Project Stark [BEST]"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Blade-Ball-Project-Stark-Free-Hub-59919"))()]],Ronix=[[loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fda9babd071d6b536a745774b6bc681c.lua"))()]]}
_G.C_K_BB=z[y[1] ]
end}
x.BladeBall:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_BB)end}


x.Doors:CreateSection"Doors"
x.Doors:CreateDropdown{Name="No Keyless",Options={"Issue of items [BEST]"},Flag="NK_Doors",Callback=function(y)_G.C_NK_Doors=(y[1]=="Issue of items [BEST]")and[[loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/Kitty-Cats-Doors-Beta/refs/heads/main/hub.lua"))()]]end}
x.Doors:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_Doors)end}
x.Doors:CreateDropdown{Name="Keyless",Options={},Flag="K_Doors",Callback=function()end}
x.Doors:CreateButton{Name="Inject Script",Callback=function()end}


x.FTAP:CreateSection"Fling Things And People"
x.FTAP:CreateDropdown{Name="No Keyless",Options={"OP Hub","EndorisFtap Hub","FTAP Hub","Yuki Hub","Holon Hub"},Flag="NK_FTAP",Callback=function(y)
local z={["OP Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-OP-HUB-80884"))()]],["EndorisFtap Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-EndorisFTAP-71376"))()]],["FTAP Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-FTAP-Hub-79081"))()]],["Yuki Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-Yuki-Hub-Ftap-BETA-75713"))()]],["Holon Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-holon-hub-87313"))()]]}
_G.C_NK_FTAP=z[y[1] ]
end}
x.FTAP:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_FTAP)end}
x.FTAP:CreateDropdown{Name="Keyless",Options={"Srv9 [WORKING] [BEST]","Srv9 [NOT WORKING]","Blitz Hub"},Flag="K_FTAP",Callback=function(y)
local z={["Srv9 [WORKING] [BEST]"]=[[script_key="your_key"; loadstring(game:HttpGet("https://srv9.xyz/scripts/loader"))()]],["Srv9 [NOT WORKING]"]=[[script_key="cOSJGNkVTJrtDMwMroMZjwgWvJoXwEom"; loadstring(game:HttpGet("https://srv9.xyz/scripts/loader"))()]],["Blitz Hub"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/refs/heads/main/FTAP.lua"))()]]}
_G.C_K_FTAP=z[y[1] ]
end}
x.FTAP:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_FTAP)end}


x.MM2:CreateSection"Murder Mystery 2"
x.MM2:CreateDropdown{Name="No Keyless",Options={"Vertex [BEST]","Zed","Kumi","Space","LuminWare","Praixe Hub","By me"},Flag="NK_MM2",Callback=function(y)
local z={["Vertex [BEST]"]=[[loadstring(game:HttpGet('https://raw.smokingscripts.org/vertex.lua'))()]],Zed=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-Murder-Mystery-2-script-2026-97170"))()]],Kumi=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Aimbot-I-Player-Role-ESP-I-Autofarm-I-Dupe-I-More-Features-97150"))()]],Space=[[loadstring(game:HttpGet("https://globalexp.xyz/"))()]],LuminWare=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-LuminWare-V2-93112"))()]],["Praixe Hub"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/supernarkl/Praixe-hub-loader/refs/heads/main/Praixe%20hub"))()]],["By me"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/j8nzi/project/refs/heads/main/main.lua", true))()]]}
_G.C_NK_MM2=z[y[1] ]
end}
x.MM2:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_MM2)end}
x.MM2:CreateDropdown{Name="Keyless",Options={"Project Snare","Spark Hub"},Flag="K_MM2",Callback=function(y)
local z={["Project Snare"]=[[loadstring(game:HttpGet("https://scripts.projectsnare.online/SnareMM2", true))()]],["Spark Hub"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/ch3kyk/Script-Hub/refs/heads/main/.gitignore"))()]]}
_G.C_K_MM2=z[y[1] ]
end}
x.MM2:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_MM2)end}


x.MVS:CreateSection"Murderers vs Sheriffs"
x.MVS:CreateDropdown{Name="No Keyless",Options={"DanHub [BEST]","Aetherium","AutoShoot"},Flag="NK_MVS",Callback=function(y)
local z={["DanHub [BEST]"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/DUELS-Murderers-VS-Sheriffs-DANHUB-NO-KEY-AUTO-SHOOT-CLICK-SHOOT-AIM-KILL-HITBOX-ETC-94134"))()]],Aetherium=[[loadstring(game:HttpGet("https://rawscripts.net/raw/DUELS-Murderers-VS-Sheriffs-Duels-AutoPlay-Bot-AutoWin-ESP-Aimbot-Hitbox-94372"))()]],AutoShoot="AUTOSHOOT_LOCAL_CODE"}
_G.C_NK_MVS=z[y[1] ]
end}
x.MVS:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_MVS)end}
x.MVS:CreateDropdown{Name="Keyless",Options={},Flag="K_MVS",Callback=function()end}
x.MVS:CreateButton{Name="Inject Script",Callback=function()end}


x.SkyWars:CreateSection"SkyWars"
x.SkyWars:CreateDropdown{Name="No Keyless",Options={"Soon..."},Flag="NK_Sky",Callback=function()end}
x.SkyWars:CreateButton{Name="Inject Script",Callback=function()end}
x.SkyWars:CreateDropdown{Name="Keyless",Options={"Vape v4 [BEST]"},Flag="K_Sky",Callback=function(y)_G.C_K_Sky=(y[1]=="Vape v4 [BEST]")and[[loadstring(game:HttpGet("https://rawscripts.net/raw/SKYWARS-Vape-v4-43277"))()]]or""end}
x.SkyWars:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_Sky)end}


x.STK:CreateSection"Survive the Killer"
x.STK:CreateDropdown{Name="No Keyless",Options={"Ywxoscripts [BEST]","Vadrifts"},Flag="NK_STK",Callback=function(y)
if y[1]=="Ywxoscripts [BEST]"then _G.C_NK_STK=[[script_key="FnOFBBljPLBHInvKKgMkRKNWsJPNSiRV"; loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/e2c3c4735b2fd5d7ae2ca226cd7ab99c.lua"))()]]
elseif y[1]=="Vadrifts"then _G.C_NK_STK=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/Vadrifts-Hub/refs/heads/main/Games/Survive-The-Killer/source.lua"))()]]end
end}
x.STK:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_STK)end}
x.STK:CreateDropdown{Name="Keyless",Options={"Soon..."},Flag="K_STK",Callback=function()_G.C_K_STK=""end}
x.STK:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_STK)end}


x.Universal:CreateSection"Universal Hub"
x.Universal:CreateDropdown{Name="Universal Hub",Options={"Sirius Hub","XVC Hub","Infiniti Yeild"},Flag="Uni_Hub",Callback=function(y)
local z={["Sirius Hub"]=[[loadstring(game:HttpGet('https://sirius.menu/script'))();]],["XVC Hub"]=[[loadstring(game:HttpGet("https://pastebin.com/raw/Piw5bqGq"))()]],["Infiniti Yeild"]=[[loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()]]}
_G.C_Uni=z[y[1] ]
end}
x.Universal:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_Uni)end}

x.Universal:CreateSection"Fling"
x.Universal:CreateDropdown{Name="Fling Gui",Options={"Fling Gui 1","Fling Gui 2","Fling Gui 3"},Flag="Fling_Drop",Callback=function(y)
local z={["Fling Gui 1"]=[[loadstring((function(t)local s=''for i=1,#t,2 do s=s..string.char(t[i]//t[i+1])end return s end)({216,2,333,3,485,5,700,7,1265,11,1508,13,1938,17,1995,19,2530,23,2987,29,80,2,309,3,485,5,763,7,1111,11,754,13,1224,17,2204,19,2668,23,3248,29,142,2,303,3,580,5,280,7,374,11,1352,13,1972,17,2204,19,2576,23,3335,29,116,2,141,3,235,5,721,7,1188,11,1443,13,1972,17,874,19,2415,23,3219,29,94,2,345,3,550,5,735,7,1232,11,1456,13,1717,17,2204,19,2645,23,1363,29,208,2,168,3,270,5,721,7,1210,11,1495,13,1700,17,1957,19,2691,23,2900,29,94,2,342,3,485,5,833,7,517,11,910,13,1836,17,1995,19,2530,23,2987,29,142,2,351,3,525,5,322,7,1188,11,1521,13,1649,17,646,19,943,23,1189,29,80,2,123,3}))()]],["Fling Gui 2"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/joshclark756/joshclark756-s-scripts/refs/heads/main/fling%20player%20gui%20(unanchored%20parts).lua"))()]],["Fling Gui 3"]=[[loadstring(game:HttpGet("https://rscripts.net/raw/fe-flinger-gui-works-anywhere_1756291955889_SwfaGHMWsT.txt",true))()]]}
_G.C_Fling=z[y[1] ]
end}
x.Universal:CreateButton{Name="Script Inject",Callback=function()Execute(_G.C_Fling)end}

x.Universal:CreateSection"Bang"
x.Universal:CreateDropdown{Name="Bang Gui",Options={"Bang Gui 1","Bang Gui 2"},Flag="Bang_Drop",Callback=function(y)
local z={["Bang Gui 1"]=[[loadstring(game:HttpGet('https://raw.githubusercontent.com/4gh9/Bang-Script-Gui/main/bang%20gui.lua'))()]],["Bang Gui 2"]=[[loadstring(game:HttpGet("https://pastebin.com/raw/SvVYqTh6"))()]]}
_G.C_Bang=z[y[1] ]
end}
x.Universal:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_Bang)end}


x.Settings:CreateSection"Script Settings"
local y={"Default","AmberGlow","Amethyst","Bloom","DarkBlue","Green","Light","Ocean","Serenity"}
x.Settings:CreateDropdown{
Name="Theme",
Options=y,
CurrentOption={"Default"},
Flag="Theme",
Callback=function(z)
local A=(type(z)=="table"and z[1])or z
if A and type(A)=="string"and A~=""then
local B,C=false,"ModifyTheme not found"
if type(w.ModifyTheme)=="function"then
B,C=pcall(w.ModifyTheme,A)
if not B then
B,C=pcall(w.ModifyTheme,w,A)
end
end
if not B and type(v.ModifyTheme)=="function"then
B,C=pcall(v.ModifyTheme,A)
if not B then
B,C=pcall(v.ModifyTheme,v,A)
end
end
if B then
v:Notify{Title="Theme",Content="Theme: "..A,Duration=2}
else
v:Notify{Title="Theme Error",Content=tostring(C or"ModifyTheme not found"),Duration=4}
end
end
end
}
x.Settings:CreateButton{Name="Destroy UI",Callback=function()v:Destroy()end}

v:Notify{Title="Authorized",Content="Script Hub | "..g.." Loaded",Duration=5}
end

r.MouseButton1Click:Connect(function()
r.Text="Checking..."
r.BackgroundColor3=Color3.fromRGB(60,60,60)
t.Text=""
u.Text="UserID: "..tostring(d.UserId).." | Checking..."

task.spawn(function()
local v=IsFollowing()

if v then
t.TextColor3=Color3.fromRGB(80,255,80)
t.Text="Subscribed! Loading..."
u.Text="Verified!"
r.BackgroundColor3=Color3.fromRGB(40,120,40)
r.Text="Verified!"
task.wait(1.5)
LoadScriptHub()
else
t.TextColor3=Color3.fromRGB(255,80,80)
t.Text="No, you're not subscribed"
u.Text="Follow @0_9XE4 on Roblox and try again"
r.BackgroundColor3=Color3.fromRGB(120,30,30)
r.Text="I subscribed"
task.wait(3)
r.BackgroundColor3=Color3.fromRGB(45,45,45)
t.Text=""
u.Text=""
end
end)
end)
