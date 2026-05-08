return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")
		--obligatory
		harpoon:setup()
		--obligatory

		--keymaps
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Harpoon: Add file" })

		vim.keymap.set("n", "<C-m>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon: Open menu" })

		vim.keymap.set("n", "<C-n>", function()
			harpoon:list()
			harpoon:list():select(1)
		end, { desc = "Harpoon: Slot 1" })

		vim.keymap.set("n", "<C-e>", function()
			harpoon:list()
			harpoon:list():select(2)
		end, { desc = "Harpoon: Slot 2" })

		vim.keymap.set("n", "<C-i>", function()
			harpoon:list()
			harpoon:list():select(3)
		end, { desc = "Harpoon: Slot 3" })

		vim.keymap.set("n", "<C-o>", function()
			harpoon:list()
			harpoon:list():select(4)
		end, { desc = "Harpoon: Slot 4" })

		--aditional keymaps
		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-h>", function()
					harpoon.ui:select_menu_item({ split = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-t>", function()
					harpoon.ui:select_menu_item({ tabedit = true })
				end, { buffer = cx.bufnr })
			end,
		})
	end,
}
