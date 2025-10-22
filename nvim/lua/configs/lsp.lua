local lspconfig = vim.lsp.config
local cmp = require('cmp')
local luasnip = require('luasnip')

-- setup auto-complete
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'path' },
  }),
})

-- setup lsp servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(_, bufnr)
  local map = vim.keymap.set
  map('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to def'})
  map('n', 'K',  vim.lsp.buf.hover,      { buffer = bufnr, desc = 'LSP hover'})
end

local setup_ls = function(name, opts)
  if not lspconfig[name] then return end
  opts = opts or {}
  opts.capabilities = capabilities
  opts.on_attach = on_attach
  lspconfig(name, opts)
end

-- make sure these are installed on your system
setup_ls('lua_ls')   -- lua:     lua-language-server (aur)
setup_ls('pyright')  -- python:  pyright (npm)
setup_ls('ts_ls')    -- ts:      typescript-language-server (npm)
setup_ls('taplo')    -- toml:    taplo-cli (cargo)
setup_ls('clangd', { -- c/c++:   clang
  cmd = {
      'clangd',
      '--clang-tidy',
      '--completion-style=detailed',
      '--header-insertion=never'
    }
  })

-- diagnostic settings
vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN]  = '',
      [vim.diagnostic.severity.INFO]  = '',
      [vim.diagnostic.severity.HINT]  = '',
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- add a floating diagnostic near the cursor
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
      source = 'always',
      scope = 'cursor',
      prefix = '',
    }

    -- check if there's a diagnostic at the cursor
    local line = vim.api.nvim_win_get_cursor(0)[1] - 1
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local diagnostics = vim.diagnostic.get(0, { lnum = line })
    for _, d in ipairs(diagnostics) do
      if col >= d.col and col < d.end_col then
        vim.diagnostic.open_float(nil, opts)
        return
      end
    end
  end,
})
