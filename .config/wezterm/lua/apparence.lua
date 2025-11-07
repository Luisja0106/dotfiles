local wezterm = require("wezterm")
local config = {}
config.font = wezterm.font_with_fallback({
	{ family = "MesloLGLDZ Nerd Font", scale = 1.2 },
	{ family = "JetBrainsMono Nerd Font", scale = 1.2 },
})
config.use_fancy_tab_bar = false
--config.window_background_opacity = 0.7
return config
