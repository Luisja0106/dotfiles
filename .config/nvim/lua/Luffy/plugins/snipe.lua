return {
	"leath-dub/snipe.nvim",
	config = function()
		local snipe = require("snipe")
		snipe.setup({
			ui = {
				max_height = -1,
				buffer_format = { "filename" },
				open_win_override = {
					title = "Buffers",
				},
			},
			navigate = {
				leader = ",",
				leader_map = {
					["d"] = function(m, i)
						require("snipe").close_buf(m, i)
					end,
					["h"] = function(m, i)
						require("snipe").open_split(m, i)
					end,
					["v"] = function(m, i)
						require("snipe").open_vsplit(m, i)
					end,
				},
				cancel_snipe = "q",
				close_buffer = "D",
				open_split = "H",
				open_vsplit = "V",
			},
		})
		local keymap = vim.keymap.set
		keymap("n", "<leader>T", function()
			require("snipe").open_buffer_menu()
		end, { desc = "Open buffer Menu Popup" })
	end,
}
