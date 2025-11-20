require('lazy').setup({

  -- colorscheme
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },

  -- utils/helpers
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'nvim-tree/nvim-web-devicons' },

  -- UI
  { 'akinsho/bufferline.nvim', version = '*' },
  { 'nvim-lualine/lualine.nvim' },
  { 'goolord/alpha-nvim' },
  { 'Bekaboo/dropbar.nvim' },

  -- treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' } },

  -- editing
  { 'uga-rosa/ccc.nvim' }, -- color picker
  { 'windwp/nvim-autopairs', event = 'InsertEnter' },
  { 'numToStr/Comment.nvim', lazy = false }, -- <L>gcc

  -- search & nav
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
})
