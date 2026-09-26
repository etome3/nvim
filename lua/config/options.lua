-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.shell = "fish"
opt.mousescroll = "ver:1,hor:1"
opt.shiftwidth = 4
opt.tabstop = 4
opt.autoindent = true
opt.expandtab = true
opt.clipboard:append("unnamedplus")
opt.updatetime = 50

vim.g.lazyvim_python_lsp = "ty"
