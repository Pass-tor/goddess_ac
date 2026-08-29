RegisterCommand('gacadmin', function()
    TriggerServerEvent('goddess_ac:server:requestAdminNUI')
end, false)

RegisterNetEvent('goddess_ac:client:openAdminNUI', function(data)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        data = data
    })
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)
