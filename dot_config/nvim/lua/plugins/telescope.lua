return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "gbrlsnchs/telescope-lsp-handlers.nvim",
      config = function()
        require('telescope').load_extension('lsp_handlers')
      end,
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },
  },
  config = function()
    -- require("telescope-config")

    local actions = require("telescope.actions")
    require("telescope").load_extension('lsp_handlers')
    require("telescope").load_extension('scope')

    require("telescope").setup({
      extensions = {
        lsp_handlers = {
          disable = {},
          location = {
            telescope = {},
            no_results_message = 'No references found',
          },
          symbol = {
            telescope = {},
            no_results_message = 'No symbols found',
          },
          call_hierarchy = {
            telescope = {},
            no_results_message = 'No calls found',
          },
          code_action = {
            telescope = {},
            no_results_message = 'No code actions available',
            prefix = '',
          },
        },
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      },
      defaults = {
        layout_config = {
          prompt_position = "bottom",
        },
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        }
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        live_grep = {
          only_sort_text = true,
        },
        git_files = {
          hidden = true,
          show_untracked = true,
        },
      }
    })

    require("telescope").load_extension('fzf')

    vim.keymap.set("n", "<Leader>gf", "<cmd>Telescope git_files<cr>", { silent = true })
    vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", { silent = true })
    -- vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>p", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>b", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>d", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      { noremap = true, silent = true })
    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>",
      { noremap = true, silent = true })
    vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>",
      { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>cb", "<cmd>Telescope current_buffer_fuzzy_find<cr>",
      { noremap = true, silent = true })
  end
}
