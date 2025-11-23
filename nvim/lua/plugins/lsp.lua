return {
  -- Mason - LSP Installer
  {
    'williamboman/mason.nvim',
    config = true
  },

  -- Mason LSP config
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'lua_ls', 'pyright', 'ts_ls' },
      -- use system-wide clangd
      automatic_installation = true
    }
  },

  -- LSP config
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = vim.lsp.config

      -- nvim cmp integration
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local setup_ls = function(name, opts)
        if not lspconfig[name] then return end
        opts = opts or {}
        opts.capabilities = capabilities
        lspconfig(name, opts)
        vim.lsp.enable(name)
      end

      -- setup language servers
      setup_ls('lua_ls')
      setup_ls('pyright')
      setup_ls('ts_ls')
      setup_ls('clangd', { cmd = { -- use the system wide installation
          'clangd', '--clang-tidy', '--completion-style=detailed',
          '--header-insertion=never'
        }})

      -- setup keybindings on lsp attach
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          -- only set these keys to the lsp buff
          local map = function(mode, key, func)
            vim.keymap.set(mode, key, func, { buffer = args.buf })
          end

          -- setup keymaps
          if client.server_capabilities.hoverProvider then
            map('n', 'K', vim.lsp.buf.hover)
          end
          map('n', 'gd', vim.lsp.buf.definition)
          map('n', 'gr', vim.lsp.buf.references)
          map('n', '<leader>rn', vim.lsp.buf.rename)
        end,
      })

      -- configure diagnostics
      vim.diagnostic.config({
        virtual_text = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚',
            [vim.diagnostic.severity.WARN]  = '󰀪',
            [vim.diagnostic.severity.INFO]  = '󰋽',
            [vim.diagnostic.severity.HINT]  = '󰌶',
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp' -- ensure this loads before lspconfig
    }
  },

  -- completion engine
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup{
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        },
        mapping = cmp.mapping.preset.insert{
          ['<c-space>'] = cmp.mapping.complete(),
          ['<tab>'] = cmp.mapping.confirm({ select = true }),
        }
      }
    end
  }
}
