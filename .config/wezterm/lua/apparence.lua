local wezterm = require("wezterm")
local config = {}
config.font = wezterm.font_with_fallback({
	{ family = "MesloLGLDZ Nerd Font", scale = 1.2 },
	{ family = "JetBrainsMono Nerd Font", scale = 1.2 },
})
config.use_fancy_tab_bar = false
--config.window_background_opacity = 0.7
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
return config
