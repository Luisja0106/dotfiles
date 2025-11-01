return {
  "roobert/tailwindcss-colorizer-cmp.nvim",
  {
    "NvChad/nvim-colorizer.lua",
    dependencies = { "nvim-treesitter/nvim-treesitter"},
    opt = {},
    config = function()
      local nvc = require("colorizer")
      local twc = require("tailwindcss-colorizer-cmp")

      nvc.setup({
        user_default_options = {
          tailwind = true,
        },
        filetypes = { "html", "css", "javascript", "typescript", "jsx", "tsx", "vue", "svelte", "lua" },
      })
      twc.setup({
        color_square_width = 2,
      })
    end,
  }
}
