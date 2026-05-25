return {
	--add the name of the file to the Top Right
	{
		"b0o/incline.nvim",
		enabled = true,
		dependencies = { "nvim-mini/mini.icons" },
		config = function()
			local icons = require("mini.icons")

			require("incline").setup({
				hide = {
					only_win = false,
				},
				render = function(props)
					local bufname = vim.api.nvim_buf_get_name(props.buf)
					local filename = vim.fn.fnamemodify(bufname, ":t")
					if filename == "" then
						filename = "[No Name]"
					end

					-- local ext = vim.fn.fnamemodify(bufname, ":e")
					local icon, icon_color = icons.get("file", filename)

					local modified = vim.bo[props.buf].modified

					return {
						{ " ", icon, " ", guifg = icon_color },
						{ filename, gui = modified and "bold" or "none" },
						modified and { " [+]", guifg = "#ff9e64" } or "",
						" ",
					}
				end,
			})
		end,
		event = "VeryLazy",
	},
}
