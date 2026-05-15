-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.relativenumber = false

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.shell = "pwsh"
opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
opt.shellquote = ""
opt.shellxquote = ""
vim.g.lazyvim_python_lsp = "ty"

vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_scroll_animation_length = 0.15
