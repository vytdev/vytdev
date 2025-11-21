return {
  -- Neovim plugin setup

  -- essentials
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'nvim-tree/nvim-web-devicons' },

  -- editing
  { 'uga-rosa/ccc.nvim', opts = { highlighter = { auto_enable = true } } },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
  { 'numToStr/Comment.nvim' }, -- gcc

  -- colorscheme
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup{
        style = 'warmer',
        code_style = { comments = 'none' },
      }
      vim.cmd('colorscheme onedark')
    end
  },

  -- treesitter for better code parsing
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('nvim-treesitter.configs').setup{
        ensure_installed = {
          'lua', 'python', 'javascript', 'typescript', 'html',
          'css', 'bash', 'json', 'yaml', 'c', 'cpp', 'markdown',
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        }
      }
    end
  },

  -- search & nav
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Grep Files' },
      { '<leader>fr', '<cmd>Telescope oldfiles<cr>',  desc = 'Recent Files' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>',   desc = 'List Buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
    }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- UI
  {
    'akinsho/bufferline.nvim',
    version = '*',
    opts = {
      options = {
        mode = 'buffers',
        numbers = 'none',
        separator_style = 'thin',
        always_show_bufferline = true,
      }
    }
  }
}
