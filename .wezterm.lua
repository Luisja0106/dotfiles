--[[
 _    _ _____ ___________ ______________  ___  _____ _____ _   _ ______ _____ _____ 
| |  | |  ___|___  /_   _|  ___| ___ \  \/  | /  __ \  _  | \ | ||  ___|_   _|  __ \
| |  | | |__    / /  | | | |__ | |_/ / .  . | | /  \/ | | |  \| || |_    | | | |  \/
| |/\| |  __|  / /   | | |  __||    /| |\/| | | |   | | | | . ` ||  _|   | | | | __ 
\  /\  / |___./ /___ | | | |___| |\ \| |  | | | \__/\ \_/ / |\  || |    _| |_| |_\ \
 \/  \/\____/\_____/ \_/ \____/\_| \_\_|  |_/  \____/\___/\_| \_/\_|    \___/ \____/
                                                                                    
                                                                                    
--]]
local wezterm = require("wezterm")

--config
local config = wezterm.config_builder()

--initial configs
config.color_scheme = "nordfox"
config.font = wezterm.font("MesloLGLDZ Nerd Font")
config.font_size = 15
config.tab_bar_at_bottom = true
config.disable_default_key_bindings = false
config.window_background_opacity = 0.7
--tabs config

--keys config
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
--config.keys = {
-- { key = "c", mods = "ALT", action = wezterm.action.CopyTo("Clipboard") },
-- { key = "v", mods = "ALT", action = wezterm.action.PasteFrom("Clipboard") },
--
-- { key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
-- { key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
--
-- { key = "Insert", mods = "CTRL", action = wezterm.action.CopyTo("PrimarySelection") },
-- { key = "Insert", mods = "SHIFT", action = wezterm.action.PasteFrom("PrimarySelection") },
--
-- { key = "m", mods = "ALT", action = wezterm.action.Hide },
-- { key = "n", mods = "ALT", action = wezterm.action.SpawnWindow },
-- { key = "n", mods = "CTRL|SHIFT", action = wezterm.action.SpawnWindow },
--
-- { key = "Enter", mods = "ALT", action = wezterm.action.ToggleFullScreen },
--
-- { key = "-", mods = "ALT", action = wezterm.action.DecreaseFontSize },
-- { key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
-- { key = "=", mods = "ALT", action = wezterm.action.IncreaseFontSize },
-- { key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
-- { key = "0", mods = "ALT", action = wezterm.action.ResetFontSize },
-- { key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
--
-- { key = "t", mods = "ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
-- { key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
-- { key = "T", mods = "ALT|SHIFT", action = wezterm.action.SpawnTab("DefaultDomain") },
--
-- { key = "w", mods = "ALT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
-- { key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
--
-- { key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
-- { key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
-- { key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
-- { key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
-- { key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },
-- { key = "6", mods = "ALT", action = wezterm.action.ActivateTab(5) },
-- { key = "7", mods = "ALT", action = wezterm.action.ActivateTab(6) },
-- { key = "8", mods = "ALT", action = wezterm.action.ActivateTab(7) },
-- { key = "9", mods = "ALT", action = wezterm.action.ActivateTab(-1) },
--
-- { key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
-- { key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
-- { key = "PageUp", mods = "CTRL", action = wezterm.action.ActivateTabRelative(-1) },
-- { key = "PageDown", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
--
-- { key = "PageUp", mods = "CTRL|SHIFT", action = wezterm.action.MoveTabRelative(-1) },
-- { key = "PageDown", mods = "CTRL|SHIFT", action = wezterm.action.MoveTabRelative(1) },
--
-- { key = "PageUp", mods = "SHIFT", action = wezterm.action.ScrollByPage(-1) },
-- { key = "PageDown", mods = "SHIFT", action = wezterm.action.ScrollByPage(1) },
--
-- { key = "r", mods = "ALT", action = wezterm.action.ReloadConfiguration },
-- { key = "R", mods = "CTRL|SHIFT", action = wezterm.action.ReloadConfiguration },
--
-- { key = "k", mods = "ALT", action = wezterm.action.ClearScrollback("ScrollbackOnly") },
-- { key = "K", mods = "CTRL|SHIFT", action = wezterm.action.ClearScrollback("ScrollbackOnly") },
--
-- { key = "L", mods = "CTRL|SHIFT", action = wezterm.action.ShowDebugOverlay },
-- { key = "P", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCommandPalette },
-- { key = "U", mods = "CTRL|SHIFT", action = wezterm.action.CharSelect },
--
-- { key = "f", mods = "ALT", action = wezterm.action.Search({ CaseSensitiveString = "" }) },
-- { key = "F", mods = "CTRL|SHIFT", action = wezterm.action.Search({ CaseSensitiveString = "" }) },
--
-- { key = "X", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },
-- { key = " ", mods = "CTRL|SHIFT", action = wezterm.action.QuickSelect },
--
-- { key = '"', mods = "CTRL|SHIFT|ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
-- { key = "%", mods = "CTRL|SHIFT|ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
--
-- { key = "LeftArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
-- { key = "RightArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
-- { key = "UpArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
-- { key = "DownArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
--
-- { key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
-- { key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
-- { key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
-- { key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
--
-- { key = "Z", mods = "CTRL|SHIFT", action = wezterm.action.TogglePaneZoomState },
--}
return config
--
