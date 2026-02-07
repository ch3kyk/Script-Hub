local a=game:GetService"Players"
local b=game:GetService"HttpService"
local c=game:GetService"RunService"
local d=game:GetService"TweenService"
game:GetService"UserInputService"
game:GetService"CoreGui"
local e=a.LocalPlayer

local f=4912088123
local g="0_9XE4"

local h="1.4"
local i={
{version="1.4",changed={"TARGET_USER_ID → 4912088123"},added={"Subscription system","Theme dropdown (Settings)","Animated backdrop on inject","Particles on subscription window","Interface Settings toggles"}},
{version="1.3",changed={"Vertex, WhyHub, Ywxoscripts, Vape v4, DanHub, Srv9, Issue of items, Project Stark [BEST]"},added={"Argon Hub X (Blade Ball)"}},
{version="1.2",added={"MM2: Spark Hub, Praixe Hub, By me","Ronix, Project Stark (Blade Ball)"}}
}

local j=(syn and syn.request)or(http and http.request)or http_request or request or(fluxus and fluxus.request)

local function IsFollowing()
if e.Name==g or e.UserId==f then
return true
end

local k=e.UserId
local l=false

local m={
"friends.roproxy.com",
"friends.rblx.trade",
"friends.roblox.com"
}

for n,o in ipairs(m)do
if l then break end
local p,q=pcall(function()
local p=""
repeat
local q="https://"..o.."/v1/users/"..k.."/followings?limit=100&sortOrder=Desc"
if p~=""then
q=q.."&cursor="..p
end
local r
if j then
local s=j{Url=q,Method="GET"}
if s then r=s.Body end
else
r=game:HttpGet(q)
end
if not r or r==""then return false end
local s=b:JSONDecode(r)
if not s or not s.data then return false end
for t,u in ipairs(s.data)do
if u.id==f then
l=true
return true
end
end
p=s.nextPageCursor or""
until p==""or l
return false
end)
if p and q then l=true end
end
if l then return true end

for n,o in ipairs(m)do
if l then break end
local p,q=pcall(function()
local p=""
repeat
local q="https://"..o.."/v1/users/"..f.."/followers?limit=100&sortOrder=Desc"
if p~=""then
q=q.."&cursor="..p
end
local r
if j then
local s=j{Url=q,Method="GET"}
if s then r=s.Body end
else
r=game:HttpGet(q)
end
if not r or r==""then return false end
local s=b:JSONDecode(r)
if not s or not s.data then return false end
for t,u in ipairs(s.data)do
if u.id==k then
l=true
return true
end
end
p=s.nextPageCursor or""
until p==""or l
return false
end)
if p and q then l=true end
end
if l then return true end

if j then
local n,o=pcall(function()
local n=j{
Url="https://friends.roblox.com/v1/user/following-exists",
Method="POST",
Headers={
["Content-Type"]="application/json",Accept=
"application/json"
},
Body=b:JSONEncode{targetUserIds={f}}
}
if n and n.Body then
local o=b:JSONDecode(n.Body)
if o and o.followings then
for p,q in ipairs(o.followings)do
if q.userId==f and q.isFollowing==true then
return true
end
end
end
end
return false
end)
if n and o then return true end
end

local n={
"www.roproxy.com",
"www.rblx.trade",
"www.roblox.com"
}
for o,p in ipairs(n)do
local q,r=pcall(function()
local q="https://"..p.."/users/"..f.."/profile"
local r
if j then
local s=j{Url=q,Method="GET"}
if s then r=s.Body end
else
r=game:HttpGet(q)
end
if r then
if string.find(r,"btn%-unfollow")or
string.find(r,"icon%-unfollow")or
string.find(r,"already%-following")or
string.find(r,"UnfollowUser")then
return true
end
end
return false
end)
if q and r then return true end
end

if j then
local o,p=pcall(function()
local o=j{
Url="https://friends.roblox.com/v1/my/friends/count",
Method="GET"
}
if o and o.StatusCode==200 then
local p=j{
Url="https://friends.roblox.com/v1/users/"..k.."/followings?limit=100&sortOrder=Desc",
Method="GET"
}
if p and p.Body then
if string.find(p.Body,tostring(f))then
return true
end
end
end
return false
end)
if o and p then return true end
end

