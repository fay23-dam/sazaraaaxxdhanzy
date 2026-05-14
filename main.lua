local games = {
    [1111111111111] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/sambung-kata.lua", -- aku
    [83369512629707] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/sawah-indo.lua", -- Sawah Indo
    [72774564502867] = "https://raw.githubusercontent.com/dhannxsazaraxhub/testajamok/refs/heads/main/lengkapi-kata.lua", -- Lengkapi Kata
    [125810438250765] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/deadly-delivers.lua", -- Deadly Delivery
    [103159798148004] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/empang-indo.lua", -- Empang Indo
    [18680867089] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/ultimate-mining-tycoon.lua", -- Ultimate Mining Tycoon
    [114640202062357] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/swingforabrainrot.lua", -- Swing Obby for a Brainrot
}

local currentID = game.PlaceId
local scriptURL = games[currentID]

if scriptURL then
    loadstring(game:HttpGet(scriptURL))()
else
    game.Players.LocalPlayer:Kick("Yo! This game ain't on the list.\nCheck the Discord for whitelisted games, homie.")
end