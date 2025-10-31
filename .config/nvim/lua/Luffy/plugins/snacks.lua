return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- === GENERAL OPTIONS ===
      indent = { enabled = true },
      input = { enabled = true },

      -- === QUICKFILE ===
      quickfile = {
        enabled = true,
        exclude = { "latex" },
      },

      -- === PICKER OPTIONS ===
      picker = {
        enabled = true,
        matchers = {
          frecency = true,
          cwd_bonus = false,
        },
        exclude = {
          ".git",
          "node_modules",
          "dist",
          "build",
        },
        formatters = {
          file = {
            filename_first = true,
            filename_only = false,
            icon_width = 2,
          },
        },
        layout = {
          preset = "telescope",
          cycle = false,
        },
        layouts = {
          select = {
            preview = false,
            layout = {
              backdrop = false,
              width = 0.6,
              min_width = 80,
              height = 0.4,
              min_height = 10,
              box = "vertical",
              border = "rounded",
              title = "{title}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
              { win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
            },
          },
          telescope = {
            reverse = true,
            layout = {
              box = "horizontal",
              backdrop = false,
              width = 0.8,
              height = 0.9,
              border = "none",
              {
                box = "vertical",
                { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
              },
              {
                win = "preview",
                title = "{preview:Preview}",
                width = 0.50,
                border = "rounded",
                title_pos = "center",
              },
            },
          },
          ivy = {
            layout = {
              box = "vertical",
              backdrop = false,
              width = 0,
              height = 0.4,
              position = "bottom",
              border = "top",
              title = " {title} {live} {flags}",
              title_pos = "left",
              { win = "input", height = 1, border = "bottom" },
              {
                box = "horizontal",
                { win = "list", border = "none" },
                { win = "preview", title = "{preview}", width = 0.5, border = "left" },
              },
            },
          },
        },
      },

      -- === DASHBOARD ===
      dashboard = require("Luffy.config_Plugins.dashboard"),
    },

    -- === KEYMAPS ===
    keys = {
      -- Git
      { "<leader>lg",  function() require("snacks").lazygit() end,               desc = "Lazygit" },
      { "<leader>gl",  function() require("snacks").lazygit.log() end,           desc = "Lazygit logs" },

      -- Explorer / Buffers
      { "<leader>dB",  function() require("snacks").bufdelete() end,             desc = "Delete or Close Buffer (Confirm)" },

      -- Picker (Files, Grep, etc.)
      { "<leader>pf",  function() require("snacks").picker.files() end,          desc = "Find files (Snacks picker)" },
      { "<leader>ps",  function() require("snacks").picker.grep() end,           desc = "Grep word" },
      { "<leader>pws", function() require("snacks").picker.grep_word() end,      desc = "Search visual selection or word", mode = { "n", "x" } },
      { "<leader>pk",  function() require("snacks").picker.keymaps({ layout = "ivy" }) end, desc = "Search keymaps" },

      -- Utility Pickers
      { "<leader>gbr", function() require("snacks").picker.git_branches({ layout = "select" }) end, desc = "Pick and Switch Git Branches" },
      { "<leader>th",  function() require("snacks").picker.colorschemes({ layout = "ivy" }) end,    desc = "Pick color Schemes" },
      { "<leader>vh",  function() require("snacks").picker.help() end,          desc = "Help pages" },
    },
  },
  {
    "folke/todo-comments.nvim",
    event ={"BufReadPre", "BufNewFile"},
    keys = {
      {"<leader>pt", function() require("snacks").picker.todo_comments() end, desc = "Todo" },
      {"<leader>pT", function() require("snacks").picker.todo_comments({ keywords = {"TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    }
  }
}

