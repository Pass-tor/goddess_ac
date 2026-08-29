GAC.Logging = {}

function GAC.Logging.SendDiscord(webhookType, title, description, color, fields)
    local url = Config.Webhooks[webhookType]
    if not url or url == '' then return end

    local embed = {
        {
            ["title"] = title,
            ["description"] = description,
            ["color"] = color or 16711680,
            ["fields"] = fields or {},
            ["footer"] = { ["text"] = "GODDESS ANTI-CHEAT • " .. os.date("%Y-%m-%d %H:%M:%S") }
        }
    }

    PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode({ username = "Goddess Sentinel", embeds = embed }), { ['Content-Type'] = 'application/json' })
end
