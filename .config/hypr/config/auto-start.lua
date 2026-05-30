hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	-- hl.exec_cmd("hyprctl setcursor Nordizy-catppuccin-mocha-dark 30")
	hl.exec_cmd("elephant")
	hl.exec_cmd("walker --gapplication-service")
end)

--enviroment variables
hl.env("XCURSOR_SIZE", "30")
hl.env("HYPRCURSOR_SIZE", "30")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
