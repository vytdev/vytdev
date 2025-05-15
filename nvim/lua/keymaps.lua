local map = vim.keymap.set
local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files,   { desc = "Find Files" })
map("n", "<leader>fg", builtin.live_grep,    { desc = "Grep Files" })
map("n", "<leader>fb", builtin.buffers,      { desc = "List Buffers" })
map("n", "<leader>fh", builtin.help_tags,    { desc = "Help Tags" })

map("n", "<leader>xx", "<cmd>Trouble diagnostics<CR>", { desc = "Diagnostics"})
map("n", "<leader>e" , "<cmd>NvimTreeToggle<CR>",      { desc = "Tree" })

map('n', '<Tab>',      '<cmd>BufferLineCycleNext<CR>', { desc = "Next Buff" })
map('n', '<S-Tab>',    '<cmd>BufferLineCyclePrev<CR>', { desc = "Prev Buff" })
map('n', '<leader>bd', '<cmd>bdelete<CR>',             { desc = "Rmov Buff" })

require("lsp-zero").on_attach(function(_, bufnr)
  map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
  map("n", "K",  vim.lsp.buf.hover,      { buffer = bufnr })
end)
