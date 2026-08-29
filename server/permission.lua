GAC.Permissions = {}

function GAC.Permissions.HasPermission(source, permission)
    if source == 0 then return true end
    return IsPlayerAceAllowed(tostring(source), permission)
end

function GAC.Permissions.IsStaff(source)
    return GAC.Permissions.HasPermission(source, GAC.Constants.Permissions.Admin) or GAC.Permissions.HasPermission(source, GAC.Constants.Permissions.Security)
end
