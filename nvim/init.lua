-- setup lua env
math.randomseed(os.time()) -- random seed

-- bootstrap and load lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('plugins')
require('options')
require('keymaps')


-- auto load scripts from lua/configs/*
local config_path = vim.fn.stdpath('config') .. '/lua/configs'

for _, file in ipairs(vim.fn.readdir(config_path)) do
  if file:match('%.lua$') then
    local module = 'configs.' .. file:gsub('%.lua$', '')
    require(module)
  end
end
