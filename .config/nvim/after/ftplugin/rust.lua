local bufnr = vim.api.nvim_get_current_buf()
local function keymap(mode, key, cmd, desc)
	vim.keymap.set(mode, key, cmd, { desc = desc, silent = true, buffer = bufnr })
end

keymap("n", "<leader>vra", function()
	vim.cmd.RustLsp("codeAction")
end, "View Rust Code Actions")

keymap("n", "<leader>dc", function()
	vim.cmd.RustLsp("debuggables")
end, "View Rust Debuggables")

keymap("n", "K", function()
	vim.cmd.RustLsp("hover", "actions")
end, "View Rust Hover Actions")

keymap("n", "<leader>ca", function()
	vim.cmd.RustLsp("codeAction")
end, "View Rust Code Actions")

keymap("n", "<leader>D", function()
	vim.cmd.RustLsp("explainError")
end, "Explain Rust Error")
