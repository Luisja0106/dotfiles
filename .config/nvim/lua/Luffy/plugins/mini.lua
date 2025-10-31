return {
  {"echasnovski/mini.nvim", version = false},
  {
    "echasnovski/mini.nvim",
    config = function()
      local MiniFiles = require("mini.files")
      MiniFiles.setup({
        mappings = {
          go_in = "<CR>",
          go_in_plus = "L",
          go_out = "-",
          go_out_plus = "H",
        },
      })
      local keymap = vim.keymap.set
      keymap("n", "<leader>es", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini explorer" })
      keymap("n", "<leader>ef", function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        MiniFiles.reveal_cwd()
      end, { desc = "Toggle into currently opened file" })
    end,
  },
}