for o,p in ipairs(m)do
local q,r=pcall(function()
local q="https://"..p.."/v1/users/"..k.."/followings?limit=100&sortOrder=Desc"
local r
if j then
local s=j{Url=q,Method="GET"}
if s then r=s.Body end
else
r=game:HttpGet(q)
end
if r and string.find(r,tostring(f))then
return true
end
return false
end)
if q and r then return true end
end

return false
end

local k=Instance.new"ScreenGui"
k.Name="SubscriptionCheck"
k.ResetOnSpawn=false
k.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
k.Parent=game:GetService"CoreGui"

local l=Instance.new"Frame"
l.Name="Backdrop"
l.AnchorPoint=Vector2.new(0.5,0.5)
l.Size=UDim2.new(2,0,2,0)
l.Position=UDim2.new(0.5,0,0.5,0)
l.BackgroundColor3=Color3.fromRGB(30,30,30)
l.BackgroundTransparency=1
l.BorderSizePixel=0
l.ZIndex=0
l.Parent=k

local m=Instance.new"Frame"
m.Size=UDim2.new(0,420,0,280)
m.Position=UDim2.new(0.5,-210,0.5,-140)
m.BackgroundColor3=Color3.fromRGB(25,25,25)
m.BorderSizePixel=0
m.Parent=k

Instance.new("UICorner",m).CornerRadius=UDim.new(0,12)
local n=Instance.new("UIStroke",m)
n.Color=Color3.fromRGB(80,80,80)
n.Thickness=1

local o=Instance.new"Frame"
o.Name="Particles"
o.Size=UDim2.new(1,0,1,0)
o.Position=UDim2.new(0,0,0,0)
o.BackgroundTransparency=1
o.ClipsDescendants=true
o.ZIndex=0
o.Parent=m
local p={}
for q=1,28 do
local r=Instance.new"Frame"
r.Size=UDim2.new(0,math.random(2,4),0,math.random(2,4))
r.Position=UDim2.new(0,math.random(0,420),0,math.random(0,280))
r.BackgroundColor3=Color3.fromRGB(255,255,255)
r.BorderSizePixel=0
r.ZIndex=0
local s=Instance.new("UICorner",r)
s.CornerRadius=UDim.new(1,0)
r.BackgroundTransparency=math.random(40,85)/100
r.Parent=o
p[#p+1]={
gui=r,
x=r.Position.X.Offset+math.random()*420,
y=r.Position.Y.Offset+math.random()*280,
vy=-0.4-math.random()*0.6,
vx=(math.random()-0.5)*0.3
}
end
c.RenderStepped:Connect(function()
if not o.Parent then return end
for q,r in ipairs(p)do
r.x=r.x+r.vx
r.y=r.y+r.vy
if r.y<-4 then r.y=284 end
if r.y>284 then r.y=-4 end
if r.x<-4 then r.x=424 end
if r.x>424 then r.x=-4 end
r.gui.Position=UDim2.new(0,math.floor(r.x),0,math.floor(r.y))
end
end)

local q=Instance.new"TextLabel"
q.Size=UDim2.new(1,0,0,50)
q.Position=UDim2.new(0,0,0,10)
q.BackgroundTransparency=1
q.Text="Subscription System"
q.TextColor3=Color3.fromRGB(255,255,255)
q.TextSize=24
q.Font=Enum.Font.GothamBold
q.Parent=m

local r=Instance.new"TextLabel"
r.Size=UDim2.new(1,0,0,30)
r.Position=UDim2.new(0,0,0,55)
r.BackgroundTransparency=1
r.Text="Subscribe to my account"
r.TextColor3=Color3.fromRGB(180,180,180)
r.TextSize=16
r.Font=Enum.Font.Gotham
r.Parent=m

local s=Instance.new"TextLabel"
s.Size=UDim2.new(1,-40,0,40)
s.Position=UDim2.new(0,20,0,95)
s.BackgroundTransparency=1
s.Text="My username: 0_9XE4"
s.TextColor3=Color3.fromRGB(140,140,140)
s.TextSize=14
s.Font=Enum.Font.Gotham
s.TextWrapped=true
s.Parent=m

local t=Instance.new"TextButton"
t.Size=UDim2.new(0,300,0,45)
t.Position=UDim2.new(0.5,-150,0,155)
t.BackgroundColor3=Color3.fromRGB(45,45,45)
t.Text="I subscribed"
t.TextColor3=Color3.fromRGB(255,255,255)
t.TextSize=18
t.Font=Enum.Font.GothamSemibold
t.BorderSizePixel=0
t.Parent=m

