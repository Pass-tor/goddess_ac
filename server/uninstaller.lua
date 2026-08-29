GAC.Uninstaller = {}

function GAC.Uninstaller.Run(source, targetResource)
    if targetResource == 'all' then
        local cache = GAC.Resources.GetCache()
        for name, _ in pairs(cache) do
            GAC.Uninstaller.UnprotectResource(name)
        end
    else
        GAC.Uninstaller.UnprotectResource(targetResource)
    end
end

function GAC.Uninstaller.UnprotectResource(name)
    local backupContent = GAC.Restore.GetBackup(name, 'fxmanifest.lua')
    if not backupContent then
        print('^1GAC UNINSTALL ABORTED:^7 Original backup unavailable for ' .. name .. '. Manual verification required.')
        return
    end

    local path = GetResourcePath(name)
    if not path then return end
    local fxPath = GAC.Utils.SanitizePath(path) .. '/fxmanifest.lua'

    local file = io.open(fxPath, 'w')
    if file then
        file:write(backupContent)
        file:close()
        print('^2[GAC UNINSTALL]^7 Restored original fxmanifest for: ' .. name)
        MySQL.update('UPDATE goddess_ac_resources SET protected = 0 WHERE resource_name = ?', { name })
    end
end
