local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

local keymap = vim.keymap.set
-- exit modes whit jk 
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode with jk"})
keymap("v", "jk", "<ESC>", { desc = "Exit visual mode with JK"})
keymap("c", "JK", "<ESC>", { desc = "Exit command mode with JK"})
-- move lines in visual mode
keymap("v", "J",":m '>+1<CR>gv=gv", {desc = "Move lines down in visual selection" })
keymap("v", "K",":m '<-2<CR>gv=gv", {desc = "Move lines down in visual selection" })
 -- no hl
keymap("n", "<leader>nh", ":nohl<CR>", {desc = "Clear search hl" })

keymap("n", "<leader>f", vim.lsp.buf.format, {desc = " "})
-- delter character without copy in theclipboard
keymap("n", "x", '"_x', opts)
-- replace a wordl globally
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" })
--hl a text when is yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

--tab stuff
keymap("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "close tab" })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", {desc = "move to the next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", {desc = "move to previous tab" })
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", {desc = "open curren tab in a new tab" })

--split
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close curren split" })