Instance.new("UICorner",t).CornerRadius=UDim.new(0,8)
local u=Instance.new("UIStroke",t)
u.Color=Color3.fromRGB(100,100,100)
u.Thickness=1

local v=Instance.new"TextLabel"
v.Size=UDim2.new(1,0,0,30)
v.Position=UDim2.new(0,0,0,215)
v.BackgroundTransparency=1
v.Text=""
v.TextColor3=Color3.fromRGB(255,80,80)
v.TextSize=14
v.Font=Enum.Font.GothamSemibold
v.Parent=m

local w=Instance.new"TextLabel"
w.Size=UDim2.new(1,0,0,20)
w.Position=UDim2.new(0,0,0,245)
w.BackgroundTransparency=1
w.Text=""
w.TextColor3=Color3.fromRGB(100,100,100)
w.TextSize=11
w.Font=Enum.Font.Gotham
w.Parent=m

local x=d:Create(l,TweenInfo.new(0.5,Enum.EasingStyle.Quad),{BackgroundTransparency=0.55})
x:Play()

local function LoadScriptHub()
k:Destroy()

local y=loadstring(game:HttpGet'https://sirius.menu/rayfield')()

local z=y:CreateWindow{
Name="Script Hub | "..h,
LoadingTitle="Script Hub",
LoadingSubtitle="By Yoshi",
ConfigurationSaving={
Enabled=true,
FolderName="Yoshi_Configs",
FileName="ScriptHub"
},
KeySystem=false
}

local function Execute(A)
if A and A~=""then local
B=pcall(function()
local B,C=loadstring(A)
if B then B()else warn(C)end
end)
if not B then
y:Notify{Title="Error",Content="Failed to execute script",Duration=3}
end
end
end

local A={
MVSD=z:CreateTab("MVSD",4483362458),
BladeBall=z:CreateTab("Blade Ball",4483362458),
Doors=z:CreateTab("Doors",4483362458),
FTAP=z:CreateTab("FTAP",4483362458),
MM2=z:CreateTab("MM2",4483362458),
MVS=z:CreateTab("MVS",4483362458),
SkyWars=z:CreateTab("SkyWars",4483362458),
STK=z:CreateTab("STK",4483362458),
Universal=z:CreateTab("Universal",4483362458),
ChangeLog=z:CreateTab("Change Log",4483362458),
Settings=z:CreateTab("Settings",4483362458)
}


for B,C in ipairs(i)do
local D={"Script Version: "..C.version,""}
if C.changed and#C.changed>0 then
table.insert(D,"Changed:")
for E,F in ipairs(C.changed)do table.insert(D,"[~] "..F)end
end
if C.added and#C.added>0 then
table.insert(D,"Added:")
for E,F in ipairs(C.added)do table.insert(D,"[+] "..F)end
end
A.ChangeLog:CreateParagraph{Title="v"..C.version.." Update Logs",Content=table.concat(D,"\n")}
end


A.MVSD:CreateSection"Murderers vs Sheriffs DUELS"
A.MVSD:CreateDropdown{Name="No Keyless",Options={"WhyHub [BEST]"},Flag="NK_MVSD",Callback=function(B)_G.C_NK_MVSD=(B[1]=="WhyHub [BEST]")and[[loadstring(game:HttpGet("https://rawscripts.net/raw/Murderers-VS-Sheriffs-DUELS-Legit-Bot-Rage-Bot-Crash-all-Kill-all-82594"))()]]end}
A.MVSD:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_MVSD)end}
A.MVSD:CreateDropdown{Name="Keyless",Options={},Flag="K_MVSD",Callback=function()end}
A.MVSD:CreateButton{Name="Inject Script",Callback=function()end}


