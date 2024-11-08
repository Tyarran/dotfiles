return {
    "Exafunction/codeium.vim",
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set('i', '<C-t>', function() return vim.fn['codeium#Complete']() end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<C-J>', function() return vim.fn['codeium#Accept']() end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-c>', function() return vim.fn['codeium#Chat']() end,
        { expr = true, silent = true })
    end
  }
