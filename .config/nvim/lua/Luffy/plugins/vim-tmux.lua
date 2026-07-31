return {
	"Christoomey/vim-tmux-navigator",
	event = "VeryLazy",
	init = function()
		vim.g.tmux_navigator_no_mappings = 1
	end,
	config = function()
		dofile(
			vim.fn.expand("/home/luffy/.config/herdr/plugins/github/vim-herdr-navigation-a8bf42123d81/editor/nvim.lua")
		)
	end,
}
