RegisterNetEvent("snus:use")
AddEventHandler("snus:use", function()

    local ped = PlayerPedId()

    -- animation
    RequestAnimDict("mp_player_inteat@burger")
    while not HasAnimDictLoaded("mp_player_inteat@burger") do
        Wait(10)
    end

    TaskPlayAnim(ped, "mp_player_inteat@burger", "mp_player_int_eat_burger", 8.0, -8.0, 3000, 49, 0, false, false, false)

    -- progressbar
    local duration = 3000
    local start = GetGameTimer()

    while (GetGameTimer() - start) < duration do
        Wait(0)

        local progress = (GetGameTimer() - start) / duration
        DrawRect(0.5, 0.9, 0.2, 0.03, 0, 0, 0, 150)
        DrawRect(0.4 + (progress * 0.1), 0.9, progress * 0.2, 0.03, 0, 200, 0, 200)
    end

    -- nikotin effekt
    StartScreenEffect("DrugsMichaelAliensFight", 5.0, false)

    SetRunSprintMultiplierForPlayer(PlayerId(), 1.15)

    Wait(20000)

    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    StopScreenEffect("DrugsMichaelAliensFight")

    TriggerEvent("chat:addMessage", {
        color = {0,255,100},
        args = {"Snus", "Nikotin kick!"}
    })

end)