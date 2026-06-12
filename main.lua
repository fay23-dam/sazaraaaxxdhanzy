local games = {
    [140209132616484] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/main/water-empire.lua", status = "disabled" }, -- Water Empire
    [114115486822297] = { url = "https://pastefy.app/Ksz9zj49/raw", status = "active" }, -- Spin A Lucky Block For Soccer Cards
    [72774564502867] = { url = "https://raw.githubusercontent.com/dhannxsazaraxhub/testajamok/refs/heads/main/lengkapi-kata.lua", status = "stable" }, -- Lengkapi Kata
    [114640202062357] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/swingforabrainrot.lua", status = "active" }, -- Swing Obby for a Brainrot
    [103159798148004] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/empang-indo.lua", status = "stable" }, -- Empang Indo
    [130342654546662] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/sambung-kata.lua", status = "disabled" }, -- Sambung Kata
    [125810438250765] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/deadly-delivers.lua", status = "active" }, -- Deadly Delivery
    [18680867089] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/ultimate-mining-tycoon.lua", status = "active" }, -- Ultimate Mining Tycoon
    [83369512629707] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/sawah-indo.lua", status = "stable" }, -- Sawah Indo
}

local currentID = game.PlaceId
local g = games[currentID]

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