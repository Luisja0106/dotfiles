--[[
 _    _ _____ ___________ ______________  ___  _____ _____ _   _ ______ _____ _____ 
| |  | |  ___|___  /_   _|  ___| ___ \  \/  | /  __ \  _  | \ | ||  ___|_   _|  __ \
| |  | | |__    / /  | | | |__ | |_/ / .  . | | /  \/ | | |  \| || |_    | | | |  \/
| |/\| |  __|  / /   | | |  __||    /| |\/| | | |   | | | | . ` ||  _|   | | | | __ 
\  /\  / |___./ /___ | | | |___| |\ \| |  | | | \__/\ \_/ / |\  || |    _| |_| |_\ \
 \/  \/\____/\_____/ \_/ \____/\_| \_\_|  |_/  \____/\___/\_| \_/\_|    \___/ \____/
                                                                                    
                                                                                    
--]]
local wezterm = require("wezterm")
local config = require("init")
local setup_statusline = require("lua.statusline")
local commands = require("lua.commands")

setup_statusline(config, wezterm)
wezterm.on("augment-command-palette", function()
	return commands
end)

return config
