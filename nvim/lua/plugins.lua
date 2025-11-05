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

  -- tools
  { 'uga-rosa/ccc.nvim' },

  -- treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' } },

  -- autocompletion, snippets, and lsp
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'L3MON4D3/LuaSnip' },
  { 'neovim/nvim-lspconfig' },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- editing convinience
  { 'windwp/nvim-autopairs', event = 'InsertEnter' },
  { 'numToStr/Comment.nvim', lazy = false },

  -- search & nav
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
})
