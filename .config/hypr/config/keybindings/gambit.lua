-- Switch to a submap called `resize`.
local mainMod = "SUPER"
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle_gambit.sh"))

-- Start a submap called "resize".
hl.define_submap("gambit", function()
	hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("pamixer -i 2"), { description = "Increase volume", repeating = true })
	hl.bind(mainMod .. " + J", hl.dsp.exec_cmd("pamixer -d 2"), { description = "Decrease volume", repeating = true })
	hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("playerctl play-pause "), { description = "Pause/Play music" })
	hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("playerctl next "), { description = "next song" })
	hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("playerctl previous "), { description = "previous song" })
	hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("swaync-client -d -sw"), { description = "Toggle notifications" })
	hl.bind(
		mainMod .. " + G",
		hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle_gamemode.sh"),
		{ description = "Toggle Gamemode" }
	)

	hl.bind("escape", hl.dsp.submap("reset"), { description = "Exit submap" })
	hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle_gambit.sh"))
end)
