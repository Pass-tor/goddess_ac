-- GODDESS ANTI-CHEAT - Shared Constants
-- Global constants used across client and server

Constants = {}

-- ============================================================================
-- DETECTION TYPES
-- ============================================================================

Constants.DetectionTypes = {
    GODMODE = 'godmode',
    HEALTH_ARMOR = 'health_armor_manipulation',
    NOCLIP = 'noclip',
    TELEPORT = 'teleport',
    SPEED = 'abnormal_speed',
    SUPERJUMP = 'superjump',
    FLY = 'fly',
    FREECAM = 'freecam',
    INVISIBLE = 'invisible',
    WEAPON_ABUSE = 'weapon_abuse',
    VEHICLE_ABUSE = 'vehicle_abuse',
    ENTITY_SPAM = 'entity_spam',
    EXPLOSION_SPAM = 'explosion_spam',
    EVENT_ABUSE = 'event_abuse',
    MONEY_MANIPULATION = 'money_manipulation',
    INVENTORY_ABUSE = 'inventory_abuse',
    JOB_ABUSE = 'job_abuse',
    RESOURCE_TAMPERING = 'resource_tampering'
}

-- ============================================================================
-- SEVERITY LEVELS
-- ============================================================================

Constants.Severity = {
    LOW = 'LOW',
    MEDIUM = 'MEDIUM',
    HIGH = 'HIGH',
    CRITICAL = 'CRITICAL'
}

-- ============================================================================
-- ACTION TYPES
-- ============================================================================

Constants.Actions = {
    LOG = 'log',
    WARN = 'warn',
    KICK = 'kick',
    TEMP_BAN = 'temp_ban',
    PERM_BAN = 'perm_ban',
    FREEZE = 'freeze',
    SPECTATE = 'spectate'
}

-- ============================================================================
-- PLAYER STATES
-- ============================================================================

Constants.PlayerStates = {
    ACTIVE = 'active',
    LOADING = 'loading',
    DEAD = 'dead',
    SPECTATING = 'spectating',
    STAFF_MODE = 'staff_mode',
    MAINTENANCE = 'maintenance'
}

-- ============================================================================
-- RESOURCE STATES
-- ============================================================================

Constants.ResourceStates = {
    RUNNING = 'running',
    STOPPED = 'stopped',
    STARTING = 'starting',
    STOPPING = 'stopping',
    ERROR = 'error',
    UNKNOWN = 'unknown'
}

-- ============================================================================
-- INTEGRITY STATUS
-- ============================================================================

Constants.IntegrityStatus = {
    UNCHANGED = 'unchanged',
    MODIFIED = 'modified',
    ADDED = 'added',
    REMOVED = 'removed',
    UNKNOWN = 'unknown'
}

-- ============================================================================
-- PROTECTION STATUS
-- ============================================================================

Constants.ProtectionStatus = {
    PROTECTED = 'protected',
    UNPROTECTED = 'unprotected',
    INVALID = 'invalid',
    ESCROWED = 'escrowed',
    SKIPPED = 'skipped',
    UNKNOWN = 'unknown'
}

-- ============================================================================
-- BAN TYPES
-- ============================================================================

Constants.BanTypes = {
    TEMPORARY = 'temporary',
    PERMANENT = 'permanent',
    WARNING = 'warning'
}

-- ============================================================================
-- EVENT NAMES
-- ============================================================================

Constants.Events = {
    -- Client Events
    ClientReady = 'goddess_ac:clientReady',
    DetectionTriggered = 'goddess_ac:detectionTriggered',
    PlayerDamaged = 'goddess_ac:playerDamaged',
    PlayerDeath = 'goddess_ac:playerDeath',
    PlayerSpawn = 'goddess_ac:playerSpawn',
    PlayerHealthCheck = 'goddess_ac:healthCheck',
    PlayerArmorCheck = 'goddess_ac:armorCheck',
    PlayerPositionCheck = 'goddess_ac:positionCheck',
    WeaponEquipped = 'goddess_ac:weaponEquipped',
    VehicleSpawned = 'goddess_ac:vehicleSpawned',
    EntityCreated = 'goddess_ac:entityCreated',
    
    -- Server Events
    ServerPlayerJoin = 'goddess_ac:serverPlayerJoin',
    ServerPlayerLeave = 'goddess_ac:serverPlayerLeave',
    ServerBanPlayer = 'goddess_ac:serverBanPlayer',
    ServerKickPlayer = 'goddess_ac:serverKickPlayer',
    ServerWarnPlayer = 'goddess_ac:serverWarnPlayer',
    ServerDetectionLogged = 'goddess_ac:detectionLogged',
    ServerResourceProtected = 'goddess_ac:resourceProtected',
    ServerResourceUnprotected = 'goddess_ac:resourceUnprotected',
    ServerDatabaseReady = 'goddess_ac:databaseReady',
    ServerMaintenanceToggle = 'goddess_ac:maintenanceToggle'
}

