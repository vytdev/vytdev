local map = vim.keymap.set

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files,   { desc = 'Find Files' })
map('n', '<leader>fg', builtin.live_grep,    { desc = 'Grep Files' })
map('n', '<leader>fr', builtin.oldfiles,     { desc = 'Recent Files' })
map('n', '<leader>fb', builtin.buffers,      { desc = 'List Buffers' })
map('n', '<leader>fh', builtin.help_tags,    { desc = 'Help Tags' })

local dropb = require('dropbar.api')
map('n', '<leader>;', dropb.pick,         { desc = 'Pick symbols in winbar' })
map('n', '[;', dropb.goto_context_start,  { desc = 'Goto start of curr ctx' })
map('n', '];', dropb.select_next_context, { desc = 'Select next ctx' })

map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle focus=false ' ..
                       'filter.buf=0<CR>',          { desc = 'Diagnostics'})
map('n', '<leader>t',  '<cmd>bel 20sp <BAR> startinsert <BAR> term $SHELL<CR>',
         { desc = 'Terminal' })

map('n', '<leader>e',  '<cmd>NvimTreeToggle<CR>',   { desc = 'Tree' })
map('n', '<leader>a',  '<cmd>AerialToggle!<CR>',    { desc = 'Symbols' })

map('n', '<Tab>',      '<cmd>BufferLineCycleNext<CR>', { desc = 'Next Buff' })
map('n', '<S-Tab>',    '<cmd>BufferLineCyclePrev<CR>', { desc = 'Prev Buff' })
map('n', '<leader>bd', '<cmd>bdelete<CR>',             { desc = 'Rmov Buff' })

-- see 'nvim/lua/configs/lsp.lua'
