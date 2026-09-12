local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- 设置
local aimbotEnabled = false
local wallCheckEnabled = false
local rightClickEnabled = false
local espEnabled = true
local maxDistance = 140
local fovAngle = 72
local aimSmoothness = 0.2
local rightClickAimbot = false

local uiMinimized = false
local baseW, baseH = 320, 440
local miniSize = UDim2.new(0,72,0,34)
local tweenInfo = TweenInfo.new(0.24, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Bandit_AimHub"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- FOV准星圈
local Circle = Instance.new("Frame")
Circle.AnchorPoint = Vector2.new(0.5, 0.5)
Circle.Position = UDim2.new(0.5, 0, 0.5, 0)
Circle.Size = UDim2.new(0, 300, 0, 300)
Circle.BackgroundTransparency = 1
Circle.Parent = ScreenGui
local stroke = Instance.new("UIStroke", Circle)
stroke.Color = Color3.new(0,1,0)
stroke.Thickness = 3
Instance.new("UICorner", Circle).CornerRadius = UDim.new(1,0)

-- 主窗口容器
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, baseW, 0, baseH)
panel.Position = UDim2.new(0.5, -baseW/2, 0.65, 0)
panel.BackgroundColor3 = Color3.new(0.07,0.07,0.07)
panel.ClipsDescendants = true
panel.AnchorPoint = Vector2.new(0,0)
panel.Parent = ScreenGui
local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0,12)
panelCorner.Parent = panel

-- 标题栏
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1,0,0,36)
titleBar.BackgroundTransparency = 1
titleBar.Parent = panel

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1,-44,1,0)
titleText.BackgroundTransparency = 1
titleText.Text = "Void兵工厂自瞄透视"
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 21
titleText.TextColor3 = Color3.new(1,1,1)
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Position = UDim2.new(0,10,0,0)
titleText.Parent = titleBar

-- 最小化按钮
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0,30,0,26)
minimizeBtn.Position = UDim2.new(1,-36,0,5)
minimizeBtn.BackgroundColor3 = Color3.new(0.16,0.16,0.16)
minimizeBtn.Text = "−"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 20
minimizeBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0,6)
minimizeBtn.Parent = titleBar

-- 悬浮最小化方块
local miniBox = Instance.new("TextButton")
miniBox.Size = miniSize
miniBox.Visible = false
miniBox.BackgroundColor3 = Color3.new(0.07,0.07,0.07)
miniBox.Text = "Void"
miniBox.Font = Enum.Font.GothamBold
miniBox.TextSize = 17
miniBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", miniBox).CornerRadius = UDim.new(0,8)
miniBox.Parent = ScreenGui

-- 内容区域（自动布局）
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1,-20,1,-50)
contentFrame.Position = UDim2.new(0,10,0,40)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = panel

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0,12)
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.Parent = contentFrame

-- 右下角拉伸把手
local resizeGrip = Instance.new("Frame")
resizeGrip.Size = UDim2.new(0,14,0,14)
resizeGrip.Position = UDim2.new(1,-14,1,-14)
resizeGrip.BackgroundTransparency = 0.6
resizeGrip.BackgroundColor3 = Color3.new(0.4,0.4,0.4)
resizeGrip.ZIndex = 10
resizeGrip.Parent = panel

-- 窗口拖动
local dragging, dragInput, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and not uiMinimized then
        dragging = true
        dragStart = input.Position
        startPos = panel.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

-- 悬浮方块拖动
local miniDrag, miniStart, miniOrigin
miniBox.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        miniDrag = true
        miniStart = input.Position
        miniOrigin = miniBox.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then miniDrag = false end
        end)
    end
end)

-- 拉伸窗口
local resizing, resizeStart, startSize
resizeGrip.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and not uiMinimized then
        resizing = true
        resizeStart = input.Position
        startSize = panel.Size
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then resizing = false end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
    if dragging and not uiMinimized then
        local delta = input.Position - dragStart
        panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    if miniDrag then
        local delta = input.Position - miniStart
        miniBox.Position = UDim2.new(miniOrigin.X.Scale, miniOrigin.X.Offset + delta.X, miniOrigin.Y.Scale, miniOrigin.Y.Offset + delta.Y)
    end
    if resizing then
        local delta = input.Position - resizeStart
        local w = math.max(280, startSize.X.Offset + delta.X)
        local h = math.max(380, startSize.Y.Offset + delta.Y)
        panel.Size = UDim2.new(0,w,0,h)
    end
end)

-- 最小化/展开动画
local function ToggleMinimize()
    uiMinimized = not uiMinimized
    if uiMinimized then
        miniBox.Position = panel.Position
        local tween = TweenService:Create(panel, tweenInfo, {Size = miniSize})
        tween:Play()
        tween.Completed:Connect(function()
            panel.Visible = false
            miniBox.Visible = true
        end)
    else
        panel.Visible = true
        panel.Position = miniBox.Position
        local tween = TweenService:Create(panel, tweenInfo, {Size = UDim2.new(0,baseW,0,baseH)})
        tween:Play()
        miniBox.Visible = false
    end
