local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

local keymap = vim.keymap.set
-- exit modes whit jk
-- keymap("i", "sd", "<ESC>", { desc = "Exit insert mode with jk" })
-- keymap("v", "<c-c>", "<ESC>", { desc = "Exit visual mode with JK" })
-- keymap("c", "ne", "<ESC>", { desc = "Exit command mode with JK" })
-- move lines in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down in visual selection" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines down in visual selection" })
-- no hl
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search hl" })
-- delter character without copy in theclipboard
keymap("n", "x", '"_x', opts)
-- replace a wordl globally
keymap(
	"n",
	"<leader>S",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under the cursor globally" }
)
--hl a text when is yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
--yank to the clipboard
keymap("n", "Y", '"+y', { desc = "Yank to the clipboard" })
keymap("v", "Y", '"+y', { desc = "Yank to the clipboard" })

--tabs
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Create new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close a tab" })
keymap("n", "<s-l>", "<cmd>tabNext<CR>", { desc = "Move to next tab" })
keymap("n", "<s-h>", "<cmd>tabprevious<CR>", { desc = "Move to prev tab" })
--split
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make split equal size" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close curren split" })
--beter movement
keymap("n", "k", "gk", { desc = "Better movement" })
keymap("n", "j", "gj", { desc = "Better movement" })

--Toggle visibility of LSP diagnostic
local lspVisible = true
keymap("n", "<leader>lx", function()
	lspVisible = not lspVisible
	vim.diagnostic.config({
		virtual_text = lspVisible,
		underline = lspVisible,
	})
end, { desc = "Toggle Lsp diagnostic" })
--fxml options
local fxml = vim.api.nvim_create_augroup("ConfigFxml", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.fxml",
	group = fxml,
	callback = function(event)
		local cmd = "flatpak run com.gluonhq.SceneBuilder " .. vim.fn.shellescape(event.file)
		keymap("n", "<leader>sb", function()
			vim.fn.jobstart(cmd, { detach = true })
		end, {
			buffer = event.buf,
			desc = "Open sceneBuilder",
		})
	end,
})
