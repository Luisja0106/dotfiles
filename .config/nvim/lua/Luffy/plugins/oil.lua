return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
	},
	{
		vim.keymap.set("n", "<leader>ee", "<CMD>Oil<CR>", { desc = "Open file explorer" }),
	},
}
