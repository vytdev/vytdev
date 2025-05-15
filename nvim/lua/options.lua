vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 4
vim.opt.colorcolumn = '80'

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
