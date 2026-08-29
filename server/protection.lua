GAC.Protection = {}

AddEventHandler('weaponDamageEvent', function(sender, data)
    local weaponType = data.weaponType
    if GAC.Utils.TableContains(Config.WeaponProtection.BlacklistedWeapons, weaponType) then
        CancelEvent()
        GAC.Detection.AddScore(sender, 'Blacklisted Weapon Usage', GAC.Constants.Severities.CRITICAL, 1.0, { weapon = weaponType })
    end
end)

AddEventHandler('explosionEvent', function(sender, ev)
    if not Config.Explosions.Enabled then return end
    if GAC.Utils.TableContains(Config.Explosions.BlacklistedTypes, ev.explosionType) then
        CancelEvent()
        GAC.Detection.AddScore(sender, 'Forbidden Explosion Type', GAC.Constants.Severities.CRITICAL, 1.0, { type = ev.explosionType })
        return
    end

    if not GAC.RateLimit.Check(sender, 'explosions', Config.Explosions.MaxPerWindow, Config.Explosions.Window) then
        CancelEvent()
        GAC.Detection.AddScore(sender, 'Explosion Spam', GAC.Constants.Severities.HIGH, 0.9, { type = ev.explosionType })
    end
end)
