-- Switch to a submap called `resize`.
local mainMod = "SUPER"
local toggleGambit = mainMod .. " + SPACE"
hl.bind(toggleGambit, hl.dsp.submap("gambit"))

-- Start a submap called "resize".
hl.define_submap("gambit", function()
	local function gambitBind(key, action, description)
		hl.bind(mainMod .. " + " .. key, action, { description = description })
	end
	gambitBind("K", hl.dsp.exec_cmd("pamixer -i 2"), "Increase volume")
	gambitBind("K", hl.dsp.exec_cmd("pamixer -d 2"), "Decrease volume")
	gambitBind("S", hl.dsp.exec_cmd("playerctl play-pause "), "Pause/Play music")
	gambitBind("L", hl.dsp.exec_cmd("playerctl next "), "next song")
	gambitBind("H", hl.dsp.exec_cmd("playerctl previous "), "previous song")
	gambitBind("M", hl.dsp.exec_cmd("swaync-client -d -sw"), "Toggle notifications")
	gambitBind("G", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle_gamemode.sh"), "Toggle Gamemode")

	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("SPACE", hl.dsp.submap("reset"))
end)
