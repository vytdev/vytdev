local map = vim.keymap.set

map('n', '<leader>t',  '<cmd>bel 20sp <BAR> startinsert' ..
           ' <BAR> term $SHELL<CR>',           { desc = 'Terminal' })
map('n', '<leader>cc', '<cmd>CccConvert<CR>',  { desc = 'Convert Color' })
map({ 'n', 'i' }, '<C-b>', '<cmd>CccPick<CR>', { desc = 'Pick Color' })

map('n', '<Tab>',   '<cmd>BufferLineCycleNext<cr>', {desc = 'Next Buffer'})
map('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {desc = 'Previous Buffer'})
-- see 'nvim/lua/configs/lsp.lua'
