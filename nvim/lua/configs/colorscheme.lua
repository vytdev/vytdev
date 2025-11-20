require('catppuccin').setup({
  flavour = 'mocha',
  transparent_background = true,
  integrations = {
    telescope = true,
    treesitter = true,
    bufferline = true,
    alpha = true,
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { 'undercurl' },
        hints = { 'undercurl' },
        warnings = { 'undercurl' },
        information = { 'undercurl' },
      },
    },
  },
})

-- apply theme
vim.cmd.colorscheme('catppuccin')

-- setup other hls
local palette = require('catppuccin.palettes')
                  .get_palette(vim.g.catppuccin_flavour or 'mocha')
local hl = vim.api.nvim_set_hl

hl(0, 'DashboardHeader', { fg = palette.green })
hl(0, 'DashboardFooter', { fg = palette.subtext0 })
