return {

  -- multi-file editing convinience
  {
    'akinsho/bufferline.nvim',
    version = '*',
    config = function()
      require('bufferline').setup{
        options = {
          mode = 'buffers',
          numbers = 'none',
          separator_style = 'thin',
          always_show_bufferline = true,
        }
      }

      local map = vim.keymap.set
      map('n', '<tab>', '<cmd>BufferLineCycleNext<cr>')
      map('n', '<s-tab>', '<cmd>BufferLineCyclePrev<cr>')
    end
  },

  -- the breadcrumbs!!
  { 'Bekaboo/dropbar.nvim' },

  -- essential current context info
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
  },

  -- search & nav (i dont like tree-based ui)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local telescope = require('telescope')

      telescope.setup{
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            }
          }
        }
      }

      telescope.load_extension('fzf')

      -- essential key mappings
      local builtin = require('telescope.builtin')
      local map = vim.keymap.set
      map('n', '<leader>ff', builtin.find_files)
      map('n', '<leader>fg', builtin.live_grep)
      map('n', '<leader>fr', builtin.oldfiles)
      map('n', '<leader>fb', builtin.buffers)
      map('n', '<leader>fh', builtin.help_tags)
    end
  },
}
