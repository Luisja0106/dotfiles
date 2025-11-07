--[[
 _    _ _____ ___________ ______________  ___  _____ _____ _   _ ______ _____ _____ 
| |  | |  ___|___  /_   _|  ___| ___ \  \/  | /  __ \  _  | \ | ||  ___|_   _|  __ \
| |  | | |__    / /  | | | |__ | |_/ / .  . | | /  \/ | | |  \| || |_    | | | |  \/
| |/\| |  __|  / /   | | |  __||    /| |\/| | | |   | | | | . ` ||  _|   | | | | __ 
\  /\  / |___./ /___ | | | |___| |\ \| |  | | | \__/\ \_/ / |\  || |    _| |_| |_\ \
 \/  \/\____/\_____/ \_/ \____/\_| \_\_|  |_/  \____/\___/\_| \_/\_|    \___/ \____/
                                                                                    
                                                                                    
--]]
local keymaps = require("lua.keymaps")
local options = require("lua.options")
local apparence = require("lua.apparence")
local colorScheme = require("lua.colorScheme")
local function merge_tables(...)
	local result = {}
	for _, t in ipairs({ ... }) do
		for k, v in pairs(t) do
			result[k] = v
		end
	end
	return result
end

local config = merge_tables(keymaps, options, apparence, colorScheme)

return config
