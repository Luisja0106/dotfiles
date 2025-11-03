local wezterm = require("wezterm")
local act = wezterm.action
local config = {}
--keys config
config.leader = { key = "Space", mods = "SHIFT", timeout_milliseconds = 3000 }
config.keys = {
	--open a new tab
	{ mods = "LEADER", key = "o", action = act.SpawnTab("CurrentPaneDomain") },
	--command pallete
	{ mods = "LEADER", key = ",", action = act.ActivateCommandPalette },
	--copy mode
	{ mods = "LEADER", key = "c", action = act.ActivateCopyMode },
	---move prev and next tab
	{ mods = "LEADER", key = "n", action = act.ActivateTabRelative(1) },
	{ mods = "LEADER", key = "p", action = act.ActivateTabRelative(-1) },
	--tab navigation
	{ mods = "LEADER", key = "t", action = act.ShowTabNavigator },
	--close current tab
	{ mods = "LEADER", key = "x", action = act.CloseCurrentPane({ confirm = true }) },
	--split Vertical
	{ mods = "LEADER", key = "-", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	--split Horizontal
	{ mods = "LEADER", key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	--move arround panes
	{ mods = "LEADER", key = "j", action = act.ActivatePaneDirection("Down") },
	{ mods = "LEADER", key = "k", action = act.ActivatePaneDirection("Up") },
	{ mods = "LEADER", key = "h", action = act.ActivatePaneDirection("Left") },
	{ mods = "LEADER", key = "l", action = act.ActivatePaneDirection("Right") },
	--zoom pane
	{ mods = "LEADER", key = "z", action = act.TogglePaneZoomState },
	--resize pane
	{ mods = "LEADER", key = "r", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
	{ mods = "LEADER", key = "m", action = act.ActivateKeyTable({ name = "move_pane", one_shot = false }) },
	--workspace
	{ mods = "LEADER", key = "w", action = act.ShowLauncher },
	--rename Tab
	{
		key = ".",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Renaming Tab Title...:" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}
--move arround tabes with the index
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end
config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	move_pane = {
		{ key = "h", action = act.MoveTabRelative(-1) },
		{ key = "l", action = act.MoveTabRelative(1) },
		{ key = "j", action = act.MoveTabRelative(-1) },
		{ key = "k", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}
return config
