return {
  "mason-org/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  },
  config = function()
    require("mason").setup()
    -- require("mason-lspconfig").setup { }
    require("mason-lspconfig").setup {
      automatic_enable = {
        "lua_ls",
        "vimls",
        "bashls",
        "vue-language-server"
      }
    }
  end
}
