return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        always_divide_middle = true,
        globalstatus = true,
        component_separators = '',
        section_separators = '',
        refresh = { statusline = 200, tabline = 200, winbar = 200 },
        ignore_focus = { 'TelescopePrompt' }
      },

      sections = {
        lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1,
            symbols = {
              modified = '󰏫',
              readonly = '󰏮',
              unnamed = '[No Name]',
            }
          },
          'diagnostics'
        },

        lualine_x = { 'diff', { 'branch', icon = '󰘬' } },
        lualine_y = {},
        lualine_z = { 'location' },
      }
    }
  }
}
