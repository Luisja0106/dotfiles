--plugin that create and modifed the custom bar of nvim
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-mini/mini.icons" },

	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local colors = {
			nord00 = "#2E3440",
			nord01 = "#3B4252",
			nord02 = "#434C5E",
			nord03 = "#4C566A",
			nord04 = "#D8DEE9",
			nord05 = "#E5E9F0",
			nord06 = "#ECEFF4",
			nord07 = "#8FBCBB",
			nord08 = "#88C0D0",
			nord09 = "#81A1C1",
			nord10 = "#5E81AC",
			nord11 = "#BF616A",
			nord12 = "#D08770",
			nord13 = "#EBCD8B",
			nord14 = "#A3BE8C",
			nord15 = "#B48EAD",
		}

		local nordic = {
			normal = {
				a = { bg = colors.nord09, fg = colors.nord03, gui = "bold" },
				b = { bg = colors.nord01, fg = colors.nord04 },
				c = { bg = colors.nord02, fg = colors.nord04 },
			},
			insert = {
				a = { bg = colors.nord07, fg = colors.nord03, gui = "bold" },
				b = { bg = colors.nord01, fg = colors.nord04 },
				c = { bg = colors.nord02, fg = colors.nord04 },
			},
			visual = {
				a = { bg = colors.nord15, fg = colors.nord03, gui = "bold" },
				b = { bg = colors.nord01, fg = colors.nord04 },
				c = { bg = colors.nord02, fg = colors.nord04 },
			},
			command = {
				a = { bg = colors.nord13, fg = colors.nord03, gui = "bold" },
				b = { bg = colors.nord01, fg = colors.nord04 },
				c = { bg = colors.nord02, fg = colors.nord04 },
			},
			replace = {
				a = { bg = colors.nord11, fg = colors.nord03, gui = "bold" },
				b = { bg = colors.nord01, fg = colors.nord04 },
				c = { bg = colors.nord02, fg = colors.nord04 },
			},
			inactive = {
				a = { bg = colors.nord00, fg = colors.nord05, gui = "bold" },
				b = { bg = colors.nord00, fg = colors.nord05 },
				c = { bg = colors.nord00, fg = colors.nord05 },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "auto",
				-- section_separators = { left = "", right = "" },
				icons_enabled = true,
			},
			sections = {
				lualine_a = {
					{
						function()
							return ""
						end,
					},
					{ "mode" },
				},
				lualine_x = {
					{
						function()
							return require("noice").api.status.command.get()
						end,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.command.has()
						end,
						color = function()
							return { fg = Snacks.util.color("Statement") }
						end,
					},
					{
						function()
							return require("noice").api.status.mode.get()
						end,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.command.has()
						end,
						color = function()
							return { fg = Snacks.util.color("Constant") }
						end,
					},
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
