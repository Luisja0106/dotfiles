return {
	"brianhuster/live-preview.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	keys = { { "<leader>dp", "<cmd>LivePreview pick<CR>", desc = "open livepreview" } },
	require("livepreview.config").set({
		browser = "firefox",
		picker = "telescope",
	}),
}
