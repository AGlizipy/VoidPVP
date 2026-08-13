local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local CONFIG_FILE = "RJR_NEW_C.json"
_G.G_FastAttack       = _G.G_FastAttack ~= true
_G.G_FastAttackMode   = _G.G_FastAttackMode or "模式2(部分账号失效用)"
_G.G_AttackMobs       = _G.G_AttackMobs ~= true
_G.G_AttackPlayers    = _G.G_AttackPlayers ~= true
_G.G_DragonGunM1      = _G.G_DragonGunM1 or false
_G.G_M1FireInterval   = _G.G_M1FireInterval or 0.2
_G.G_FruitM1          = _G.G_FruitM1 or false
_G.G_AutoHaki         = _G.G_AutoHaki or false
_G.G_AutoV3           = _G.G_AutoV3 or false
_G.G_AutoV4           = _G.G_AutoV4 or false
_G.G_AutoFlee         = _G.G_AutoFlee or false
_G.G_AutoFleeHP       = _G.G_AutoFleeHP or 30
_G.G_translateSpeed   = _G.G_translateSpeed or 50
_G.G_translateAccel   = _G.G_translateAccel or false
_G.G_jumpHeight       = _G.G_jumpHeight or 50
_G.G_jumpEnabled      = _G.G_jumpEnabled or false
_G.G_InfiniteJump     = _G.G_InfiniteJump or false
_G.G_Fly              = _G.G_Fly or false
_G.G_Noclip           = _G.G_Noclip or false
_G.G_ESPEnabled       = _G.G_ESPEnabled ~= false
_G.G_ESP_Name         = _G.G_ESP_Name ~= false
_G.G_ESP_Level        = _G.G_ESP_Level ~= false
_G.G_ESP_Bounty       = _G.G_ESP_Bounty ~= false
_G.G_ESP_Fruit        = _G.G_ESP_Fruit ~= false
_G.G_ESP_Distance     = _G.G_ESP_Distance ~= false
_G.G_ESP_HP           = _G.G_ESP_HP ~= false
_G.G_ESP_TextSize     = _G.G_ESP_TextSize or 14
_G.G_ESP_Highlight    = _G.G_ESP_Highlight or false
_G.G_ESP_HighlightColor = _G.G_ESP_HighlightColor or "FF0000"
_G.G_ESP_Layout       = _G.G_ESP_Layout or "经典"
_G.G_ESP_NameColor    = _G.G_ESP_NameColor or "FFFF00"
_G.G_ESP_LevelColor   = _G.G_ESP_LevelColor or "00FF00"
_G.G_ESP_BountyColor  = _G.G_ESP_BountyColor or "FFD700"
_G.G_ESP_FruitColor   = _G.G_ESP_FruitColor or "FF69B4"
_G.G_ESP_DistanceColor= _G.G_ESP_DistanceColor or "00FFFF"
_G.G_ESP_HPColor      = _G.G_ESP_HPColor or "FF5555"
_G.G_ESP_Avatar       = _G.G_ESP_Avatar or false
_G.G_ESP_AvatarSide   = _G.G_ESP_AvatarSide or "右边"

-- Misc
_G.G_currentZoom      = _G.G_currentZoom or 0
_G.G_DodgeNoCooldown  = _G.G_DodgeNoCooldown or false
_G.G_DashLengthEnabled= _G.G_DashLengthEnabled or false
_G.G_DashLength       = _G.G_DashLength or 5
_G.G_RemoveLava       = _G.G_RemoveLava or false
_G.G_RemoveFog        = _G.G_RemoveFog or false
_G.G_RemoveAnim       = _G.G_RemoveAnim or false
_G.G_RemoveGhostShip  = _G.G_RemoveGhostShip or false
_G.G_WalkOnWater      = _G.G_WalkOnWater or false
_G.G_spinEnabled      = _G.G_spinEnabled or false
_G.G_spinSpeed        = _G.G_spinSpeed or 10
_G.G_AutoFpsLock      = _G.G_AutoFpsLock or false
_G.G_NoMove           = _G.G_NoMove or false

_G.G_TeleportOffsetX  = _G.G_TeleportOffsetX or 0
_G.G_TeleportOffsetY  = _G.G_TeleportOffsetY or 0
_G.G_TeleportOffsetZ  = _G.G_TeleportOffsetZ or 0
_G.G_SelectPly        = _G.G_SelectPly or ""
_G.G_TeleportPly      = _G.G_TeleportPly or false
_G.G_Teleport         = _G.G_Teleport or false
_G.G_Lock2            = _G.G_Lock2 or false
_G.G_LockOrbit        = _G.G_LockOrbit or false
_G.G_TeleportPredict  = _G.G_TeleportPredict or false
_G.G_LockQuickPath    = _G.G_LockQuickPath ~= false
_G.G_SpectatePlys     = _G.G_SpectatePlys or false

_G.G_ServerRegion       = _G.G_ServerRegion or "Singapore"
_G.G_HopPlayerRange = _G.G_HopPlayerRange or "1-12"
_G.G_HopBountyRange = _G.G_HopBountyRange or "大于3m"
_G.G_HopMinPlayers = _G.G_HopMinPlayers or 1
_G.G_HopMaxPlayers = _G.G_HopMaxPlayers or 12
_G.G_HopMinBounty = _G.G_HopMinBounty or 3000001
_G.G_HopMaxBounty = _G.G_HopMaxBounty or 999999999

_G.G_SilentAimM1R   = _G.G_SilentAimM1R or false
_G.G_SilentAimSkill = _G.G_SilentAimSkill or false
_G.G_SilentAimSkills = _G.G_SilentAimSkills or {"Z", "X", "C", "V", "F"}
_G.G_SilentAimShowFOV = _G.G_SilentAimShowFOV or false
_G.G_SilentAimFOV     = _G.G_SilentAimFOV or 100
_G.G_SilentAimPart    = _G.G_SilentAimPart or "Head"
_G.G_SilentAimFOVThickness = _G.G_SilentAimFOVThickness or 2
_G.G_SilentAimFOVTransparency = _G.G_SilentAimFOVTransparency or 1
_G.G_SilentAimTargetPlayers = _G.G_SilentAimTargetPlayers or false
_G.G_SilentAimTargetMobs    = _G.G_SilentAimTargetMobs or false
_G.G_SilentAimShowLine      = _G.G_SilentAimShowLine or false
_G.G_SilentAimFOVMode       = _G.G_SilentAimFOVMode or "跟随鼠标"
_G.G_SilentAimTeamCheck     = _G.G_SilentAimTeamCheck or false
_G.G_SilentAimExcludePVP    = _G.G_SilentAimExcludePVP or false
_G.G_SilentAimMethod        = _G.G_SilentAimMethod or "鼠标最近的玩家"
_G.G_LockHotkey              = _G.G_LockHotkey or false
_G.G_LockHotkeyMode          = _G.G_LockHotkeyMode or "锁人1"
_G.G_LockHotkeyKey           = _G.G_LockHotkeyKey or "H"
_G.G_AutoSoru                = _G.G_AutoSoru or false

_G.G_Theme            = _G.G_Theme or "Light"
_G.G_Language         = _G.G_Language or "中文"

local ConfigKeys = {
    "G_FastAttack",
    "G_FastAttackMode",
    "G_AttackMobs",
    "G_AttackPlayers",
    "G_DragonGunM1",
    "G_M1FireInterval",
    "G_FruitM1",
    "G_AutoHaki",
    "G_AutoV3",
    "G_AutoV4",
    "G_AutoFlee",
    "G_AutoFleeHP",
    "G_translateSpeed",
    "G_translateAccel",
    "G_jumpHeight",
    "G_jumpEnabled",
    "G_InfiniteJump",
    "G_Fly",
    "G_Noclip",
    "G_ESPEnabled",
    "G_ESP_Name",
    "G_ESP_Level",
    "G_ESP_Bounty",
    "G_ESP_Fruit",
    "G_ESP_Distance",
    "G_ESP_HP",
    "G_ESP_TextSize",
    "G_ESP_Highlight",
    "G_ESP_HighlightColor",
    "G_ESP_Layout",
    "G_ESP_NameColor",
    "G_ESP_LevelColor",
    "G_ESP_BountyColor",
    "G_ESP_FruitColor",
    "G_ESP_DistanceColor",
    "G_ESP_HPColor",
    "G_ESP_Avatar",
    "G_ESP_AvatarSide",
    "G_currentZoom",
    "G_DodgeNoCooldown",
    "G_DashLengthEnabled",
    "G_DashLength",
    "G_RemoveLava",
    "G_RemoveFog",
    "G_RemoveAnim",
    "G_RemoveGhostShip",
    "G_WalkOnWater",
    "G_spinEnabled",
    "G_spinSpeed",
    "G_AutoFpsLock",
    "G_NoMove",
    "G_TeleportOffsetX",
    "G_TeleportOffsetY",
    "G_TeleportOffsetZ",
    "G_TeleportPredict",
    "G_LockQuickPath",
    "G_LockOrbit",
    "G_ServerRegion",
    "G_HopPlayerRange",
    "G_HopBountyRange",
    "G_HopMinPlayers",
    "G_HopMaxPlayers",
    "G_HopMinBounty",
    "G_HopMaxBounty",
    "G_SilentAimM1R",
    "G_SilentAimSkill",
    "G_SilentAimSkills",
    "G_SilentAimShowFOV",
    "G_SilentAimFOV",
    "G_SilentAimPart",
    "G_SilentAimFOVThickness",
    "G_SilentAimFOVTransparency",
    "G_SilentAimTargetPlayers",
    "G_SilentAimTargetMobs",
    "G_SilentAimShowLine",
    "G_SilentAimFOVMode",
    "G_SilentAimTeamCheck",
    "G_SilentAimExcludePVP",
    "G_SilentAimMethod",
    "G_LockHotkey",
    "G_LockHotkeyMode",
    "G_LockHotkeyKey",
    "G_Theme",
    "G_Language",
}
local ConfigDirty = false
local ConfigSaving = false
local ConfigReady = false
local ConfigLoadedData = {}

local function EnsureConfigFolder()
    if typeof(isfolder) == "function" and typeof(makefolder) == "function" then
        local dir = CONFIG_FILE:match("^(.-)/[^/]+$")
        if dir and not isfolder(dir) then
            makefolder(dir)
        end
        return true
    end
    return false
end

local function DeepCopy(value)
    if type(value) ~= "table" then
        return value
    end
    local copy = {}
    for k, v in pairs(value) do
        copy[k] = DeepCopy(v)
    end
    return copy
end

local function CollectConfig()
    local data = {}
    for _, key in ipairs(ConfigKeys) do
        local value = _G[key]
        if value ~= nil then
            data[key] = DeepCopy(value)
        end
    end
    return data
end

local function ApplyConfigData(data)
    if type(data) ~= "table" then
        return
    end
    for _, key in ipairs(ConfigKeys) do
        if data[key] ~= nil then
            _G[key] = DeepCopy(data[key])
        end
    end
end

local function SaveConfig(force)
    if ConfigSaving then
        return false
    end
    if not force and not ConfigDirty then
        return false
    end
    if typeof(writefile) ~= "function" then
        return false
    end
    ConfigSaving = true
    local ok = pcall(function()
        EnsureConfigFolder()
        local payload = CollectConfig()
        writefile(CONFIG_FILE, HttpService:JSONEncode(payload))
    end)
    if ok then
        ConfigDirty = false
    end
    ConfigSaving = false
    return ok
end

local function QueueSaveConfig()
    if not ConfigReady then
        return
    end
    ConfigDirty = true
end

local function SaveConfiguration()
    QueueSaveConfig()
end

local function LoadConfig()
    if typeof(readfile) ~= "function" or typeof(isfile) ~= "function" then
        return false
    end
    if not isfile(CONFIG_FILE) then
        return false
    end
    local ok, data = pcall(function()
        return HttpService:JSONDecode(readfile(CONFIG_FILE))
    end)
    if not ok or type(data) ~= "table" then
        return false
    end
    ConfigLoadedData = data
    ApplyConfigData(data)
    return true
end

LoadConfig()
ConfigReady = true

task.spawn(function()
    local lastRaw = nil
    while task.wait(1) do
        if not ConfigReady then
            continue
        end
        local ok, raw = pcall(function()
            return HttpService:JSONEncode(CollectConfig())
        end)
        if ok and raw then
            if raw ~= lastRaw then
                lastRaw = raw
                ConfigDirty = true
            end
        end
        if ConfigDirty then
            SaveConfig(true)
        end
    end
end)

local Translations = {
    ["中文"] = {},
    ["English"] = {
        -- 窗口
        ["Void中心"] = "Void",
        ["主要功能"] = "Main",
        ["杀戮光环"] = "Aura",
        ["ESP"] = "ESP",
        ["绘制"] = "Aimbot",
        ["传送"] = "Teleport",
        ["杂项"] = "Misc",
        ["服务器"] = "Server",
        ["设置"] = "Settings",
        ["FOV"] = "FOV",
        ["商店"] = "Shop",
        -- 杀戮光环
        ["开启快速攻击"] = "Enable Fast Attack",
        ["快速攻击模式"] = "Fast Attack Mode",
        ["攻击怪物(此页面所有功能)"] = "Attack Mobs (All features)",
        ["攻击玩家(此页面所有功能)"] = "Attack Players (All features)",
        ["枪械 m1"] = "Dragon Gun M1",
        ["枪械 m1 发射间隔"] = "Gun M1 Fire Interval",
        ["果实m1"] = "Fruit M1",
        -- 主要功能
        ["移动速度"] = "Move Speed",
        ["加速开关"] = "Speed Boost",
        ["跳跃高度"] = "Jump Height",
        ["高跳开启"] = "High Jump",
        ["无限跳跃"] = "Infinite Jump",
        ["穿墙"] = "Noclip",
        ["飞行"] = "Fly",
        ["自动武装色"] = "Auto Haki",
        ["自动 V3"] = "Auto V3",
        ["自动 V4"] = "Auto V4",
        ["自动逃跑"] = "Auto Flee",
        ["逃跑血量阈值(%)"] = "Flee HP Threshold (%)",
        -- ESP
        ["ESP 开关"] = "ESP Toggle",
        ["显示玩家名字"] = "Show Player Name",
        ["显示玩家等级"] = "Show Player Level",
        ["显示玩家赏金"] = "Show Bounty",
        ["显示恶魔果实"] = "Show Fruit",
        ["显示距离"] = "Show Distance",
        ["显示血量"] = "Show HP",
        ["高亮显示玩家"] = "Highlight Players",
        ["高亮颜色"] = "Highlight Color",
        ["ESP 字体大小"] = "ESP Text Size",
        ["ESP 排版"] = "ESP Layout",
        ["经典"] = "Classic",
        ["血条样式"] = "HP Bar Style",
        ["名字颜色"] = "Name Color",
        ["等级颜色"] = "Level Color",
        ["赏金颜色"] = "Bounty Color",
        ["果实颜色"] = "Fruit Color",
        ["距离颜色"] = "Distance Color",
        ["血量颜色"] = "HP Color",
        ["显示玩家头像"] = "Show Player Avatar",
        ["头像位置"] = "Avatar Position",
        ["左边"] = "Left",
        ["右边"] = "Right",
        -- 杂项
        ["视角缩放距离"] = "Camera Zoom",
        ["冲刺无冷却"] = "Dodge No Cooldown",
        ["冲刺距离修改开关"] = "Dash Length Toggle",
        ["冲刺距离"] = "Dash Length",
        ["减画质"] = "Reduce Graphics",
        ["移除岩浆 (需重进恢复)"] = "Remove Lava (Rejoin to restore)",
        ["移除雾 (需重进恢复)"] = "Remove Fog (Rejoin to restore)",
        ["移除玩家动作 (僵直)"] = "Remove Player Anim (Stun)",
        ["移除鬼船 (保留传送点)"] = "Remove Ghost Ship",
        ["水上行走"] = "Walk on Water",
        ["解帧数限制 (仅电脑)"] = "Unlock FPS (PC only)",
        ["自动血拳卡帧"] = "Auto sanguine FPS Lock",
        ["旋转"] = "Spin",
        ["旋转速度"] = "Spin Speed",
        ["反移动(释放技能不移动)"] = "Anti-Move (Skill no move)",
        -- 服务器
        ["重进服务器"] = "Rejoin Server",
        ["选择服务器区域"] = "Select Server Region",
        ["跳服"] = "Server Hop",
        ["服务器id"] = "Server ID",
        ["输入服务器id"] = "Enter Server ID",
        ["加入服务器 id"] = "Join Server ID",
        -- 设置
        ["选择主题"] = "Select Theme",
        ["自动保存已开启"] = "Auto Save On",
        ["保存配置"] = "Save Config",
        ["加载配置"] = "Load Config",
        ["窗口切换键"] = "Toggle Window Key",
        -- 传送
        ["选择目标玩家"] = "Select Target Player",
        ["刷新玩家列表"] = "Refresh Player List",
        ["观战玩家"] = "Spectate Player",
        ["平滑传送至玩家"] = "Twen TP",
        ["直接传送至玩家"] = "Instant TP",
        ["锁人2"] = "Lock 2",
        ["锁人预判 (对抗飞行)"] = "Lock Predict (Anti-Fly)",
        ["X轴偏移"] = "X Offset",
        ["Y轴偏移"] = "Y Offset",
        ["Z轴偏移"] = "Z Offset",
        ["豪宅"] = "Mansion",
        ["天鹅房间"] = "Swan Room",
        ["鬼船"] = "Ship Inside",
        ["僵尸岛"] = "Ship Outside",
        ["海洋城堡"] = "castle of the sea",
        ["海龟豪宅"] = "Turtle Mansion",
        ["司法"] = "Justice",
        ["九头蛇"] = "Hydra",
        -- 绘制/FOV
        ["自瞄范围设置"] = "Aimbot Range Settings",
        ["显示 FOV 范围"] = "Show FOV Range",
        ["FOV 位置"] = "FOV Position",
        ["FOV 半径大小"] = "FOV Radius",
        ["FOV 范围颜色"] = "FOV Range Color",
        ["自瞄设置"] = "Aimbot Settings",
        ["M1 自瞄"] = "M1 Aimbot",
        ["技能自瞄"] = "Skill Aimbot",
        ["指定技能自瞄"] = "Aimbot Skills",
        ["瞄准玩家"] = "Target Players",
        ["瞄准 NPC"] = "Target NPCs",
        ["团队检测"] = "Team Check",
        ["排除未开启pvp"] = "Exclude PvP Disabled",
        ["显示锁定红线"] = "Show Lock Line",
        ["瞄准部位"] = "Target Part",
        ["静默瞄准方法"] = "Silent Aim Method",
        ["鼠标最近的玩家"] = "Closest to Mouse",
        ["最近的玩家"] = "Closest Player",
        ["选择玩家"] = "Selected Player",
        ["快捷键锁人"] = "Hotkey Lock",
        ["锁人快捷键"] = "Lock Hotkey",
        ["快捷锁人"] = "Hotkey Lock",
        ["未锁定"] = "Not Locked",
        ["距离: "] = "Distance: ",
        ["快捷键: "] = "Hotkey: ",
        ["按下按键开始锁定"] = "Press the key to lock",
        ["解除锁定"] = "Unlock",
        ["开始锁定"] = "Start Lock",
        ["锁人模式"] = "Lock Mode",
        ["M1 R 自瞄"] = "M1 R Aimbot",
        ["选择瞄准玩家"] = "Select Aimbot Player",
        ["重置数据"] = "Reset Stads",
        ["重置种族"] = "Reroll Race",
        ["切换海盗"] = "Join Pirates",
        ["切换海军"] = "Join Marines",
        ["更换吸血鬼"] = "Change to Ghoul",
        ["更换机器人"] = "Change to Cyborg",
        -- 描述
        ["跳服时搜索的服务器区域"] = "Server region for server hop",
        ["切换窗口显示状态"] = "Toggle window visibility",
        -- 通知
        ["区域设置"] = "Region Settings",
        ["已切换为: "] = "Switched to: ",
        ["准备跳服..."] = "Preparing server hop...",
        ["设置区域为: "] = "Region set to: ",
        ["自动跳服"] = "Auto Server Hop",
        ["跳服失败"] = "Server hop failed",
        ["请重新加入游戏"] = "Please rejoin the game",
        ["复制成功"] = "Copied",
        ["已复制当前服务器ID"] = "Current server ID copied",
        ["操作失败"] = "Operation Failed",
        ["请先输入服务器ID"] = "Please enter server ID first",
        ["已设置为"] = "Set to ",
        ["刷新玩家列表"] = "Refresh Player List",
        ["加载完成"] = "Loaded",
        ["保存配置"] = "Config Saved",
        ["加载配置"] = "Config Loaded",
        ["观战中断"] = "Spectate Interrupted",
        ["目标玩家不存在/角色消失"] = "Target player not found",
        ["传送开启"] = "Teleport Started",
        ["传送关闭"] = "Teleport Stopped",
        ["已停止传送目标玩家"] = "Stopped teleporting to target",
        ["Bypass关闭"] = "Bypass Off",
        ["已恢复目标玩家状态"] = "Target player state restored",
        ["传送中断"] = "Teleport Interrupted",
        ["目标/本地玩家角色异常"] = "Target/local character error",
        ["锁人2开启"] = "Lock 2 Started",
        ["自动选最近传送点接近，300米内直接锁定"] = "Auto nearest TP approach, direct lock within 300m",
        ["锁人2关闭"] = "Lock 2 Stopped",
        ["已停止锁定目标"] = "Stopped locking target",
        ["快捷传送点"] = "Quick TP Point",
        ["锁人快捷路径"] = "Lock Quick Path",
        ["环绕锁人"] = "Orbit Lock",
        ["通过传送点快速接近目标"] = "Quickly approach target via TP points",
        ["公告"] = "Announcement",
        ["DC 服务器"] = "DC Server",
        ["点击复制 DC 链接"] = "Click to copy DC link",
        ["已复制 DC 链接"] = "DC link copied",
        ["宣传图"] = "Banner",
        -- 语言切换
        ["语言"] = "Language",
        ["中文"] = "Chinese",
        ["语言已切换为: 中文"] = "Language switched to: Chinese",
        ["语言已切换为: English"] = "Language switched to: English",
        -- 其他
        ["正在锁人: "] = "Locking: ",
        ["正在锁人..."] = "Locking...",
        -- 补充（下拉框显示值/通知）
        ["锁人1"] = "Lock 1",
        ["跟随鼠标"] = "Follow Mouse",
        ["屏幕中心"] = "Screen Center",
        ["模式1"] = "Mode 1",
        ["模式2(部分账号失效用)"] = "Mode 2 (Some accounts fail)",
        ["大于3m"] = ">3M",
        ["大于5m"] = ">5M",
        ["大于10m"] = ">10M",
        ["大于15m"] = ">15M",
        ["大于25m"] = ">25M",
        ["大于35m"] = ">35M",
        ["大于50m"] = ">50M",
        ["人数: "] = "Players: ",
        ["赏金: "] = "Bounty: ",
        ["Rayfield ui版脚本链接"] = "Rayfield UI script link",
        ["点击复制"] = "Click to copy",
        ["已复制链接"] = "Link copied",
        ["选择人数"] = "Select Players",
        ["人数设置"] = "Players Setting",
        ["选择赏金"] = "Select Bounty",
        ["赏金设置"] = "Bounty Setting",
        ["匹配到服务器"] = "Matched Server",
        ["请先选择目标玩家"] = "Select target player first",
        ["观战结束"] = "Spectate Ended",
        ["已恢复本地视角"] = "Camera restored",
        ["自动瞬步"] = "Auto Soru",
    }
}

