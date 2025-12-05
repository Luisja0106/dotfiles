return {
	"lervag/vimtex",
	ft = { "tex", "latex" },
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_fold_enabled = 1
		vim.g.vimtex_quickfix_mode = 0
		vim.g.vimtex_imaps_enabled = 1
		vim.g.vimtex_spell_enabled = 1
		vim.g.vimtex_spell_enabled = 1
		vim.g.vimtex_view_automatic = 1
		vim.cmd("let $NVIM_LISTEN_ADDRESS = '/tmp/nvim' ")
		vim.g.vimtex_compiler_latexmk = {
			options = { "-pdf", "-interaction=nonstopmode", "-synctex=1" },
		}
	end,
}
