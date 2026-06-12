local games = {
    [140209132616484] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/main/water-empire.lua", status = "active" }, -- Water Empire
    [114115486822297] = { url = "https://pastefy.app/Ksz9zj49/raw", status = "active" }, -- Spin A Lucky Block For Soccer Cards
    [72774564502867] = { url = "https://raw.githubusercontent.com/dhannxsazaraxhub/testajamok/refs/heads/main/lengkapi-kata.lua", status = "stable" }, -- Lengkapi Kata
    [114640202062357] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/swingforabrainrot.lua", status = "active" }, -- Swing Obby for a Brainrot
    [103159798148004] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/empang-indo.lua", status = "stable" }, -- Empang Indo
    [125810438250765] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/deadly-delivers.lua", status = "active" }, -- Deadly Delivery
    [130342654546662] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/sambung-kata.lua", status = "disabled" }, -- Sambung Kata
    [18680867089] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/ultimate-mining-tycoon.lua", status = "active" }, -- Ultimate Mining Tycoon
    [83369512629707] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/sawah-indo.lua", status = "stable" }, -- Sawah Indo
}

local currentID = game.PlaceId
local g = games[currentID]

-- Victoria Global Broadcast Receiver
task.spawn(function()
    local last_id = ""
    local HttpService = game:GetService("HttpService")
    local TweenService = game:GetService("TweenService")
    local SoundService = game:GetService("SoundService")
    local CoreGui = game:GetService("CoreGui")
    while true do
        pcall(function()
            local res = game:HttpGet("https://victoriascript.vercel.app/api/announcement?t="..tostring(os.time()))
            local data = HttpService:JSONDecode(res)
            if data and data.id and data.id ~= last_id and data.is_active then
                last_id = data.id
                -- Play Ting Sound
                local sound = Instance.new("Sound")
                sound.SoundId = "rbxassetid://2865227271"
                sound.Volume = 1
                sound.Parent = SoundService
                sound:Play()
                game.Debris:AddItem(sound, 3)
                -- Create UI
                local sg = Instance.new("ScreenGui")
                sg.Name = "VicBroadcast"
                sg.Parent = CoreGui
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(0, 320, 0, 110)
                frame.Position = UDim2.new(0.5, -160, 0, -130)
                frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
                frame.BorderSizePixel = 0
                frame.Parent = sg
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0, 8)
                corner.Parent = frame
                local stroke = Instance.new("UIStroke")
                stroke.Color = data.type == "warning" and Color3.fromRGB(255, 60, 60) or Color3.fromRGB(255, 185, 55)
                stroke.Thickness = 2
                stroke.Parent = frame
                local title = Instance.new("TextLabel")
                title.Size = UDim2.new(1, 0, 0, 25)
                title.Position = UDim2.new(0, 0, 0, 8)
                title.BackgroundTransparency = 1
                title.Text = data.type == "warning" and "⚠️ WARNING" or "📢 ANNOUNCEMENT"
                title.TextColor3 = data.type == "warning" and Color3.fromRGB(255, 60, 60) or Color3.fromRGB(255, 185, 55)
                title.Font = Enum.Font.GothamBold
                title.TextSize = 14
                title.Parent = frame
                local msg = Instance.new("TextLabel")
                msg.Size = UDim2.new(1, -30, 1, -45)
                msg.Position = UDim2.new(0, 15, 0, 35)
                msg.BackgroundTransparency = 1
                msg.Text = data.message
                msg.TextColor3 = Color3.fromRGB(220, 220, 220)
                msg.Font = Enum.Font.Gotham
                msg.TextSize = 12
                msg.TextWrapped = true
                msg.TextYAlignment = Enum.TextYAlignment.Top
                msg.Parent = frame
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(0, 25, 0, 25)
                btn.Position = UDim2.new(1, -30, 0, 5)
                btn.BackgroundTransparency = 1
                btn.Text = "X"
                btn.TextColor3 = Color3.fromRGB(255, 100, 100)
                btn.Font = Enum.Font.GothamBold
                btn.TextSize = 14
                btn.Parent = frame
                btn.MouseButton1Click:Connect(function()
                    TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -160, 0, -130)}):Play()
                    task.wait(0.5)
                    sg:Destroy()
                end)
                TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -160, 0, 20)}):Play()
                task.delay(15, function()
                    if sg and sg.Parent then
                        TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -160, 0, -130)}):Play()
                        task.wait(0.5)
                        if sg and sg.Parent then sg:Destroy() end
                    end
                end)
            end
        end)
        task.wait(30)
    end
end)

-- Victoria Analytics Tracker
pcall(function()
    local req = (syn and syn.request) or request or http_request or (http and http.request)
    if req then
        req({
            Url = "https://victoriascript.vercel.app/api/track",
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode({
                gameId = currentID,
                player = game:GetService("Players").LocalPlayer.Name,
                executor = identifyexecutor and identifyexecutor() or "Unknown"
            })
        })
    end
end)

if g then
    if g.status == "maintenance" then
        loadstring(game:HttpGet("https://victoriascript.vercel.app/intromaintenance.lua"))()
    elseif g.status == "disabled" then
        loadstring(game:HttpGet("https://victoriascript.vercel.app/introdisable.lua"))()
    else
        loadstring(game:HttpGet(g.url))()
    end
else
    game.Players.LocalPlayer:Kick("Yo! This game ain't on the list.\nCheck the Discord for whitelisted games, homie.")
end