return {
  'akinsho/toggleterm.nvim',
  -- version = "*",
  -- opts = {
  --   direction = "float"
  -- },
  config = function()
    require("toggleterm").setup({
      direction = "float",
      shade_terminals = true,
      shading_factor = -10,
      float_opts = {
        border = "curved",
        winblend = 3,
      },
      highlights = {
        --   -- highlights which map to a highlight group name and a table of it's values
        --   -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        --   Normal = {
        --     guibg = "#000000",
        --   },
        NormalFloat = {
          guibg = "#1E2030"
          -- link = 'Normal'
        }
        --   -- FloatBorder = {
        --   --   guifg = "#000000",
        --   --   guibg = "#000000",
        --   -- },
      },
      winbar = {
        enable = true
      },
      -- open_mapping = [[<C-/>]],
      on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<S-h>", "<nop>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<S-l>", "<nop>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<A-h>", "<nop>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<A-l>", "<nop>", { noremap = true, silent = true })
      end
    })

    vim.keymap.set("n", "<C-_>", ":ToggleTerm<CR>", { noremap = true, silent = true })
    vim.keymap.set("i", "<C-_>", "<ESC>:ToggleTerm<CR>", { noremap = true, silent = true })
    vim.keymap.set("t", "<C-_>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
    vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", { noremap = true, silent = true })
    vim.keymap.set("t", "<ESC>", "<nop>", { noremap = true, silent = true })
  end
}
