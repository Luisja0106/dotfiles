local wezterm = require("wezterm")
--local act = wezterm.action

local command = {
	brief = "Switch global theme",
	icon = "md_palette",
	action = wezterm.action_callback(function(window, pane)
		window:perform_action(
			wezterm.action.PromptInputLine({
				description = "Enter theme:",
				action = wezterm.action_callback(function(_, _, line)
					if line then
						os.execute(string.format("$HOME/.themes/theme-switcher.sh %s", line))
					end
				end),
			}),
			pane
		)
	end),
}

return command
