--apps
local terminal = "ghostty"
local fileManager = "nemo"
local browser = "helium-browser"
local musicTUI = "kitty -T 'tidal' -e riptide"
local launcher = "nc -U /run/user/1000/walker/walker.sock"
local runner = "walker -s run"

--keys
local mainMod = "SUPER" -- Sets super key as main modifier
local secondMod = "SUPER + SHIFT"
local superCTRL = "SUPER + CTRL"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal), { description = "Open terminal" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), { description = "Open browser" })
hl.bind("SUPER + ALT + T", hl.dsp.exec_cmd(musicTUI), { description = "Open music TUI player" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close active window" })
hl.bind(secondMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"), { description = "Reload Hyprland config" })
hl.bind(
	secondMod .. " + S",
	hl.dsp.exec_cmd("~/.config/walker/scripts/screenshoot.sh"),
	{ description = "Restart Hyprland" }
)
hl.bind(
	secondMod .. " + Q",
	hl.dsp.exec_cmd("hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"),
	{ description = "Quit active window and all open instances" }
)
hl.bind(superCTRL .. " + Q", hl.dsp.exec_cmd("wlogout"), { description = "open logout manager" })
hl.bind(
	mainMod .. " + F",
	hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
	{ description = "Toggle Fullscreen" }
)
hl.bind(
	mainMod .. " + M",
	hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
	{ description = "Toggle Maximize Window" }
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "Open file manager" })
hl.bind(superCTRL .. " + RETURN", hl.dsp.exec_cmd(launcher), { description = "Open application launcher" })
hl.bind(secondMod .. " + RETURN", hl.dsp.exec_cmd(runner), { description = "Open command runner" })
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { description = "Toggle pseudoTiling mode" })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }), { description = "Focus left window" })
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }), { description = "Focus right window" })
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }), { description = "Focus upper window" })
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }), { description = "Focus lower window" })

hl.bind(secondMod .. " + h", hl.dsp.window.move({ direction = "left" }), { description = "Move window left" })
hl.bind(secondMod .. " + l", hl.dsp.window.move({ direction = "right" }), { description = "Move window right" })
hl.bind(secondMod .. " + k", hl.dsp.window.move({ direction = "up" }), { description = "Move window up" })
hl.bind(secondMod .. " + j", hl.dsp.window.move({ direction = "down" }), { description = "Move window down" })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(secondMod .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
