return {
  {
    "tiagovla/scope.nvim",
    config = function() require("scope").setup({}) end
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        -- options = {
        --   mode = "tabs"
        -- }
      })
    end
  }
}
