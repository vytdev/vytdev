require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    always_divide_middle = true,
    globalstatus = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    refresh = { statusline = 200, tabline = 200, winbar = 200 },
    ignore_focus = {
      'trouble', 'NvimTree', 'aerial',
      'TelescopePrompt', 'dropbar_menu'
    }
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
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