A.BladeBall:CreateSection"Blade Ball"
A.BladeBall:CreateDropdown{Name="No Keyless",Options={"Argon Hub X [BEST]",".2xr.","Corolla Hub","Soluna","Sslkin","Bedol Hub"},Flag="NK_BB",Callback=function(B)
local C={["Argon Hub X [BEST]"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/Scriptsnets/BladeBall/refs/heads/main/Argon-Hub-X-BladeBall-OP.lua"))()]],[".2xr."]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/2xrW/return/refs/heads/main/hub"))()]],["Corolla Hub"]=[[loadstring(game:HttpGet('https://raw.githubusercontent.com/7190000/Corolla-Hub/main/ch.lua'))()]],Soluna=[[loadstring(game:HttpGet("https://soluna-script.vercel.app/bladeball.lua",true))()]],Sslkin=[[getgenv().KEY = 'sosalkinhub<3'; loadstring(game:HttpGet('https://raw.githubusercontent.com/cbozovcloh781-hub/kfvweiyulfg2873f2/refs/heads/main/adkfayibhdbfajshfvaufvaeyuv_loaderkeyless'))()]],["Bedol Hub"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))()]]}
_G.C_NK_BB=C[B[1] ]
end}
A.BladeBall:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_BB)end}
A.BladeBall:CreateDropdown{Name="Keyless",Options={"Project Stark [BEST]","Ronix"},Flag="K_BB",Callback=function(B)
local C={["Project Stark [BEST]"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Blade-Ball-Project-Stark-Free-Hub-59919"))()]],Ronix=[[loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fda9babd071d6b536a745774b6bc681c.lua"))()]]}
_G.C_K_BB=C[B[1] ]
end}
A.BladeBall:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_BB)end}


A.Doors:CreateSection"Doors"
A.Doors:CreateDropdown{Name="No Keyless",Options={"Issue of items [BEST]"},Flag="NK_Doors",Callback=function(B)_G.C_NK_Doors=(B[1]=="Issue of items [BEST]")and[[loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/Kitty-Cats-Doors-Beta/refs/heads/main/hub.lua"))()]]end}
A.Doors:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_Doors)end}
A.Doors:CreateDropdown{Name="Keyless",Options={},Flag="K_Doors",Callback=function()end}
A.Doors:CreateButton{Name="Inject Script",Callback=function()end}


A.FTAP:CreateSection"Fling Things And People"
A.FTAP:CreateDropdown{Name="No Keyless",Options={"OP Hub","EndorisFtap Hub","FTAP Hub","Yuki Hub","Holon Hub"},Flag="NK_FTAP",Callback=function(B)
local C={["OP Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-OP-HUB-80884"))()]],["EndorisFtap Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-EndorisFTAP-71376"))()]],["FTAP Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-FTAP-Hub-79081"))()]],["Yuki Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-Yuki-Hub-Ftap-BETA-75713"))()]],["Holon Hub"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-holon-hub-87313"))()]]}
_G.C_NK_FTAP=C[B[1] ]
end}
A.FTAP:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_FTAP)end}
A.FTAP:CreateDropdown{Name="Keyless",Options={"Srv9 [WORKING] [BEST]","Srv9 [NOT WORKING]","Blitz Hub"},Flag="K_FTAP",Callback=function(B)
local C={["Srv9 [WORKING] [BEST]"]=[[script_key="your_key"; loadstring(game:HttpGet("https://srv9.xyz/scripts/loader"))()]],["Srv9 [NOT WORKING]"]=[[script_key="cOSJGNkVTJrtDMwMroMZjwgWvJoXwEom"; loadstring(game:HttpGet("https://srv9.xyz/scripts/loader"))()]],["Blitz Hub"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/refs/heads/main/FTAP.lua"))()]]}
_G.C_K_FTAP=C[B[1] ]
end}
A.FTAP:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_FTAP)end}


A.MM2:CreateSection"Murder Mystery 2"
A.MM2:CreateDropdown{Name="No Keyless",Options={"Vertex [BEST]","Zed","Kumi","Space","LuminWare","Praixe Hub","By me"},Flag="NK_MM2",Callback=function(B)
local C={["Vertex [BEST]"]=[[loadstring(game:HttpGet('https://raw.smokingscripts.org/vertex.lua'))()]],Zed=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-Murder-Mystery-2-script-2026-97170"))()]],Kumi=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Aimbot-I-Player-Role-ESP-I-Autofarm-I-Dupe-I-More-Features-97150"))()]],Space=[[loadstring(game:HttpGet("https://globalexp.xyz/"))()]],LuminWare=[[loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-LuminWare-V2-93112"))()]],["Praixe Hub"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/supernarkl/Praixe-hub-loader/refs/heads/main/Praixe%20hub"))()]],["By me"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/j8nzi/project/refs/heads/main/main.lua", true))()]]}
_G.C_NK_MM2=C[B[1] ]
end}
A.MM2:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_MM2)end}
A.MM2:CreateDropdown{Name="Keyless",Options={"Project Snare","Spark Hub"},Flag="K_MM2",Callback=function(B)
local C={["Project Snare"]=[[loadstring(game:HttpGet("https://scripts.projectsnare.online/SnareMM2", true))()]],["Spark Hub"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/ch3kyk/Script-Hub/refs/heads/main/.gitignore"))()]]}
_G.C_K_MM2=C[B[1] ]
end}
A.MM2:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_MM2)end}


