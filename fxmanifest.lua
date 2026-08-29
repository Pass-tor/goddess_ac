fx_version 'cerulean'
game 'gta5'

author 'GODDESS Development'
description 'GODDESS ANTI-CHEAT - All-in-one FiveM security system'
version '1.0.0'
repository 'https://github.com/Pass-tor/goddess_ac'

lua54 'yes'

shared_scripts {
    'shared/constants.lua',
    'shared/utils.lua',
}

server_scripts {
    'server/main.lua',
    'server/database.lua',
    'server/permissions.lua',
    'server/logging.lua',
    'server/detection.lua',
    'server/protection.lua',
    'server/events.lua',
    'server/entities.lua',
    'server/resources.lua',
    'server/installer.lua',
    'server/uninstaller.lua',
    'server/integrity.lua',
    'server/backup.lua',
    'server/restore.lua',
    'server/bans.lua',
    'server/rate_limit.lua',
    'server/license.lua',
    'server/api.lua',
}

client_scripts {
    'client/main.lua',
    'client/detection.lua',
    'client/movement.lua',
    'client/weapon.lua',
    'client/entity.lua',
    'client/player.lua',
    'client/nui.lua',
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/style.css',
    'web/app.js',
}

exports {
    'AuthorizeInvulnerability',
    'AuthorizeTeleport',
    'AuthorizeInvisible',
    'AuthorizeVehicleSpawn',
    'RegisterProtectedEvent',
    'SetStaffMode',
    'RegisterResource',
    'IsResourceProtected',
    'GetResourceIntegrity',
    'ScanResource',
    'CreateBaseline',
    'ApproveBaseline',
    'AuthorizeResourceUpdate',
    'AllowResource',
    'RemoveAllowedResource',
    'GetPlayerScore',
    'AddDetection',
    'GetPlayerBanStatus',
    'UnbanPlayer',
    'GetDetectionHistory',
    'GetResourceStatus',
    'InstallResource',
    'UninstallResource',
    'RestoreResource',
    'BackupResource',
}

dependencies {
    'mysql-async',
}
