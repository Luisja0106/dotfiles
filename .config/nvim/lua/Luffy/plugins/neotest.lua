-- plugins/neotest.lua
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- Java adapter — works with JUnit 4, JUnit 5 and TestNG automatically
		"rcasia/neotest-java",
		"mrcjkb/rustaceanvim",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-java")({
					-- nil = auto-download the junit standalone jar
					-- blink uses your existing jdtls+dap under the hood for debugging
					junit_jar = nil,
				}),
				require("rustaceanvim.neotest"),
			},

			-- shows test results inline in the buffer as virtual text
			-- similar to IntelliJ's green checkmarks next to test methods
			icons = {
				passed = " ",
				failed = " ",
				running = " ",
				skipped = "󰙢 ",
				unknown = "󰀦 ",
				watching = "󰈈 ",

				expanded = " ",
				collapsed = "󰘕 ",
				child_indent = "│",
				child_prefix = "├",
				final_child_prefix = "└",
				final_child_indent = " ",
				non_collapsible = "─",

				running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
			},

			-- opens the output panel automatically when a test fails
			-- so you see the stack trace without extra keystrokes
			output = {
				open_on_run = true,
			},

			summary = {
				-- tree view of all tests, like IntelliJ's test runner panel on the left
				open = "botright vsplit | vertical resize 40",
			},
		})
	end,

	keys = {
		{
			"<leader>ur",
			function()
				require("neotest").run.run()
			end,
			desc = "Unit: Run nearest",
			mode = "n",
		},
		{
			"<leader>uf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Unit: Run file",
			mode = "n",
		},
		{
			"<leader>ud",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "Unit: Debug nearest",
			mode = "n",
		},
		{
			"<leader>uS",
			function()
				require("neotest").run.stop()
			end,
			desc = "Unit: Stop",
			mode = "n",
		},
		{
			"<leader>us",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Unit: Toggle summary",
			mode = "n",
		},
		{
			"<leader>uo",
			function()
				require("neotest").output.open({ enter = true, auto_close = true })
			end,
			desc = "Unit: Show Output",
			mode = "n",
		},
		{
			"<leader>up",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Unit: Toggle Ouput panel",
			mode = "n",
		},
	},
}
