GAC.Events = {}
local ProtectedEvents = {}

function GAC.Events.RegisterProtectedEvent(eventName, options)
    ProtectedEvents[eventName] = options
    RegisterNetEvent(eventName, function(...)
        local src = source
        local opts = ProtectedEvents[eventName]
        if not opts then return end

        if opts.rateLimit then
            if not GAC.RateLimit.Check(src, 'event_' .. eventName, opts.rateLimit.maxCalls, opts.rateLimit.window) then
                GAC.Detection.AddScore(src, 'Event Rate Limit Exceeded', GAC.Constants.Severities.HIGH, 0.95, { event = eventName })
                CancelEvent()
                return
            end
        end

        if opts.validate then
            local valid = opts.validate(src, { ... })
            if not valid then
                GAC.Detection.AddScore(src, 'Invalid Event Payload', GAC.Constants.Severities.CRITICAL, 1.0, { event = eventName })
                CancelEvent()
                return
            end
        end
    end)
end

exports('RegisterProtectedEvent', GAC.Events.RegisterProtectedEvent)
