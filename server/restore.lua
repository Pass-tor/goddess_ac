GAC.Restore = {}

function GAC.Restore.GetBackup(resourceName, fileName)
    local backupPath = GetResourcePath('goddess_ac') .. '/backups/' .. resourceName .. '/' .. fileName
    local file = io.open(backupPath, 'r')
    if not file then return nil end
    local content = file:read('*a')
    file:close()
    return content
end
