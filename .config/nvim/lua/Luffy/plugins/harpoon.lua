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
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon: Add file",
			mode = "n",
		},
		{
			"<C-m>",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Harpoon: Open menu",
			mode = "n",
		},
		{
			"<C-n>",
			function()
				local harpoon = require("harpoon")
				harpoon:list()
				harpoon:list():select(1)
			end,
			desc = "Harpoon: Slot 1",
			mode = "n",
		},
		{
			"<C-e>",
			function()
				local harpoon = require("harpoon")
				harpoon:list()
				harpoon:list():select(2)
			end,
			desc = "Harpoon: Slot 2",
			mode = "n",
		},
		{
			"<C-i>",
			function()
				local harpoon = require("harpoon")
				harpoon:list()
				harpoon:list():select(3)
			end,
			desc = "Harpoon: Slot 3",
			mode = "n",
		},
		{
			"<C-o>",
			function()
				local harpoon = require("harpoon")
				harpoon:list()
				harpoon:list():select(4)
			end,
			desc = "Harpoon: Slot 4",
			mode = "n",
		},
	},
}
