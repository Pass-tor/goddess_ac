GAC.Entities = {}
local AuthorizedVehicles = {}

function GAC.Entities.AuthorizeVehicleSpawn(source, model)
    if not AuthorizedVehicles[source] then AuthorizedVehicles[source] = {} end
    AuthorizedVehicles[source][model] = GetGameTimer() + 10000
end

AddEventHandler('entityCreating', function(entity)
    if not DoesEntityExist(entity) then return end
    local entityType = GetEntityType(entity)
    local owner = NetworkGetEntityOwner(entity)

    if entityType == 2 then -- Vehicle
        local model = GetEntityModel(entity)
        if GAC.Utils.TableContains(Config.VehicleProtection.BlacklistedVehicles, model) then
            CancelEvent()
            if owner and owner > 0 then
                GAC.Detection.AddScore(owner, 'Blacklisted Vehicle Spawn', GAC.Constants.Severities.CRITICAL, 1.0, { model = model })
            end
            return
        end

        if owner and owner > 0 then
            if not GAC.RateLimit.Check(owner, 'spawn_veh', Config.EntityLimits.vehicles.max, Config.EntityLimits.vehicles.window * 1000) then
                CancelEvent()
                GAC.Detection.AddScore(owner, 'Vehicle Spawn Spam', GAC.Constants.Severities.HIGH, 0.85, {})
            end
        end
    end
end)

exports('AuthorizeVehicleSpawn', GAC.Entities.AuthorizeVehicleSpawn)
