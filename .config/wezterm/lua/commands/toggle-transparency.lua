local wz = require("wezterm")

local command = {
	brief = "Toggle terminal transparency",
	icon = "md_circle_opacity",
	action = wz.action_callback(function(window)
		local override = window:get_config_overrides() or {}
		if not override.window_background_opacity or override.window_background_opacity == 1 then
			override.window_background_opacity = 0.5
		else
			override.window_background_opacity = 1
		end
		window:set_config_overrides(override)
	end),
}

return command
