--plugin that create a "tab" for a buffer like an ide
return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "tabs",
				separator_style = "slant",
				always_show_bufferline = false,
				auto_toggle_bufferline = true,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				indicator = { style = "underline" },
				diagnostics = "nvim_lsp",
			},
		})
		local keymap = vim.keymap.set
		keymap("n", "<leader>tp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Pin a Tab" })
	end,
}
