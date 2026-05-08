return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"lewis6991/async.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("refactoring").setup()
		require("telescope").load_extension("refactoring")
	end,
	keys = {
		{
			"<leader>pR",
			function()
				require("telescope").extensions.refactoring.refactors()
			end,
			desc = "refactoring",
			mode = { "n", "x" },
		},
	},
}
