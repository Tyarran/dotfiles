return {
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
      ensure_installed = {
        "lexical",
        "bashls",
        "pyright",
        "dockerls",
        "docker_compose_language_service",
        "cssls",
        "html",
        "jsonls",
        "vimls",
        "jsonls",
        "lua_ls",
        "sqlls" }
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
}
