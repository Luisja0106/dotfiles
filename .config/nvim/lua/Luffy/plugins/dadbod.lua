return {
	{
		"tpope/vim-dadbod",
		lazy = true,
	},
	{
		-- UI on top of dadbod — tree of connections, tables, query execution
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			"tpope/vim-dadbod",
			-- autocompletion for SQL inside dadbod buffers
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = { "DBUI", "DBUIToggle" }, -- only loads when you run these commands
		init = function()
			-- store connections here instead of in the project folder
			vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
			-- auto-execute queries when saving a .sql buffer inside DBUI
			vim.g.db_ui_execute_on_save = 1
		end,
		keys = {
			{ "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Database: Toggle UI" },
		},
	},
}