-- ============================================================================
-- COMMAND PREFIXES
-- ============================================================================

Constants.Commands = {
    GAC = 'gac',
    BAN = 'ban',
    UNBAN = 'unban',
    WARN = 'warn',
    KICK = 'kick',
    SPECTATE = 'spectate',
    FREEZE = 'freeze',
    INSTALL = 'install',
    UNINSTALL = 'uninstall',
    SCAN = 'scan',
    BASELINE = 'baseline',
    RESTORE = 'restore',
    BACKUP = 'backup'
}

-- ============================================================================
-- VALID FRAMEWORKS
-- ============================================================================

Constants.Frameworks = {
    ESX = 'esx',
    QBCORE = 'qbcore',
    VRPEX = 'vrpex'
}

-- ============================================================================
-- VALID INVENTORY SYSTEMS
-- ============================================================================

Constants.InventorySystems = {
    OX_INVENTORY = 'ox_inventory',
    ESX_INVENTORY = 'esx_inventory',
    QB_INVENTORY = 'qb-inventory'
}

-- ============================================================================
-- HTTP RESPONSE CODES
-- ============================================================================

Constants.HttpCodes = {
    OK = 200,
    CREATED = 201,
    BAD_REQUEST = 400,
    UNAUTHORIZED = 401,
    FORBIDDEN = 403,
    NOT_FOUND = 404,
    CONFLICT = 409,
    SERVER_ERROR = 500,
    SERVICE_UNAVAILABLE = 503
}

-- ============================================================================
-- NATIVE VALIDATION
-- ============================================================================

Constants.ValidWeaponHashes = {
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
    'WEAPON_SMG_MK2',
    'WEAPON_ASSAULTSMG',
    'WEAPON_COMBATPDW',
    'WEAPON_MACHINEPISTOL',
    'WEAPON_MINISMG',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_PUMPSHOTGUN_MK2',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_MUSKET',
    'WEAPON_HEAVYSHOTGUN',
    'WEAPON_DOUBLEACTIONREVOLVER',
    'WEAPON_RIFLE',
    'WEAPON_RIFLE_MK2',
    'WEAPON_CARBINERIFLE',
    'WEAPON_CARBINERIFLE_MK2',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_SPECIALCARBINE_MK2',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_BULLPUPRIFLE_MK2',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_MILITARYRIFLE',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_HEAVYSNIPER_MK2',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_MARKSMANRIFLE_MK2',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_GRENADELAUNCHER_SMOKE',
    'WEAPON_RPG',
    'WEAPON_STINGER',
    'WEAPON_MINIGUN',
    'WEAPON_GRENADE',
    'WEAPON_STICKYBOMB',
    'WEAPON_MOLOTOV',
    'WEAPON_FIREEXTINGUISHER',
    'WEAPON_PETROLCAN',
    'WEAPON_FLARE',
    'WEAPON_FLASHLIGHT'
}

-- ============================================================================
-- HASH ALGORITHMS
-- ============================================================================

Constants.HashAlgorithms = {
    MD5 = 'md5',
    SHA1 = 'sha1',
    SHA256 = 'sha256',
    SHA512 = 'sha512'
}

-- ============================================================================
-- TIME CONSTANTS (in milliseconds)
-- ============================================================================

Constants.Time = {
    ONE_SECOND = 1000,
    ONE_MINUTE = 60000,
    FIVE_MINUTES = 300000,
    TEN_MINUTES = 600000,
    FIFTEEN_MINUTES = 900000,
    THIRTY_MINUTES = 1800000,
    ONE_HOUR = 3600000,
    SIX_HOURS = 21600000,
    TWELVE_HOURS = 43200000,
    ONE_DAY = 86400000,
    SEVEN_DAYS = 604800000,
    THIRTY_DAYS = 2592000000
}

-- ============================================================================
-- DISTANCE CONSTANTS
-- ============================================================================

Constants.Distances = {
    VERY_CLOSE = 5.0,
    CLOSE = 10.0,
    MEDIUM = 25.0,
    FAR = 50.0,
    VERY_FAR = 100.0,
    EXTREME = 500.0
}

print('^2[GODDESS AC]^7 Constants loaded')
