GAC = GAC or {}
GAC.Constants = {}

GAC.Constants.Version = '1.0.0'

GAC.Constants.Severities = {
    LOW = 'LOW',
    MEDIUM = 'MEDIUM',
    HIGH = 'HIGH',
    CRITICAL = 'CRITICAL'
}

GAC.Constants.ResourceStatuses = {
    PROTECTED = 'PROTECTED',
    UNPROTECTED = 'UNPROTECTED',
    INVALID = 'INVALID',
    ESCROWED = 'ESCROWED',
    SKIPPED = 'SKIPPED',
    UNKNOWN = 'UNKNOWN'
}

GAC.Constants.IntegrityStatuses = {
    UNCHANGED = 'UNCHANGED',
    MODIFIED = 'MODIFIED',
    ADDITION = 'ADDED',
    REMOVED = 'REMOVED',
    UNKNOWN = 'UNKNOWN'
}

GAC.Constants.Actions = {
    WARN = 'WARN',
    KICK = 'KICK',
    TEMP_BAN = 'TEMP_BAN',
    PERM_BAN = 'PERM_BAN',
    LOG_ONLY = 'LOG_ONLY'
}

GAC.Constants.Permissions = {
    Admin = 'goddess.admin',
    Security = 'goddess.security',
    Bypass = 'goddess.bypass'
}
