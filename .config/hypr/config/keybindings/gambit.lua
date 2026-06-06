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
	hl.bind(mainMod .. " + CTRL + K", hl.dsp.exec_cmd("hyprctl kill"), { description = "Kill window" })
	hl.bind(
		mainMod .. " + G",
		hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle_gamemode.sh"),
		{ description = "Toggle Gamemode" }
	)
	hl.bind(
		mainMod .. " + SHIFT + K",
		hl.dsp.exec_cmd("~/.config/hypr/scripts/get_keymaps.sh"),
		{ description = "Show Keybinds" }
	)
	hl.bind(
		mainMod .. " + 1",
		hl.dsp.workspace.toggle_special("magic"),
		{ description = "Toggle special workspace 'magic'" }
	)
	hl.bind(
		mainMod .. " + SHIFT + S",
		hl.dsp.window.move({ workspace = "special:magic" }),
		{ description = "Move focused window to special workspace 'magic'" }
	)
	hl.bind(
		mainMod .. " + ALT + SHIFT + V",
		hl.dsp.exec_cmd("~/.config/hypr/scripts/vnc_toggle.sh"),
		{ description = "Toggle VNC server" }
	)
	hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"), { description = "Toggle notifications" })

	hl.bind("escape", hl.dsp.submap("reset"), { description = "Exit submap" })
	hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle_gambit.sh"))
end)
