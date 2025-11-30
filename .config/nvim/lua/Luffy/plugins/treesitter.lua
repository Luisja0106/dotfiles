--plugin that mark smart the functions
return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			--import nvim-treesitter plugint
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = { enabled = true },
				--enable auto-indentation
				indent = { enabled = true },
				--ensure these languages parsers are installed
				ensure_installed = {
					"json",
					"yaml",
					"css",
					"python",
					"javascript",
					"bash",
					"lua",
					"vim",
					"gitignore",
					"vimdoc",
					"java",
				},
				--incremental selection
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<A-space>",
						node_incremental = "<A-space>",
					},
				},
				additional_vim_regex_highlighting = false,
			})
		end,
	},
}
