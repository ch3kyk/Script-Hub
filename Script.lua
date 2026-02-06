-- [DIX SYSTEM]: Инициализация расширенного поиска объектов
print("[DIX]: Script Loading...")

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "DIX Exploit | Roblox ESP",
   LoadingTitle = "DIX System Loading...",
   LoadingSubtitle = "by Dixyi",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "DIX_Configs",
      FileName = "ESP_Settings"
   },
   KeySystem = false
})

-- Хранилище настроек
local Settings = {
    Colors = {
        Highlight = Color3.fromRGB(255, 0, 0),
        ForceField = Color3.fromRGB(0, 255, 255),
        NeonGlass = Color3.fromRGB(255, 255, 255)
    },
    Active = {
        Highlight = false,
        ForceField = false,
        NeonGlass = false
    }
}

-- Функция очистки (возвращает стандартный вид всем частям и аксессуарам)
local function ClearChams(type)
    for _, p in pairs(game.Players:GetPlayers()) do
        local char = p.Character
        if char then
            if type == "Highlight" then
                local h = char:FindFirstChild("DIX_Highlight")
                if h then h:Destroy() end
            else
                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Material = Enum.Material.Plastic
                        v.Transparency = 0
                    end
                end
            end
        end
    end
end

-- Функция применения (теперь сканирует абсолютно все вложения)
local function ApplyChams(player, type)
    if player == game.Players.LocalPlayer then return end
    
    local function apply(char)
        if not char then return end
        task.wait(0.3) -- Пауза для полной прогрузки аксессуаров

        -- HIGHLIGHT
        if type == "Highlight" and Settings.Active.Highlight then
            local h = char:FindFirstChild("DIX_Highlight") or Instance.new("Highlight", char)
            h.Name = "DIX_Highlight"
            h.FillColor = Settings.Colors.Highlight
            h.OutlineColor = Color3.fromRGB(255, 255, 255)
            h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        
        -- FORCEFIELD (Все части тела + Все аксессуары)
        elseif type == "ForceField" and Settings.Active.ForceField then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.ForceField
                    v.Color = Settings.Colors.ForceField
                end
            end
            
        -- NEON / GLASS (Все части тела + Все аксессуары)
        elseif type == "NeonGlass" and Settings.Active.NeonGlass then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.Neon
                    v.Color = Settings.Colors.NeonGlass
                    v.Transparency = 0.5
                end
            end
        end
    end

    player.CharacterAdded:Connect(apply)
    if player.Character then apply(player.Character) end
end

local function UpdateAll(type)
    for _, p in pairs(game.Players:GetPlayers()) do ApplyChams(p, type) end
end

-- Вкладки
local TabLog = Window:CreateTab("ChangeLog", 4483362458)
TabLog:CreateSection("Обновления")
TabLog:CreateParagraph({Title = "v1.3.0", Content = "- ForceField теперь влияет на ВСЕ аксессуары\n- Neon / Glass теперь влияет на ВСЕ аксессуары\n- Оптимизирован поиск через GetDescendants"})

local TabESP = Window:CreateTab("ESP", 4483345998)

-- --- HIGHLIGHT SECTION ---
TabESP:CreateSection("Highlight ESP")

TabESP:CreateColorPicker({
    Name = "Highlight color",
    Color = Settings.Colors.Highlight,
    Flag = "C_HL",
    Callback = function(Value)
        Settings.Colors.Highlight = Value
        if Settings.Active.Highlight then UpdateAll("Highlight") end
    end,
})

TabESP:CreateToggle({
   Name = "Highlight Chams",
   CurrentValue = false,
   Flag = "T_HL",
   Callback = function(Value)
      Settings.Active.Highlight = Value
      if Value then UpdateAll("Highlight") else ClearChams("Highlight") end
   end,
})

-- --- FORCEFIELD SECTION ---
TabESP:CreateSection("ForceField Chams ESP")

TabESP:CreateColorPicker({
    Name = "ForceField Chams color",
    Color = Settings.Colors.ForceField,
    Flag = "C_FF",
    Callback = function(Value)
        Settings.Colors.ForceField = Value
        if Settings.Active.ForceField then UpdateAll("ForceField") end
    end,
})

TabESP:CreateToggle({
   Name = "ForceField Chams",
   CurrentValue = false,
   Flag = "T_FF",
   Callback = function(Value)
      Settings.Active.ForceField = Value
      if Value then UpdateAll("ForceField") else ClearChams("ForceField") end
   end,
})

-- --- NEON / GLASS SECTION ---
TabESP:CreateSection("Neon / Glass Chams ESP")

TabESP:CreateColorPicker({
    Name = "Toggle Neon / Glass Chams color",
    Color = Settings.Colors.NeonGlass,
    Flag = "C_Neon",
    Callback = function(Value)
        Settings.Colors.NeonGlass = Value
        if Settings.Active.NeonGlass then UpdateAll("NeonGlass") end
    end,
})

TabESP:CreateToggle({
   Name = "Neon / Glass Chams",
   CurrentValue = false,
   Flag = "T_Neon",
   Callback = function(Value)
      Settings.Active.NeonGlass = Value
      if Value then UpdateAll("NeonGlass") else ClearChams("NeonGlass") end
   end,
})

Rayfield:LoadConfiguration()
print("[DIX]: Script Loaded. Full Accessory Support Active.")