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

		-- <leader>u = unit test
		vim.keymap.set("n", "<leader>ur", function()
			nt.run.run()
		end, { desc = "Unit: Run nearest" })
		vim.keymap.set("n", "<leader>uf", function()
			nt.run.run(vim.fn.expand("%"))
		end, { desc = "Unit: Run file" })
		vim.keymap.set("n", "<leader>ud", function()
			nt.run.run({ strategy = "dap" })
		end, { desc = "Unit: Debug nearest" })
		vim.keymap.set("n", "<leader>uS", function()
			nt.run.stop()
		end, { desc = "Unit: Stop" })
		vim.keymap.set("n", "<leader>us", function()
			nt.summary.toggle()
		end, { desc = "Unit: Toggle summary" })
		vim.keymap.set("n", "<leader>uo", function()
			nt.output.open({ enter = true, auto_close = true })
		end, { desc = "Unit: Show output" })
		vim.keymap.set("n", "<leader>up", function()
			nt.output_panel.toggle()
		end, { desc = "Unit: Toggle output panel" })
	end,
}
