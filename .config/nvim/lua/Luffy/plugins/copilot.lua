return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<M-l>", -- Alt+l to accept full suggestion
						accept_word = "<M-w>", -- Alt+w to accept one word
						next = "<M-]>", -- Alt+] next suggestion
						prev = "<M-[>", -- Alt+[ previous suggestion
						dismiss = "<M-e>", -- Alt+e to dismiss
					},
				},
				panel = { enabled = false }, -- we use blink for the panel
				filetypes = {
					markdown = true,
					yaml = true,
					["*"] = true, -- enable for all filetypes
				},
			})
		end,
	},
}
