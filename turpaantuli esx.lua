-- Done by Vilho
-- Client scripti
local ESX = nil
local playerClothes = {}

-- Komento joka resetoi hatun ja lasit
RegisterCommand('turpaantuli', function()
    local playerPed = PlayerPedId()

    -- Reset hat
    if playerClothes.hat then
        SetPedPropIndex(playerPed, 0, playerClothes.hat.drawable, playerClothes.hat.texture, true)
    end

    -- Reset glasses
    if playerClothes.glasses then
        SetPedPropIndex(playerPed, 1, playerClothes.glasses.drawable, playerClothes.glasses.texture, true)
    end

    ESX:showNotification("Päähine ja lasit on palautettu.", "success")
end, false)

-- Tallenna nykyinen hattu ja lasit, kun komentoa käytetään
CreateThread(function()
    while true do
        Wait(1000)
        local playerPed = PlayerPedId()
        
        -- Tarkista ja tallenna hattu
        local hatDrawable = GetPedPropIndex(playerPed, 0)
        local hatTexture = GetPedPropTextureIndex(playerPed, 0)
        if hatDrawable ~= -1 then
            playerClothes.hat = {drawable = hatDrawable, texture = hatTexture}
        end
        
        -- Tarkista ja tallenna lasit
        local glassesDrawable = GetPedPropIndex(playerPed, 1)
        local glassesTexture = GetPedPropTextureIndex(playerPed, 1)
        if glassesDrawable ~= -1 then
            playerClothes.glasses = {drawable = glassesDrawable, texture = glassesTexture}
        end
    end
end)