A.MVS:CreateSection"Murderers vs Sheriffs"
A.MVS:CreateDropdown{Name="No Keyless",Options={"DanHub [BEST]","Aetherium","AutoShoot"},Flag="NK_MVS",Callback=function(B)
local C={["DanHub [BEST]"]=[[loadstring(game:HttpGet("https://rawscripts.net/raw/DUELS-Murderers-VS-Sheriffs-DANHUB-NO-KEY-AUTO-SHOOT-CLICK-SHOOT-AIM-KILL-HITBOX-ETC-94134"))()]],Aetherium=[[loadstring(game:HttpGet("https://rawscripts.net/raw/DUELS-Murderers-VS-Sheriffs-Duels-AutoPlay-Bot-AutoWin-ESP-Aimbot-Hitbox-94372"))()]],AutoShoot="AUTOSHOOT_LOCAL_CODE"}
_G.C_NK_MVS=C[B[1] ]
end}
A.MVS:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_MVS)end}
A.MVS:CreateDropdown{Name="Keyless",Options={},Flag="K_MVS",Callback=function()end}
A.MVS:CreateButton{Name="Inject Script",Callback=function()end}


A.SkyWars:CreateSection"SkyWars"
A.SkyWars:CreateDropdown{Name="No Keyless",Options={"Soon..."},Flag="NK_Sky",Callback=function()end}
A.SkyWars:CreateButton{Name="Inject Script",Callback=function()end}
A.SkyWars:CreateDropdown{Name="Keyless",Options={"Vape v4 [BEST]"},Flag="K_Sky",Callback=function(B)_G.C_K_Sky=(B[1]=="Vape v4 [BEST]")and[[loadstring(game:HttpGet("https://rawscripts.net/raw/SKYWARS-Vape-v4-43277"))()]]or""end}
A.SkyWars:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_Sky)end}


A.STK:CreateSection"Survive the Killer"
A.STK:CreateDropdown{Name="No Keyless",Options={"Ywxoscripts [BEST]","Vadrifts"},Flag="NK_STK",Callback=function(B)
if B[1]=="Ywxoscripts [BEST]"then _G.C_NK_STK=[[script_key="FnOFBBljPLBHInvKKgMkRKNWsJPNSiRV"; loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/e2c3c4735b2fd5d7ae2ca226cd7ab99c.lua"))()]]
elseif B[1]=="Vadrifts"then _G.C_NK_STK=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/Vadrifts-Hub/refs/heads/main/Games/Survive-The-Killer/source.lua"))()]]end
end}
A.STK:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_NK_STK)end}
A.STK:CreateDropdown{Name="Keyless",Options={"Soon..."},Flag="K_STK",Callback=function()_G.C_K_STK=""end}
A.STK:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_K_STK)end}


A.Universal:CreateSection"Universal Hub"
A.Universal:CreateDropdown{Name="Universal Hub",Options={"Sirius Hub","XVC Hub","Infiniti Yeild"},Flag="Uni_Hub",Callback=function(B)
local C={["Sirius Hub"]=[[loadstring(game:HttpGet('https://sirius.menu/script'))();]],["XVC Hub"]=[[loadstring(game:HttpGet("https://pastebin.com/raw/Piw5bqGq"))()]],["Infiniti Yeild"]=[[loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()]]}
_G.C_Uni=C[B[1] ]
end}
A.Universal:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_Uni)end}

