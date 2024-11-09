local opts = {}

function opts.init()
  vim.opt.ai = true
  vim.opt.background = "dark"
  vim.opt.cursorline = true
  vim.opt.hidden = true
  vim.opt.hlsearch = true
  vim.opt.ic = true
  vim.opt.inccommand = "nosplit"
  vim.opt.incsearch = true
  vim.opt.mouse = "a"
  vim.opt.number = true
  vim.opt.smartindent = true
  vim.opt.smartcase = true
  vim.opt.wrap = true
  vim.opt.termguicolors = true
  vim.opt.relativenumber = false
  vim.opt.clipboard = 'unnamedplus'
end

return opts
