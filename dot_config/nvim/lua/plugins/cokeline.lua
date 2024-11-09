return {
  'willothy/nvim-cokeline',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons"
  }, -- If you want devicons
  -- config = true
  config = function()
    require('cokeline').setup({
      sidebar = {
        filetype = { 'neo-tree', 'NvimTree' },
        components = {
          {
            text = function(buf)
              return vim.bo[buf.number].filetype
            end,
            -- ...
          },
        }
      },
    })
    -- vim.keymap.set('n', '<Tab>', '<Plug>(cokeline-focus-prev)', { silent = true })
    -- vim.keymap.set('n', '<backspace>', '<Plug>(cokeline-focus-next)', { silent = true })
    vim.keymap.set('n', '<Leader>p', '<Plug>(cokeline-switch-prev)', { silent = true })
    vim.keymap.set('n', '<Leader>n', '<Plug>(cokeline-switch-next)', { silent = true })
    vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { silent = true })

    for i = 1, 9 do
      vim.keymap.set('n', ('<F%s>'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i),
        { silent = true })
      vim.keymap.set('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i),
        { silent = true })
    end
  end
}
