return function(cfg, wz)
	-- obtener nombre del esquema actual
	local scheme_name = cfg.color_scheme or "tokyonight"

	-- obtener paleta de colores del esquema
	local scheme = wz.color.get_builtin_schemes()[scheme_name] or {}

	-- definir colores base (con fallback)
	local bg = scheme.background or "#1a1b26"
	local fg = scheme.foreground or "#c0caf5"
	local accent = scheme.ansi and scheme.ansi[2] or "#7aa2f7" -- azul de tokyonight

	wz.on("update-status", function(stats)
		local stat = "none"
		local statCol = fg

		if stats:leader_is_active() then
			stat = "LDR"
			statCol = accent
		end

		stats:set_right_status(wz.format({
			{ Foreground = { Color = statCol } },
			{ Background = { Color = bg } },
			{ Text = wz.nerdfonts.oct_table .. " " .. stat },
		}))
	end)
end
