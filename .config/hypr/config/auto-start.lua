hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("swaync")
	hl.exec_cmd("elephant")
	hl.exec_cmd("walker --gapplication-service")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd(
		"killall xdg-desktop-portal-hyprland; killall xdg-desktop-portal; /usr/lib/xdg-desktop-portal-hyprland & sleep 2; /usr/lib/xdg-desktop-portal &"
	)
end)

--enviroment variables
hl.env("XCURSOR_SIZE", "30")
hl.env("HYPRCURSOR_SIZE", "30")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
