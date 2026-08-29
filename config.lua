Config = {}

Config.Debug = false
Config.MaintenanceMode = false
Config.ResourceDirectory = 'resources' -- Relative to FXServer root

Config.LicenseServer = '' -- Blank for FREE plan or local validation
Config.LicenseKey = 'GAC-FREE-COMMUNITY-KEY'

Config.DetectionScores = {
    LOW = 10,
    MEDIUM = 25,
    HIGH = 50,
    CRITICAL = 100
}

Config.Thresholds = {
    Warn = 40,
    Kick = 80,
    TemporaryBan = 140,
    PermanentBan = 200
}

Config.ScoreDecay = {
    Enabled = true,
    Interval = 60000, -- Decay every 60s
    Amount = 5
}

Config.Exclusions = {
    Resources = {
        ['goddess_ac'] = true,
        ['oxmysql'] = true,
        ['ox_lib'] = true,
        ['es_extended'] = true,
        ['screenshot-basic'] = true
    }
}

Config.AntiGodmode = {
    Enabled = true,
    MaxHealth = 200,
    CheckInterval = 2500
}

Config.AntiMovement = {
    Enabled = true,
    MaxSpeedWalking = 12.0,
    MaxSpeedVehicle = 140.0, -- In m/s
    MaxJumpHeight = 15.0,
    TeleportDistanceThreshold = 100.0,
    CheckInterval = 1000
}

Config.WeaponProtection = {
    Enabled = true,
    BlacklistedWeapons = {
        `WEAPON_RPG`,
        `WEAPON_GRENADELAUNCHER`,
        `WEAPON_MINIGUN`,
        `WEAPON_RAILGUN`,
        `WEAPON_HOMINGLAUNCHER`,
        `WEAPON_COMPACTLAUNCHER`
    }
}

Config.VehicleProtection = {
    Enabled = true,
    BlacklistedVehicles = {
        `rhino`,
        `lazer`,
        `hydra`,
        `oppressor`,
        `oppressor2`,
        `khanjali`
    }
}

Config.EntityLimits = {
    vehicles = { enabled = true, max = 5, window = 10 },
    peds = { enabled = true, max = 8, window = 10 },
    objects = { enabled = true, max = 15, window = 10 }
}

Config.Explosions = {
    Enabled = true,
    MaxPerWindow = 3,
    Window = 5000,
    BlacklistedTypes = { 1, 2, 4, 5, 29, 32, 33 }
}

Config.Webhooks = {
    Detection = '',
    Ban = '',
    Resource = '',
    Admin = '',
    Security = ''
}
