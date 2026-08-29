GAC.Backup = {}

function GAC.Backup.Create(resourceName, fileName, content)
    local backupPath = GetResourcePath('goddess_ac') .. '/backups/' .. resourceName
    os.execute('mkdir -p "' .. backupPath .. '"')
    
    local file = io.open(backupPath .. '/' .. fileName, 'w')
    if file then
        file:write(content)
        file:close()
    end
end
