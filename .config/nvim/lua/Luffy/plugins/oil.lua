return {
	{
		"malewicz1337/oil-git.nvim",
		dependencies = { "stevearc/oil.nvim" },
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		opts = {
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true,
			},
			float = {
				padding = 2,
				max_width = 0,
				max_height = 0,
				border = "rounded",
			},
		},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
	},
	{
		vim.keymap.set("n", "<leader>ee", "<CMD>Oil<CR>", { desc = "Open file explorer" }),
	},
}
