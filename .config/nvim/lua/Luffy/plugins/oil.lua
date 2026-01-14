return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		opts = {
			default_file_explorer = true,
			delete_to_trash = true, -- Seguridad ante todo, Luffy
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true, -- Para ver los .dotfiles de tus proyectos
			},
			-- Configuración estética para que se vea profesional
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
