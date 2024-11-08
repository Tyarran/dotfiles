local opts = require("nvim-opts")
opts.init()

vim.g.mapleader = ","


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

local keys = require("nvim-keys")
keys.init()

vim.cmd([[
autocmd BufReadPost *.re set filetype=reason
autocmd BufWritePre * lua vim.lsp.buf.format()
]])

-- require('onedark').load()
