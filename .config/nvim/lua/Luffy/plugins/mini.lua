return {
  {"echasnovski/mini.nvim", version = false},
  --Comments
  {
    "echasnovski/mini.comment",
    version = false,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      
      require('ts_context_commentstring').setup{
        enable_autocmd = false,
      }
      require('mini.comment').setup{
        -- tsx, jsx, html, fxml
        options = {
          custom_commentstring = function()
            return require('ts_context_commentstring.internal').calculate_commentstring({key ='commentstring' } )
            or vim.bo.commentstring
          end,
        }
      }
    end,
  },
  --File Explorer
  {
    "echasnovski/mini.files",
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