end
minimizeBtn.MouseButton1Click:Connect(ToggleMinimize)
miniBox.MouseButton1Click:Connect(ToggleMinimize)

-- 创建按钮
local function CreateToggleBtn(name, offCol, onCol)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,280,0,38)
    btn.BackgroundColor3 = offCol
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.Text = name.."：关闭"
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)
    btn.Parent = contentFrame
    local state = false
    return btn, function()
        state = not state
        btn.Text = name.."："..(state and "开启" or "关闭")
        btn.BackgroundColor3 = state and onCol or offCol
        return state
    end
end

local aimBtn, aimCallback = CreateToggleBtn("自瞄", Color3.new(0.14,0.20,0.14), Color3.new(0,0.42,0))
aimBtn.MouseButton1Click:Connect(function()
    aimbotEnabled = aimCallback()
end)

local wallBtn, wallCallback = CreateToggleBtn("隔墙不自瞄", Color3.new(0.14,0.14,0.21), Color3.new(0,0,0.42))
wallBtn.MouseButton1Click:Connect(function()
    wallCheckEnabled = wallCallback()
end)

local rmbBtn, rmbCallback = CreateToggleBtn("右键按住自瞄", Color3.new(0.21,0.14,0.14), Color3.new(0.42,0,0))
rmbBtn.MouseButton1Click:Connect(function()
    rightClickEnabled = rmbCallback()
end)

local espBtn, espCallback = CreateToggleBtn("方框ESP", Color3.new(0.19,0.15,0.23), Color3.new(0.36,0,0.56))
espBtn.MouseButton1Click:Connect(function()
    espEnabled = espCallback()
end)

-- 参数输入行模板
local function CreateSettingInput(labelName, default, minV, maxV, updateFunc)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0,280,0,32)
    container.BackgroundTransparency = 1
    container.Parent = contentFrame

    local lab = Instance.new("TextLabel")
    lab.Size = UDim2.new(0,90,1,0)
    lab.BackgroundTransparency = 1
    lab.Text = labelName
    lab.Font = Enum.Font.Gotham
    lab.TextSize = 17
    lab.TextColor3 = Color3.new(1,1,1)
    lab.TextXAlignment = Enum.TextXAlignment.Left
    lab.Parent = container

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0,110,1,0)
    box.Position = UDim2.new(0,100,0,0)
    box.Text = tostring(default)
    box.ClearTextOnFocus = false
    box.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
    box.TextColor3 = Color3.new(1,1,1)
    box.Font = Enum.Font.Gotham
    box.TextSize = 17
    Instance.new("UICorner", box).CornerRadius = UDim.new(0,6)
    box.Parent = container

    box.FocusLost:Connect(function(enter)
        if not enter then return end
        local val = tonumber(box.Text)
        if val then
            val = math.clamp(val, minV, maxV)
            updateFunc(val)
        end
        box.Text = tostring(val or default)
    end)
end

CreateSettingInput("FOV角度", fovAngle, 30, 120, function(v) fovAngle = v end)
CreateSettingInput("最大距离", maxDistance, 10, 250, function(v) maxDistance = v end)
CreateSettingInput("平滑系数", aimSmoothness, 0.05, 1, function(v) aimSmoothness = v end)

-- 右键状态监听
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.UserInputType == Enum.UserInputType.MouseButton2 then
        rightClickAimbot = true
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        rightClickAimbot = false
    end
end)

-- ESP缓存
local ESPCache = {}
local function NewDraw(type, props)
    local ok, drawObj = pcall(Drawing.new, type)
    if not ok then return nil end
    for k,v in pairs(props) do pcall(function() drawObj[k] = v end) end
    return drawObj
end

-- 清理全部ESP缓存
local function ClearAllESP()
    for _,data in pairs(ESPCache) do
        for _,d in pairs(data) do
            pcall(function() d:Destroy() end)
        end
    end
    table.clear(ESPCache)
end

-- 三维FOV寻敌
local function GetNearestEnemy()
    local targetHead, bestAngle = nil, math.huge
    local camPos = Camera.CFrame.Position
    local camLook = Camera.CFrame.LookVector
    local localChar = LocalPlayer.Character
    local localHRP = localChar and localChar:FindFirstChild("HumanoidRootPart")

    -- 本地无角色（死亡观战）直接不寻找目标
    if not localHRP then return nil end

    for _,player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer or player.Team == LocalPlayer.Team then continue end
        local char = player.Character
        if not char then continue end
        local head = char:FindFirstChild("Head")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not (head and hum and hum.Health > 0) then continue end

        local hPos = head.Position
        local dist = (localHRP.Position - hPos).Magnitude
        -- 距离超限直接跳过
        if dist > maxDistance then continue end
        -- Arsenal虚空尸体一般Y极低，过滤地底休眠角色
        if hPos.Y < -100 then continue end

        local dir = (hPos - camPos).Unit
        local dot = camLook:Dot(dir)
        if dot <= 0 then continue end

        local angle = math.deg(math.acos(math.clamp(dot, -1, 1)))
        if angle > fovAngle then continue end

        local canSee = true
        if wallCheckEnabled then
            local rayParam = RaycastParams.new()
            rayParam.FilterDescendantsInstances = {localChar, char}
            rayParam.FilterType = Enum.RaycastFilterType.Exclude
            if workspace:Raycast(camPos, hPos - camPos, rayParam) then
                canSee = false
            end
        end

        if canSee and angle < bestAngle then
            bestAngle = angle
            targetHead = head
        end
    end
    return targetHead
