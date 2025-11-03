local wezterm = require("wezterm")
local config = {}
config.window_close_confirmation = "AlwaysPrompt"
config.default_cursor_style = "SteadyBar"
config.default_workspace = "main"
config.hide_tab_bar_if_only_one_tab = true

config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.2,
}
return config
