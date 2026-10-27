local colors_ok, colors = pcall(require, "colors")
local active_border = (colors_ok and colors and colors.border_active) or "rgba(136, 192, 208, 0.9)"
local inactive_border = (colors_ok and colors and colors.border_inactive) or "rgba(89, 89, 89, 0.7)"

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,

		border_size = 3,

		col = {
			active_border = active_border,
			inactive_border = inactive_border,
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 0.8,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = false,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
})
