local wz = require("wezterm")
local config = wz.config_builder()
config.window_close_confirmation = "AlwaysPrompt"

config.default_cursor_style = "SteadyBar"
config.default_workspace = "main"
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.2,
}
config.max_fps = 120

return config
