GAC.Bans = {}

function GAC.Bans.Execute(source, reason, detection, evidence, permanent, duration)
    local name = GetPlayerName(source) or 'Unknown'
    local license = GetPlayerIdentifierByType(source, 'license')
    local license2 = GetPlayerIdentifierByType(source, 'license2')
    local discord = GetPlayerIdentifierByType(source, 'discord')
    local fivem = GetPlayerIdentifierByType(source, 'fivem')
    local ip = GetPlayerEndpoint(source) or '0.0.0.0'

    local expiresAt = nil
    if not permanent and duration then
        expiresAt = os.date('%Y-%m-%d %H:%M:%S', os.time() + duration)
    end

    GAC.Database.AddBan(name, license, license2, discord, fivem, ip, reason, detection, evidence, 'GAC System', expiresAt, permanent)
    GAC.Logging.SendDiscord('Ban', 'Player Banned', string.format("**Player:** %s\n**Reason:** %s\n**Permanent:** %s", name, reason, tostring(permanent)), 10038562)
    
    DropPlayer(source, "[GAC BAN] " .. reason)
end

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    deferrals.defer()
    Wait(50)
    deferrals.update("Checking security credentials...")
    
    local license = GetPlayerIdentifierByType(src, 'license')
    if not license then
        deferrals.done("[GAC] Valid rockstar license required.")
        return
    end

    local ban = GAC.Database.IsBanned(license)
    if ban then
        deferrals.done(string.format("[GAC] You are banned from this server.\nReason: %s\nBan ID: %d", ban.reason, ban.id))
        return
    end

    deferrals.done()
end)
