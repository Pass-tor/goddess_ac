GAC.Client = GAC.Client or {}

CreateThread(function()
    while true do
        Wait(5000)
        local ped = PlayerPedId()
        if DoesEntityExist(ped) then
            -- Periodic client heartbeat check
        end
    end
end)
