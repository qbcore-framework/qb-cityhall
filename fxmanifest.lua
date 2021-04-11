fx_version 'cerulean'
game 'gta5'

description 'QB-CityHall'
version '1.0.0'

ui_page "html/index.html"

server_scripts {
    "server/main.lua",
    "config.lua"
}

client_scripts {
	"client/main.lua",
    "config.lua"
}

files {
    "html/*.js",
    "html/*.html",
    "html/*.css",
    "html/img/*.png",
    "html/img/*.jpg"
}