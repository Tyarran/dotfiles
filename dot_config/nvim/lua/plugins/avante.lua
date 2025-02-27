return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- add any opts here
    provider = "copilot"
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      "zbirenbaum/copilot.lua",    -- for providers='copilot'
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          panel = {
            enabled = false,
            auto_refresh = true,
            keymap = {
              jump_prev = "[[",
              jump_next = "]]",
              accept = "<C-J>",
              refresh = "gr",
              open = "<M-CR>"
            },
            layout = {
              position = "vertical", -- | top | left | right | horizontal | vertical
              ratio = 0.4
            },
          },
          suggestion = {
            enabled = false,
            auto_trigger = false,
            hide_during_completion = true,
            debounce = 75,
            keymap = {
              accept = "<M-l>",
              accept_word = false,
              accept_line = false,
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = "<C-]>",
            },
          },
          -- filetypes = {
          --   yaml = false,
          --   markdown = false,
          --   help = false,
          --   gitcommit = false,
          --   gitrebase = false,
          --   hgcommit = false,
          --   svn = false,
          --   cvs = false,
          --   ["."] = false,
          -- },
          copilot_node_command = 'node', -- Node.js version must be > 18.x
          server_opts_overrides = {},
        })
      end,
    },
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  config = function()
    vim.keymap.set("n", "<Leader>av", "<cmd>AvanteToggle<cr>", { silent = true })
  end
}
