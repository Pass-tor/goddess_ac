GAC.Detection = {}
local PlayerScores = {}
local AuthorizedInvulnerability = {}
local AuthorizedTeleports = {}
local AuthorizedInvisibility = {}
local StaffModes = {}

function GAC.Detection.AddScore(source, detectionName, severity, confidence, evidence)
    if StaffModes[source] or Config.MaintenanceMode then return end
    
    local score = Config.DetectionScores[severity] or 10
    local identifier = GetPlayerIdentifierByType(source, 'license') or 'unknown'
    local name = GetPlayerName(source) or 'Unknown'

    PlayerScores[source] = (PlayerScores[source] or 0) + score
    local totalScore = PlayerScores[source]

    GAC.Database.LogDetection(source, identifier, detectionName, severity, score, confidence, evidence)
    GAC.Logging.SendDiscord('Detection', 'Cheat Detection: ' .. detectionName, string.format("**Player:** %s (%s)\n**Severity:** %s\n**Score Added:** %d\n**Total Score:** %d\n**Confidence:** %.2f", name, source, severity, score, totalScore, confidence), 15158332, {
        { name = "Evidence", value = "```json\n" .. json.encode(evidence) .. "\n```" }
    })

    if totalScore >= Config.Thresholds.PermanentBan then
        GAC.Bans.Execute(source, "Automated Ban: " .. detectionName, detectionName, evidence, true)
    elseif totalScore >= Config.Thresholds.TemporaryBan then
        GAC.Bans.Execute(source, "Automated Temp Ban: " .. detectionName, detectionName, evidence, false, 86400)
    elseif totalScore >= Config.Thresholds.Kick then
        DropPlayer(source, "[GAC] Kicked for suspicious activity: " .. detectionName)
    elseif totalScore >= Config.Thresholds.Warn then
        TriggerClientEvent('ox_lib:notify', source, { type = 'warning', description = 'Security Warning: Suspicious activity detected.' })
    end
end

CreateThread(function()
    while true do
        Wait(Config.ScoreDecay.Interval)
        for src, score in pairs(PlayerScores) do
            if score > 0 then
                PlayerScores[src] = math.max(0, score - Config.ScoreDecay.Amount)
            end
        end
    end
end)

function GAC.Detection.AuthorizeInvulnerability(source, duration)
    AuthorizedInvulnerability[source] = GetGameTimer() + duration
end

function GAC.Detection.IsInvulnerableAuthorized(source)
    return (AuthorizedInvulnerability[source] or 0) > GetGameTimer()
end

function GAC.Detection.AuthorizeTeleport(source, duration)
    AuthorizedTeleports[source] = GetGameTimer() + duration
end

function GAC.Detection.IsTeleportAuthorized(source)
    return (AuthorizedTeleports[source] or 0) > GetGameTimer()
end

function GAC.Detection.AuthorizeInvisible(source, duration)
    AuthorizedInvisibility[source] = GetGameTimer() + duration
end

function GAC.Detection.IsInvisibleAuthorized(source)
    return (AuthorizedInvisibility[source] or 0) > GetGameTimer()
end

function GAC.Detection.SetStaffMode(source, state)
    if GAC.Permissions.IsStaff(source) then
        StaffModes[source] = state
        return true
    end
    return false
end

RegisterNetEvent('goddess_ac:server:reportDetection', function(detectionName, severity, confidence, evidence)
    local src = source
    GAC.Detection.AddScore(src, detectionName, severity, confidence, evidence)
end)
