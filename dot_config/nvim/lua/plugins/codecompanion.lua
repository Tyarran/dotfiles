return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      model = "gpt-4.1"
    })
    vim.keymap.set("n", "<leader>cc", ":CodeCompanion<CR>", { noremap = false, silent = true })
    vim.keymap.set("n", "<leader>ccc", ":CodeCompanionChat<CR>", { noremap = false, silent = true })
  end
}