local function L(text)
    if _G.G_Language == "English" and Translations["English"][text] then
        return Translations["English"][text]
    end
    return text
end

local EnglishTranslationSources = {}
for source, translation in pairs(Translations["English"]) do
    if EnglishTranslationSources[translation] == nil then
        EnglishTranslationSources[translation] = source
    end
end

local function LocalizeExistingText(text)
    if type(text) ~= "string" or text == "" then
        return text
    end
    return L(EnglishTranslationSources[text] or text)
end

_G.FOVMode = _G.G_SilentAimFOVMode or "跟随鼠标"
local WindUI = loadstring(request({
    Url = "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
}).Body)()
local availableThemesCheck = WindUI:GetThemes()
if not availableThemesCheck[_G.G_Theme] then
    _G.G_Theme = "Dark"
end
WindUI:SetTheme(_G.G_Theme)
local Window = WindUI:CreateWindow({
    Title = L("Void中心"),
    Icon = "",
    Author = "by Void",
    Folder = "WindUI",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = _G.G_Theme,
    Acrylic = false,
    HideSearchBar = false,
    SideBarWidth = 200,
    OpenButton = {
        Title = "VoidBF-PVP",
        CornerRadius = UDim.new(1, 0),
        StrokeThickness = 3,
        Enabled = true,
        OnlyMobile = false,
        Draggable = true,
        OnlyIcon = false,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(135, 206, 235)),
            ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 183, 197)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
        }),
    },
    ToggleKey = Enum.KeyCode.G,
})
local Tabs = {
    [L("主要功能")] = Window:Section({ Title = L("主要功能"), Opened = true }),
    [L("设置")] = Window:Section({ Title = L("设置"), Opened = true }),
}
local RJR = {
    [L("主要功能")] = Tabs[L("主要功能")]:Tab({ Title = L("主要功能"), Icon = "zap" }),
    [L("杀戮光环")] = Tabs[L("主要功能")]:Tab({ Title = L("杀戮光环"), Icon = "sword" }),
    ["ESP"]     = Tabs[L("主要功能")]:Tab({ Title = "ESP", Icon = "eye" }),
    [L("绘制")]     = Tabs[L("主要功能")]:Tab({ Title = L("FOV"), Icon = "pen-tool" }),
    [L("传送")]     = Tabs[L("主要功能")]:Tab({ Title = L("传送"), Icon = "users" }),
    [L("杂项")]     = Tabs[L("主要功能")]:Tab({ Title = L("杂项"), Icon = "list" }),
    [L("商店")]     = Tabs[L("主要功能")]:Tab({ Title = L("商店"), Icon = "shopping-cart" }),
    [L("服务器")]   = Tabs[L("设置")]:Tab({ Title = L("服务器"), Icon = "server" }),
    [L("设置")]     = Tabs[L("设置")]:Tab({ Title = L("设置"), Icon = "settings" }),
}
local function IsAlive(character)
    if not character then return false end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    return humanoid and humanoid.Health and humanoid.Health > 0
end
local function GetRandomValidPart(target)
    if not target then return nil end
    local hrp = target:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local parts = { target:FindFirstChild("Head"), target:FindFirstChild("UpperTorso"), target:FindFirstChild("LowerTorso"), target:FindFirstChild("Torso"), hrp }
    local validParts = {}
    for _, p in ipairs(parts) do
        if p and p:IsA("BasePart") then table.insert(validParts, p) end
    end
    if #validParts > 0 then return validParts[math.random(1, #validParts)] end
    return hrp
end
local M1_State = { consecutiveFailures = 0, maxConsecutiveFailures = 5, Remotes = nil, Net = nil, RegisterAttack = nil, RegisterHit = nil, Enemies = nil }
local function M1_CheckAndGetCoreComponents()
    if M1_State.Remotes and M1_State.Net and M1_State.RegisterAttack and M1_State.RegisterHit and M1_State.Enemies then
        return M1_State.Remotes, M1_State.Net, M1_State.RegisterAttack, M1_State.RegisterHit, M1_State.Enemies
    end
    local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
    local Modules = ReplicatedStorage:FindFirstChild("Modules")
    local Net = Modules and Modules:FindFirstChild("Net")
    local RegisterAttack = Net and (Net:FindFirstChild("RE/RegisterAttack") or Net:FindFirstChild("RegisterAttack"))
    local RegisterHit = Net and (Net:FindFirstChild("RE/RegisterHit") or Net:FindFirstChild("RegisterHit"))
    local Enemies = workspace:FindFirstChild("Enemies") or workspace:FindFirstChild("NPCs")
    if Remotes and Modules and Net and RegisterAttack and RegisterHit and Enemies then
        M1_State.Remotes = Remotes; M1_State.Net = Net; M1_State.RegisterAttack = RegisterAttack; M1_State.RegisterHit = RegisterHit; M1_State.Enemies = Enemies
        return Remotes, Net, RegisterAttack, RegisterHit, Enemies
    end
    return nil, nil, nil, nil, nil
end
local function M1_ProcessEnemies(OthersEnemies, Folder)
    if not Folder or not _G.G_AttackMobs then return nil end
    local BasePart = nil
    local myPos = LocalPlayer.Character and LocalPlayer.Character.PrimaryPart and LocalPlayer.Character.PrimaryPart.Position
    if not myPos then return nil end
    for _, Enemy in ipairs(Folder:GetChildren()) do
        if Enemy == LocalPlayer.Character or not IsAlive(Enemy) then continue end
        local enemyRoot = Enemy:FindFirstChild("HumanoidRootPart")
        if not enemyRoot then continue end
        if (enemyRoot.Position - myPos).Magnitude < 500 then
             local foundPart = GetRandomValidPart(Enemy)
             if foundPart then
                table.insert(OthersEnemies, {Enemy, foundPart})
                BasePart = foundPart
             end
        end
    end
    return BasePart
end
local function M1_ProcessRealPlayers(OthersEnemies)
    if not _G.G_AttackPlayers then return nil end
    local BasePart = nil
    local myPos = LocalPlayer.Character and LocalPlayer.Character.PrimaryPart and LocalPlayer.Character.PrimaryPart.Position
    if not myPos then return nil end
    for _, OtherPlayer in ipairs(Players:GetPlayers()) do
        if OtherPlayer == LocalPlayer then continue end
        local OtherChar = OtherPlayer.Character
        if not IsAlive(OtherChar) then continue end
        local foundPart = GetRandomValidPart(OtherChar)
        if foundPart and LocalPlayer:DistanceFromCharacter(foundPart.Position) < 500 then
            table.insert(OthersEnemies, {OtherChar, foundPart})
            BasePart = foundPart
        end
    end
    return BasePart
