return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets", -- ¡Tus snippets vitales para Java!
	version = "*", -- Usa la última versión estable
	opts = {
		-- Usar el motor nativo de Neovim para snippets (0.10+)
		snippets = {
			expand = function(snippet)
				vim.snippet.expand(snippet)
			end,
		},

		-- Configuración de teclas (Ajustada para Colemak-DH)
		keymap = {
			preset = "default",
			-- Si prefieres usar tus teclas de movimiento mnei, puedes mapear aquí:
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" }, -- 'e' es fácil en Colemak-DH
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = true, -- Mantiene los iconos que ya conoces
			nerd_font_variant = "mono",
		},

		-- Fuentes de datos
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
}
