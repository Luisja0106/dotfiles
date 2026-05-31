function activate_gamemode()
	hl.config({
		animations = { enabled = false },
		decoration = {
			shadow = { enabled = false },
			blur = { enabled = false },
			active_opacity = 1.0,
			inactive_opacity = 1.0,
			fullscreen_opacity = 1.0,
			rounding = 0,
		},
		general = {
			gaps_in = 0,
			gaps_out = 0,
			border_size = 1,
		},
	})
	hl.dispatch(hl.dsp.exec_cmd("killall elephant"))
	hl.dispatch(hl.dsp.exec_cmd("killall walker"))
	hl.unbind("SUPER + CTRL + RETURN")
	hl.unbind("SUPER + SHIFT + RETURN")
	hl.bind("SUPER + CTRL + RETURN", hl.dsp.exec_cmd("rofi -show drun"), { description = "Open application launcher" })
	hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("rofi -show run"), { description = "Open command runner" })
	print("GAMEMODE ON")
end

function disable_gamemode()
	hl.dispatch(hl.dsp.exec_cmd("elephant"))
	hl.dispatch(hl.dsp.exec_cmd("walker --gapplication-service"))
	hl.dispatch(hl.dsp.exec_cmd("hyprctl reload"))
end