end
local function M1_Attack(BasePart, OthersEnemies)
    local _, Net, temp_RegisterAttack, temp_RegisterHit, _ = M1_CheckAndGetCoreComponents()
    if not (BasePart and OthersEnemies and #OthersEnemies > 0 and temp_RegisterAttack and temp_RegisterHit) then
        M1_State.consecutiveFailures = M1_State.consecutiveFailures + 1
        if M1_State.consecutiveFailures >= M1_State.maxConsecutiveFailures then
            M1_State.Remotes = nil; M1_State.Net = nil; M1_State.RegisterAttack = nil; M1_State.RegisterHit = nil; M1_State.Enemies = nil; M1_State.consecutiveFailures = 0
        end
        return
    end
    M1_State.consecutiveFailures = 0
    local success, _ = pcall(function()
        temp_RegisterAttack:FireServer(0.3)
        temp_RegisterHit:FireServer(BasePart, OthersEnemies)
    end)
    if not success then M1_State.RegisterAttack = nil; M1_State.RegisterHit = nil end
end
local function PerformAttackMode1()
    local _, _, _, _, Enemies = M1_CheckAndGetCoreComponents()
    if not Enemies then M1_State.Enemies = nil; return end
    local OthersEnemies = {}
    local Part1 = M1_ProcessEnemies(OthersEnemies, Enemies)
    local Part2 = M1_ProcessRealPlayers(OthersEnemies)
    if #OthersEnemies > 0 then M1_Attack(Part1 or Part2, OthersEnemies) end
end
local Settings = { Range = 5000, AttackSpeed = 0.005, AutoScanRemotes = true }
local Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")
local RemoteSeed = Net:FindFirstChild("seed")
local State = { FoundRemote = nil, FoundRemoteId = nil, LastAttack = 0 }
if Settings.AutoScanRemotes then
    task.spawn(function()
        local folders = { ReplicatedStorage:FindFirstChild("Util"), ReplicatedStorage:FindFirstChild("Common"), ReplicatedStorage:FindFirstChild("Remotes"), ReplicatedStorage:FindFirstChild("Assets"), ReplicatedStorage:FindFirstChild("FX") }
        local function checkChild(child)
            if child:IsA("RemoteEvent") and child:GetAttribute("Id") then
                State.FoundRemoteId = child:GetAttribute("Id")
                State.FoundRemote = child
            end
        end
        for _, folder in ipairs(folders) do
            if folder then
                for _, child in ipairs(folder:GetChildren()) do checkChild(child) end
                folder.ChildAdded:Connect(checkChild)
            end
        end
    end)
end
local function GetTargets()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return {} end
    local targets = {}
    local myPos = root.Position
    local folders = {workspace:FindFirstChild("Enemies"), workspace:FindFirstChild("Characters")}
    for _, folder in ipairs(folders) do
        if not folder then continue end
        for _, model in ipairs(folder:GetChildren()) do
            if model == char then continue end
            local tRoot = model:FindFirstChild("HumanoidRootPart")
            local tHum = model:FindFirstChild("Humanoid")
            if tRoot and tHum and tHum.Health > 0 then
                local dist = (tRoot.Position - myPos).Magnitude
                if dist <= Settings.Range then
                    table.insert(targets, { Model = model, Root = tRoot, Head = model:FindFirstChild("Head") or tRoot })
                end
            end
        end
    end
    return targets
end
local function PerformAttackMode2()
    local char = LocalPlayer.Character
    if not char then return end
    local hasTool = char:FindFirstChildOfClass("Tool") or char:FindFirstChild("EquippedWeapon")
    if not hasTool then return end
    local targets = GetTargets()
    if #targets == 0 then return end
    local mainTarget = targets[1]
    local hitList = {}
    for i, target in ipairs(targets) do table.insert(hitList, {target.Model, target.Root}) end
    RegisterAttack:FireServer()
    local fakeHash = tostring(LocalPlayer.UserId):sub(2,4) .. tostring(math.random(10000, 99999))
    pcall(function()
        RegisterHit:FireServer(mainTarget.Head, hitList, {}, fakeHash)
    end)
    if State.FoundRemote and State.FoundRemoteId then
        pcall(function()
            local seedValue = RemoteSeed and RemoteSeed:InvokeServer() or 1
            local encryptedId = bit32.bxor(State.FoundRemoteId + 909090, seedValue * 2)
            local rawName = "RE/RegisterHit"
            local timestamp = math.floor(workspace:GetServerTimeNow() / 10 % 10) + 1
            local encryptedName = string.gsub(rawName, ".", function(c) return string.char(bit32.bxor(string.byte(c), timestamp)) end)
            State.FoundRemote:FireServer(encryptedName, encryptedId, mainTarget.Head, hitList)
        end)
    end
end
local function PerformAttack()
    if not _G.G_FastAttack then return end
    if _G.G_FastAttackMode == "模式1" then
        local Character = LocalPlayer.Character
        local Equipped = Character and IsAlive(Character) and Character:FindFirstChildOfClass("Tool")
        if not Equipped or Equipped.ToolTip == "Gun" then return end
        PerformAttackMode1()
    else
        PerformAttackMode2()
    end
end
task.spawn(function()
    while true do
        if not _G.G_FastAttack then
            task.wait(0.05)
            continue
        end
        local startTime = tick()
        pcall(PerformAttack)
        if _G.G_FastAttackMode == "模式1" then
             task.wait(0.05)
        else
             local elapsed = tick() - startTime
             local waitTime = math.max(0.005 - elapsed, 0.001)
             task.wait(waitTime)
        end
    end
end)
RJR[L("杀戮光环")]:Toggle({
    Title = L("开启快速攻击"),
    Value = _G.G_FastAttack,
    Callback = function(v)
        _G.G_FastAttack = v
        SaveConfiguration()
    end
})

RJR[L("杀戮光环")]:Dropdown({
    Title = L("快速攻击模式"),
    Values = {"模式1", "模式2(部分账号失效用)"},
    Value = _G.G_FastAttackMode,
    Callback = function(v)
        _G.G_FastAttackMode = v
        SaveConfiguration()
    end
})
RJR[L("杀戮光环")]:Toggle({
    Title = L("攻击怪物(此页面所有功能)"),
    Value = _G.G_AttackMobs,
    Callback = function(v) 
        _G.G_AttackMobs = v 
        SaveConfiguration()
    end
})
RJR[L("杀戮光环")]:Toggle({
    Title = L("攻击玩家(此页面所有功能)"),
    Value = _G.G_AttackPlayers,
    Callback = function(v) 
        _G.G_AttackPlayers = v 
        SaveConfiguration()
    end
})
task.spawn(function()
    local Modules = ReplicatedStorage:WaitForChild("Modules")
    local DragonNet = Modules:WaitForChild("Net")
    local ShootGunEvent = DragonNet:WaitForChild("RE/ShootGunEvent")
    local Validator2 = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Validator2")
    local getupval = debug.getupvalue or getupvalue
    local setupval = debug.setupvalue or setupvalue
    local getupvals = debug.getupvalues or getupvalues
    local ShootFunction
    local V_Idx = { v26 = 12, v22 = 13, v25 = 14, v21 = 15, v23 = 16, v24 = 17, v27 = 18 }
    local function InitDragonGun()
        local success, result = pcall(require, ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("CombatController"))
        if success and type(result) == "table" and result.Attack then ShootFunction = getupval(result.Attack, 9) end
    end
    local function GetNextValidator()
        if not ShootFunction then InitDragonGun() end
        if not ShootFunction then return 0, 0 end
        local upvals = getupvals(ShootFunction)
        if not upvals then return 0, 0 end
        if upvals[V_Idx.v21] ~= 727595 then
            for i, v in pairs(upvals) do
                if v == 727595 then
                    local offset = i - 15
                    V_Idx.v21 = i; V_Idx.v22 = 13 + offset; V_Idx.v23 = 16 + offset; V_Idx.v24 = 17 + offset
                    V_Idx.v26 = 12 + offset; V_Idx.v25 = 14 + offset; V_Idx.v27 = 18 + offset
                    break
                end
            end
        end
        local v1 = getupval(ShootFunction, V_Idx.v21)
        local v2 = getupval(ShootFunction, V_Idx.v22)
        local v3 = getupval(ShootFunction, V_Idx.v23)
        local v4 = getupval(ShootFunction, V_Idx.v24)
        local v5 = getupval(ShootFunction, V_Idx.v25)
        local v6 = getupval(ShootFunction, V_Idx.v26)
        local v7 = getupval(ShootFunction, V_Idx.v27)
        if not (v1 and v2 and v3 and v4 and v5 and v6 and v7) then return 0, 0 end
        local v8 = v6 * v2
        local v9 = (v5 * v2 + v6 * v1) % v3
        v9 = (v9 * v3 + v8) % v4
        v5 = math.floor(v9 / v3)
        v6 = v9 - v5 * v3
        v7 = v7 + 1
        setupval(ShootFunction, V_Idx.v25, v5); setupval(ShootFunction, V_Idx.v26, v6); setupval(ShootFunction, V_Idx.v27, v7)
        return math.floor(v9 / v4 * 16777215), v7
    end
    local function IsSilentAimEnemy(player)
        if not player or player == LocalPlayer then return false end
        local main = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("Main")
        local frame = main and main:FindFirstChild("Allies")
            and main.Allies:FindFirstChild("Container")
            and main.Allies.Container:FindFirstChild("Allies")
            and main.Allies.Container.Allies:FindFirstChild("ScrollingFrame")
            and main.Allies.Container.Allies.ScrollingFrame:FindFirstChild("Frame")
        if frame and frame:FindFirstChild(player.Name) then return false end
        local myTeam = LocalPlayer.Team
        local targetTeam = player.Team
        if myTeam and targetTeam and myTeam.Name == "Marines" and targetTeam.Name == "Marines" then return false end
        return true
    end
    local function GetClosestDragonTarget()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return nil end
        local closest, dist = nil, math.huge
        local myPos = root.Position
        if _G.G_AttackMobs then
            local function scanSea(node, depth)
                if not node then return end
                for _, enemy in node:GetChildren() do
                    local eHum = enemy:FindFirstChildOfClass("Humanoid")
                    local eRoot = enemy:FindFirstChild("HumanoidRootPart") or enemy.PrimaryPart or enemy:FindFirstChildWhichIsA("BasePart")
                    if eRoot and (not eHum or eHum.Health > 0) then
                        local d = (eRoot.Position - myPos).Magnitude
                        if d < dist then dist = d; closest = eRoot end
                    elseif depth < 3 and not enemy:IsA("BasePart") then
                        scanSea(enemy, depth + 1)
                    end
                end
            end
            local enemiesFolder = workspace:FindFirstChild("Enemies")
            if enemiesFolder then
                for _, enemy in enemiesFolder:GetChildren() do
                    local eHum = enemy:FindFirstChildOfClass("Humanoid")
                    local eRoot = enemy:FindFirstChild("HumanoidRootPart")
                    if eHum and eHum.Health > 0 and eRoot then
                        local d = (eRoot.Position - myPos).Magnitude
                        if d < dist then dist = d; closest = eRoot end
                    end
                end
            end
            scanSea(workspace:FindFirstChild("SeaBeasts"), 0)
            scanSea(workspace:FindFirstChild("SeaEvents"), 0)
        end
        if _G.G_AttackPlayers then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    if player:GetAttribute("PvpDisabled") == true then continue end
                    local isRubber = false
                    pcall(function()
                        local fruit = player.Data.DevilFruit.Value
                        if typeof(fruit) == "string" and fruit:find("Rubber") then
                            isRubber = true
                        end
                    end)
                    if isRubber then continue end
                    if not IsSilentAimEnemy(player) then continue end
                    local pHum = player.Character:FindFirstChildOfClass("Humanoid")
                    local pRoot = player.Character:FindFirstChild("HumanoidRootPart")
                    if pHum and pHum.Health > 0 and pRoot then
                        local d = (pRoot.Position - myPos).Magnitude
                        if d < dist then dist = d; closest = pRoot end
                    end
                end
            end
        end
        return closest
    end
    while true do
        task.wait(_G.G_M1FireInterval)
        if not _G.G_DragonGunM1 then continue end
        pcall(function()
            local char = LocalPlayer.Character
            local tool = char and char:FindFirstChildOfClass("Tool")
            if not tool or tool.ToolTip ~= "Gun" then return end
            local targetPart = GetClosestDragonTarget()
            if not targetPart then return end
            local valCode, valCount = GetNextValidator()
            if valCode ~= 0 then Validator2:FireServer(valCode, valCount) end
            tool:SetAttribute("LocalOverheat", 0)
            tool:SetAttribute("LocalTotalShots", (tool:GetAttribute("LocalTotalShots") or 0) + 1)
            ShootGunEvent:FireServer(targetPart.Position, { targetPart })
        end)
    end
end)
RJR[L("杀戮光环")]:Toggle({
    Title = L("枪械 m1"),
    Value = _G.G_DragonGunM1,
    Callback = function(v) 
        _G.G_DragonGunM1 = v 
        SaveConfiguration()
    end
})
RJR[L("杀戮光环")]:Slider({
    Title = L("枪械 m1 发射间隔"),
    Step = 0.001,
    Value = {
        Min = 0,
        Max = 0.2,
        Default = _G.G_M1FireInterval
    },
    Callback = function(v)
        _G.G_M1FireInterval = v
        SaveConfiguration()
    end
})
local FruitAttackConnection = nil
local FruitAttack = false
local function GetPlayerFruit()
    local char = LocalPlayer.Character
    if not char then return nil end
    for _, tool in pairs(char:GetChildren()) do
        if tool:IsA("Tool") and tool.ToolTip == "Blox Fruit" then
            return tool
        end
    end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, tool in pairs(backpack:GetChildren()) do
            if tool:IsA("Tool") and tool.ToolTip == "Blox Fruit" then
                return tool
            end
        end
    end
    return nil
end
local function SetFruitM1Enabled(enabled)
    FruitAttack = enabled
    if enabled then
        if FruitAttackConnection then
            task.cancel(FruitAttackConnection)
        end
        FruitAttackConnection = task.spawn(function()
            while FruitAttack do
                task.wait(0.05)
                local fruit = GetPlayerFruit()
                if not fruit then continue end
                local remote = fruit:FindFirstChild("LeftClickRemote")
                if not remote then continue end
                local char = LocalPlayer.Character
                local myHRP = char and char:FindFirstChild("HumanoidRootPart")
                if not myHRP then continue end
                if _G.G_AttackPlayers then
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
                            local hum       = player.Character:FindFirstChild("Humanoid")
                            if targetHRP and hum and hum.Health > 0 then
                                  if (targetHRP.Position - myHRP.Position).Magnitude < 500 then
                                      local dir = (targetHRP.Position - myHRP.Position).Unit
                                    pcall(function() remote:FireServer(Vector3.new(dir.X, dir.Y, dir.Z), 1, true) end)
                                end
                            end
                        end
                    end
                end
                if _G.G_AttackMobs then
                    local enemiesFolder = workspace:FindFirstChild("Enemies")
                    if enemiesFolder then
                        for _, npc in pairs(enemiesFolder:GetChildren()) do
                            local targetHRP = npc:FindFirstChild("HumanoidRootPart")
                            local hum       = npc:FindFirstChild("Humanoid")
                              if targetHRP and hum and hum.Health > 0 then
                                  if (targetHRP.Position - myHRP.Position).Magnitude < 500 then
                                      local dir = (targetHRP.Position - myHRP.Position).Unit
                                      pcall(function() remote:FireServer(Vector3.new(dir.X, dir.Y, dir.Z), 1, true) end)
                                end
                            end
                        end
                    end
                end
            end
        end)
    else
        if FruitAttackConnection then
            task.cancel(FruitAttackConnection)
            FruitAttackConnection = nil
        end
    end
end
if _G.G_FruitM1 then
    SetFruitM1Enabled(true)
end
RJR[L("杀戮光环")]:Toggle({
    Title = L("果实m1"),
    Value = _G.G_FruitM1,
    Callback = function(vatt)
        _G.G_FruitM1 = vatt
        SetFruitM1Enabled(vatt)
        SaveConfiguration()
    end
})
local function startAutoHakiLoop()
    task.spawn(function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local remotes = ReplicatedStorage:WaitForChild("Remotes", 5)
        local commF = remotes and remotes:WaitForChild("CommF_", 5)
        while true do
            task.wait(2) 
            if _G.G_AutoHaki and commF then
                local Character = LocalPlayer.Character
                if Character and not Character:FindFirstChild("HasBuso") then
                    pcall(function()
                        commF:InvokeServer("Buso")
                    end)
                end
            end
        end
    end)
end
local function handleAbility(abilityType)
    task.spawn(function()
        while true do
            if (_G["G_Auto"..abilityType]) then
                if abilityType == "V4" then
                    local Awakening = LocalPlayer:FindFirstChild("Backpack") and LocalPlayer.Backpack:FindFirstChild("Awakening")
                    if Awakening and Awakening:FindFirstChild("RemoteFunction") then
                        pcall(function() Awakening.RemoteFunction:InvokeServer(true) end)
                    end
                elseif abilityType == "V3" then
                    local ReplicatedStorage = game:GetService("ReplicatedStorage")
                    local CommE = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommE")
                    if CommE then
                        pcall(function() CommE:FireServer("ActivateAbility") end)
                    end
                end
            end
            task.wait(1)
        end
    end)
end
startAutoHakiLoop()
handleAbility("V3")
handleAbility("V4")

local fleeConnection = nil
local fleeTeleported = false
-- 世界2 → 鬼船，世界3 → 九头蛇
local function GetFleeDestination()
    local pid = game.PlaceId
    if pid == 4442272183 or pid == 79091703265657 then
        return Vector3.new(923, 126, 32852)
    elseif pid == 7449423635 or pid == 100117331123089 then
        return Vector3.new(-5027.03, 316.43, -3206.07)
    end
    return nil
end
local function RestoreFleeState()
    pcall(function()
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
        end
        if hum then
            hum.PlatformStand = false
            hum:ChangeState(Enum.HumanoidStateType.GettingUp)
            hum:ChangeState(Enum.HumanoidStateType.Running)
        end
    end)
end
local function StartAutoFlee()
    if fleeConnection then return end
    fleeConnection = task.spawn(function()
        while _G.G_AutoFlee do
            task.wait(0.01)
            pcall(function()
                if not _G.G_AutoFlee then return end
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if not hum or not hrp or hum.Health <= 0 then
                    fleeTeleported = false
                    return
                end
                local hpPercent = (hum.Health / hum.MaxHealth) * 100
                if hpPercent <= _G.G_AutoFleeHP then
                    if not fleeTeleported then
                        fleeTeleported = true
                        local dest = GetFleeDestination()
                        if dest then
                            pcall(function()
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", dest)
                            end)
                        end
                    end
                    -- 清零速度 + Physics 状态，否则重力会把角色拉下来
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    hrp.AssemblyAngularVelocity = Vector3.zero
                    hum:ChangeState(Enum.HumanoidStateType.Physics)
                    hrp.CFrame = hrp.CFrame + Vector3.new(0, 20, 0)
                elseif fleeTeleported then
                    fleeTeleported = false
                    RestoreFleeState()
                end
            end)
        end
        fleeConnection = nil
        fleeTeleported = false
        RestoreFleeState()
    end)
end
local function StopAutoFlee()
    fleeConnection = nil
    fleeTeleported = false
    RestoreFleeState()
end
if _G.G_AutoFlee then StartAutoFlee() end
RJR[L("主要功能")]:Toggle({
    Title = L("自动武装色"),
    Value = _G.G_AutoHaki,
    Callback = function(v)
        _G.G_AutoHaki = v
        SaveConfiguration()
    end
})
RJR[L("主要功能")]:Toggle({
    Title = L("自动 V3"),
    Value = _G.G_AutoV3,
    Callback = function(v)
        _G.G_AutoV3 = v
        SaveConfiguration()
    end
})
RJR[L("主要功能")]:Toggle({
    Title = L("自动 V4"),
    Value = _G.G_AutoV4,
    Callback = function(v)
        _G.G_AutoV4 = v
        SaveConfiguration()
    end
})
RJR[L("主要功能")]:Toggle({
    Title = L("自动逃跑"),
    Value = _G.G_AutoFlee,
    Callback = function(v)
        _G.G_AutoFlee = v
        if v then StartAutoFlee() else StopAutoFlee() end
        SaveConfiguration()
    end
})
RJR[L("主要功能")]:Slider({
    Title = L("逃跑血量阈值(%)"),
    Value = {
        Min = 1,
        Max = 100,
        Default = _G.G_AutoFleeHP or 30
    },
    Callback = function(v)
        _G.G_AutoFleeHP = v
        SaveConfiguration()
    end
})
local LastSkillPressed = "Z"
UIS.InputBegan:Connect(function(input)
    if UIS:GetFocusedTextBox() then return end
    if input.KeyCode == Enum.KeyCode.Z then
        LastSkillPressed = "Z"
    elseif input.KeyCode == Enum.KeyCode.X then
        LastSkillPressed = "X"
    elseif input.KeyCode == Enum.KeyCode.C then
        LastSkillPressed = "C"
    elseif input.KeyCode == Enum.KeyCode.V then
        LastSkillPressed = "V"
    elseif input.KeyCode == Enum.KeyCode.F then
        LastSkillPressed = "F"
    end
end)
local function IsSkillSelected(skillName)
    local skills = _G.G_SilentAimSkills
    if not skills then return true end
    if type(skills) == "table" then
        if next(skills) == nil then return false end
        if skills[skillName] ~= nil then
            return skills[skillName] == true
        end
        for _, v in pairs(skills) do
            if v == skillName then return true end
        end
        return false
    end
    return true
end
local function IsCurrentSkillEnabled()
    return IsSkillSelected(LastSkillPressed)
end
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if _G.G_SilentAimSkill and IsCurrentSkillEnabled() and _G.G_SilentAimTargetPos and (method == "FireServer" or method == "InvokeServer") then
        local sName = tostring(self)
        if sName == "RemoteEvent" or sName == "CommE" or sName == "RemoteFunction" then
            for i, v in pairs(args) do
                if typeof(v) == "Vector3" then
                    args[i] = _G.G_SilentAimTargetPos
                end
            end
            return oldNamecall(self, unpack(args))
        end
    end
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)
local translateConnection
local translateWalkSpeedConn = nil
local function ApplyTranslateWalkSpeed(humanoid)
    if not humanoid then return end
    if _G.G_translateAccel then
        humanoid.WalkSpeed = math.clamp(_G.G_translateSpeed, 1, 2000)
    end
end
local function StartTranslateAccel()
    if translateConnection then return end
    local function bind(char)
        local humanoid = char:WaitForChild("Humanoid", 5)
        if not humanoid then return end
        ApplyTranslateWalkSpeed(humanoid)
        if translateWalkSpeedConn then
            translateWalkSpeedConn:Disconnect()
            translateWalkSpeedConn = nil
        end
        translateWalkSpeedConn = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if _G.G_translateAccel and humanoid.Health > 0 then
                humanoid.WalkSpeed = math.clamp(_G.G_translateSpeed, 1, 2000)
            end
        end)
    end
    translateConnection = LocalPlayer.CharacterAdded:Connect(bind)
    if LocalPlayer.Character then
        bind(LocalPlayer.Character)
    end
end
local function StopTranslateAccel()
    if translateConnection then
        translateConnection:Disconnect()
        translateConnection = nil
    end
    if translateWalkSpeedConn then
        translateWalkSpeedConn:Disconnect()
        translateWalkSpeedConn = nil
    end
    local char = LocalPlayer.Character
    local humanoid = char and char:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 16
    end
end
local stateConn
local function updateJumpPower(humanoid)
    if not humanoid then return end
    if humanoid.UseJumpPower then
        humanoid.JumpPower = _G.G_jumpEnabled and _G.G_jumpHeight or 50
    else
        humanoid.JumpHeight = _G.G_jumpEnabled and _G.G_jumpHeight or 7.2
    end
end
local function bindHumanoid(humanoid)
    if stateConn then
        stateConn:Disconnect()
        stateConn = nil
    end
    local prop = humanoid.UseJumpPower and "JumpPower" or "JumpHeight"
    stateConn = humanoid:GetPropertyChangedSignal(prop):Connect(function()
        if _G.G_jumpEnabled then
            updateJumpPower(humanoid)
        end
    end)
    updateJumpPower(humanoid)
end
LocalPlayer.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid", 5)
    if humanoid then
        bindHumanoid(humanoid)
    end
end)
if LocalPlayer.Character then
    local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        bindHumanoid(humanoid)
    end
end
if _G.G_translateAccel then
    StartTranslateAccel()
end
local ESPRunning = false
local espObjects = {}
local espUpdateConnection = nil
local function getTeamInfo(player)
    if not player.Team then
        return "Unknown", Color3.fromRGB(255,255,255)
    end
    if player.Team.Name == "Marines" then
        return "海军", Color3.fromRGB(0,170,255)
    else
        return "海贼", Color3.fromRGB(255,70,70)
    end
end
local function hexToColor3(hex)
    local r = tonumber(hex:sub(1,2), 16) / 255 or 0
    local g = tonumber(hex:sub(3,4), 16) / 255 or 1
    local b = tonumber(hex:sub(5,6), 16) / 255 or 0
    return Color3.new(r, g, b)
end
local function color3ToRGBString(color3)
    return string.format("rgb(%d,%d,%d)",
        math.floor(color3.R * 255 + 0.5),
        math.floor(color3.G * 255 + 0.5),
        math.floor(color3.B * 255 + 0.5))
end
local function NormalizeLayout(l)
    l = l or "经典"
    if l == "血条" then return "血条样式" end
    if l == "多行" or l == "单行" or l == "双行" or l == "方框" then return "经典" end
    return l
end
local function FormatBounty(amount)
    if amount >= 1000000 then
        return string.format("%.1f", amount / 1000000) .. "M"
    else
        return string.format("%.1f", amount / 1000) .. "K"
    end
end
local function removeESP(player)
    if espObjects[player] then
        pcall(function()
            espObjects[player].gui:Destroy()
            if espObjects[player].highlight then
                espObjects[player].highlight:Destroy()
            end
        end)
        espObjects[player] = nil
    end
end
local function createESP(player)
    if player:GetAttribute("IsAuthor") or 
       player.Name == "AGlizipy" then 
        return 
    end
    if player == LocalPlayer then return end
    local char = player.Character
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end
    local team, color = getTeamInfo(player)
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = head
    billboard.Size = UDim2.new(0,220,0,150)
    billboard.StudsOffset = Vector3.new(0,3,0)
    billboard.AlwaysOnTop = true
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.TextScaled = false
    text.TextSize = _G.G_ESP_TextSize
    text.RichText = true
    text.Font = Enum.Font.SourceSansBold
    text.TextStrokeTransparency = 0
    text.TextColor3 = color
    text.Parent = billboard
    local hpBar = Instance.new("Frame")
    hpBar.Name = "ESP_HPBar"
    hpBar.Size = UDim2.new(1, -60, 0, 6)
    hpBar.Position = UDim2.new(0.5, 0, 1, -8)
    hpBar.AnchorPoint = Vector2.new(0.5, 1)
    hpBar.BackgroundColor3 = Color3.fromRGB(25,25,25)
    hpBar.BorderSizePixel = 1
    hpBar.BorderColor3 = Color3.fromRGB(0,0,0)
    hpBar.Visible = false
    local hpFill = Instance.new("Frame")
    hpFill.Size = UDim2.new(1, 0, 1, 0)
    hpFill.Position = UDim2.new(0, 0, 0.5, 0)
    hpFill.AnchorPoint = Vector2.new(0, 0.5)
    hpFill.BackgroundColor3 = Color3.fromRGB(0,255,0)
    hpFill.BorderSizePixel = 0
    hpFill.Parent = hpBar
    hpBar.Parent = billboard
    local avatar = Instance.new("ImageLabel")
    avatar.Name = "ESP_Avatar"
    avatar.Size = UDim2.new(0, 42, 0, 42)
    avatar.AnchorPoint = Vector2.new(0, 0.5)
    avatar.Position = UDim2.new(0, 4, 0.5, 0)
    avatar.BackgroundColor3 = Color3.fromRGB(0,0,0)
    avatar.BackgroundTransparency = 0.2
    avatar.BorderSizePixel = 1
    avatar.BorderColor3 = color
    avatar.Image = ""
    avatar.ScaleType = Enum.ScaleType.Crop
    avatar.Visible = false
    avatar.Parent = billboard
    task.spawn(function()
        pcall(function()
            local url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"
            pcall(function()
                game:GetService("ContentProvider"):Preload(url)
            end)
            avatar.Image = url
        end)
    end)
    billboard.Parent = head
    local highlight = nil
    if _G.G_ESP_Highlight then
        local hlColor = hexToColor3(_G.G_ESP_HighlightColor)
        highlight = Instance.new("Highlight")
        highlight.Name = "ESP_PlayerHighlight"
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillColor = hlColor
        highlight.FillTransparency = 0.5
        highlight.OutlineColor = hlColor
        highlight.OutlineTransparency = 0
        highlight.Parent = char
    end
    espObjects[player] = {
        gui = billboard,
        label = text,
        hpBar = hpBar,
        hpFill = hpFill,
        avatar = avatar,
        char = char,
        highlight = highlight
    }
