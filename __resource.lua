ui_page "html/ui.html"

files {
    "html/*",
}

client_script {
    'client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}