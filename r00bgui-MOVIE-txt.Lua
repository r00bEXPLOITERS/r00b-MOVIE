local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local glitchFonts = {
    Enum.Font.Legacy,
    Enum.Font.Arial,
    Enum.Font.ArialBold,
    Enum.Font.SourceSans,
    Enum.Font.SourceSansBold,
    Enum.Font.SourceSansSemibold,
    Enum.Font.SourceSansLight,
    Enum.Font.SourceSansItalic,
    Enum.Font.Bodoni,
    Enum.Font.Garamond,
    Enum.Font.Cartoon,
    Enum.Font.Code,
    Enum.Font.Highway,
    Enum.Font.SciFi,
    Enum.Font.Arcade,
    Enum.Font.Fantasy,
    Enum.Font.Antique,
    Enum.Font.GothamSemibold,
    Enum.Font.GothamBold,
    Enum.Font.GothamBlack
}

local function madeByGavin(plr)
    local playerGui = plr:WaitForChild("PlayerGui")

    local gui = Instance.new("ScreenGui")
    gui.Name = "LOLCOOKED"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 999999
    gui.ScreenInsets = Enum.ScreenInsets.None
    gui.Parent = playerGui

    local bg = Instance.new("ImageLabel")
    bg.Parent = gui
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.Image = "rbxassetid://87228378014029"
    bg.BackgroundColor3 = Color3.new(0, 0, 0)

    task.spawn(function()
        local USER_IDS = {10640423431}

        local ANIM_IDS = {
            "rbxassetid://80227566492978",
            "rbxassetid://81292195847151"
        }

        local viewport = Instance.new("ViewportFrame")
        viewport.Parent = gui
        viewport.Size = UDim2.new(1, 0, 1, 0)
        viewport.BackgroundTransparency = 1
        viewport.ZIndex = 1000

        local worldModel = Instance.new("WorldModel")
        worldModel.Parent = viewport

        local camera = Instance.new("Camera")
        camera.Parent = viewport
        camera.FieldOfView = 35
        camera.CFrame = CFrame.lookAt(
            Vector3.new(0, -1.4, 8),
            Vector3.new(0, 0.35, -12)
        )

        viewport.CurrentCamera = camera

        local radius = 12
        local totalChars = #USER_IDS
        local arcAngle = math.rad(90)

        math.randomseed(os.clock())

        local function playRandomAnim(humanoid)
            local animator =
                humanoid:FindFirstChildOfClass("Animator")
                or Instance.new("Animator", humanoid)

            local anim = Instance.new("Animation")
            anim.AnimationId =
                ANIM_IDS[math.random(1, #ANIM_IDS)]

            local track = animator:LoadAnimation(anim)
            track.Looped = true
            track:Play()

            return track
        end

        for i, userId in ipairs(USER_IDS) do
            local angle =
                (i - (totalChars + 1) / 2)
                * (arcAngle / (totalChars - 1 > 0 and totalChars - 1 or 1))

            local x = math.sin(angle) * radius
            local z = -math.cos(angle) * radius

            pcall(function()
                local description =
                    Players:GetHumanoidDescriptionFromUserId(userId)

                local model =
                    Players:CreateHumanoidModelFromDescription(
                        description,
                        Enum.HumanoidRigType.R15
                    )

                model.Name = "0zCafKidd"
                model.Parent = worldModel

                local pos = Vector3.new(x, 0, z)

                model:SetPrimaryPartCFrame(
                    CFrame.new(pos, Vector3.new(0, 0, 7))
                )

                local hum = model:FindFirstChildOfClass("Humanoid")

                if hum then
                    task.spawn(function()
                        while hum.Parent do
                            local track = playRandomAnim(hum)

                            task.wait(math.random(4, 12))

                            if track then
                                track:Stop()
                                track:Destroy()
                            end
                        end
                    end)
                end
            end)
        end
    end)

    local Sound = Instance.new("Sound")
    Sound.Parent = bg
    Sound.SoundId = "rbxassetid://98752310524434"
    Sound.Volume = 3
    Sound.Looped = true
    Sound.PlaybackSpeed = 1
    Sound.Name = "MASTER ZELDABE"
    Sound:Play()

    task.wait(0.2)

    local Sound1 = Instance.new("Sound")
    Sound1.Parent = bg
    Sound1.SoundId = "rbxassetid://98752310524434"
    Sound1.Volume = 0.2
    Sound1.Name = "Master Sword"
    Sound1.Looped = true
    Sound1.PlaybackSpeed = 10
    Sound1:Play()

    local function makeGlitchText(text, zindex)
        local t = Instance.new("TextLabel")
        t.Text = text
        t.Size = UDim2.new(0, 120, 0, 30)
        t.TextScaled = true
        t.TextColor3 = Color3.new(1, 1, 1)
        t.BackgroundTransparency = 1
        t.BorderSizePixel = 0
        t.ZIndex = zindex
        t.Parent = gui

        return t
    end

    local topText = makeGlitchText("r00bgui_Exploiters MOVIE", 100)
    topText.Size = UDim2.new(1, 0, 0, 80)
    topText.Position = UDim2.new(0, 0, 0, 0)
    topText.BackgroundTransparency = 0.7
    topText.BackgroundColor3 = Color3.new(0, 0, 0)

    local mainLine = "r00bgui_Exploiters MOVIE  r00bgui_Exploiters MOVIE  r00bgui_Exploiters MOVIE  r00bgui_Exploiters MOVIE"
    local mainTextString = mainLine .. "\n" .. mainLine .. "\n" .. mainLine .. "\n" .. mainLine

    local main = makeGlitchText(mainTextString, 5)
    main.Size = UDim2.new(1, 0, 1, 0)
    main.Position = UDim2.new(0, 0, 0, 0)
    main.BackgroundTransparency = 1
    main.TextScaled = false
    main.TextSize = 80
    main.TextWrapped = true

    local bottomText = makeGlitchText("r00bgui_Exploiters MOVIE", 100)
    bottomText.Size = UDim2.new(1, 0, 0, 80)
    bottomText.Position = UDim2.new(0, 0, 0.85, 0)
    bottomText.BackgroundTransparency = 0.7
    bottomText.BackgroundColor3 = Color3.new(0, 0, 0)

    task.spawn(function()
        local startTime = tick()
        local fontIndex = 1

        while tick() - startTime < 90 do
            task.wait(0.1)

            local currentFont = glitchFonts[fontIndex]

            topText.Font = currentFont
            main.Font = currentFont
            bottomText.Font = currentFont

            fontIndex += 1

            if fontIndex > #glitchFonts then
                fontIndex = 1
            end
        end
    end)

    task.wait(90)

    TweenService:Create(
        bg,
        TweenInfo.new(2),
        {
            ImageTransparency = 1
        }
    ):Play()

    task.wait(3)

    gui:Destroy()
end

for _, plr in ipairs(Players:GetPlayers()) do
    task.spawn(madeByGavin, plr)
end
