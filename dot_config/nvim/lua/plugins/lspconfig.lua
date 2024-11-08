return {
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
}
