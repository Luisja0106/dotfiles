return {
  "folke/which-key.nvim",
  dependencies = {"nvim-tree/nvim-web-devicons", "nvim-mini/mini.icons"},
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 1000
  end,
  opts = {
    preset = "helix",
    spec = {
      mode = {"n", "x"},
      --Single keybindings
     { "<leader>S", icon = " "},
     { "<leader>u", icon = " "},
      --tabs
      { "<leader>t", group = "tabs" },
      { "<leader>to",icon = " "},
      { "<leader>tx",icon = "󱀷 "},
      --color scheme
      { "<leader>c",group = "Color Scheme", icon = " "},
      { "<leader>cs",icon = " "},
      { "<leader>csp",icon = " "},
      --split
      { "<leader>s", group = "split", icon = " " },
      { "<leader>sh",icon = " "},
      { "<leader>sv",icon = " "},
      { "<leader>sm",icon = "󱐪 "},
      { "<leader>sx",icon = "󰅖 "},
      --file Manager
      { "<leader>e", group = "File Manager", icon = " " },
      { "<leader>ee",icon = "  "},
      { "<leader>ef",icon = "  "},
      { "<leader>ec",icon = "  "},
      { "<leader>es",icon = "  "},
      --Git
      { "<leader>g", group = "Git" },
      { "<leader>gB",icon = " "},
      { "<leader>gd",icon = " "},
      { "<leader>gD",icon = " "},
      { "<leader>gp",icon = "󰡫 "},
      { "<leader>gr",icon = "󰦛 "},
      { "<leader>gR",icon = "󰦛 "},
      { "<leader>gu",icon = "󰕌 "},
      { "<leader>gs",icon = "󰊢 "},
      { "<leader>gS",icon = "󰊢 "},
      { "<leader>gL",icon = "󰊢 "},
      { "<leader>gb", group = "Blame/Branch" },
      -- Restore Session
      { "<leader>w", group = "Restore Session" },
      -- Picker
      { "<leader>p", group = "Picker", icon = "󰈞 " },
      { "<leader>pf",icon = "󰈞 " },
      { "<leader>pk",icon = "󰌌 " },
      { "<leader>ps",icon = " " },
      { "<leader>pw", group = "Pick Word", icon = " " },
      { "<leader>pws",icon = " " },
      { "<leader>pwS",icon = " " },
      --negation 
      { "<leader>n", group = "Negation", icon = " " },
      { "<leader>nh",icon = "󰸱 " },
      --delete
      { "<leader>d", group = "Delete", icon = " " },
      { "<leader>dB",icon = " " },
      --visualize
      { "<leader>v", group = "Visualize", icon = "󰈈 "},
      { "<leader>vh", icon = "󰋖 "},

    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false})
      end,
      desc = "Buffer Local Keymaps (which-key)"
    },
  },
}
