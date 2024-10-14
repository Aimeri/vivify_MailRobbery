fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Aimeri'
description 'Mailbox Robbery Script For VivifyRP'
version '1.0.0'

dependencies {
	'progressbar',
    'interact'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua',
}

shared_scripts {
    'config.lua'
}