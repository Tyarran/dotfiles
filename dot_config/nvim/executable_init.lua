vim.g.mapleader = ","


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- essentials
  -- syntaxes
  {
    "nkrkv/nvim-treesitter-rescript",
    ft = "rescript"
  },
  {
    "danielo515/nvim-treesitter-reason",
    ft = "reason"
  },
  {
    "reasonml-editor/vim-reason-plus",
    ft = "reason"
  },
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup {
        nextls = { enable = true },
        credo = {},
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = false,
            enableTestLenses = false,
          },
          on_attach = function(_client, _bufnr)
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        }
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- colorscheme
  "bluz71/vim-nightfly-colors",
  "chriskempson/base16-vim",
  "catppuccin/nvim",
  "cocopon/iceberg.vim",
  "EdenEast/nightfox.nvim",
  {
    "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
    end
  },
  "folke/tokyonight.nvim",
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require('nightfox').setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          }
        }
      })
    end
  },

  -- code tools
  { "echasnovski/mini.indentscope", config = function() require("mini.indentscope").setup() end },

  {
    "monkoose/matchparen.nvim",
    config = function()
      require('matchparen').setup({
        on_startup = true,           -- Should it be enabled by default
        hl_group = 'MatchParen',     -- highlight group of the matched brackets
        augroup_name = 'matchparen', -- almost no reason to touch this unless there is already augroup with such name
        debounce_time = 100,         -- debounce time in milliseconds for rehighlighting of brackets.
      })
    end
  },
  {
    "Exafunction/codeium.vim",
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set('i', '<C-t>', function() return vim.fn['codeium#Complete']() end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<C-J>', function() return vim.fn['codeium#Accept']() end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-c>', function() return vim.fn['codeium#Chat']() end,
        { expr = true, silent = true })
    end
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        current_ligne_blame = true
      })
    end,
    event = "insertEnter",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true
      })
    end,
    event = "BufRead",
  },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
    end,
    event = "BufRead",
  },
  {
    "windwp/nvim-autopairs",
    event = "BufRead",
  },
  {
    "liuchengxu/vista.vim",
    cmd = { "Vista" },
  },
  "wakatime/vim-wakatime",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>v",
            node_incremental = "<Up>",
            scope_incremental = "gnc",
            node_decremental = "<Down>",
          },
        },
      })
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "jfpedroza/neotest-elixir",
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          require("neotest-elixir")
        }
      })
      vim.keymap.set("n", "<Leader>rt", function()
        neotest.run.run()
      end)
      vim.keymap.set("n", "<Leader>ta", function()
        neotest.run.attach({ enter = true })
      end)
      vim.keymap.set("n", "<Leader>rft", function()
        neotest.run.run(vim.fn.expand("%"))
      end)
      vim.keymap.set("n", "<Leader>to", function()
        neotest.output.open({ enter = true })
      end)
      vim.keymap.set("n", "<Leader>so", function()
        neotest.output.open({ enter = true })
        neotest.summary.open()
      end)
      vim.keymap.set("n", "<Leader>tsc", function()
        neotest.summary.close()
      end)
    end,
    ft = "elixir",
  },
  {
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-rhubarb",
    }
  },

  -- interface
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },
  {
    "romgrk/winteract.vim",
    -- cmd = "InteractiveWindow",
    config = function()
      vim.keymap.set("n", "<Leader>w", "<cmd>InteractiveWindow<cr>", { silent = true })
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({})
    end
  },
  {
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
      require("telescope-config")
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
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({})
      vim.keymap.set("n", "<Leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
    end,
    cmd = { "TroubleToggle", "Trouble" },
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        shade_terminals = true,
        auto_scroll = false,
        direction = "float",
        start_in_insert = false,
        hide_numbers = false,
        float_opts = {
          border = "double"
        }
      })
      vim.keymap.set("n", "<Leader>tf", "<cmd>ToggleTerm direction=float<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "<Leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "<Leader>tt", "<cmd>ToggleTerm direction=tab<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "<Leader>to", "<cmd>ToggleTerm<cr>", { silent = true, noremap = true })
      vim.keymap.set("v", "<Leader>tt", "<cmd>ToggleTermSendVisualSelection<cr>", { silent = true, noremap = true })
      vim.keymap.set("x", "<Leader>tt", "<cmd>ToggleTermSendVisualLines<cr>", { silent = true, noremap = true })
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })
      local btop     = Terminal:new({ cmd = "btop", hidden = true })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      function _btop_toggle()
        btop:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>bt", "<cmd>lua _btop_toggle()<CR>", { noremap = true, silent = true })
    end
  },
  -- {
  --   'rebelot/terminal.nvim',
  --   config = function()
  --     require("terminal").setup()
  --     local term_map = require("terminal.mappings")
  --     vim.keymap.set({ "n", "x" }, "<leader>ts", term_map.operator_send, { expr = true })
  --     vim.keymap.set("n", "<leader>to", term_map.toggle)
  --     vim.keymap.set("n", "<leader>tO", term_map.toggle({ open_cmd = "enew" }))
  --     vim.keymap.set("n", "<leader>tr", term_map.run)
  --     vim.keymap.set("n", "<leader>tR", term_map.run(nil, { layout = { open_cmd = "enew" } }))
  --     vim.keymap.set("n", "<leader>tk", term_map.kill)
  --     vim.keymap.set("n", "<leader>t]", term_map.cycle_next)
  --     vim.keymap.set("n", "<leader>t[", term_map.cycle_prev)
  --     vim.keymap.set("n", "<leader>tl", term_map.move({ open_cmd = "belowright vnew" }))
  --     vim.keymap.set("n", "<leader>tL", term_map.move({ open_cmd = "botright vnew" }))
  --     vim.keymap.set("n", "<leader>th", term_map.move({ open_cmd = "belowright new" }))
  --     vim.keymap.set("n", "<leader>tH", term_map.move({ open_cmd = "botright new" }))
  --     vim.keymap.set("n", "<leader>tf", term_map.move({ open_cmd = "float" }))
  --   end
  -- },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  -- {
  {
    'willothy/nvim-cokeline',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons"
    }, -- If you want devicons
    -- config = true
    config = function()
      require('cokeline').setup({
        sidebar = {
          filetype = { 'neo-tree', 'NvimTree' },
          components = {
            {
              text = function(buf)
                return vim.bo[buf.number].filetype
              end,
              -- ...
            },
          }
        },
      })
      vim.keymap.set('n', '<Tab>', '<Plug>(cokeline-focus-prev)', { silent = true })
      vim.keymap.set('n', '<backspace>', '<Plug>(cokeline-focus-next)', { silent = true })
      vim.keymap.set('n', '<Leader>p', '<Plug>(cokeline-switch-prev)', { silent = true })
      vim.keymap.set('n', '<Leader>n', '<Plug>(cokeline-switch-next)', { silent = true })
      vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { silent = true })

      for i = 1, 9 do
        vim.keymap.set('n', ('<F%s>'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i),
          { silent = true })
        vim.keymap.set('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i),
          { silent = true })
      end
    end
  },
  -- {
  --   "edluffy/hologram.nvim",
  --   config = function()
  --     require('hologram').setup {
  --       auto_display = false         -- WIP automatic markdown image display, may be prone to breaking
  --     }
  --   end
  -- },
  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    config = true, -- default settings
    -- you can specify also another config if you want
    config = function()
      require("gx").setup {
        open_browser_app = "xdg-open", -- specify your browser app; default for macos is "open" and for linux "xdg-open"
        handlers = {
          plugin = true,               -- open plugin links in lua (e.g. packer, lazy, ..)
          github = true,               -- open github issues
        },
      }
    end,
  },
  -- {
  --   "folke/twilight.nvim",
  --   config = function()
  --     require("twilight").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end
  -- },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      -- Keymaps
      vim.keymap.set("n", "<leader>hm", function() harpoon:list():add() end)
      vim.keymap.set("n", "<leader>hl", function() toggle_telescope(harpoon:list()) end,
        { desc = "Open harpoon window" })
    end
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- {
      -- 	"SmiteshP/nvim-navbuddy",
      -- 	dependencies = {
      -- 		"SmiteshP/nvim-navic",
      -- 		"MunifTanjim/nui.nvim"
      -- 	},
      -- 	opts = { lsp = { auto_attach = true } }
      -- }
    },
    config = function()
      -- vim.keymap.set("n", "<Leader>nn", require('nvim-navbuddy').open,
      -- { silent = true, noremap = true })
    end
    -- your lsp config or other stuff
  },

  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        ui = {
          enable = false,
          sign = false
        },
        lightbulb = {
          sign = false
        }
      })

      vim.keymap.set("n", "<leader>h", "<cmd>Lspsaga hover_doc<cr>",
        { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<cr>",
        { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>f", "<cmd>Lspsaga finder<cr>",
        { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<cr>",
        { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>en", "<cmd>Lspsaga diagnostic_jump_next<cr>",
        { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>",
        { noremap = true, silent = true })
      -- vim.keymap.set("n", "<leader>tt", "<cmd>Lspsaga term_toggle<cr>",
      --   { noremap = true, silent = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    }
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mhartington/formatter.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig"
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = { "elixirls", "bashls",
          "pyright", "dockerls",
          "docker_compose_language_service", "cssls", "html", "jsonls", "vimls", "jsonls",
          "lua_ls", "sqlls" }
      }
      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["rust_analyzer"] = function()
          require("rust-tools").setup {}
        end

        -- ["lua_ls"] = function()
        --
        -- 	-- require("rust-tools").setup {}
        -- end
      }
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { noremap = true, silent = true })
      -- vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover,
      --   { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>s", vim.lsp.buf.signature_help, { noremap = true, silent = true })
      -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
      vim.keymap.set({ "n", "v" }, "<leader>r", vim.lsp.buf.references,
        { noremap = true, silent = true, buffer = true })
      vim.keymap.set("n", "<leader>t", vim.lsp.buf.document_symbol, { noremap = true, silent = true })
      -- vim.keymap.set({ "n", "v" }, "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true })
      -- vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, { noremap = true, silent = true })
    end
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta",         lazy = true }, -- optional `vim.uv` typings
  -- {                                        -- optional completion source for require statements and module annotations
  --     "hrsh7th/nvim-cmp",
  --     opts = function(_, opts)
  --         opts.sources = opts.sources or {}
  --         table.insert(opts.sources, {
  --             name = "lazydev",
  --             group_index = 0, -- set group index to 0 to skip loading LuaLS completions
  --         })
  --     end,
  -- },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "neovim/nvim-lspconfig",
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      "hrsh7th/cmp-emoji",
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      -- "molleweide/LuaSnip-snippets.nvim",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("nvim-cmp-config")
    end,
    event = "BufRead"
  },

  -- others
  {
    "epwalsh/obsidian.nvim",
    config = function()
      require("obsidian").setup({
        dir = "~/Documents/rcommande",
        -- Optional, key mappings.
        mappings = {
          -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
          ["gr"] = {
            action = function()
              return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
          },
        },

        -- Optional, if set to true, the specified mappings in the `mappings`
        -- table will overwrite existing ones. Otherwise a warning is printed
        -- and the mappings are not applied.
        -- overwrite_mappings = false,
        --
        new_notes_location = "current_dir",
        -- Optional, completion.
        completion = {
          -- If using nvim-cmp, otherwise set to false
          nvim_cmp = true,
          -- Trigger completion at 2 chars
          min_chars = 2,
          -- Where to put new notes created from completion. Valid options are
          --  * "current_dir" - put new notes in same directory as the current buffer.
          --  * "notes_subdir" - put new notes in the default notes subdirectory.

          -- Whether to add the output of the node_id_func to new notes in autocompletion.
          -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
          -- prepend_note_id = true
        },
      })
      vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>oqs", ":ObsidianQuickSwitch<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>on", ":ObsidianNew ", { noremap = true })
    end,
  },
  {
    "rhysd/vim-grammarous"
  },
  {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end
  },
  {
    'junegunn/fzf.vim'
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
-- vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ft", ":Neotree reveal toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { noremap = true, silent = true })

-- local options = { }

-- vim.opt = { table.unpack(vim.opt or {}), tale.unpack(options) }
-- vim.opt = options
vim.opt.ai = true
vim.opt.background = "dark"
-- vim.opt.clipboard=unnamedplus
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ic = true
-- vim.opt.Insensitive case
vim.opt.inccommand = "nosplit"
vim.opt.incsearch = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.smartindent = true
vim.opt.smartcase = true
-- vim.opt.t_Co = 256
vim.opt.wrap = true
vim.opt.termguicolors = true
vim.opt.relativenumber = false

-- filetype indent on
-- filetype on
-- filetype plugin on
--
-- colorscheme tokyonight-moon
-- colorscheme tokyonight-night
-- imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
-- let g:copilot_no_tab_map = v:true
-- colorscheme nightfly
-- colorscheme tokyonight
-- colorscheme catppuccin-mocha
vim.cmd([[

set clipboard+=unnamedplus
set completeopt=menu,menuone,noselect

colorscheme tokyonight

"Keybindings
nmap <C-y> :set hlsearch! hlsearch?<CR>
nnoremap <C-d> :BufferClose<CR>
nnoremap <C-d>f :bd!<CR>
tnoremap <C-n><C-n> <C-\><C-n>
nmap m [m
nmap M ]m
vmap m [m
vmap M ]m
nnoremap <C-w>n :split<CR>

" aliases
autocmd BufReadPost *.re set filetype=reason
autocmd BufWritePre * lua vim.lsp.buf.format()
]])

-- require('onedark').load()
