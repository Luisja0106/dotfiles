--[[
  ___ ___ _____.___.____________________.____       _____    _______  ________   
 /   |   \\__  |   |\______   \______   \    |     /  _  \   \      \ \______ \  
/    ~    \/   |   | |     ___/|       _/    |    /  /_\  \  /   |   \ |    |  \ 
\    Y    /\____   | |    |    |    |   \    |___/    |    \/    |    \|    `   \
 \___|_  / / ______| |____|    |____|_  /_______ \____|__  /\____|__  /_______  /
       \/  \/                         \/        \/       \/         \/        \/ 
--]]

-- autostart
require("config.auto-start")

--TODO:Functions
require("functions")

--Monitors
require("config.monitors")
--
--Input
require("config.input")
-- --TODO: colors
-- -- require("colors")
-- config
require("config.enviroments")
require("config.windows")
require("config.decorations")
require("config.layouts")
require("config.workspaces")
require("config.misc")
require("config.windowrules")
require("config.animations")

--keymaps
require("config.keybindings.normal")
require("config.keybindings.gambit")
