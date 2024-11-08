local keys = {}

function keys.init()
  vim.keymap.set("n", "<C-y>", ":set hlsearch! hlsearch?<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<C-d>", ":BufferClose<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<C-d>f", ":bd!<CR>", { noremap = true, silent = true })
  vim.keymap.set("t", "<C-n><C-n>", "<C-\\><C-n>", { noremap = true, silent = true })
  vim.keymap.set("n", "<C-w>n", ":split<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>ft", ":Neotree reveal float toggle<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { noremap = true, silent = true })
end

return keys
