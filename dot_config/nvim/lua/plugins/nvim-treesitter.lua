return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      sync_install = false,
      auto_install = true,
      ignore_install = { "" },
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>v",
          node_incremental = "<Up>",
          scope_incremental = "gnc",
          node_decremental = "<Down>",
        },
      },
    })
  end
}
