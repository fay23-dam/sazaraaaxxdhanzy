local games = {
    [130342654546662] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/sambung-kata.lua",
    [83369512629707]  = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/sawah-indo.lua",
    [72774564502867]  = "https://raw.githubusercontent.com/dhannxsazaraxhub/testajamok/refs/heads/main/lengkapi-kata.lua",
    [103159798148004] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/empang-indo.lua",
    [125810438250765] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/deadly-delivers.lua",
    [93044798454681]  = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/deadly-delivers.lua",
    [114640202062357] = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/swingforabrainrot.lua",
    [18680867089]     = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/ultimate-mining-tycoon.lua",
}

local player = game:GetService("Players").LocalPlayer
local currentID = game.PlaceId
local scriptURL = games[currentID]

if scriptURL then
    -- Gunakan pcall agar jika link mati, script tidak langsung crash
    local success, content = pcall(function()
        return game:HttpGet(scriptURL)
    end)

    if success and content then
        local func, err = loadstring(content)
        if func then
            func() -- Jalankan script
        else
            warn("Gagal compile script: " .. tostring(err))
        end
    else
        warn("Gagal mengambil data dari URL!")
    end
else
    -- Pastikan player sudah ada sebelum kick
    if player then
        player:Kick("\n[Sazara Hub]\nGame ini tidak ada dalam daftar whitelist.\nCek Discord untuk info lebih lanjut.")
    end
end
