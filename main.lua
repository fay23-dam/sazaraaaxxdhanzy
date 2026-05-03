local games = {
    [130342654546662] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/sambung-kata.lua", -- sambungkata
    [83369512629707] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/sawah-indo.lua", -- sawahindo
    [72774564502867] = "https://raw.githubusercontent.com/dhannxsazaraxhub/testajamok/refs/heads/main/lengkapi-kata.lua", -- lengkapikata
    [103159798148004] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/empang-indo.lua", --empangindo
    [125810438250765] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/deadly-delivers.lua",
    [93044798454681]  = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/deadly-delivers.lua",
    [114640202062357]  = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/swingforabrainrot.lua",
    [18680867089] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/ultimate-mining-tycoon.lua", -- ultimate mining tycoon
}

local currentID = game.PlaceId
local scriptURL = games[currentID]

if scriptURL then
    loadstring(game:HttpGet(scriptURL))()
else
    game.Players.LocalPlayer:Kick("Yo! This game ain't on the list.\nCheck the Discord for whitelisted games, homie.")
end
