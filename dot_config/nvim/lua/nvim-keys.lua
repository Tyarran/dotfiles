local keys = {}

function keys.init()
  vim.keymap.set("n", "<C-y>", ":set hlsearch! hlsearch?<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<C-d>f", ":bd!<CR>", { noremap = true, silent = true })
  -- vim.keymap.set("t", "<C-n><C-n>", "<C-\\><C-n>", { noremap = true, silent = true })
  vim.keymap.set("n", "<C-w>n", ":split<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { noremap = true, silent = true })

  -- tab
  vim.keymap.set("n", "<A-h>", ":tabprevious<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<A-l>", ":tabnext<cr>", { noremap = true, silent = true })

  -- buffers
  vim.keymap.set("n", "<S-h>", ":bprevious<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<S-l>", ":bnext<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<S-d>", ":BufferClose<CR>", { noremap = true, silent = true })

  vim.keymap.set("n", "<S-Up>", "<CMD>resize +2<CR>", { desc = "Increase window height", silent = true })
  vim.keymap.set("n", "<S-Down>", "<CMD>resize -2<CR>", { desc = "Decrease window height", silent = true })
  vim.keymap.set("n", "<S-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease window width", silent = true })
  vim.keymap.set("n", "<S-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase window width", silent = true })
end

return keys
