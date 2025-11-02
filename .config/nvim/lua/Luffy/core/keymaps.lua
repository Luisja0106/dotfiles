local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

local keymap = vim.keymap.set
-- exit modes whit jk
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap("v", "jK", "<ESC>", { desc = "Exit visual mode with JK" })
keymap("c", "JK", "<ESC>", { desc = "Exit command mode with JK" })
-- move lines in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down in visual selection" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines down in visual selection" })
-- no hl
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search hl" })

keymap("n", "<leader>f", vim.lsp.buf.format, { desc = " " })
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
