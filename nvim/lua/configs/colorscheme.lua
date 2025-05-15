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
