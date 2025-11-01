--[[
__   _____   ___________   _____ _____ _   _ ______ _____ _____ 
\ \ / / _ \ |___  /_   _| /  __ \  _  | \ | ||  ___|_   _|  __ \
 \ V / /_\ \   / /  | |   | /  \/ | | |  \| || |_    | | | |  \/
  \ /|  _  |  / /   | |   | |   | | | | . ` ||  _|   | | | | __ 
  | || | | |./ /____| |_  | \__/\ \_/ / |\  || |    _| |_| |_\ \
  \_/\_| |_/\_____/\___/   \____/\___/\_| \_/\_|    \___/ \____/
                                                                
                                                                
--]]
require("full-border"):setup() --Ronded border
-- Git config
th.git = th.git or {}
--modified file 
th.git.modified = ui.Style():fg("blue") 
th.git.modified_sign = "M"
--deleted file
th.git.deleted_sign = "D"
th.git.deleted = ui.Style():fg("red"):bold()

require("git"):setup({})
