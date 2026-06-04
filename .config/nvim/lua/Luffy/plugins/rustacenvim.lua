return {
	"mrcjkb/rustaceanvim",
	version = "^9",
	ft = "rust",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	init = function()
		vim.g.rustaceanvim = {
			server = {
				default_settings = {
					["rust-analyzer"] = {
						checkOnSave = { command = "clippy" },
						cargo = { allFeatures = true },
						procMacro = { enable = true },
						inlayHints = {
							parameterHints = { enable = true },
							typeHints = { enable = true },
						},
					},
				},
			},
		}
	end,
}
