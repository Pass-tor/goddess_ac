GAC.Utils = {}

function GAC.Utils.SanitizePath(path)
    if not path then return nil end
    local clean = path:gsub("\\", "/"):gsub("%.%.", "")
    return clean:gsub("^/*", "")
end

function GAC.Utils.StringSplit(str, sep)
    if sep == nil then sep = "%s" end
    local t = {}
    for substring in string.gmatch(str, "([^" .. sep .. "]+)") do
        table.insert(t, substring)
    end
    return t
end

function GAC.Utils.TableContains(tbl, val)
    if not tbl then return false end
    for _, v in pairs(tbl) do
        if v == val then return true end
    end
    return false
end

function GAC.Utils.DeepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[GAC.Utils.DeepCopy(orig_key)] = GAC.Utils.DeepCopy(orig_value)
        end
        setmetatable(copy, GAC.Utils.DeepCopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end
