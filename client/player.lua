CreateThread(function()
    while true do
        Wait(Config.AntiGodmode.CheckInterval)
        local ped = PlayerPedId()
        if DoesEntityExist(ped) then
            local maxHealth = GetEntityMaxHealth(ped)
            if maxHealth > Config.AntiGodmode.MaxHealth then
                SetEntityMaxHealth(ped, Config.AntiGodmode.MaxHealth)
                SetEntityHealth(ped, Config.AntiGodmode.MaxHealth)
                GAC.ClientDetection.Report('Impossible Max Health', GAC.Constants.Severities.HIGH, 0.90, { maxHealth = maxHealth })
            end

            if GetPlayerInvincible(PlayerId()) then
                GAC.ClientDetection.Report('Invincibility Flag Activated', GAC.Constants.Severities.CRITICAL, 0.95, {})
            end
        end
    end
end)
