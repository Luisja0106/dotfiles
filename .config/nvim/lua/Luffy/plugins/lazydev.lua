return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only loads when you open a lua file, zero overhead otherwise
		opts = {
			library = {
				{ "nvim-dap-ui" },
				-- loads vim API types automatically
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"Bilal2453/luvit-meta",
		lazy = true, -- provides type definitions for vim.uv (libuv bindings)
	},
}
