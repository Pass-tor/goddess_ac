GAC.Resources = {}
local ResourceCache = {}

function GAC.Resources.ScanAll()
    local count = GetNumResources()
    print('^2[GAC GUARD]^7 Scanning ' .. count .. ' loaded resources...')
    
    for i = 0, count - 1 do
        local name = GetResourceByFindIndex(i)
        if name and not Config.Exclusions.Resources[name] then
            local state = GetResourceState(name)
            local path = GetResourcePath(name)
            
            ResourceCache[name] = {
                name = name,
                path = path,
                state = state,
                protected = GAC.Resources.IsProtected(name),
                integrity = 'UNCHANGED'
            }
        end
    end
    print('^2[GAC GUARD]^7 Resource Scan Completed.')
end

function GAC.Resources.IsProtected(name)
    local path = GetResourcePath(name)
    if not path then return false end
    local fxPath = path .. '/fxmanifest.lua'
    local file = io.open(fxPath, 'r')
    if not file then return false end
    local content = file:read('*a')
    file:close()
    return content:find("dependency 'goddess_ac'") ~= nil or content:find("goddess_ac") ~= nil
end

function GAC.Resources.GetCache()
    return ResourceCache
end
