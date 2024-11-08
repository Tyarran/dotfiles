return {
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
    vim.keymap.set("n", "<leader>r", "<cmd>Lspsaga incoming_calls<cr>",
      { noremap = true, silent = true })
    -- vim.keymap.set("n", "<leader>tt", "<cmd>Lspsaga term_toggle<cr>",
    --   { noremap = true, silent = true })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',   -- optional
    'nvim-tree/nvim-web-devicons',       -- optional
  }
}
