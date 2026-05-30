return {
	"saghen/blink.cmp",
	-- blink.cmp requires NO extra dependencies for Tailwind — it's built-in.
	-- friendly-snippets gives us a big library of VSCode-style snippets.
	dependencies = {
		"rafamadriz/friendly-snippets",
		"fang2hou/blink-copilot",
		"zbirenbaum/copilot.lua",
	},
	-- Use the latest stable release (pre-built Rust binaries).
	-- The fuzzy matcher is compiled in Rust — that's the main speed win over nvim-cmp.
	version = "*",

	-- opts_extend lets lazy.nvim merge this list if other plugins add sources.
	-- For example, lazydev.nvim adds "lazydev" to sources.default automatically.
	opts_extend = { "sources.default" },

	opts = {

		-- Remove cmd autocompletions
		cmdline = {
			completion = {
				menu = {
					auto_show = true,
				},
			},
			keymap = {
				preset = "inherit",
				["C-i"] = { "select_and_accept", "fallback" },
				["C-k"] = { "select_prev", "fallback" },
				["C-j"] = { "select_next", "fallback" },
				["<CR>"] = false,
			},
		},

		-- ─── 1. SNIPPETS ─────────────────────────────────────────────────────────
		-- blink has built-in support for vim.snippet (Neovim 0.10+).
		-- The "default" preset uses vim.snippet under the hood.
		-- You do NOT need to define expand manually.
		snippets = { preset = "default" },

		-- ─── 2. KEYMAPS ──────────────────────────────────────────────────────────
		-- blink's keymap system works differently from nvim-cmp.
		-- Each key maps to an ORDERED LIST of commands.
		-- blink runs them left-to-right and stops at the first one that succeeds.
		-- "fallback" = run whatever Neovim/other plugin had mapped to this key.
		-- "fallback_to_mappings" = same but skip built-in Neovim behavior.
		keymap = {
			-- preset = "none" means we define ALL keymaps ourselves.
			-- No defaults will be added. Good for full control.
			preset = "none",

			-- Show the completion menu manually, or toggle docs if menu is open.
			["<C-q>"] = { "show", "show_documentation", "hide_documentation" },

			-- Close the completion menu without inserting anything.
			["<C-e>"] = { "hide", "fallback" },

			-- Accept the currently selected item.
			-- "accept" only works if an item is selected.
			-- "fallback" inserts a normal <CR> if no item is selected.
			["<CR>"] = { "accept", "fallback" },

			-- <C-i> as alternative confirm (you had this in nvim-cmp).
			["<C-i>"] = { "accept", "fallback" },

			-- Navigate the list — multiple bindings for the same action.
			-- select_next / select_prev move through the completion items.
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback_to_mappings" },
			["<C-p>"] = { "select_prev", "fallback_to_mappings" },
			["<Down>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },

			-- Scroll the DOCUMENTATION popup (not the list).
			-- NOTE: <C-b> = scroll UP, <C-f> = scroll DOWN — same as your nvim-cmp config.
			-- Your draft had these REVERSED — this is the correct mapping.
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			-- <Tab>: Smart behavior matching your old nvim-cmp config.
			-- 1. If a snippet is active and has a next placeholder → jump forward.
			-- 2. If the menu is visible → select next item.
			-- 3. Otherwise → open the completion menu (fallback triggers it).
			["<Tab>"] = {
				-- This function receives the blink.cmp API as `cmp`.
				-- It must return `true` to stop processing, or nil/false to continue.
				function(cmp)
					-- If we're inside a snippet with a next jump point, jump there.
					if cmp.snippet_active({ direction = 1 }) then
						return cmp.snippet_forward()
					end
					-- If the menu is visible, select the next item.
					if cmp.is_visible() then
						return cmp.select_next()
					end
					-- Returning nil/false means: continue to the next command.
				end,
				-- If "show" also fails (e.g., nothing to complete), run the normal <Tab>.
				"fallback",
			},

			-- <S-Tab>: Mirror of <Tab> but going backward.
			["<S-Tab>"] = {
				function(cmp)
					if cmp.snippet_active({ direction = -1 }) then
						return cmp.snippet_backward()
					end
					if cmp.is_visible() then
						return cmp.select_prev()
					end
				end,
				"fallback",
			},
		},

		-- ─── 3. APPEARANCE ───────────────────────────────────────────────────────
		appearance = {
			-- Makes blink fall back to nvim-cmp's highlight groups if your colorscheme
			-- doesn't define blink-specific ones (BlinkCmpKind*, etc.).
			-- Useful during transition. You can remove this once your theme supports blink.
			use_nvim_cmp_as_default = true,

			-- "mono" adjusts icon spacing for Nerd Font Mono fonts.
			-- Use "normal" if you use a proportional Nerd Font.
			nerd_font_variant = "mono",

			-- These are your exact icons from the old config, carried over.
			kind_icons = {
				Text = " ",
				Method = " ",
				Function = " ",
				Constructor = " ",
				Field = " ",
				Variable = " ",
				Class = " ",
				Interface = " ",
				Module = " ",
				Property = " ",
				Unit = " ",
				Value = " ",
				Enum = " ",
				Keyword = " ",
				Snippet = "󱄽 ",
				Color = " ",
				File = " ",
				Reference = " ",
				Folder = " ",
				EnumMember = " ",
				Constant = " ",
				Struct = " ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
			},
		},

		-- ─── 4. SOURCES ──────────────────────────────────────────────────────────
		-- These are blink's built-in sources — no extra plugins needed.
		-- "lsp"      → Language server completions (replaces cmp-nvim-lsp)
		-- "path"     → File system paths (replaces cmp-path)
		-- "snippets" → Snippet engine completions (replaces cmp_luasnip)
		-- "buffer"   → Words from current buffer (replaces cmp-buffer)
		sources = {
			default = { "lazydev", "copilot", "lsp", "path", "snippets", "buffer" },
			per_filetype = {
				sql = { "dadbod", "buffer" },
				mysql = { "dadbod", "buffer" },
				mariadb = { "dadbod", "buffer" },
			},
			providers = {
				copilot = {
					name = "Copilot",
					module = "blink-copilot",
					score_offset = 90, -- high priority, just below lazydev
					async = true,
					opts = { name = "copilot" },
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				dadbod = {
					name = "Dadbod",
					module = "vim_dadbod_completion.blink",
				},
			},
		},

		-- ─── 5. COMPLETION WINDOW ─────────────────────────────────────────────────
		completion = {
			-- Ghost text: shows the top completion inline as you type.
			-- This was your `experimental.ghost_text = true` in nvim-cmp.
			ghost_text = { enabled = true },

			-- The completion list behavior.
			list = {
				selection = {
					-- Don't auto-select the first item — user must navigate to select.
					-- This matches your old `noinsert` completeopt behavior.
					preselect = false,
					-- Don't auto-insert the selected text until the user confirms.
					auto_insert = false,
				},
			},

			-- The dropdown menu window.
			menu = {
				-- Rounded border — matches your old nvim-cmp window style.
				border = "rounded",

				-- How columns are laid out in the menu.
				-- kind_icon | label + description | kind name
				-- This replaces your lspkind formatting.
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "kind" },
					},
					-- Use treesitter to highlight label text (replaces lspkind's maxwidth).
					treesitter = { "lsp" },
				},
			},

			-- The documentation popup that appears next to the menu.
			documentation = {
				-- Show docs automatically when navigating the list.
				auto_show = true,
				auto_show_delay_ms = 300,

				-- The documentation window settings.
				window = {
					border = "rounded",
				},
			},
		},

		-- ─── 6. SIGNATURE HELP ───────────────────────────────────────────────────
		-- Shows function signature while you type arguments.
		-- This was not in your nvim-cmp config but is a great addition.
		signature = {
			enabled = true,
			window = { border = "rounded" },
		},
	},
	event = "InsertEnter",
}
