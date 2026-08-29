GAC.Server = GAC.Server or {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    print('^2[GODDESS ANTI-CHEAT]^7 Initializing Core System v' .. GAC.Constants.Version)
    
    GAC.Database.Initialize()
    GAC.License.Verify()
    GAC.Resources.ScanAll()
end)

RegisterCommand('gac', function(source, args, rawCommand)
    if source ~= 0 and not GAC.Permissions.HasPermission(source, GAC.Constants.Permissions.Admin) then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Unauthorized.' })
        return
    end

    local action = args[1]
    if action == 'install' then
        local target = args[2]
        local isDryRun = GAC.Utils.TableContains(args, '--dry-run')
        if not target then
            print('^1[GAC]^7 Usage: /gac install [resource_name|all] [--dry-run]')
            return
        end
        GAC.Installer.Run(source, target, isDryRun)
    elseif action == 'uninstall' then
        local target = args[2]
        if not target then
            print('^1[GAC]^7 Usage: /gac uninstall [resource_name|all]')
            return
        end
        GAC.Uninstaller.Run(source, target)
    elseif action == 'maintenance' then
        local state = args[2] == 'on'
        Config.MaintenanceMode = state
        local msg = '^3[GAC]^7 Maintenance Mode is now ' .. (state and '^2ENABLED' or '^1DISABLED')
        if source == 0 then print(msg) else TriggerClientEvent('ox_lib:notify', source, { type = 'inform', description = msg }) end
    elseif action == 'scan' then
        GAC.Resources.ScanAll()
    else
        print('^3[GAC]^7 Commands: install, uninstall, scan, maintenance')
    end
end, false)
