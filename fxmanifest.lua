fx_version 'cerulean'
lua_version '5.4'
game 'gta5'

name 'goddess_ac'
author 'Goddess Security Team'
description 'Goddess Anti-Cheat — All-In-One Production Security System'
version '1.0.0'

ui_page 'web/index.html'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/constants.lua',
    'shared/utils.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'client/detection.lua',
    'client/movement.lua',
    'client/weapon.lua',
    'client/entity.lua',
    'client/player.lua',
    'client/nui.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/database.lua',
    'server/license.lua',
    'server/permissions.lua',
    'server/rate_limit.lua',
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
    'server/api.lua'
}

files {
    'web/index.html',
    'web/style.css',
    'web/app.js'
}

dependencies {
    'ox_lib',
    'oxmysql',
    'es_extended'
}
