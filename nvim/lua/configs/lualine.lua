require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    always_divide_middle = true,
    globalstatus = true,
    component_separators = '',
    section_separators = { left = '', right = '' },
    refresh = { statusline = 200, tabline = 200, winbar = 200 },
    ignore_focus = {
      'trouble', 'NvimTree', 'aerial',
      'TelescopePrompt', 'dropbar_menu'
    }
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_x = { 'diff' },
    lualine_y = { 'encoding' },
    lualine_z = { 'location' },
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = '',
          readonly = '',
          unnamed = '[No Name]',
        }
      },
      'fileformat', 'diagnostics'
    },
  },

  extensions = {
    {
      filetypes = { 'alpha' },
      sections = {
        lualine_c = { require('splash').get_splash },
      }
    }
  }
})
