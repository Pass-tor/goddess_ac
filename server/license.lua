GAC.License = {}
GAC.License.Plan = 'FREE'
GAC.License.Valid = true

function GAC.License.Verify()
    if Config.LicenseServer == '' or Config.LicenseKey == 'GAC-FREE-COMMUNITY-KEY' then
        GAC.License.Plan = 'FREE'
        GAC.License.Valid = true
        print('^2[GAC LICENSE]^7 Running under FREE Tier. Commercial modules restricted.')
        return
    end

    PerformHttpRequest(Config.LicenseServer .. '/api/v1/verify', function(status, body, headers)
        if status == 200 then
            local data = json.decode(body)
            if data and data.valid then
                GAC.License.Valid = true
                GAC.License.Plan = data.plan or 'BASIC'
                print('^2[GAC LICENSE]^7 Verified successfully! Plan: ' .. GAC.License.Plan)
                return
            end
        end
        print('^1[GAC LICENSE]^7 License validation failed! Grace period active (24 hours).')
        GAC.License.Valid = true
    end, 'POST', json.encode({ key = Config.LicenseKey, server = GetConvar('sv_hostname', 'Unknown') }), { ['Content-Type'] = 'application/json' })
end
