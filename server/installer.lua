GAC.Installer = {}

function GAC.Installer.Run(source, targetResource, isDryRun)
    if isDryRun then
        print('^3[GAC INSTALL DRY-RUN]^7 Simulating installation for: ' .. targetResource)
        return
    end

    if targetResource == 'all' then
        local cache = GAC.Resources.GetCache()
        for name, _ in pairs(cache) do
            GAC.Installer.ProtectResource(name)
        end
    else
        GAC.Installer.ProtectResource(targetResource)
    end
end

function GAC.Installer.ProtectResource(name)
    if Config.Exclusions.Resources[name] then return end
    local path = GetResourcePath(name)
    if not path then return end

    -- Path Traversal Guard
    local safePath = GAC.Utils.SanitizePath(path)
    local fxPath = safePath .. '/fxmanifest.lua'

    local file = io.open(fxPath, 'r')
    if not file then return end
    local content = file:read('*a')
    file:close()

    if content:find("dependency 'goddess_ac'") then
        print('^3[GAC INSTALL]^7 Resource ' .. name .. ' already protected.')
        return
    end

    -- Create Backup
    GAC.Backup.Create(name, 'fxmanifest.lua', content)

    -- Inject Manifest Protection
    local newContent = content .. "\n\n-- GODDESS ANTI-CHEAT PROTECTED --\ndependency 'goddess_ac'\n"
    local wfile = io.open(fxPath, 'w')
    if wfile then
        wfile:write(newContent)
        wfile:close()
        print('^2[GAC INSTALL]^7 Successfully protected: ' .. name)
        MySQL.insert('INSERT INTO goddess_ac_resources (resource_name, protected) VALUES (?, 1) ON DUPLICATE KEY UPDATE protected = 1', { name })
    end
end
