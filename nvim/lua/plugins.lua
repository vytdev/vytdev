require('lazy').setup({

  -- colorscheme
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },

  -- utils/helpers
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'nvim-tree/nvim-web-devicons' },

  -- UI
  { 'rcarriga/nvim-notify' },
  { 'akinsho/bufferline.nvim', version = '*' },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' },
  { 'nvim-tree/nvim-tree.lua' },
  { 'nvim-lualine/lualine.nvim' },
  { 'folke/trouble.nvim' },
  { 'goolord/alpha-nvim' },
  { 'Bekaboo/dropbar.nvim' },
  { 'stevearc/aerial.nvim' },

  -- treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' } },

  -- autocompletion & snippets
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'L3MON4D3/LuaSnip' },

  -- lsp and tools
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },

  -- editing convinience
  { 'windwp/nvim-autopairs', event = 'InsertEnter' },
  { 'numToStr/Comment.nvim', lazy = false },

  -- search & nav
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
})
