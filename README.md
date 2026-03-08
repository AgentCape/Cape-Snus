Added 2 diffrent snus to the list that can be used in X-inventory

local usingSnus = false

RegisterNetEvent("snus:client:use", function()

    if usingSnus then
        return
    end

    usingSnus = true

    local ped = PlayerPedId()

    RequestAnimDict("mp_player_inteat@burger")
    while not HasAnimDictLoaded("mp_player_inteat@burger") do
        Wait(10)
    end

    TaskPlayAnim(
        ped,
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        8.0,
        -8.0,
        3000,
        49,
        0,
        false,
        false,
        false
    )

    local duration = 3000
    local start = GetGameTimer()

    while (GetGameTimer() - start) < duration do
        Wait(0)

        local progress = (GetGameTimer() - start) / duration

        DrawRect(0.5, 0.92, 0.2, 0.035, 0, 0, 0, 180)
        DrawRect(0.4 + (progress * 0.1), 0.92, progress * 0.2, 0.03, 0, 180, 0, 220)
    end

    ClearPedTasks(ped)

    -- Nikotin effekt
    StartScreenEffect("DrugsMichaelAliensFight", 5.0, false)

    SetRunSprintMultiplierForPlayer(PlayerId(), 1.15)

    TriggerEvent("chat:addMessage", {
        color = {0,255,100},
        args = {"Snus", "Nikotin kick!"}
    })

    Wait(20000)

    StopScreenEffect("DrugsMichaelAliensFight")
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)

    usingSnus = false

end)


snus_ettan = {
    Label = "Ettan lös",
    Weight = 0.01 * 20,

    Description = {
        {
            Title = "",
            Text = "Denna tobaksvara kan skada din hälsa och är beroendeframkallande."
        },
        {
            Title = "Snus:",
            Text = "20st"
        }
    },

    UseButton = "SNUSA",

    UseCallback = function(character, itemData)

        local snusLeft = itemData.MetaData.Snus or 0

        if snusLeft <= 0 then
            character.Notify("Dosen är tom.")
            return
        end

        itemData.MetaData.Snus = snusLeft - 1

        TriggerClientEvent("snus:client:use", character.Source)

    end,

    DefaultMetaData = {
        Snus = 20
    },

    Model = GetHashKey("prop_ettanlos_01")
}
