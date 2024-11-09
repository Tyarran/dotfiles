return {
  'akinsho/toggleterm.nvim',
  -- version = "*",
  -- opts = {
  --   direction = "float"
  -- },
  config = function()
    require("toggleterm").setup({
      start_in_insert = true,
      direction = "float",
      shade_terminals = true,
      shading_factor = -10,
      float_opts = {
        border = "curved",
        winblend = 3,
      },
      highlights = {
        NormalFloat = {
          guibg = "#1E2030"
        }
      },
      winbar = {
        enable = true
      },
      -- open_mapping = [[<C-/>]],
      on_open = function(term)
        vim.cmd("startinsert")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<S-h>", "<nop>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<S-l>", "<nop>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<A-h>", "<nop>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<A-l>", "<nop>", { noremap = true, silent = true })
      end,
      on_close = function(_term)
        vim.cmd("stopinsert")
      end
    })

    vim.keymap.set("n", "<C-_>", ":ToggleTerm<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-/>", ":ToggleTerm<CR>", { noremap = true, silent = true })
    vim.keymap.set("i", "<C-_>", "<ESC>:ToggleTerm<CR>", { noremap = true, silent = true })
    vim.keymap.set("i", "<C-/>", "<ESC>:ToggleTerm<CR>", { noremap = true, silent = true })
    vim.keymap.set("t", "<C-_>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
    vim.keymap.set("t", "<C-/>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
    vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", { noremap = true, silent = true })
    vim.keymap.set("t", "<ESC>", "<nop>", { noremap = true, silent = true })
  end
}
