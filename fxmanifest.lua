fx_version 'cerulean'
game 'gta5'

description 'Cityhall for QBCore'
version '1.0.0'

ui_page 'html/index.html'

shared_script 'config.lua'

server_script 'server/*.lua'
client_script 'client/*.lua'

files {
    'html/*.js',
    'html/*.html',
    'html/*.css'
}
