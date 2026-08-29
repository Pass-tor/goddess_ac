GAC.RateLimit = {}
local Limits = {}

function GAC.RateLimit.Check(source, key, maxEvents, windowMs)
    local now = GetGameTimer()
    if not Limits[source] then Limits[source] = {} end
    if not Limits[source][key] then
        Limits[source][key] = { count = 1, reset = now + windowMs }
        return true
    end

    local tracker = Limits[source][key]
    if now > tracker.reset then
        tracker.count = 1
        tracker.reset = now + windowMs
        return true
    end

    tracker.count = tracker.count + 1
    if tracker.count > maxEvents then
        return false
    end
    return true
end

AddEventHandler('playerDropped', function()
    local src = source
    Limits[src] = nil
end)