end

-- 渲染循环
RunService.RenderStepped:Connect(function()
    local activePlayers = {}
    for _,p in ipairs(Players:GetPlayers()) do
        table.insert(activePlayers, p)
    end

    -- 清理离线玩家ESP
    for plr,data in pairs(ESPCache) do
        if not table.find(activePlayers, plr) then
            for _,d in pairs(data) do
                pcall(function() d:Destroy() end)
            end
            ESPCache[plr] = nil
        end
    end

    local localChar = LocalPlayer.Character
    local localHRP = localChar and localChar:FindFirstChild("HumanoidRootPart")
    -- 关键修复：本地玩家死亡没有HRP，强制全部隐藏ESP，杜绝观战虚空方框
    local isDead = not localHRP

    for _,plr in ipairs(Players:GetPlayers()) do
        if plr == LocalPlayer or plr.Team == LocalPlayer.Team then continue end
        local char = plr.Character

        -- 没有角色 OR 自己死亡观战，隐藏ESP
        if not char or isDead then
            if ESPCache[plr] then
                local esp = ESPCache[plr]
                esp.OuterBox.Visible = false
                esp.InnerBox.Visible = false
                esp.NameText.Visible = false
                esp.DistText.Visible = false
            end
            continue
        end

        local head = char:FindFirstChild("Head")
        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")

        if not ESPCache[plr] then
            ESPCache[plr] = {
                OuterBox = NewDraw("Square", {Visible=false,Color=Color3.new(0,0,0),Thickness=2.3}),
                InnerBox = NewDraw("Square", {Visible=false,Color=Color3.new(1,0,0),Thickness=1.4}),
                NameText = NewDraw("Text", {Visible=false,Color=Color3.new(1,1,1),Outline=true,Size=12}),
                DistText = NewDraw("Text", {Visible=false,Color=Color3.new(1,1,0),Outline=true,Size=11})
            }
        end
        local esp = ESPCache[plr]

        -- 多重判定
        if not espEnabled or not (head and root and hum and hum.Health>0) then
            esp.OuterBox.Visible = false
            esp.InnerBox.Visible = false
            esp.NameText.Visible = false
            esp.DistText.Visible = false
        else
            -- 过滤地图下方虚空休眠尸体
            if head.Position.Y < -100 then
                esp.OuterBox.Visible = false
                esp.InnerBox.Visible = false
                esp.NameText.Visible = false
                esp.DistText.Visible = false
                continue
            end

            local top3D, topVis = Camera:WorldToViewportPoint(head.Position + Vector3.new(0,0.5,0))
            local bot3D, botVis = Camera:WorldToViewportPoint(root.Position - Vector3.new(0,2.3,0))

            if not (topVis and botVis and top3D.Z > 0.1 and bot3D.Z > 0.1) then
                esp.OuterBox.Visible = false
                esp.InnerBox.Visible = false
                esp.NameText.Visible = false
                esp.DistText.Visible = false
            else
                local dist = (localHRP.Position - root.Position).Magnitude
                -- 距离超出设定直接隐藏
                if dist > maxDistance then
                    esp.OuterBox.Visible = false
                    esp.InnerBox.Visible = false
                    esp.NameText.Visible = false
                    esp.DistText.Visible = false
                    continue
                end

                local top2D = Vector2.new(top3D.X, top3D.Y)
                local bot2D = Vector2.new(bot3D.X, bot3D.Y)
                local height = bot2D.Y - top2D.Y
                local width = height * 0.48

                esp.InnerBox.Position = Vector2.new(top2D.X - width/2, top2D.Y)
                esp.InnerBox.Size = Vector2.new(width, height)
                esp.InnerBox.Visible = true

                esp.OuterBox.Position = esp.InnerBox.Position
                esp.OuterBox.Size = esp.InnerBox.Size
                esp.OuterBox.Visible = true

                esp.NameText.Position = Vector2.new(top2D.X, top2D.Y - 6)
                esp.NameText.Text = plr.Name
                esp.NameText.Visible = true

                local dis = math.floor(dist)
                esp.DistText.Position = Vector2.new(top2D.X, bot2D.Y + 6)
                esp.DistText.Text = dis.." m"
                esp.DistText.Visible = true
            end
        end
    end

    -- 执行自瞄
    local activeAim = aimbotEnabled
    if rightClickEnabled then activeAim = rightClickAimbot end
    if activeAim then
        local targetHead = GetNearestEnemy()
        if targetHead then
            local targetCam = CFrame.new(Camera.CFrame.Position, targetHead.Position)
            Camera.CFrame = Camera.CFrame:Lerp(targetCam, aimSmoothness)
        end
    end
end)