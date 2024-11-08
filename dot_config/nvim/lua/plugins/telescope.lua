return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "gbrlsnchs/telescope-lsp-handlers.nvim",
      config = function()
        require('telescope').load_extension('lsp_handlers')
      end,
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },
  },
  config = function()
    require("telescope-config")
    vim.keymap.set("n", "<Leader>gf", "<cmd>Telescope git_files<cr>", { silent = true })
    vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", { silent = true })
    -- vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>p", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>b", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>d", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      { noremap = true, silent = true })
    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>",
      { noremap = true, silent = true })
    vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>",
      { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>cb", "<cmd>Telescope current_buffer_fuzzy_find<cr>",
      { noremap = true, silent = true })
  end
}
