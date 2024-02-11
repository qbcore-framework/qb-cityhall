fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_fxv2_oal 'yes'
author 'Kakarot'
description 'Allows players to purchase id cards and licenses or change their job'
version '2.1.3'

ui_page 'html/index.html'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}

server_script 'server/main.lua'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/main.lua'
}

files {
    'html/*.js',
    'html/*.html',
    'html/*.css'
}
