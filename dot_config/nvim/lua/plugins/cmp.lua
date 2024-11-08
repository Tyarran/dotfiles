return {
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
}
