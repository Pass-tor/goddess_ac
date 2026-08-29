exports('AuthorizeInvulnerability', function(source, duration)
    GAC.Detection.AuthorizeInvulnerability(source, duration)
end)

exports('AuthorizeTeleport', function(source, duration)
    GAC.Detection.AuthorizeTeleport(source, duration)
end)

exports('AuthorizeInvisible', function(source, duration)
    GAC.Detection.AuthorizeInvisible(source, duration)
end)

exports('AuthorizeVehicleSpawn', function(source, model)
    GAC.Entities.AuthorizeVehicleSpawn(source, model)
end)

exports('SetStaffMode', function(source, state)
    return GAC.Detection.SetStaffMode(source, state)
end)

exports('GetPlayerScore', function(source)
    return PlayerScores[source] or 0
end)
