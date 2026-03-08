Added 2 diffrent snus to the list that can be used in X-inventory

Install:
Drag the file into resources and make sure to ensure Cape-Snus


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
    },

    snus_general = {
    Label = "General lös",
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

    Model = GetHashKey("prop_generallos_01")
    }
