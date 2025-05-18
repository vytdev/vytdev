require('catppuccin').setup({
  flavour = 'mocha',
  transparent_background = false,
  color_overrides = {
    mocha = {
      base = '#1a1a1a',
      mantle = '#121212',
      crust = '#0e0e0e',
      surface0 = '#2a2a2a',
      surface1 = '#333333',
      text = '#dddddd',
    },
  },
  integrations = {
    cmp = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    bufferline = true,
    notify = true,
    alpha = true,
    aerial = true,
    lsp_trouble = true,
    indent_blankline = { enabled = true },
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

hl(0, 'CmpSignatureActiveParameter', { fg = palette.teal, bold = true })
hl(0, 'CmpSignatureHelp', { fg = palette.text, bg = palette.surface1 })
hl(0, 'CmpSignatureHelpBorder', { fg = palette.blue })
