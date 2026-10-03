return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		-- 1. Plugin setup (only for optional settings)
		ts.setup({})

		-- 2. Install the parsers (runs in the background)
		ts.install({
			"json",
			"css",
			"python",
			"javascript",
			"lua",
			"gitignore",
			"java",
			"typescript",
			"tsx",
			"html",
		})

		-- 3. Start highlighting and indentation for these file types
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"json",
				"css",
				"python",
				"javascript",
				"javascriptreact",
				"lua",
				"gitignore",
				"java",
				"typescript",
				"typescriptreact",
				"html",
			},
			callback = function(args)
				-- Highlighting (pcall ignores the error if the parser is not ready yet)
				pcall(vim.treesitter.start, args.buf)

				-- Indentation
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
