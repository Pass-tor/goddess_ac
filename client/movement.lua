CreateThread(function()
    while true do
        Wait(Config.AntiMovement.CheckInterval)
        local ped = PlayerPedId()
        
        if DoesEntityExist(ped) and not IsPedInAnyVehicle(ped, false) and not IsPlayerDead(PlayerId()) then
            local speed = GetEntitySpeed(ped)
            if speed > Config.AntiMovement.MaxSpeedWalking and not IsPedFalling(ped) and not IsPedInParachuteFreeFall(ped) then
                GAC.ClientDetection.Report('Super Speed', GAC.Constants.Severities.HIGH, 0.85, { speed = speed })
            end

            local heightAboveGround = GetEntityHeightAboveGround(ped)
            if heightAboveGround > Config.AntiMovement.MaxJumpHeight and not IsPedInParachuteFreeFall(ped) and not IsPedFalling(ped) then
                GAC.ClientDetection.Report('Noclip / Fly', GAC.Constants.Severities.HIGH, 0.80, { height = heightAboveGround })
            end
        end
    end
end)
