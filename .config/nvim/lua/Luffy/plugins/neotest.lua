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
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-java")({
					-- nil = auto-download the junit standalone jar
					-- blink uses your existing jdtls+dap under the hood for debugging
					junit_jar = nil,
				}),
			},

			-- shows test results inline in the buffer as virtual text
			-- similar to IntelliJ's green checkmarks next to test methods
			icons = {
				passed = " ",
				failed = " ",
				running = " ",
				skipped = " ",
				unknown = " ",
				watching = " ",
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

		local nt = require("neotest")

		-- run the test method under the cursor
		vim.keymap.set("n", "<leader>tr", function()
			nt.run.run()
		end, { desc = "Test: Run nearest" })

		-- run all tests in the current file
		vim.keymap.set("n", "<leader>tf", function()
			nt.run.run(vim.fn.expand("%"))
		end, { desc = "Test: Run file" })

		-- debug the test under cursor — uses your existing dap setup automatically
		-- this is the equivalent of IntelliJ's "Debug" button next to a test method
		vim.keymap.set("n", "<leader>td", function()
			nt.run.run({ strategy = "dap" })
		end, { desc = "Test: Debug nearest" })

		-- stop a running test
		vim.keymap.set("n", "<leader>tS", function()
			nt.run.stop()
		end, { desc = "Test: Stop" })

		-- toggle the test summary panel (tree of all tests)
		vim.keymap.set("n", "<leader>ts", function()
			nt.summary.toggle()
		end, { desc = "Test: Toggle summary panel" })

		-- show the output of the last test run (stack trace on failure)
		vim.keymap.set("n", "<leader>to", function()
			nt.output.open({ enter = true, auto_close = true })
		end, { desc = "Test: Show output" })

		-- toggle inline output panel at the bottom
		vim.keymap.set("n", "<leader>tp", function()
			nt.output_panel.toggle()
		end, { desc = "Test: Toggle output panel" })
	end,
}
