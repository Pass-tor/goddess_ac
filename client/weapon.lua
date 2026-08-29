CreateThread(function()
    while true do
        Wait(2000)
        local ped = PlayerPedId()
        if DoesEntityExist(ped) then
            local _, weaponHash = GetCurrentPedWeapon(ped, true)
            if GAC.Utils.TableContains(Config.WeaponProtection.BlacklistedWeapons, weaponHash) then
                RemoveWeaponFromPed(ped, weaponHash)
                GAC.ClientDetection.Report('Blacklisted Weapon', GAC.Constants.Severities.CRITICAL, 1.0, { weapon = weaponHash })
            end
        end
    end
end)