end
local lastESPUpdate = 0
local ESP_UPDATE_INTERVAL = 0.1
local playerCache = {}
local function getPlayerData(player)
    if not playerCache[player] then
        playerCache[player] = {
            level = "?",
            fruit = "None",
            bounty = 0,
            team = "Unknown",
            color = Color3.fromRGB(255, 255, 255),
            lastUpdate = 0
        }
    end
    local data = playerCache[player]
    local now = tick()
    if now - data.lastUpdate > 5 then
        pcall(function() data.level = player.Data.Level.Value end)
        pcall(function() data.fruit = player.Data.DevilFruit.Value end)
        pcall(function() data.bounty = player.leaderstats["Bounty/Honor"].Value end)
        data.team, data.color = getTeamInfo(player)
        data.lastUpdate = now
    end
    return data
end
local function updateESP()
    local now = tick()
    if now - lastESPUpdate < ESP_UPDATE_INTERVAL then return end
    lastESPUpdate = now
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    local myPos = myRoot.Position
    for _,player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if player:GetAttribute("IsAuthor") or 
               player.Name == "AGlizipy" then 
                if espObjects[player] then
                    removeESP(player)
                end
                continue 
            end
            local char = player.Character
            local head = char and char:FindFirstChild("Head")
            local data = espObjects[player]
            if char and head then
                if not data or data.char ~= char or not data.gui.Parent then
                    removeESP(player)
                    createESP(player)
                    data = espObjects[player]
                end
            else
                if data then
                    removeESP(player)
                end
                continue
            end
            if not data then continue end
            if char then
                local hum = char:FindFirstChild("Humanoid")
                local root = char:FindFirstChild("HumanoidRootPart")
                if hum and root then
                    local distance = math.floor((root.Position - myPos).Magnitude)
                    local hp = math.floor((hum.Health/hum.MaxHealth)*100)
                    local pData = getPlayerData(player)
                    local level = pData.level
                    local fruit = pData.fruit
                    local bounty = pData.bounty
                    local team = pData.team
                    local color = pData.color
                    local warnTag = ""
                    if bounty > 10000000 then
                        warnTag = "⚠ "
                    end
                    local pvpState = "⚔ PVP已开启 "
                    local pvpIcon = "🔴 "
                    local isPvpDisabled = false
                    if player:GetAttribute("PvpDisabled") == true then
                        pvpState = "PvP已关闭 "
                        pvpIcon = "🟢 "
                        isPvpDisabled = true
                    end
                    data.label.TextColor3 = color
                    local layout = NormalizeLayout(_G.G_ESP_Layout)
                    local ts = _G.G_ESP_TextSize or 14
                    if data.label.TextSize ~= ts then
                        data.label.TextSize = ts
                    end
                    local showAvatar = _G.G_ESP_Avatar and data.avatar.Image ~= ""
                    local avatarLeft = (_G.G_ESP_AvatarSide or "右边") == "左边"
                    data.avatar.Visible = showAvatar
                    if showAvatar then
                        pcall(function()
                            if avatarLeft then
                                data.avatar.AnchorPoint = Vector2.new(0, 0.5)
                                data.avatar.Position = UDim2.new(0, 4, 0.5, 0)
                                data.label.AnchorPoint = Vector2.new(0.5, 0.5)
                                data.label.Position = UDim2.new(0.5, 18, 0.5, 0)
                                data.label.Size = UDim2.new(1, -56, 1, 0)
                            else
                                data.avatar.AnchorPoint = Vector2.new(1, 0.5)
                                data.avatar.Position = UDim2.new(1, -4, 0.5, 0)
                                data.label.AnchorPoint = Vector2.new(0.5, 0.5)
                                data.label.Position = UDim2.new(0.5, -18, 0.5, 0)
                                data.label.Size = UDim2.new(1, -56, 1, 0)
                            end
                        end)
                    else
                        pcall(function()
                            data.label.AnchorPoint = Vector2.new(0, 0)
                            data.label.Position = UDim2.new(0, 0, 0, 0)
                            data.label.Size = UDim2.new(1, 0, 1, 0)
                        end)
                    end
                    local namePart, levelPart, fruitPart, bountyPart, distPart, hpPart
                    if _G.G_ESP_Name then
                        namePart = warnTag .. "[" .. team .. "] <font color=\"" .. color3ToRGBString(hexToColor3(_G.G_ESP_NameColor)) .. "\">" .. player.Name .. "</font>"
                    end
                    if _G.G_ESP_Level then
                        levelPart = "<font color=\"" .. color3ToRGBString(hexToColor3(_G.G_ESP_LevelColor)) .. "\">Lv." .. level .. "</font>"
                    end
                    local pvpPart
                    if isPvpDisabled then
                        pvpPart = "<font color=\"rgb(0,255,0)\">" .. pvpIcon .. pvpState .. "</font>"
                    else
                        pvpPart = pvpIcon .. pvpState
                    end
                    if _G.G_ESP_Fruit then
                        fruitPart = "<font color=\"" .. color3ToRGBString(hexToColor3(_G.G_ESP_FruitColor)) .. "\">水果: " .. fruit .. "</font>"
                    end
                    if _G.G_ESP_Bounty then
                        bountyPart = "<font color=\"" .. color3ToRGBString(hexToColor3(_G.G_ESP_BountyColor)) .. "\">赏金: " .. FormatBounty(bounty) .. "</font>"
                    end
                    if _G.G_ESP_Distance then
                        distPart = "<font color=\"" .. color3ToRGBString(hexToColor3(_G.G_ESP_DistanceColor)) .. "\">" .. distance .. "米</font>"
                    end
                    if _G.G_ESP_HP and layout ~= "血条样式" then
                        hpPart = "<font color=\"" .. color3ToRGBString(hexToColor3(_G.G_ESP_HPColor)) .. "\">生命 " .. hp .. "%</font>"
                    end
                    data.gui.StudsOffset = Vector3.new(0, 3, 0)
                    local hpBarVisible = layout == "血条样式"
                    data.hpBar.Visible = hpBarVisible
                    if hpBarVisible then
                        pcall(function()
                            data.hpFill.Size = UDim2.new(math.clamp(hp / 100, 0, 1), 0, 1, 0)
                            if hp > 50 then
                                data.hpFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                            elseif hp > 25 then
                                data.hpFill.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
                            else
                                data.hpFill.BackgroundColor3 = Color3.fromRGB(255, 40, 40)
                            end
                        end)
                    end
                    data.label.Visible = true
                    local parts = {}
                    if namePart then parts[#parts+1] = namePart end
                    if levelPart then parts[#parts+1] = levelPart end
                    if pvpPart then parts[#parts+1] = pvpPart end
                    if fruitPart then parts[#parts+1] = fruitPart end
                    if bountyPart then parts[#parts+1] = bountyPart end
                    if distPart then parts[#parts+1] = distPart end
                    if hpPart then parts[#parts+1] = hpPart end
                    data.label.Text = table.concat(parts, "\n")
            
                    if _G.G_ESP_Highlight then
                        local hlColor = hexToColor3(_G.G_ESP_HighlightColor)
                        pcall(function()
                            for _, child in ipairs(char:GetChildren()) do
                                if child:IsA("Highlight") and child.Name ~= "ESP_PlayerHighlight" then
                                    child.FillColor = hlColor
                                    child.OutlineColor = hlColor
                                    child.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                end
                            end
                        end)
                        if not data.highlight or not data.highlight.Parent then
                            local hl = Instance.new("Highlight")
                            hl.Name = "ESP_PlayerHighlight"
                            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            hl.FillColor = hlColor
                            hl.FillTransparency = 0.5
                            hl.OutlineColor = hlColor
                            hl.OutlineTransparency = 0
                            hl.Parent = char
                            data.highlight = hl
                        else
                            data.highlight.FillColor = hlColor
                            data.highlight.OutlineColor = hlColor
                            data.highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        end
                    else
                        if data.highlight then
                            data.highlight:Destroy()
                            data.highlight = nil
                        end
                    end
                end
            end
        end
    end
end
function EnableESP()
    if ESPRunning then return end
    ESPRunning = true
    for _, player in ipairs(Players:GetPlayers()) do
        createESP(player)
    end
    espUpdateConnection = task.spawn(function()
        while ESPRunning do
            pcall(updateESP)
            task.wait(ESP_UPDATE_INTERVAL)
        end
    end)
end
function DisableESP()
    ESPRunning = false
    espUpdateConnection = nil
    for player, _ in pairs(espObjects) do
        removeESP(player)
    end
    espObjects = {}
end
if not _G.ESP_Initialized then
    _G.ESP_Initialized = true
    Players.PlayerRemoving:Connect(function(player)
        removeESP(player)
        playerCache[player] = nil
    end)
end
task.spawn(function()
    task.wait(1)
    if _G.G_ESPEnabled then
        EnableESP()
    end
end)

RJR[L("主要功能")]:Input({
    Title = L("移动速度"),
    Value = tostring(_G.G_translateSpeed),
    Placeholder = "1 - 2000",
    Callback = function(text)
        local v = tonumber(text)
        if v then
            _G.G_translateSpeed = math.clamp(v, 1, 2000)
            if _G.G_translateAccel and LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = _G.G_translateSpeed
                end
            end
            SaveConfiguration()
        end
    end
})

RJR[L("主要功能")]:Toggle({
    Title = L("加速开关"),
    Value = _G.G_translateAccel,
    Callback = function(state)
        _G.G_translateAccel = state
        if state then
            StartTranslateAccel()
        else
            StopTranslateAccel()
        end
        SaveConfiguration()
    end
})

RJR[L("主要功能")]:Input({
    Title = L("跳跃高度"),
    Value = tostring(_G.G_jumpHeight),
    Placeholder = "50 - 500",
    Callback = function(text)
        local v = tonumber(text)
        if v then
            _G.G_jumpHeight = math.clamp(v, 50, 500)
            if _G.G_jumpEnabled and LocalPlayer.Character then
                updateJumpPower(LocalPlayer.Character:FindFirstChild("Humanoid"))
            end
            SaveConfiguration()
        end
    end
})

RJR[L("主要功能")]:Toggle({
    Title = L("高跳开启"),
    Value = _G.G_jumpEnabled,
    Callback = function(state)
        _G.G_jumpEnabled = state
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                if state then
                    bindHumanoid(humanoid) 
                else
                    if humanoid.UseJumpPower then
                        humanoid.JumpPower = 50
                    else
                        humanoid.JumpHeight = 7.2
                    end
                    if stateConn then
                        stateConn:Disconnect()
                        stateConn = nil
                    end
                end
            end
        end
        SaveConfiguration()
    end
})
local InfiniteJumpRunning = false
local InfiniteJumpLast = 0
local SkyjumpFns = nil
local SkyjumpFnsSky = nil
local SkyjumpJumped = nil
local SkyjumpLastUseTbl = nil
local function ResetSkyjumpUpvalues(char)
    if not (char and getgc and getupvalues and setupvalue) then return end
    local sky = char:FindFirstChild("Skyjump")
    if not sky then return end
    if SkyjumpFnsSky ~= sky or #SkyjumpFns == 0 then
        SkyjumpFnsSky = sky
        SkyjumpFns = {}
        SkyjumpJumped = nil
        SkyjumpLastUseTbl = nil
        for _, fn in next, getgc() do
            if typeof(fn) == "function" then
                local ok, env = pcall(getfenv, fn)
                if ok and env and env.script == sky then
                    table.insert(SkyjumpFns, fn)
                end
            end
        end
    end
    for _, fn in ipairs(SkyjumpFns) do
        local hasLastUse = false
        for i, uv in next, getupvalues(fn) do
            if type(uv) == "table" and uv.LastUse ~= nil then
                uv.LastUse = 0
                SkyjumpLastUseTbl = uv
                hasLastUse = true
            elseif type(uv) == "number" and uv >= 5 and uv <= 100 then
                pcall(setupvalue, fn, i, 0)
            end
        end
        if hasLastUse and not SkyjumpJumped then
            SkyjumpJumped = fn
        end
    end
end
local function DoInfiniteJump()
    if not _G.G_InfiniteJump then return end
    local now = tick()
    if now - InfiniteJumpLast < 0.05 then return end
    InfiniteJumpLast = now
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp or hum.Health <= 0 or hum.Sit then return end
    ResetSkyjumpUpvalues(char)
    pcall(function()
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end)
    if SkyjumpJumped then
        local before = SkyjumpLastUseTbl and SkyjumpLastUseTbl.LastUse
        pcall(SkyjumpJumped, { UserInputState = Enum.UserInputState.Begin })
        if SkyjumpLastUseTbl and before ~= SkyjumpLastUseTbl.LastUse then
            return
        end
    end
    local mult = 1.5
    pcall(function()
        local race = LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Race")
        if race and race.Value == "Skypiea" then mult = 1.4 end
    end)
    local jp = 50
    if hum.UseJumpPower then
        jp = hum.JumpPower
    else
        jp = math.sqrt(math.max(hum.JumpHeight or 7.2, 0) * 2 * workspace.Gravity)
    end
    local vel = hrp.AssemblyLinearVelocity
    hrp.AssemblyLinearVelocity = Vector3.new(vel.X, math.max(jp * mult, 50), vel.Z)
    pcall(function()
        local energy = char:FindFirstChild("Energy")
        local cost = 15
        if energy and energy.Value >= cost then
            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
            local commE = remotes and remotes:FindFirstChild("CommE")
            if commE then
                commE:FireServer("Dodge", "Geppo", cost, nil, workspace:GetServerTimeNow())
            end
            local skyEv = ReplicatedStorage:FindFirstChild("PlayerSkyJumped")
            if skyEv then skyEv:Fire() end
        end
    end)
end
UIS.JumpRequest:Connect(DoInfiniteJump)
local function StartInfiniteJumpLoop()
    if InfiniteJumpRunning then return end
    InfiniteJumpRunning = true
    task.spawn(function()
        while _G.G_InfiniteJump do
            pcall(ResetSkyjumpUpvalues, LocalPlayer.Character)
            task.wait(0.1)
        end
        InfiniteJumpRunning = false
    end)
end
if _G.G_InfiniteJump then StartInfiniteJumpLoop() end
LocalPlayer.CharacterAdded:Connect(function()
    if _G.G_InfiniteJump then
        task.wait(1)
        StartInfiniteJumpLoop()
    end
end)
RJR[L("主要功能")]:Toggle({
    Title = L("无限跳跃"),
    Value = _G.G_InfiniteJump,
    Callback = function(v)
        _G.G_InfiniteJump = v
        if v then StartInfiniteJumpLoop() end
        SaveConfiguration()
    end
})

local NoclipConnection = nil
local function StartNoclip()
    if NoclipConnection then return end
    NoclipConnection = RunService.Stepped:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end)
end
local function StopNoclip()
    if NoclipConnection then
        NoclipConnection:Disconnect()
        NoclipConnection = nil
    end
    local char = LocalPlayer.Character
    if not char then return end
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = true
        end
    end
end
if _G.G_Noclip then StartNoclip() end
RJR[L("主要功能")]:Toggle({
    Title = L("穿墙"),
    Value = _G.G_Noclip,
    Callback = function(v)
        _G.G_Noclip = v
        if v then StartNoclip() else StopNoclip() end
        SaveConfiguration()
    end
})

RJR[L("主要功能")]:Button({
    Title = L("飞行"),
    Icon = "wind",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://github.com/AGlizipy/fly1/releases/download/lajifly/fly.lua"))()
        end)
    end
})
RJR["ESP"]:Toggle({
    Title = L("ESP 开关"),
    Value = _G.G_ESPEnabled,
    Callback = function(state)
        _G.G_ESPEnabled = state
        if state then EnableESP() else DisableESP() end
        SaveConfiguration()
    end
})
RJR["ESP"]:Toggle({
    Title = L("显示玩家名字"),
    Value = _G.G_ESP_Name,
    Callback = function(v)
        _G.G_ESP_Name = v
        SaveConfiguration()
    end
})
RJR["ESP"]:Toggle({
    Title = L("显示玩家等级"),
    Value = _G.G_ESP_Level,
    Callback = function(v)
        _G.G_ESP_Level = v
        SaveConfiguration()
    end
})
RJR["ESP"]:Toggle({
    Title = L("显示玩家赏金"),
    Value = _G.G_ESP_Bounty,
    Callback = function(v)
        _G.G_ESP_Bounty = v
        SaveConfiguration()
    end
})
RJR["ESP"]:Toggle({
    Title = L("显示恶魔果实"),
    Value = _G.G_ESP_Fruit,
    Callback = function(v)
        _G.G_ESP_Fruit = v
        SaveConfiguration()
    end
})
RJR["ESP"]:Toggle({
    Title = L("显示距离"),
    Value = _G.G_ESP_Distance,
    Callback = function(v)
        _G.G_ESP_Distance = v
        SaveConfiguration()
    end
})
RJR["ESP"]:Toggle({
    Title = L("显示血量"),
    Value = _G.G_ESP_HP,
    Callback = function(v)
        _G.G_ESP_HP = v
        SaveConfiguration()
    end
})
RJR["ESP"]:Toggle({
    Title = L("高亮显示玩家"),
    Value = _G.G_ESP_Highlight,
    Callback = function(v)
        _G.G_ESP_Highlight = v
        SaveConfiguration()
    end
})
RJR["ESP"]:Colorpicker({
    Title = L("高亮颜色"),
    Default = hexToColor3(_G.G_ESP_HighlightColor),
    Transparency = 0,
    Callback = function(color)
        _G.G_ESP_HighlightColor = string.format("%02X%02X%02X",
            math.floor(color.R * 255 + 0.5),
            math.floor(color.G * 255 + 0.5),
            math.floor(color.B * 255 + 0.5))
        SaveConfiguration()
    end
})
RJR["ESP"]:Divider()
RJR["ESP"]:Dropdown({
    Title = L("ESP 排版"),
    Values = {"经典", "血条样式"},
    Value = NormalizeLayout(_G.G_ESP_Layout),
    Callback = function(v)
        _G.G_ESP_Layout = v
        SaveConfiguration()
    end
})
RJR["ESP"]:Toggle({
    Title = L("显示玩家头像"),
    Value = _G.G_ESP_Avatar,
    Callback = function(v)
        _G.G_ESP_Avatar = v
        SaveConfiguration()
    end
})
RJR["ESP"]:Dropdown({
    Title = L("头像位置"),
    Values = {"左边", "右边"},
    Value = _G.G_ESP_AvatarSide or "右边",
    Callback = function(v)
        _G.G_ESP_AvatarSide = v
        SaveConfiguration()
    end
})
local function SaveHexColor(key, color)
    _G[key] = string.format("%02X%02X%02X",
        math.floor(color.R * 255 + 0.5),
        math.floor(color.G * 255 + 0.5),
        math.floor(color.B * 255 + 0.5))
    SaveConfiguration()
end
RJR["ESP"]:Colorpicker({
    Title = L("名字颜色"),
    Default = hexToColor3(_G.G_ESP_NameColor),
    Callback = function(color)
        SaveHexColor("G_ESP_NameColor", color)
    end
})
RJR["ESP"]:Colorpicker({
    Title = L("等级颜色"),
    Default = hexToColor3(_G.G_ESP_LevelColor),
    Callback = function(color)
        SaveHexColor("G_ESP_LevelColor", color)
    end
})
RJR["ESP"]:Colorpicker({
    Title = L("赏金颜色"),
    Default = hexToColor3(_G.G_ESP_BountyColor),
    Callback = function(color)
        SaveHexColor("G_ESP_BountyColor", color)
    end
})
RJR["ESP"]:Colorpicker({
    Title = L("果实颜色"),
    Default = hexToColor3(_G.G_ESP_FruitColor),
    Callback = function(color)
        SaveHexColor("G_ESP_FruitColor", color)
    end
})
RJR["ESP"]:Colorpicker({
    Title = L("距离颜色"),
    Default = hexToColor3(_G.G_ESP_DistanceColor),
    Callback = function(color)
        SaveHexColor("G_ESP_DistanceColor", color)
    end
})
RJR["ESP"]:Colorpicker({
    Title = L("血量颜色"),
    Default = hexToColor3(_G.G_ESP_HPColor),
    Callback = function(color)
        SaveHexColor("G_ESP_HPColor", color)
    end
})
RJR["ESP"]:Slider({
    Title = L("ESP 字体大小"),
    Value = {
        Min = 8,
        Max = 32,
        Default = _G.G_ESP_TextSize or 14
    },
    Callback = function(v)
        _G.G_ESP_TextSize = v
        SaveConfiguration()
    end
})



local function ApplyCameraZoom()
    if _G.G_currentZoom and _G.G_currentZoom > 0 then
        LocalPlayer.CameraMaxZoomDistance = _G.G_currentZoom
        LocalPlayer.CameraMinZoomDistance = 0.5
    else
        LocalPlayer.CameraMaxZoomDistance = 128
        LocalPlayer.CameraMinZoomDistance = 0.5
    end
end

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    ApplyCameraZoom()
end)

task.spawn(function()
    task.wait(0.5)
    ApplyCameraZoom()
end)

local DodgeNoCooldownRunning = false
local function DodgeNoCooldown()
    if _G.G_DodgeNoCooldown and not DodgeNoCooldownRunning then
        DodgeNoCooldownRunning = true
        task.spawn(function()
            if not getgc or not getupvalues or not setupvalue then DodgeNoCooldownRunning = false; return end

            for i,v in next, getgc() do
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Dodge") then
                    if typeof(v) == "function" and getfenv(v).script == char.Dodge then
                        for i2,v2 in next, getupvalues(v) do
                            if tostring(v2) == "0.4" then
                                task.spawn(function()
                                    repeat
                                        setupvalue(v,i2,0)
                                        task.wait(0.1)
                                    until not _G.G_DodgeNoCooldown
                                    DodgeNoCooldownRunning = false
                                end)
                            end
                        end
                    end
                end
            end
        end)
    end
end

if _G.G_DodgeNoCooldown then DodgeNoCooldown() end

LocalPlayer.CharacterAdded:Connect(function()
    if _G.G_DodgeNoCooldown then
        task.wait(1)
        DodgeNoCooldown()
    end
end)

local DashConnection = nil
local function ManageDashLength()
    if _G.G_DashLengthEnabled then
        if DashConnection then task.cancel(DashConnection) end
        DashConnection = task.spawn(function()
            while _G.G_DashLengthEnabled do
                task.wait(0.1)
                local character = LocalPlayer.Character
                if character then
                    local currentValue = character:GetAttribute("DashLength")
                    if currentValue ~= _G.G_DashLength then
                        character:SetAttribute("DashLength", _G.G_DashLength)
                        character:SetAttribute("DashLengthAir", _G.G_DashLength)
                    end
                end
            end
        end)
    else
        if DashConnection then
            local character = LocalPlayer.Character
            if character then
                character:SetAttribute("DashLength", 1)
                character:SetAttribute("DashLengthAir", 1)
            end
            task.cancel(DashConnection)
            DashConnection = nil
        end
    end
end
if _G.G_DashLengthEnabled then ManageDashLength() end

local lavaConnection = nil

local function CheckAndDestroyLava(v)
    if not v then return end
    local name = v.Name
    if name == "Lava" then
        pcall(function() v:Destroy() end)
    elseif name == "LavaParts" then
        local parent = v.Parent
        if parent then
            local pName = parent.Name
            if (pName == "CircleIsland" or pName == "GhostShipInterior") then
                 local grandParent = parent.Parent
                 if grandParent and grandParent.Name == "Map" then
                     pcall(function() v:Destroy() end)
                 end
            end
        end
    end
end

local function StartRemoveLava()
    pcall(function()
        for i, v in pairs(Workspace:GetDescendants()) do
            CheckAndDestroyLava(v)
        end
        for i, v in pairs(ReplicatedStorage:GetDescendants()) do
            CheckAndDestroyLava(v)
        end
    end)
end

local function StopRemoveLava()
    if lavaConnection then
        lavaConnection:Disconnect()
        lavaConnection = nil
    end
end

local function DoRemoveFog()
    pcall(function()
        local lightingService = game:GetService("Lighting")
        if lightingService:FindFirstChild("LightingLayers") then lightingService.LightingLayers:Destroy() end
        if lightingService:FindFirstChild("Sky") then lightingService.Sky:Destroy() end
        lightingService.FogEnd = 9000000000
    end)
end

if _G.G_RemoveLava then StartRemoveLava() end
if _G.G_RemoveFog then DoRemoveFog() end

local removeAnimCharConn = nil
local removeAnimTrackConn = nil

local function DisableAnimForChar(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if not hum then return end
    local animator = hum:WaitForChild("Animator", 5)
    if not animator then return end
    
    for _, t in pairs(animator:GetPlayingAnimationTracks()) do t:Stop() end
    
    if removeAnimTrackConn then removeAnimTrackConn:Disconnect() end
    removeAnimTrackConn = animator.AnimationPlayed:Connect(function(t)
        t:Stop()
    end)
end

local function StartRemoveAnim()
    if LocalPlayer.Character then
        DisableAnimForChar(LocalPlayer.Character)
    end
    
    if not removeAnimCharConn then
        removeAnimCharConn = LocalPlayer.CharacterAdded:Connect(function(char)
            task.wait(0.5) 
            if _G.G_RemoveAnim then
                DisableAnimForChar(char)
            end
        end)
    end
end

local function StopRemoveAnim()
    if removeAnimTrackConn then 
        removeAnimTrackConn:Disconnect() 
        removeAnimTrackConn = nil
    end
    if removeAnimCharConn then
        removeAnimCharConn:Disconnect()
        removeAnimCharConn = nil
    end
end

if _G.G_RemoveAnim then StartRemoveAnim() end

local ghostShipConnection = nil

local function RemoveGhostShipParts()
    local map = Workspace:FindFirstChild("Map")
    if not map then return end
    
    local interior = map:FindFirstChild("GhostShipInterior")
    if not interior then return end
    
    for _, v in pairs(interior:GetChildren()) do
        if v.Name ~= "Teleport" and v.Name ~= "TeleportSpawn" then
            pcall(function() v:Destroy() end)
        end
    end
end

local function StartRemoveGhostShip()
    RemoveGhostShipParts()
    
    if not ghostShipConnection then
        local map = Workspace:FindFirstChild("Map")
        if map then
            ghostShipConnection = map.ChildAdded:Connect(function(child)
                if child.Name == "GhostShipInterior" then
                    task.wait(0.1) 
                    RemoveGhostShipParts()
                end
            end)
        end
    end
end

local function StopRemoveGhostShip()
    if ghostShipConnection then
        ghostShipConnection:Disconnect()
        ghostShipConnection = nil
    end
end

if _G.G_RemoveGhostShip then StartRemoveGhostShip() end

local walkOnWaterConn = nil
local function StartWalkOnWater()
    if walkOnWaterConn then return end
    walkOnWaterConn = task.spawn(function()
        while task.wait(0.2) do
            if not _G.G_WalkOnWater then break end
            pcall(function()
                local waterBase = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("WaterBase-Plane")
                if waterBase then
                    waterBase.Size = Vector3.new(1000, 112, 1000)
                end
            end)
        end
    end)
end

local function StopWalkOnWater()
    _G.G_WalkOnWater = false
    pcall(function()
        local waterBase = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("WaterBase-Plane")
        if waterBase then
            waterBase.Size = Vector3.new(1000, 80, 1000)
        end
    end)
end

if _G.G_WalkOnWater then StartWalkOnWater() end


local autoFpsLockRunning = false
local autoFpsLockSignals = {}
local function StartAutoFpsLock()
    if autoFpsLockRunning then return end
    autoFpsLockRunning = true
    local isLocked = false
    local delayTask = nil
    task.spawn(function()
        while autoFpsLockRunning and task.wait(0.5) do
            pcall(function()
                local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
                if not playerGui then return end
                local main = playerGui:FindFirstChild("Main")
                if not main then return end
                local skills = main:FindFirstChild("Skills")
                if not skills then return end
                local sanguine = skills:FindFirstChild("Sanguine Art")
                if not sanguine then return end
                local zSkill = sanguine:FindFirstChild("Z")
                if not zSkill then return end
                local cooldown = zSkill:FindFirstChild("Cooldown")
                if cooldown and not cooldown:GetAttribute("AutoFpsBound") then
                    cooldown:SetAttribute("AutoFpsBound", true)
                    local fullCdSize = UDim2.new(1, 0, 1, -1)
                    if cooldown.Size == fullCdSize then
                        if not isLocked and setfpscap then
                            isLocked = true
                            setfpscap(22)
                        end
                    end
                    local conn = cooldown:GetPropertyChangedSignal("Size"):Connect(function()
                        if not autoFpsLockRunning then return end
                        if cooldown.Size == fullCdSize then
                            if delayTask then
                                delayTask = nil
                            end
                            if not isLocked and setfpscap then
                                isLocked = true
                                setfpscap(22)
                            end
                        else
                            if isLocked and not delayTask then
                                delayTask = true
                                task.spawn(function()
                                    task.wait(0.3)
                                    delayTask = nil
                                    if setfpscap then
                                        setfpscap(0)
                                    end
                                    isLocked = false
                                end)
                            end
                        end
                    end)
                    table.insert(autoFpsLockSignals, conn)
                end
            end)
        end
        isLocked = false
        if setfpscap then setfpscap(0) end
        autoFpsLockRunning = false
    end)
end

local function StopAutoFpsLock()
    autoFpsLockRunning = false

    for _, conn in ipairs(autoFpsLockSignals) do
        pcall(function() conn:Disconnect() end)
    end
    table.clear(autoFpsLockSignals)

    pcall(function()
        local sanguine = LocalPlayer:FindFirstChild("PlayerGui")
            and LocalPlayer.PlayerGui:FindFirstChild("Main")
            and LocalPlayer.PlayerGui.Main:FindFirstChild("Skills")
            and LocalPlayer.PlayerGui.Main.Skills:FindFirstChild("Sanguine Art")
        if sanguine then
            local zSkill = sanguine:FindFirstChild("Z")
            if zSkill then
                local cooldown = zSkill:FindFirstChild("Cooldown")
                if cooldown then
                    cooldown:SetAttribute("AutoFpsBound", nil)
                end
            end
        end
    end)
    if setfpscap then setfpscap(0) end
end

if _G.G_AutoFpsLock then StartAutoFpsLock() end

local spinConnection
local function StartSpin()
    if spinConnection then return end
    spinConnection = RunService.RenderStepped:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(_G.G_spinSpeed), 0)
    end)
end

local function StopSpin()
    if spinConnection then
        spinConnection:Disconnect()
        spinConnection = nil

        local char = LocalPlayer.Character
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.AutoRotate = true
        end
    end
end

if _G.G_spinEnabled then StartSpin() end

local noMoveConnection = nil
local function StartNoMove()
    if noMoveConnection then return end
    local function apply(char)
        if not char:FindFirstChild("AntiMover") then
            Instance.new("Folder", char).Name = "AntiMover"
        end
    end
    if LocalPlayer.Character then
        apply(LocalPlayer.Character)
    end
    noMoveConnection = LocalPlayer.CharacterAdded:Connect(apply)
end

local function StopNoMove()
    if noMoveConnection then
        noMoveConnection:Disconnect()
        noMoveConnection = nil
    end
    pcall(function()
        if LocalPlayer.Character then
            local anti = LocalPlayer.Character:FindFirstChild("AntiMover")
            if anti then anti:Destroy() end
        end
    end)
end

if _G.G_NoMove then StartNoMove() end



RJR[L("杂项")]:Slider({
    Title = L("视角缩放距离"),
    Value = {
        Min = 1,
        Max = 10000,
        Default = _G.G_currentZoom or 128
    },
    Callback = function(value)
        _G.G_currentZoom = value
        ApplyCameraZoom()
        SaveConfiguration()
    end
})

RJR[L("杂项")]:Toggle({
    Title = L("冲刺无冷却"),
    Value = _G.G_DodgeNoCooldown,
    Callback = function(v)
        _G.G_DodgeNoCooldown = v
        if v then DodgeNoCooldown() end
        SaveConfiguration()
    end
})

RJR[L("杂项")]:Toggle({
    Title = L("冲刺距离修改开关"),
    Value = _G.G_DashLengthEnabled,
    Callback = function(state)
        _G.G_DashLengthEnabled = state
        ManageDashLength()
        SaveConfiguration()
    end
})

RJR[L("杂项")]:Slider({
    Title = L("冲刺距离"),
    Value = {
        Min = 20,
        Max = 300,
        Default = _G.G_DashLength or 50
    },
    Callback = function(value)
        _G.G_DashLength = value
        if _G.G_DashLengthEnabled then ManageDashLength() end
        SaveConfiguration()
    end
})

RJR[L("杂项")]:Button({
    Title = L("减画质"),
    Icon = "monitor",
    Callback = function()
        pcall(function()
            for _, descendant in pairs(game:GetDescendants()) do
                if descendant:IsA("Part") or descendant:IsA("Union") or descendant:IsA("CornerWedgePart") or descendant:IsA("TrussPart") then
                    descendant.Material = "Plastic"
                    descendant.Reflectance = 0
                elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
                    descendant.Transparency = 1
                elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
                    descendant.Lifetime = NumberRange.new(0)
                elseif descendant:IsA("Explosion") then
                    descendant.BlastPressure = 1
                    descendant.BlastRadius = 1
                elseif descendant:IsA("Fire") or descendant:IsA("SpotLight") or descendant:IsA("Smoke") then
                    descendant.Enabled = false
                end
            end
        end)
    end
})

RJR[L("杂项")]:Toggle({
    Title = L("移除岩浆 (需重进恢复)"),
    Value = _G.G_RemoveLava,
    Callback = function(v)
        _G.G_RemoveLava = v
        if v then StartRemoveLava() else StopRemoveLava() end
        SaveConfiguration()
    end
})

RJR[L("杂项")]:Toggle({
    Title = L("移除雾 (需重进恢复)"),
    Value = _G.G_RemoveFog,
    Callback = function(v)
        _G.G_RemoveFog = v
        if v then DoRemoveFog() end
        SaveConfiguration()
    end
})

RJR[L("杂项")]:Toggle({
    Title = L("移除玩家动作 (僵直)"),
    Value = _G.G_RemoveAnim,
    Callback = function(v)
        _G.G_RemoveAnim = v
        if v then StartRemoveAnim() else StopRemoveAnim() end
        SaveConfiguration()
    end
})

RJR[L("杂项")]:Toggle({
    Title = L("移除鬼船 (保留传送点)"),
    Value = _G.G_RemoveGhostShip,
    Callback = function(v)
        _G.G_RemoveGhostShip = v
        if v then StartRemoveGhostShip() else StopRemoveGhostShip() end
        SaveConfiguration()
    end
})

RJR[L("杂项")]:Toggle({
    Title = L("水上行走"),
    Value = _G.G_WalkOnWater,
    Callback = function(v)
        _G.G_WalkOnWater = v
        if v then StartWalkOnWater() else StopWalkOnWater() end
        SaveConfiguration()
    end
})

RJR[L("杂项")]:Toggle({
    Title = L("解帧数限制 (仅电脑)"),
    Value = false,
    Callback = function(v)
        if v and setfpscap then
            setfpscap(999)
        end
    end
})

RJR[L("杂项")]:Toggle({
    Title = L("自动血拳卡帧"),
    Value = _G.G_AutoFpsLock,
    Callback = function(v)
        _G.G_AutoFpsLock = v
        if v then
            StartAutoFpsLock()
        else
            StopAutoFpsLock()
        end
        SaveConfiguration()
    end
})

RJR[L("杂项")]:Toggle({
    Title = L("旋转"),
    Value = _G.G_spinEnabled,
    Callback = function(v)
        _G.G_spinEnabled = v
        if v then StartSpin() else StopSpin() end
        SaveConfiguration()
    end
})

RJR[L("杂项")]:Slider({
    Title = L("旋转速度"),
    Value = {
        Min = 1,
        Max = 100,
        Default = _G.G_spinSpeed
    },
    Callback = function(value)
        _G.G_spinSpeed = value
        SaveConfiguration()
    end
})

RJR[L("杂项")]:Toggle({
    Title = L("反移动(释放技能不移动)"),
    Value = _G.G_NoMove,
    Callback = function(v)
        _G.G_NoMove = v
        if v then StartNoMove() else StopNoMove() end
        SaveConfiguration()
    end
})



RJR[L("商店")]:Button({
    Title = L("重置数据"),
    Icon = "refresh-cw",
    Callback = function()
        local args = { 
            "BlackbeardReward", 
            "Refund", 
            "2"
        } 
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end
})
RJR[L("商店")]:Button({
    Title = L("重置种族"),
    Icon = "shuffle",
    Callback = function()
        local args = { 
            "BlackbeardReward", 
            "Reroll", 
            "2"
        } 
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end
})
RJR[L("商店")]:Button({
    Title = L("切换海盗"),
    Icon = "anchor",
    Callback = function()
        local args = {
            "SetTeam",
            "Pirates"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end
})
RJR[L("商店")]:Button({
    Title = L("切换海军"),
    Icon = "shield",
    Callback = function()
        local args = {
            "SetTeam",
            "Marines"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end
})
RJR[L("商店")]:Button({
    Title = L("更换吸血鬼"),
    Icon = "moon",
    Callback = function()
        local args = {"Ectoplasm", "Change", 4}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end
})
RJR[L("商店")]:Button({
    Title = L("更换机器人"),
    Icon = "cpu",
    Callback = function()
        local args = {"CyborgTrainer", "Buy"}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end
})

RJR[L("服务器")]:Button({
    Title = L("重进服务器"),
    Callback = function()
        local args = {
            "teleport",
            game.JobId
        }
        game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer(unpack(args))
    end
})

local function FormatNumber(n)
    local s = tostring(math.floor(tonumber(n) or 0))
    local left, num, right = s:match("^([^%d]*%d)(%d*)(.-)$")
    return left .. (num:reverse():gsub("(%d%d%d)", "%1,"):reverse()) .. right
end

local function ApplyPlayerRange(label)
    _G.G_HopPlayerRange = label
    local minPlayers, maxPlayers = label:match("(%d+)%-(%d+)")
    if minPlayers and maxPlayers then
        _G.G_HopMinPlayers = tonumber(minPlayers)
        _G.G_HopMaxPlayers = tonumber(maxPlayers)
        return
    end
    _G.G_HopMinPlayers = 1
    _G.G_HopMaxPlayers = 12
end

local function ApplyBountyRange(label)
    _G.G_HopBountyRange = label
    local minOnly = label:match("大于([%d%.]+[Mm]?)")
    if minOnly then
        local num, unit = minOnly:match("([%d%.]+)([Mm]?)")
        local value = tonumber(num) or 0
        if unit and unit:lower() == "m" then value = value * 1000000 end
        _G.G_HopMinBounty = value + 1
        _G.G_HopMaxBounty = 999999999
        return
    end
    _G.G_HopMinBounty = 0
    _G.G_HopMaxBounty = 999999999
end

local function ParseServerInfo(text)
    if type(text) ~= "string" or text == "" then return nil end
    local region = text:match("Region:%s*(.-)%s*%-%s*Players:")
    local cur, max = text:match("Players:%s*(%d+)%s*/%s*(%d+)")
    local bt = text:match("Bounty:%s*([%d,]+)")
    if not cur or not max or not bt then return nil end
    local bounty = tonumber((bt:gsub(",", "")))
    if not bounty then return nil end
    return { Region = region or "Unknown", Players = tonumber(cur), MaxPlayers = tonumber(max), Bounty = bounty }
end

local function IsServerAllowed(info)
    if not info then return false end
    if info.Players < _G.G_HopMinPlayers or info.Players > _G.G_HopMaxPlayers then return false end
    if info.Bounty < _G.G_HopMinBounty or info.Bounty > _G.G_HopMaxBounty then return false end
    return true
end

ApplyPlayerRange(_G.G_HopPlayerRange)
ApplyBountyRange(_G.G_HopBountyRange)

RJR[L("服务器")]:Dropdown({
    Title = L("选择服务器区域"),
    Desc = L("跳服时搜索的服务器区域"),
    Values = {"Oregon", "Florida", "Texas", "California", "Hong Kong", "Germany", "Brazil", "Singapore"},
    Value = _G.G_ServerRegion,
    Callback = function(v)
        _G.G_ServerRegion = v
        SaveConfiguration()
        WindUI:Notify({ Title = L("区域设置"), Content = L("已切换为: ") .. v, Duration = 2 })
    end
})

RJR[L("服务器")]:Dropdown({
    Title = L("选择人数"),
    Desc = L("跳服时过滤人数范围"),
    Values = {"1-12", "3-12", "5-12", "7-12", "9-12"},
    Value = _G.G_HopPlayerRange,
    Callback = function(v)
        ApplyPlayerRange(v)
        SaveConfiguration()
        WindUI:Notify({ Title = L("人数设置"), Content = v .. " (" .. _G.G_HopMinPlayers .. "-" .. _G.G_HopMaxPlayers .. ")", Duration = 2 })
    end
})

RJR[L("服务器")]:Dropdown({
    Title = L("选择赏金"),
    Desc = L("跳服时过滤赏金范围"),
    Values = {"大于3m", "大于5m", "大于10m", "大于15m", "大于25m", "大于35m", "大于50m"},
    Value = _G.G_HopBountyRange,
    Callback = function(v)
        ApplyBountyRange(v)
        SaveConfiguration()
        WindUI:Notify({ Title = L("赏金设置"), Content = v .. " (" .. FormatNumber(_G.G_HopMinBounty) .. " - " .. FormatNumber(_G.G_HopMaxBounty) .. ")", Duration = 2 })
    end
})

RJR[L("服务器")]:Button({
    Title = L("跳服"),
    Icon = "wind",
    Callback = function()
        if getgenv().IsServerHopping == true then return end

        getgenv().IsServerHopping = true
        getgenv().ShuttingDown = true

        WindUI:Notify({
            Title = L("自动跳服"),
            Content = L("准备跳服...") .. "\n\n"
                .. L("设置区域为: ") .. _G.G_ServerRegion .. "\n"
                .. L("人数: ") .. _G.G_HopPlayerRange .. "\n"
                .. L("赏金: ") .. _G.G_HopBountyRange,
            Icon = "wind",
            Duration = 10
        })

        local PlayerGui = LocalPlayer.PlayerGui

        if not PlayerGui:FindFirstChild("ServerBrowser") then
            getgenv().IsServerHopping = false
            return
        end

        PlayerGui.ServerBrowser.Enabled = true
        task.wait(0.1)

        local Filters = PlayerGui.ServerBrowser.Frame:FindFirstChild("Filters")
        local SearchRegion = Filters and Filters:FindFirstChild("SearchRegion")
        local TextBox = SearchRegion and SearchRegion:FindFirstChild("TextBox")

        if not TextBox then
            getgenv().IsServerHopping = false
            return
        end

        TextBox.Text = _G.G_ServerRegion

        -- 展开完整列表
        local Full = Filters and Filters:FindFirstChild("Full")
        local FullCheck = Full and Full:FindFirstChild("Check")
        if FullCheck then
            FullCheck.Text = "\226\156\148\239\184\143"
            task.wait(0.1)
        end

        local ScrollingFrame = PlayerGui.ServerBrowser.Frame.ScrollingFrame
        local FakeScroll = PlayerGui.ServerBrowser.Frame.FakeScroll
        local Inside = FakeScroll.Inside

        task.spawn(function()
            while getgenv().IsServerHopping do
                ScrollingFrame.CanvasPosition = Vector2.new(0, math.random(100, 7000))
                task.wait(0.3)
            end
        end)

        task.wait()

        local currentJobId = game.JobId
        local ServerBrowserRemote = game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser")

        while getgenv().IsServerHopping do
            for _, template in ipairs(Inside:GetChildren()) do
                if template.Name == "Template" then
                    local joinButton = template:FindFirstChild("Join")
                    local textLabel = template:FindFirstChild("TextLabel")
                    local info = textLabel and ParseServerInfo(textLabel.Text)

                    if joinButton and info and IsServerAllowed(info) then
                        local job = joinButton:GetAttribute("Job")
                        if job and tostring(job):find("-", 1, true) then
                            job = tostring(job)

                            if job ~= currentJobId then
                                WindUI:Notify({
                                    Title = L("匹配到服务器"),
                                    Content = L("尝试跳服") .. "\n"
                                        .. L("地区: ") .. tostring(info.Region) .. "\n"
                                        .. L("人数: ") .. info.Players .. "/" .. info.MaxPlayers .. "\n"
                                        .. L("赏金: ") .. FormatNumber(info.Bounty),
                                    Icon = "wind",
                                    Duration = 5
                                })

                                local success = pcall(function()
                                    ServerBrowserRemote:InvokeServer("teleport", job)
                                end)
                                if not success then
                                    local success2 = pcall(function()
                                        ServerBrowserRemote:InvokeServer("teleport", job)
                                    end)
                                    if not success2 then
                                        WindUI:Notify({
                                            Title = L("自动跳服"),
                                            Content = L("跳服失败") .. "\n\n" .. L("请重新加入游戏"),
                                            Icon = "wind",
                                            Duration = 10
                                        })
                                    end
                                end
                                task.wait(0.3)
                            end
                        end
                    end
                end
            end
            task.wait(3)
        end
    end
})

RJR[L("服务器")]:Paragraph({
    Title = L("服务器id"),
    Desc = game.JobId,
    Buttons = {{
        Title = "Copy",
        Callback = function()
            setclipboard(game.JobId)
            WindUI:Notify({ Title = L("复制成功"), Content = L("已复制当前服务器ID"), Duration = 2 })
        end
    }}
})

RJR[L("服务器")]:Input({
    Title = L("输入服务器id"),
    Value = _G.G_JobId,
    Callback = function(value)
        _G.G_JobId = value
        SaveConfiguration()
    end
})

RJR[L("服务器")]:Button({
    Title = L("加入服务器 id"),
    Callback = function()
        if not _G.G_JobId or _G.G_JobId == "" then
            WindUI:Notify({ Title = L("操作失败"), Content = L("请先输入服务器ID"), Duration = 2 })
            return
        end
        local args = {
            "teleport",
            _G.G_JobId
        }
        pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer(unpack(args))
        end)
    end
})


local currentThemeName = WindUI:GetCurrentTheme()
local availableThemes = WindUI:GetThemes()
local themeList = {}
for themeName, _ in pairs(availableThemes) do
    table.insert(themeList, themeName)
end


RJR[L("设置")]:Keybind({
    Title = L("窗口切换键"),
    Desc = L("切换窗口显示状态"),
    Value = "G",
    Callback = function(v)
        Window:SetToggleKey(Enum.KeyCode[v])
    end
})

local RefreshLocalizedUI
local RefreshDynamicLanguageUI
local LanguageButton

LanguageButton = RJR[L("设置")]:Button({
    Title = L("语言") .. " (" .. _G.G_Language .. ")",
    Icon = "globe",
    Callback = function()
        if _G.G_Language == "中文" then
            _G.G_Language = "English"
        else
            _G.G_Language = "中文"
        end
        SaveConfiguration()
        if RefreshLocalizedUI then RefreshLocalizedUI() end
        WindUI:Notify({
            Title = L("语言"),
            Content = _G.G_Language == "English" and L("语言已切换为: English") or L("语言已切换为: 中文"),
            Duration = 3
        })
    end
})

RefreshLocalizedUI = function()
    pcall(function()
        Window:SetTitle(LocalizeExistingText(Window.Title))
    end)
    for _, tab in ipairs((Window.TabModule and Window.TabModule.Tabs) or {}) do
        for _, element in ipairs(tab.Elements or {}) do
            if type(element) == "table" and element.SetTitle then
                pcall(function()
                    element:SetTitle(LocalizeExistingText(element.Title))
                    if element.SetDesc and element.Desc then
                        element:SetDesc(LocalizeExistingText(element.Desc))
                    end
                end)
            end
            if type(element) == "table" and element.__type == "Dropdown" then
                pcall(function()
                    if element.Tabs then
                        for _, item in ipairs(element.Tabs) do
                            local lbl = item and item.UIElements and item.UIElements.TabItem
                                and item.UIElements.TabItem.Frame and item.UIElements.TabItem.Frame.Title
                                and item.UIElements.TabItem.Frame.Title.TextLabel
                            if lbl and type(item.Name) == "string" then
                                lbl.Text = L(item.Name)
                            end
                        end
                    end
                    if element.UIElements and element.UIElements.Dropdown and not element._langHooked then
                        element._langHooked = true
                        local lbl = element.UIElements.Dropdown.Frame.Frame.TextLabel
                        if lbl and lbl.GetPropertyChangedSignal then
                            lbl:GetPropertyChangedSignal("Text"):Connect(function()
                                local t = LocalizeExistingText(lbl.Text)
                                if t ~= lbl.Text then
                                    lbl.Text = t
                                end
                            end)
                            local t = LocalizeExistingText(lbl.Text)
                            if t ~= lbl.Text then
                                lbl.Text = t
                            end
                        end
                    end
                end)
            end
        end
    end
    local function scanTexts(inst)
        for _, child in ipairs(inst:GetChildren()) do
            if child:IsA("TextLabel") then
                local nt = LocalizeExistingText(child.Text)
                if nt ~= child.Text then
                    child.Text = nt
                end
            end
            scanTexts(child)
        end
    end
    local sb = Window.UIElements and Window.UIElements.SideBar and Window.UIElements.SideBar.Frame
    if sb then
        pcall(function() scanTexts(sb) end)
    end
    if RefreshDynamicLanguageUI then
        pcall(RefreshDynamicLanguageUI)
    end
    if LanguageButton then
        local languageName = _G.G_Language == "English" and "English" or "中文"
        LanguageButton:SetTitle(L("语言") .. " (" .. languageName .. ")")
    end
end




local function GetPlayerList()
    local playerList = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    table.sort(playerList)
    return playerList
end

local function SetCollide()
    local character = LocalPlayer.Character
    if not character then return end
    for _, v in ipairs(character:GetChildren()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
            v.CanTouch   = true
            v.CanQuery   = true
        end
    end
end

local function SetNoCollide()
    local character = LocalPlayer.Character
    if not character then return end
    for _, v in ipairs(character:GetChildren()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
            v.CanTouch   = true
            v.CanQuery   = true
        end
    end
end

local ActiveTween = nil

local function topos(Pos)
    if not LocalPlayer or not LocalPlayer.Character then return end
    local HRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
    if not HRP or not Humanoid then return end

    HRP.AssemblyLinearVelocity  = Vector3.zero
    HRP.AssemblyAngularVelocity = Vector3.zero
    Humanoid:ChangeState(Enum.HumanoidStateType.Physics)

    local Distance = (Pos.Position - HRP.Position).Magnitude
    
    local Speed = 300

    if ActiveTween then ActiveTween:Cancel() end

    ActiveTween = game:GetService("TweenService"):Create(
        HRP,
        TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    )

    local isActive = true
    task.spawn(function()
        while isActive and ActiveTween and ActiveTween.PlaybackState == Enum.PlaybackState.Playing do
            SetNoCollide()
            task.wait(0.001)
        end
    end)

    ActiveTween:Play()

    ActiveTween.Completed:Connect(function()
        isActive = false
        if Humanoid then
            SetCollide()
            Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end
    end)
    
    task.delay(0.05, function()
        if Humanoid then
            Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end
    end)
end

local function StopTween()
    if ActiveTween then
        ActiveTween:Cancel()
        ActiveTween = nil
    end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local bodyClip = LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")
        if bodyClip then bodyClip:Destroy() end
    end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Highlight") then
        LocalPlayer.Character.Highlight:Destroy()
    end
end

local function validateOffset(val)
    local num = tonumber(val)
    if not num then return 0 end
    return math.clamp(num, -3000, 3000)
end

local PlayerDropdown = RJR[L("传送")]:Dropdown({
    Title = L("选择目标玩家"),
    Values = GetPlayerList(),
    Value = _G.G_SelectPly,
    Callback = function(selectedValue)
        if selectedValue and selectedValue ~= "" then
            _G.G_SelectPly = selectedValue
            WindUI:Notify({ Title = L("选择目标玩家"), Content = L("已设置为") .. selectedValue, Duration = 2 })
        else
            _G.G_SelectPly = ""
        end
    end
})

RJR[L("传送")]:Button({
    Title = L("刷新玩家列表"),
    Callback = function()
        local newPlayerList = GetPlayerList()
        if PlayerDropdown and PlayerDropdown.Refresh then
            PlayerDropdown:Refresh(newPlayerList, true) 
        end
        if _G.G_SelectPly ~= "" and PlayerDropdown and PlayerDropdown.SetValue then
            for _, name in ipairs(newPlayerList) do
                if name == _G.G_SelectPly then
                    pcall(function() PlayerDropdown:SetValue(_G.G_SelectPly) end)
                    break
                end
            end
        end
        WindUI:Notify({ Title = L("刷新玩家列表"), Content = L("加载完成"), Duration = 2 })
    end
})

RJR[L("传送")]:Toggle({
    Title = L("观战玩家"),
    Value = _G.G_SpectatePlys,
    Callback = function(value)
        _G.G_SpectatePlys = value
        if value and _G.G_SelectPly == "" then
            WindUI:Notify({ Title = L("操作失败"), Content = L("请先选择目标玩家"), Duration = 2 })
            _G.G_SpectatePlys = false
            return
        end
        task.spawn(function()
            local Camera = workspace.CurrentCamera
            repeat 
                task.wait(0.1)
                local TargetPlr = Players:FindFirstChild(_G.G_SelectPly)
                if not TargetPlr or not TargetPlr.Character or not TargetPlr.Character:FindFirstChildOfClass("Humanoid") then
                    WindUI:Notify({ Title = L("观战中断"), Content = L("目标玩家不存在/角色消失"), Duration = 2 })
                    _G.G_SpectatePlys = false
                    break
                end
                Camera.CameraSubject = TargetPlr.Character.Humanoid
            until _G.G_SpectatePlys == false 
            if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                Camera.CameraSubject = LocalPlayer.Character.Humanoid
                WindUI:Notify({ Title = L("观战结束"), Content = L("已恢复本地视角"), Duration = 2 })
            end
        end)
    end
})

local TeleportPlyConnection

RJR[L("传送")]:Toggle({
    Title = L("平滑传送至玩家"),
    Value = _G.G_TeleportPly,
    Callback = function(value)
        _G.G_TeleportPly = value
        if value and _G.G_SelectPly == "" then
            WindUI:Notify({ Title = L("操作失败"), Content = L("请先选择目标玩家"), Duration = 2 })
            _G.G_TeleportPly = false
            return
        end

        if TeleportPlyConnection then 
            TeleportPlyConnection:Disconnect()
            TeleportPlyConnection = nil
        end

        if value then
            WindUI:Notify({ 
                Title = L("传送开启"), 
                Content = L("已开始传送玩家（偏移X:")..(_G.G_TeleportOffsetX).." Y:"..(_G.G_TeleportOffsetY).." Z:"..(_G.G_TeleportOffsetZ).."）", 
                Duration = 2 
            })
            
            TeleportPlyConnection = RunService.Stepped:Connect(function()
                if not _G.G_TeleportPly then 
                    if TeleportPlyConnection then 
                        TeleportPlyConnection:Disconnect() 
                        TeleportPlyConnection = nil
                    end
                    return 
                end

                local TargetPlr = Players:FindFirstChild(_G.G_SelectPly)
                if not TargetPlr or not TargetPlr.Character or not TargetPlr.Character:FindFirstChild("HumanoidRootPart") then
                    return
                end

                local targetCFrame = TargetPlr.Character.HumanoidRootPart.CFrame + Vector3.new(_G.G_TeleportOffsetX, _G.G_TeleportOffsetY, _G.G_TeleportOffsetZ)
                topos(targetCFrame)
            end)
        else
            if TeleportPlyConnection then 
                TeleportPlyConnection:Disconnect() 
                TeleportPlyConnection = nil
            end
            StopTween()
            WindUI:Notify({ Title = L("传送关闭"), Content = L("已停止传送目标玩家"), Duration = 2 })
        end
    end
})


local PredictLastPos = {}
local PredictLastTick = {}
local function GetPredictedCFrame(hrp)
    local now = tick()
    local playerKey = hrp
    local baseCFrame = hrp.CFrame

    if not _G.G_TeleportPredict then
        PredictLastPos[playerKey] = hrp.Position
        PredictLastTick[playerKey] = now
        return baseCFrame
    end


    local velocity = hrp.AssemblyLinearVelocity
    if velocity.Magnitude < 0.1 then
        velocity = hrp.Velocity
    end


    local derivedVel = Vector3.zero
    local lastPos = PredictLastPos[playerKey]
    local lastTick = PredictLastTick[playerKey]
    if lastPos and lastTick then
        local dt = now - lastTick
        if dt > 0 and dt < 1 then
            derivedVel = (hrp.Position - lastPos) / dt
        end
    end
    PredictLastPos[playerKey] = hrp.Position
    PredictLastTick[playerKey] = now


    local finalVel = velocity
    if derivedVel.Magnitude > velocity.Magnitude then
        finalVel = derivedVel
    end

    local speed = finalVel.Magnitude
    local amount = 0.08 + speed * 0.0016
    if amount > 0.5 then amount = 0.5 end

    local predictedPos = hrp.Position + finalVel * amount
    return CFrame.new(predictedPos) * (baseCFrame - baseCFrame.Position)
end

RJR[L("传送")]:Toggle({
    Title = L("直接传送至玩家"),
    Value = _G.G_Teleport,
    Callback = function(bool)
        _G.G_Teleport = bool
        if bool and _G.G_SelectPly == "" then
            WindUI:Notify({ Title = L("操作失败"), Content = L("请先选择目标玩家"), Duration = 2 })
            _G.G_Teleport = false
            return
        end
        task.spawn(function()
            local VirtualUser = game:GetService("VirtualUser")
            if _G.G_Teleport == false then
                local TargetPlr = Players:FindFirstChild(_G.G_SelectPly)
                if TargetPlr and TargetPlr.Character and TargetPlr.Character:FindFirstChild("HumanoidRootPart") then
                    TargetPlr.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                end
                WindUI:Notify({ Title = L("Bypass关闭"), Content = L("已恢复目标玩家状态"), Duration = 2 })
                return
            end
            WindUI:Notify({ 
                Title = L("传送开启"), 
                Content = L("已开始传送（偏移X:").._G.G_TeleportOffsetX.." Y:".._G.G_TeleportOffsetY.." Z:".._G.G_TeleportOffsetZ.."）", 
                Duration = 2 
            })
            while _G.G_Teleport do task.wait()
                pcall(function()
                    local TargetPlr = Players:FindFirstChild(_G.G_SelectPly)
                    if not LocalPlayer.Character or not LocalPlayer.Character.HumanoidRootPart or not TargetPlr or not TargetPlr.Character or not TargetPlr.Character.HumanoidRootPart then
                        _G.G_Teleport = false
                        if TargetPlr and TargetPlr.Character and TargetPlr.Character.HumanoidRootPart then
                            TargetPlr.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
                        end
                        WindUI:Notify({ Title = L("传送中断"), Content = L("目标/本地玩家角色异常"), Duration = 2 })
                        return
                    end
                    local targetCFrame = GetPredictedCFrame(TargetPlr.Character.HumanoidRootPart) + Vector3.new(_G.G_TeleportOffsetX, _G.G_TeleportOffsetY, _G.G_TeleportOffsetZ)
                    LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
                    TargetPlr.Character.HumanoidRootPart.Size = Vector3.new(60,60,60)
                    VirtualUser:CaptureController()
                    VirtualUser:Button1Down(Vector2.new(1280, 672))
                end)
            end
        end)
    end
})

local function requestEntrance(pos)
    local args = {
        [1] = "requestEntrance",
        [2] = pos
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

local World2 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
local World3 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089

local TeleportLocations = {}
if World2 then
    TeleportLocations = {
        ["豪宅"] = Vector3.new(-390, 332, 673),
        ["天鹅房间"] = Vector3.new(2285, 15, 905),
        ["鬼船"] = Vector3.new(923, 126, 32852),
        ["僵尸岛"] = Vector3.new(-6509, 83, -133),
    }
elseif World3 then
    TeleportLocations = {
        ["海洋城堡"] = Vector3.new(-12463.6, 376.26, -7566.08),
        ["海龟豪宅"] = Vector3.new(-5060.41, 316.43, -3192.30),
        ["司法"] = Vector3.new(-5096.48, 316.43, -3177.91),
        ["九头蛇"] = Vector3.new(-5027.03, 316.43, -3206.07),
    }
end

local function GetNearestEntranceToTarget(targetPos, myPos)
    local bestName, bestPos = nil, nil
    local bestDist = (targetPos - myPos).Magnitude  
    for name, pos in pairs(TeleportLocations) do
        local d = (targetPos - pos).Magnitude
        if d < bestDist then
            bestDist = d
            bestName = name
            bestPos = pos
        end
    end
    return bestName, bestPos
end

local Lock2Connection
local Lock2LastEntrance = 0
local LockOrbitLastRoll = 0
local LockOrbitDX = 0
local LockOrbitDY = 0
local LockOrbitDZ = 0
local function GetLockOrbitPos(targetPos)
    if tick() - LockOrbitLastRoll > 0.08 + math.random() * 0.07 then
        LockOrbitLastRoll = tick()
        local function rnd() return math.random(25, 75) * (math.random() < 0.5 and 1 or -1) end
        LockOrbitDX = rnd()
        LockOrbitDY = rnd()
        LockOrbitDZ = rnd()
    end
    return targetPos + Vector3.new(LockOrbitDX, LockOrbitDY, LockOrbitDZ)
end

RJR[L("传送")]:Toggle({
    Title = L("锁人2"),
    Value = _G.G_Lock2,
    Callback = function(value)
        _G.G_Lock2 = value
        if value and _G.G_SelectPly == "" then
            WindUI:Notify({ Title = L("操作失败"), Content = L("请先选择目标玩家"), Duration = 2 })
            _G.G_Lock2 = false
            return
        end

        if Lock2Connection then
            Lock2Connection:Disconnect()
            Lock2Connection = nil
        end

        if value then
            WindUI:Notify({ Title = L("锁人2开启"), Content = L("自动选最近传送点接近，300米内直接锁定"), Duration = 2 })
            Lock2LastEntrance = 0

            Lock2Connection = RunService.Stepped:Connect(function()
                if not _G.G_Lock2 then
                    if Lock2Connection then
                        Lock2Connection:Disconnect()
                        Lock2Connection = nil
                    end
                    return
                end

                local myChar = LocalPlayer.Character
                local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
                local TargetPlr = Players:FindFirstChild(_G.G_SelectPly)
                if not myHRP or not TargetPlr or not TargetPlr.Character or not TargetPlr.Character:FindFirstChild("HumanoidRootPart") then
                    return
                end
                local tHRP = TargetPlr.Character.HumanoidRootPart

                local targetCFrame = GetPredictedCFrame(tHRP) + Vector3.new(_G.G_TeleportOffsetX, _G.G_TeleportOffsetY, _G.G_TeleportOffsetZ)
                local targetPos = targetCFrame.Position
                local myPos = myHRP.Position
                local distance = (targetPos - myPos).Magnitude

    
                if math.abs(myPos.Y - targetPos.Y) > 0.5 then
                    myHRP.CFrame = CFrame.new(myPos.X, targetPos.Y, myPos.Z)
                end

            
                if _G.G_LockQuickPath and distance > 1000 and tick() - Lock2LastEntrance > 3 then
                    local entName, entPos = GetNearestEntranceToTarget(targetPos, myPos)
                    if entName and entPos and entName ~= "P1" and entName ~= "P2" then
                        requestEntrance(entPos)
                        Lock2LastEntrance = tick()
                        return
                    end
                end
                if distance > 300 then
                    topos(targetCFrame)
                elseif _G.G_LockOrbit then
                    StopTween()
                    myHRP.CFrame = CFrame.new(GetLockOrbitPos(targetPos))
                else             
                    StopTween()
                    myHRP.CFrame = targetCFrame
                end
            end)
        else
            if Lock2Connection then
                Lock2Connection:Disconnect()
                Lock2Connection = nil
            end
            StopTween()
            WindUI:Notify({ Title = L("锁人2关闭"), Content = L("已停止锁定目标"), Duration = 2 })
        end
    end
})

RJR[L("传送")]:Toggle({
    Title = L("随机偏移锁人"),
    Value = _G.G_LockOrbit,
    Callback = function(v)
        _G.G_LockOrbit = v
        SaveConfiguration()
    end
})

RJR[L("传送")]:Toggle({
    Title = L("锁人预判 (对抗飞行)"),
    Value = _G.G_TeleportPredict,
    Callback = function(v)
        _G.G_TeleportPredict = v
        SaveConfiguration()
    end
})

RJR[L("传送")]:Toggle({
    Title = L("锁人快捷路径"),
    Desc = L("通过传送点快速接近目标"),
    Value = _G.G_LockQuickPath,
    Callback = function(v)
        _G.G_LockQuickPath = v
        SaveConfiguration()
    end
})

RJR[L("传送")]:Divider()

for name, pos in pairs(TeleportLocations) do
    RJR[L("传送")]:Button({
        Title = L(name),
        Icon = "map",
        Callback = function()
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                requestEntrance(pos)
                WindUI:Notify({
                    Title = L("快捷传送点"),
                    Content = L("已设置为 ") .. name,
                    Duration = 2
                })
            end
        end
    })
end

RJR[L("传送")]:Input({
    Title = L("X轴偏移"),
    Value = tostring(_G.G_TeleportOffsetX),
    Placeholder = "-3000 - 3000",
    Callback = function(inputVal)
        _G.G_TeleportOffsetX = validateOffset(inputVal)
        SaveConfiguration()
    end
})

RJR[L("传送")]:Input({
    Title = L("Y轴偏移"),
    Value = tostring(_G.G_TeleportOffsetY),
    Placeholder = "-3000 - 3000",
    Callback = function(inputVal)
        _G.G_TeleportOffsetY = validateOffset(inputVal)
        SaveConfiguration()
    end
})

RJR[L("传送")]:Input({
    Title = L("Z轴偏移"),
    Value = tostring(_G.G_TeleportOffsetZ),
    Placeholder = "-3000 - 3000",
    Callback = function(inputVal)
        _G.G_TeleportOffsetZ = validateOffset(inputVal)
        SaveConfiguration()
    end
})



RJR[L("设置")]:Dropdown({
    Title = L("选择主题"),
    Values = themeList,
    Value = _G.G_Theme,
    Callback = function(v)
        _G.G_Theme = v
        WindUI:SetTheme(v)
    end
})

RJR[L("设置")]:Button({
    Title = L("保存配置"),
    Callback = function()
        SaveConfig(true)
        WindUI:Notify({ Title = L("保存配置"), Content = L("加载完成"), Duration = 2 })
    end
})

RJR[L("设置")]:Button({
    Title = L("加载配置"),
    Callback = function()
        LoadConfig()
        WindUI:Notify({ Title = L("加载配置"), Content = L("加载完成"), Duration = 2 })
    end
})




local function IsAlive(character)
    if not character then return false end
    local hum = character:FindFirstChildOfClass("Humanoid")
    return hum ~= nil and hum.Health > 0
end

local c = Drawing.new("Circle")
c.Visible = false                   -- 默认关闭，必须等开关打开才绘制
c.Color = Color3.fromRGB(255, 0, 0) -- 默认红色
c.Radius = 150                      -- 默认半径
c.Thickness = 2
c.Filled = false


local Line = Drawing.new("Line")
Line.Thickness = 2
Line.Color = Color3.fromRGB(255, 0, 0)
Line.Transparency = 1
Line.Visible = false

if _G.G_SilentAimShowFOV then c.Visible = true end
if _G.G_SilentAimFOV then c.Radius = _G.G_SilentAimFOV end

task.spawn(function()
    RunService.RenderStepped:Connect(function()
        if not c.Visible then return end

        local p
        if _G.FOVMode == "屏幕中心" then
            local v = workspace.CurrentCamera.ViewportSize
            p = Vector2.new(v.X / 2, v.Y / 2)
        else
            p = UIS:GetMouseLocation()
            if p.X <= 0 or p.Y <= 0 then
                local v = workspace.CurrentCamera.ViewportSize
                p = Vector2.new(v.X / 2, v.Y / 2)
            end
        end
        c.Position = p
    end)
end)

local currentSilentAimTarget = nil

local function IsSilentAimAlly(player)
    local main = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("Main")
    local frame = main and main:FindFirstChild("Allies")
        and main.Allies:FindFirstChild("Container")
        and main.Allies.Container:FindFirstChild("Allies")
        and main.Allies.Container.Allies:FindFirstChild("ScrollingFrame")
        and main.Allies.Container.Allies.ScrollingFrame:FindFirstChild("Frame")
    if not frame then return false end
    return frame:FindFirstChild(player.Name) ~= nil
end

local function IsSilentAimEnemy(player)
    if not player or player == LocalPlayer then return false end
    if IsSilentAimAlly(player) then return false end
    local myTeam, targetTeam = LocalPlayer.Team, player.Team
    if myTeam and targetTeam and myTeam.Name == "Marines" and targetTeam.Name == "Marines" then
        return false
    end
    return true
end

local function GetSilentAimOrigin()
    local p = UIS:GetMouseLocation()
    if _G.FOVMode == "屏幕中心" or p.X <= 0 or p.Y <= 0 then
        local v = workspace.CurrentCamera.ViewportSize
        return Vector2.new(v.X / 2, v.Y / 2)
    end
    return p
end

local function GetClosestTargetToMouse()
    local method = _G.G_SilentAimMethod or "鼠标最近的玩家"

    if method == "选择玩家" then
        if not _G.G_SilentAimTargetPlayers then return nil end
        local name = _G.G_SilentAimSelectedPlayer
        if not name or name == "" then return nil end
        local player = Players:FindFirstChild(name)
        if not player or player == LocalPlayer then return nil end
        if _G.G_SilentAimTeamCheck and not IsSilentAimEnemy(player) then return nil end
        if _G.G_SilentAimExcludePVP and player:GetAttribute("PvpDisabled") == true then return nil end
        local character = player.Character
        if not IsAlive(character) then return nil end
        return character:FindFirstChild(_G.G_SilentAimPart) or character:FindFirstChild("HumanoidRootPart")
    end

    if method == "最近的玩家" then
        local myChar = LocalPlayer.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
        if not myRoot then return nil end
        local closest, shortest = nil, math.huge
        local myPos = myRoot.Position

        local function checkNearest(character)
            if not IsAlive(character) then return end
            local part = character:FindFirstChild(_G.G_SilentAimPart) or character:FindFirstChild("HumanoidRootPart")
            if not part then return end
            local d = (part.Position - myPos).Magnitude
            if d < shortest then closest, shortest = part, d end
        end

        if _G.G_SilentAimTargetPlayers then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    if (not _G.G_SilentAimTeamCheck or IsSilentAimEnemy(player)) and not (_G.G_SilentAimExcludePVP and player:GetAttribute("PvpDisabled") == true) then
                        checkNearest(player.Character)
                    end
                end
            end
        end
        if _G.G_SilentAimTargetMobs and workspace:FindFirstChild("Enemies") then
            for _, enemy in ipairs(workspace.Enemies:GetChildren()) do
                checkNearest(enemy)
            end
        end
        return closest
    end

    -- 鼠标最近的玩家（当前默认方法，按 FOV 内屏幕距离）
    local origin = GetSilentAimOrigin()
    local closest, shortest = nil, math.huge

    local function check(character)
        if not IsAlive(character) then return end
        local part = character:FindFirstChild(_G.G_SilentAimPart) or character:FindFirstChild("HumanoidRootPart")
        if not part then return end
        local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
        if onScreen then
            local dist = (Vector2.new(pos.X, pos.Y) - origin).Magnitude
            if dist <= _G.G_SilentAimFOV and dist < shortest then closest, shortest = part, dist end
        end
    end

    if _G.G_SilentAimTargetPlayers then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                if (not _G.G_SilentAimTeamCheck or IsSilentAimEnemy(player)) and not (_G.G_SilentAimExcludePVP and player:GetAttribute("PvpDisabled") == true) then
                    check(player.Character)
                end
            end
        end
    end
    if _G.G_SilentAimTargetMobs and workspace:FindFirstChild("Enemies") then
        for _, enemy in ipairs(workspace.Enemies:GetChildren()) do
            check(enemy)
        end
    end
    return closest
end

local MouseModuleInstance = ReplicatedStorage:FindFirstChild("Mouse")
local MouseModule = nil
if MouseModuleInstance then
    pcall(function() MouseModule = require(MouseModuleInstance) end)
end
if MouseModule and typeof(MouseModule) == "table" then
    pcall(function()
        local realStore = { Hit = rawget(MouseModule, "Hit"), Target = rawget(MouseModule, "Target") }
        local mmt = getrawmetatable(MouseModule)
        if mmt then setreadonly(mmt, false) else mmt = {}; setmetatable(MouseModule, mmt) end
        rawset(MouseModule, "Hit", nil); rawset(MouseModule, "Target", nil)
        mmt.__index = function(self, key)
            if key == "Hit" then
                if _G.G_SilentAimSkill and IsCurrentSkillEnabled() and currentSilentAimTarget then return CFrame.new(currentSilentAimTarget.Position) end
                return realStore.Hit
            elseif key == "Target" then
                if _G.G_SilentAimSkill and IsCurrentSkillEnabled() and currentSilentAimTarget then return currentSilentAimTarget end
                return realStore.Target
            end
        end
        mmt.__newindex = function(self, key, value)
            if key == "Hit" or key == "Target" then realStore[key] = value else rawset(self, key, value) end
        end
        setreadonly(mmt, true)
    end)
end


local mouse = LocalPlayer:GetMouse()
local oldIndex
pcall(function()
    oldIndex = hookmetamethod(game, "__index", function(self, key)
        if _G.G_SilentAimM1R and IsCurrentSkillEnabled() and currentSilentAimTarget and not checkcaller() and self == mouse then
            local tp = currentSilentAimTarget.Position
            local cp = workspace.CurrentCamera.CFrame.Position
            if key == "Hit" then return CFrame.new(tp)
            elseif key == "Target" then return currentSilentAimTarget
            elseif key == "UnitRay" then return Ray.new(cp, (tp - cp).Unit)
            elseif key == "Origin" then return cp
            elseif key == "Direction" then return (tp - cp).Unit
            end
        end
        return oldIndex(self, key)
    end)
end)


RunService.RenderStepped:Connect(function()
    local p = UIS:GetMouseLocation()
    if _G.FOVMode == "屏幕中心" or p.X <= 0 or p.Y <= 0 then
        local v = workspace.CurrentCamera.ViewportSize
        p = Vector2.new(v.X / 2, v.Y / 2)
    end

    if _G.G_SilentAimM1R or _G.G_SilentAimSkill then
        currentSilentAimTarget = GetClosestTargetToMouse()
    else
        currentSilentAimTarget = nil
    end

    if _G.G_SilentAimShowLine and currentSilentAimTarget then
        local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(currentSilentAimTarget.Position)
        if onScreen then
            Line.Visible = true
            Line.From = p
            Line.To = Vector2.new(pos.X, pos.Y)
        else
            Line.Visible = false
        end
    else
        Line.Visible = false
    end
end)

local LockHotkey = {
    gui = nil,
    panel = nil,
    title = nil,
    status = nil,
    info = nil,
    btn = nil,
    conns = {},
    conn = nil,
    loop = nil,
    active = false,
    target = nil,
    distance = 0,
    entranceTick = 0,
    uiTick = 0,
}

local function GetLockHotkeyName()
    local hotkey = _G.G_LockHotkeyKey or "H"
    if type(hotkey) ~= "string" then hotkey = "H" end
    hotkey = tostring(hotkey):upper()
    if hotkey == "" or hotkey == "NONE" then hotkey = "H" end
    return hotkey
end

local function DestroyLockHotkeyGui()
    for _, conn in pairs(LockHotkey.conns) do
        pcall(function() conn:Disconnect() end)
    end
    table.clear(LockHotkey.conns)
    if LockHotkey.gui then
        pcall(function() LockHotkey.gui:Destroy() end)
    end
    LockHotkey.gui = nil
    LockHotkey.panel = nil
    LockHotkey.title = nil
    LockHotkey.status = nil
    LockHotkey.info = nil
    LockHotkey.btn = nil
end

local function LockHotkeyUpdateUI()
    local status = LockHotkey.status
    local info = LockHotkey.info
    local btn = LockHotkey.btn
    local title = LockHotkey.title
    if not status or not info or not btn then return end
    local hotkeyText = GetLockHotkeyName()
    if title then
        title.Text = L("快捷锁人")
    end
    if LockHotkey.active and LockHotkey.target then
        status.Text = L("正在锁人: ") .. LockHotkey.target.Name
        status.TextColor3 = Color3.fromRGB(90, 255, 140)
        info.Text = L("距离: ") .. math.floor(LockHotkey.distance) .. L("米") .. "  |  " .. L("快捷键: ") .. hotkeyText
        btn.Text = L("解除锁定")
        btn.BackgroundColor3 = Color3.fromRGB(160, 50, 50)
    elseif LockHotkey.active then
        status.Text = L("正在锁人...")
        status.TextColor3 = Color3.fromRGB(255, 200, 70)
        info.Text = L("快捷键: ") .. hotkeyText
        btn.Text = L("解除锁定")
        btn.BackgroundColor3 = Color3.fromRGB(160, 50, 50)
    else
        status.Text = L("未锁定")
        status.TextColor3 = Color3.fromRGB(255, 95, 95)
        info.Text = L("快捷键: ") .. hotkeyText .. "  |  " .. L("按下按键开始锁定")
        btn.Text = L("开始锁定")
        btn.BackgroundColor3 = Color3.fromRGB(45, 120, 70)
    end
end

RefreshDynamicLanguageUI = LockHotkeyUpdateUI

local function LockHotkeyStopLoop()
    LockHotkey.active = false
    if LockHotkey.loop then
        LockHotkey.loop:Disconnect()
        LockHotkey.loop = nil
    end
    StopTween()
    LockHotkey.target = nil
    LockHotkey.distance = 0
    LockHotkeyUpdateUI()
end

local function LockHotkeyStartLoop()
    if LockHotkey.active then return end

    local firstTarget = GetClosestTargetToMouse()
    local targetPlayer = nil
    if firstTarget then
        local tc = firstTarget.Parent
        if tc and tc:IsA("Model") then
            targetPlayer = Players:GetPlayerFromCharacter(tc)
        end
    end
    if not targetPlayer then
        WindUI:Notify({ Title = L("快捷锁人"), Content = L("请先选择目标玩家"), Duration = 1.5 })
        return
    end

    if LockHotkey.loop then
        LockHotkey.loop:Disconnect()
        LockHotkey.loop = nil
    end

    LockHotkey.target = targetPlayer
    LockHotkey.active = true
    LockHotkey.entranceTick = 0
    LockHotkey.uiTick = 0
    LockHotkeyUpdateUI()

    local VirtualUser = game:GetService("VirtualUser")
    LockHotkey.loop = RunService.Heartbeat:Connect(function()
        if not LockHotkey.active then
            if LockHotkey.loop then
                LockHotkey.loop:Disconnect()
                LockHotkey.loop = nil
            end
            return
        end

        local ok = pcall(function()
            local tPlayer = LockHotkey.target
            if not tPlayer or not tPlayer.Parent or not tPlayer.Character then
                LockHotkeyStopLoop()
                return
            end
            local tHum = tPlayer.Character:FindFirstChildOfClass("Humanoid")
            local tHRP = tPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not tHRP or (tHum and tHum.Health <= 0) then
                LockHotkeyStopLoop()
                return
            end
            local myChar = LocalPlayer.Character
            local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if not myHRP then return end

            local targetCFrame = GetPredictedCFrame(tHRP) + Vector3.new(_G.G_TeleportOffsetX, _G.G_TeleportOffsetY, _G.G_TeleportOffsetZ)
            LockHotkey.distance = (targetCFrame.Position - myHRP.Position).Magnitude

            if _G.G_LockHotkeyMode == "锁人2" then
                local targetPos = targetCFrame.Position
                local myPos = myHRP.Position
                local distance = LockHotkey.distance

                if math.abs(myPos.Y - targetPos.Y) > 0.5 then
                    myHRP.CFrame = CFrame.new(myPos.X, targetPos.Y, myPos.Z)
                end

                if _G.G_LockQuickPath and distance > 1000 and tick() - LockHotkey.entranceTick > 3 then
                    local entName, entPos = GetNearestEntranceToTarget(targetPos, myPos)
                    if entName and entPos then
                        requestEntrance(entPos)
                        LockHotkey.entranceTick = tick()
                        return
                    end
                end
                if distance > 300 then
                    topos(targetCFrame)
                elseif _G.G_LockOrbit then
                    StopTween()
                    myHRP.CFrame = CFrame.new(GetLockOrbitPos(targetPos))
                else
                    StopTween()
                    myHRP.CFrame = targetCFrame
                end
            else
                myHRP.CFrame = targetCFrame
                VirtualUser:CaptureController()
                VirtualUser:Button1Down(Vector2.new(1280, 672))
            end
        end)

        if ok and tick() - LockHotkey.uiTick > 0.1 then
            LockHotkey.uiTick = tick()
            LockHotkeyUpdateUI()
        end
    end)
end

local function CreateLockHotkeyGui()
    DestroyLockHotkeyGui()

    local parentGui
    pcall(function()
        if gethui then
            parentGui = gethui()
        end
    end)
    if not parentGui then
        pcall(function()
            parentGui = game:GetService("CoreGui")
        end)
    end
    if not parentGui then
        parentGui = LocalPlayer:FindFirstChild("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui")
    end

    local sgui = Instance.new("ScreenGui")
    sgui.Name = "LockHotkeyGui"
    sgui.ResetOnSpawn = false
    sgui.IgnoreGuiInset = true
    sgui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    sgui.DisplayOrder = 999
    sgui.Parent = parentGui
    pcall(function()
        if syn and syn.protect_gui then
            syn.protect_gui(sgui)
        elseif protect_gui then
            protect_gui(sgui)
        end
    end)

    local panel = Instance.new("Frame")
    panel.Name = "Panel"
    panel.AnchorPoint = Vector2.new(0, 1)
    panel.Position = UDim2.new(0, 14, 1, -18)
    panel.Size = UDim2.new(0, 250, 0, 112)
    panel.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    panel.BackgroundTransparency = 0.12
    panel.BorderSizePixel = 0
    panel.Active = true
    panel.Parent = sgui

    local panelCorner = Instance.new("UICorner")
    panelCorner.CornerRadius = UDim.new(0, 10)
    panelCorner.Parent = panel

    local panelStroke = Instance.new("UIStroke")
    panelStroke.Color = Color3.fromRGB(255, 150, 55)
    panelStroke.Thickness = 1.2
    panelStroke.Transparency = 0.15
    panelStroke.Parent = panel

    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 28)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
    titleBar.BackgroundTransparency = 0.15
    titleBar.BorderSizePixel = 0
    titleBar.Active = true
    titleBar.Parent = panel

    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 10)
    titleCorner.Parent = titleBar

    local titleFix = Instance.new("Frame")
    titleFix.Size = UDim2.new(1, 0, 0, 12)
    titleFix.Position = UDim2.new(0, 0, 1, -12)
    titleFix.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
    titleFix.BackgroundTransparency = 0.15
    titleFix.BorderSizePixel = 0
    titleFix.Parent = titleBar

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, -12, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextColor3 = Color3.fromRGB(255, 190, 95)
    title.Text = L("快捷锁人")
    title.Parent = titleBar

    local status = Instance.new("TextLabel")
    status.Name = "Status"
    status.BackgroundTransparency = 1
    status.Position = UDim2.new(0, 12, 0, 36)
    status.Size = UDim2.new(1, -24, 0, 20)
    status.Font = Enum.Font.GothamBold
    status.TextSize = 14
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.TextColor3 = Color3.fromRGB(255, 95, 95)
    status.Text = L("未锁定")
    status.Parent = panel

    local info = Instance.new("TextLabel")
    info.Name = "Info"
    info.BackgroundTransparency = 1
    info.Position = UDim2.new(0, 12, 0, 56)
    info.Size = UDim2.new(1, -24, 0, 16)
    info.Font = Enum.Font.Gotham
    info.TextSize = 12
    info.TextXAlignment = Enum.TextXAlignment.Left
    info.TextColor3 = Color3.fromRGB(190, 190, 200)
    info.Text = ""
    info.Parent = panel

    local btn = Instance.new("TextButton")
    btn.Name = "ToggleBtn"
    btn.Position = UDim2.new(0, 12, 1, -32)
    btn.Size = UDim2.new(1, -24, 0, 24)
    btn.BackgroundColor3 = Color3.fromRGB(45, 120, 70)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = true
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = L("开始锁定")
    btn.Parent = panel

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    LockHotkey.gui = sgui
    LockHotkey.panel = panel
    LockHotkey.title = title
    LockHotkey.status = status
    LockHotkey.info = info
    LockHotkey.btn = btn

    LockHotkey.conns.btn = btn.MouseButton1Click:Connect(function()
        if LockHotkey.active then
            LockHotkeyStopLoop()
        else
            LockHotkeyStartLoop()
        end
    end)

    local dragging = false
    local dragStart = Vector2.zero
    local startPos = UDim2.new()
    LockHotkey.conns.dragBegin = titleBar.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
            return
        end
        dragging = true
        dragStart = Vector2.new(input.Position.X, input.Position.Y)
        startPos = panel.Position
        local ended
        ended = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                if ended then ended:Disconnect() end
            end
        end)
    end)
    LockHotkey.conns.dragMove = UIS.InputChanged:Connect(function(input)
        if not dragging then return end
        if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
            return
        end
        local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStart
        panel.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end)

    LockHotkeyUpdateUI()
end

local function StartLockHotkey()
    if not LockHotkey.gui or not LockHotkey.gui.Parent then
        CreateLockHotkeyGui()
    else
        LockHotkeyUpdateUI()
    end

    if LockHotkey.conn then return end
    LockHotkey.conn = UIS.InputBegan:Connect(function(input)
        if not _G.G_LockHotkey then return end
        if UIS:GetFocusedTextBox() then return end
        if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
        if input.KeyCode.Name:upper() ~= GetLockHotkeyName() then return end
        if LockHotkey.active then
            LockHotkeyStopLoop()
        else
            LockHotkeyStartLoop()
        end
    end)
end

local function StopLockHotkey()
    LockHotkeyStopLoop()
    if LockHotkey.conn then
        LockHotkey.conn:Disconnect()
        LockHotkey.conn = nil
    end
    DestroyLockHotkeyGui()
end

RJR[L("绘制")]:Divider()
do
local FOVSection = RJR[L("绘制")]:Section({ Title = L("自瞄范围设置") })


FOVSection:Toggle({
    Title = L("显示 FOV 范围"),
    Value = _G.G_SilentAimShowFOV,
    Callback = function(v)
        c.Visible = v
        _G.G_SilentAimShowFOV = v
        SaveConfiguration()
    end
})

FOVSection:Dropdown({
    Title = L("FOV 位置"),
    Values = {"跟随鼠标", "屏幕中心"},
    Value = _G.FOVMode,
    Callback = function(v)
        _G.FOVMode = v
        _G.G_SilentAimFOVMode = v
        SaveConfiguration()
    end
})

FOVSection:Slider({
    Title = L("FOV 半径大小"),
    Value = {
        Min = 10,
        Max = 2000,
        Default = _G.G_SilentAimFOV or 150
    },
    Callback = function(value)
        c.Radius = value
        _G.G_SilentAimFOV = value
        SaveConfiguration()
    end
})

FOVSection:Colorpicker({
    Title = L("FOV 范围颜色"),
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(v)
        c.Color = v
    end
})

RJR[L("绘制")]:Divider()


local AimSection = RJR[L("绘制")]:Section({ Title = L("自瞄设置") })

AimSection:Toggle({
    Title = L("M1 R 自瞄"),
    Value = _G.G_SilentAimM1R,
    Callback = function(v) _G.G_SilentAimM1R = v; SaveConfiguration() end
})

AimSection:Toggle({
    Title = L("技能自瞄"),
    Value = _G.G_SilentAimSkill,
    Callback = function(v) _G.G_SilentAimSkill = v; SaveConfiguration() end
})

AimSection:Dropdown({
    Title = L("指定技能自瞄"),
    Values = {"Z", "X", "C", "V", "F"},
    Value = _G.G_SilentAimSkills,
    Multi = true,
    Callback = function(v)
        _G.G_SilentAimSkills = v
        SaveConfiguration()
    end
})

AimSection:Dropdown({
    Title = L("静默瞄准方法"),
    Values = {"鼠标最近的玩家", "最近的玩家", "选择玩家"},
    Value = _G.G_SilentAimMethod or "鼠标最近的玩家",
    Callback = function(v)
        _G.G_SilentAimMethod = v
        SaveConfiguration()
    end
})

AimSection:Toggle({
    Title = L("瞄准玩家"),
    Value = _G.G_SilentAimTargetPlayers,
    Callback = function(v) _G.G_SilentAimTargetPlayers = v; SaveConfiguration() end
})

AimSection:Toggle({
    Title = L("瞄准 NPC"),
    Value = _G.G_SilentAimTargetMobs,
    Callback = function(v) _G.G_SilentAimTargetMobs = v; SaveConfiguration() end
})

AimSection:Toggle({
    Title = L("团队检测"),
    Value = _G.G_SilentAimTeamCheck,
    Callback = function(v) _G.G_SilentAimTeamCheck = v; SaveConfiguration() end
})

AimSection:Toggle({
    Title = L("排除未开启pvp"),
    Value = _G.G_SilentAimExcludePVP,
    Callback = function(v) _G.G_SilentAimExcludePVP = v; SaveConfiguration() end
})

AimSection:Toggle({
    Title = L("显示锁定红线"),
    Value = _G.G_SilentAimShowLine,
    Callback = function(v) _G.G_SilentAimShowLine = v; SaveConfiguration() end
})

AimSection:Dropdown({
    Title = L("瞄准部位"),
    Values = {"HumanoidRootPart", "Head", "Torso", "UpperTorso", "LowerTorso"},
    Value = _G.G_SilentAimPart,
    Callback = function(v) _G.G_SilentAimPart = v; SaveConfiguration() end
})

RJR[L("绘制")]:Divider()

local SilentAimPlayerDropdown = RJR[L("绘制")]:Dropdown({
    Title = L("选择瞄准玩家"),
    Values = GetPlayerList(),
    Value = _G.G_SilentAimSelectedPlayer,
    Callback = function(v)
        _G.G_SilentAimSelectedPlayer = v or ""
        SaveConfiguration()
    end
})

RJR[L("绘制")]:Button({
    Title = L("刷新玩家列表"),
    Callback = function()
        local newPlayerList = GetPlayerList()
        if SilentAimPlayerDropdown and SilentAimPlayerDropdown.Refresh then
            SilentAimPlayerDropdown:Refresh(newPlayerList, true)
        end
        if _G.G_SilentAimSelectedPlayer ~= "" and SilentAimPlayerDropdown and SilentAimPlayerDropdown.SetValue then
            for _, name in ipairs(newPlayerList) do
                if name == _G.G_SilentAimSelectedPlayer then
                    pcall(function() SilentAimPlayerDropdown:SetValue(_G.G_SilentAimSelectedPlayer) end)
                    break
                end
            end
        end
    end
})
end

RJR[L("绘制")]:Toggle({
    Title = L("快捷键锁人"),
    Value = _G.G_LockHotkey,
    Callback = function(v)
        _G.G_LockHotkey = v
        if v then
            StartLockHotkey()
        else
            StopLockHotkey()
        end
        SaveConfiguration()
    end
})

RJR[L("绘制")]:Keybind({
    Title = L("锁人快捷键"),
    Value = _G.G_LockHotkeyKey or "H",
    Callback = function(v)
        _G.G_LockHotkeyKey = v
        LockHotkeyUpdateUI()
        SaveConfiguration()
    end
})

RJR[L("绘制")]:Dropdown({
    Title = L("锁人模式"),
    Values = {"锁人1", "锁人2"},
    Value = _G.G_LockHotkeyMode,
    Callback = function(v)
        _G.G_LockHotkeyMode = v
        SaveConfiguration()
    end
})

if _G.G_LockHotkey then StartLockHotkey() end

RJR[L("绘制")]:Divider()

do
    local autoSoruConn = nil

    local function soruTo(targetPosition)
        local Character = LocalPlayer.Character
        if not Character then return end

        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        local Humanoid = Character:FindFirstChild("Humanoid")
        if not HumanoidRootPart or not Humanoid or Humanoid.Health <= 0 then return end

        local startCFrame = HumanoidRootPart.CFrame
        local finalCFrame = (startCFrame - startCFrame.Position) + targetPosition + Vector3.new(0, HumanoidRootPart.Size.Y * 1.5, 0)

        ReplicatedStorage.Remotes.CommE:FireServer(
            "Soru",
            startCFrame,
            finalCFrame,
            workspace:GetServerTimeNow(),
            math.random(1, 999999999)
        )
    end

    local function soruToClosestPlayer()
        local closestPlayer, shortestDistance = nil, math.huge
        local Character = LocalPlayer.Character
        local myRoot = Character and Character:FindFirstChild("HumanoidRootPart")
        if not myRoot then return end
        local myPos = myRoot.Position

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local otherChar = player.Character
                local otherHum = otherChar and otherChar:FindFirstChild("Humanoid")
                local otherRoot = otherChar and otherChar:FindFirstChild("HumanoidRootPart")
                if otherHum and otherRoot and otherHum.Health > 0 then
                    local distance = (otherRoot.Position - myPos).Magnitude
                    if distance < shortestDistance then
                        shortestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end

        local targetChar = closestPlayer and closestPlayer.Character
        local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        if targetRoot then
            soruTo((targetRoot.CFrame * CFrame.new(0, 0, 3)).Position)
        end
    end

    local function startAutoSoru()
        if autoSoruConn then return end
        autoSoruConn = task.spawn(function()
            while _G.G_AutoSoru do
                pcall(soruToClosestPlayer)
                task.wait(1)
            end
            autoSoruConn = nil
        end)
    end

    local function stopAutoSoru()
        _G.G_AutoSoru = false
        autoSoruConn = nil
    end

    RJR[L("绘制")]:Toggle({
        Title = L("自动瞬步"),
        Desc = "每15秒强制打你2500血你气不气😂",
        Value = _G.G_AutoSoru,
        Callback = function(v)
            _G.G_AutoSoru = v
            if v then
                startAutoSoru()
            else
                stopAutoSoru()
            end
            SaveConfiguration()
        end
    })

    if _G.G_AutoSoru then startAutoSoru() end
end

task.defer(function()
    SaveConfig(true)
    WindUI:Notify({ Title = L("保存配置"), Content = L("自动保存已开启"), Duration = 3 })
end)
