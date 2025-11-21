-- generic non-plugin keymaps
local map = vim.keymap.set

map('n', '<leader>t', '<cmd>bel 20sp <bar> startinsert' ..
           ' <bar> term $SHELL<cr>')
