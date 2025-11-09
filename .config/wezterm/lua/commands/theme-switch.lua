local wezterm = require("wezterm")

local command = {
	brief = "Switch global theme",
	icon = "md_palette",
	action = wezterm.action_callback(function(window, pane)
		window:perform_action(
			wezterm.action.PromptInputLine({
				description = "Enter theme:",
				action = wezterm.action_callback(function(window, pane, line)
					if line and #line > 0 then
						local cmd = string.format("source ~/.themes/theme-switcher.sh %s\r", line)
						window:perform_action(wezterm.action.SendString(cmd), pane)
					end
				end),
			}),
			pane
		)
	end),
}

return command
