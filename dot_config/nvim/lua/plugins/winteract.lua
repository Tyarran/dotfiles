return {
  "romgrk/winteract.vim",
  -- cmd = "InteractiveWindow",
  config = function()
    vim.keymap.set("n", "<Leader>w", "<cmd>InteractiveWindow<cr>", { silent = true })
  end
}