A.Universal:CreateSection"Fling"
A.Universal:CreateDropdown{Name="Fling Gui",Options={"Fling Gui 1","Fling Gui 2","Fling Gui 3"},Flag="Fling_Drop",Callback=function(B)
local C={["Fling Gui 1"]=[[loadstring((function(t)local s=''for i=1,#t,2 do s=s..string.char(t[i]//t[i+1])end return s end)({216,2,333,3,485,5,700,7,1265,11,1508,13,1938,17,1995,19,2530,23,2987,29,80,2,309,3,485,5,763,7,1111,11,754,13,1224,17,2204,19,2668,23,3248,29,142,2,303,3,580,5,280,7,374,11,1352,13,1972,17,2204,19,2576,23,3335,29,116,2,141,3,235,5,721,7,1188,11,1443,13,1972,17,874,19,2415,23,3219,29,94,2,345,3,550,5,735,7,1232,11,1456,13,1717,17,2204,19,2645,23,1363,29,208,2,168,3,270,5,721,7,1210,11,1495,13,1700,17,1957,19,2691,23,2900,29,94,2,342,3,485,5,833,7,517,11,910,13,1836,17,1995,19,2530,23,2987,29,142,2,351,3,525,5,322,7,1188,11,1521,13,1649,17,646,19,943,23,1189,29,80,2,123,3}))()]],["Fling Gui 2"]=[[loadstring(game:HttpGet("https://raw.githubusercontent.com/joshclark756/joshclark756-s-scripts/refs/heads/main/fling%20player%20gui%20(unanchored%20parts).lua"))()]],["Fling Gui 3"]=[[loadstring(game:HttpGet("https://rscripts.net/raw/fe-flinger-gui-works-anywhere_1756291955889_SwfaGHMWsT.txt",true))()]]}
_G.C_Fling=C[B[1] ]
end}
A.Universal:CreateButton{Name="Script Inject",Callback=function()Execute(_G.C_Fling)end}

A.Universal:CreateSection"Bang"
A.Universal:CreateDropdown{Name="Bang Gui",Options={"Bang Gui 1","Bang Gui 2"},Flag="Bang_Drop",Callback=function(B)
local C={["Bang Gui 1"]=[[loadstring(game:HttpGet('https://raw.githubusercontent.com/4gh9/Bang-Script-Gui/main/bang%20gui.lua'))()]],["Bang Gui 2"]=[[loadstring(game:HttpGet("https://pastebin.com/raw/SvVYqTh6"))()]]}
_G.C_Bang=C[B[1] ]
end}
A.Universal:CreateButton{Name="Inject Script",Callback=function()Execute(_G.C_Bang)end}


A.Settings:CreateSection"Script Settings"
local B={"Default","AmberGlow","Amethyst","Bloom","DarkBlue","Green","Light","Ocean","Serenity"}
A.Settings:CreateDropdown{
Name="Theme",
Options=B,
CurrentOption={"Default"},
Flag="Theme",
Callback=function(C)
local D=(type(C)=="table"and C[1])or C
if D and type(D)=="string"and D~=""then
local E,F=false,"ModifyTheme not found"
if type(z.ModifyTheme)=="function"then
E,F=pcall(z.ModifyTheme,D)
if not E then
E,F=pcall(z.ModifyTheme,z,D)
end
end
if not E and type(y.ModifyTheme)=="function"then
E,F=pcall(y.ModifyTheme,D)
if not E then
E,F=pcall(y.ModifyTheme,y,D)
end
end
if E then
y:Notify{Title="Theme",Content="Theme: "..D,Duration=2}
else
y:Notify{Title="Theme Error",Content=tostring(F or"ModifyTheme not found"),Duration=4}
end
end
end
}
A.Settings:CreateButton{Name="Destroy UI",Callback=function()y:Destroy()end}

y:Notify{Title="Authorized",Content="Script Hub | "..h.." Loaded",Duration=5}
end

t.MouseButton1Click:Connect(function()
t.Text="Checking..."
t.BackgroundColor3=Color3.fromRGB(60,60,60)
v.Text=""
w.Text="UserID: "..tostring(e.UserId).." | Checking..."

task.spawn(function()
local y=IsFollowing()

if y then
v.TextColor3=Color3.fromRGB(80,255,80)
v.Text="Subscribed! Loading..."
w.Text="Verified!"
t.BackgroundColor3=Color3.fromRGB(40,120,40)
t.Text="Verified!"
task.wait(1.2)
local z=d:Create(l,TweenInfo.new(0.4,Enum.EasingStyle.Quad),{BackgroundTransparency=1})
z:Play()
z.Completed:Wait()
LoadScriptHub()
else
v.TextColor3=Color3.fromRGB(255,80,80)
v.Text="No, you're not subscribed"
w.Text="Follow @0_9XE4 on Roblox and try again"
t.BackgroundColor3=Color3.fromRGB(120,30,30)
t.Text="I subscribed"
task.wait(3)
t.BackgroundColor3=Color3.fromRGB(45,45,45)
v.Text=""
w.Text=""
end
end)
end)
