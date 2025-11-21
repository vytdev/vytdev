return {
  -- Neovim plugin setup

  -- essentials
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'nvim-tree/nvim-web-devicons' },

  -- editing
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
  { 'numToStr/Comment.nvim' }, -- gcc

  -- editing: color picker
  {
    'uga-rosa/ccc.nvim',
    config = function()
      require('ccc').setup{
        highlighter = {
          auto_enable = true
        }
      }

      local map = vim.keymap.set
      map('n', '<leader>cc', '<cmd>CccConvert<cr>')
      map({ 'n', 'i' }, '<c-b>', '<cmd>CccPick<cr>')
    end
  },

  -- colorscheme
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup{
        style = 'warmer',
        code_style = { comments = 'none' },
      }
      vim.cmd.colorscheme('onedark')
    end
  },

  -- treesitter for better code parsing and analysis
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
}
