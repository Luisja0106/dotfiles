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
