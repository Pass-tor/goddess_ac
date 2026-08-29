GAC.Database = {}

function GAC.Database.Initialize()
    MySQL.ready(function()
        print('^2[GAC]^7 SQL Database Connected via oxmysql.')
    end)
end

function GAC.Database.LogDetection(source, identifier, detection, severity, score, confidence, evidence)
    MySQL.insert('INSERT INTO goddess_ac_detections (source, identifier, detection, severity, score, confidence, evidence) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        source, identifier, detection, severity, score, confidence, json.encode(evidence or {})
    })
end

function GAC.Database.AddBan(playerName, license, license2, discord, fivem, ipHash, reason, detection, evidence, admin, expiresAt, permanent)
    return MySQL.insert.await('INSERT INTO goddess_ac_bans (player_name, license, license2, discord, fivem, ip_hash, reason, detection, evidence, admin, expires_at, permanent, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)', {
        playerName, license, license2, discord, fivem, ipHash, reason, detection, json.encode(evidence or {}), admin, expiresAt, permanent and 1 or 0
    })
end

function GAC.Database.IsBanned(license)
    local result = MySQL.single.await('SELECT * FROM goddess_ac_bans WHERE license = ? AND active = 1 AND (expires_at > NOW() OR permanent = 1)', { license })
    return result
end

function GAC.Database.LogAudit(adminIdentifier, action, target, details)
    MySQL.insert('INSERT INTO goddess_ac_audit (admin_identifier, action, target, details) VALUES (?, ?, ?, ?)', {
        adminIdentifier, action, target, json.encode(details or {})
    })
end
