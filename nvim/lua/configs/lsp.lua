local lspconfig = require('lspconfig')
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
  }),
})

-- setup lsp servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(_, bufnr)
  local map = vim.keymap.set
  map('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
  map('n', 'K',  vim.lsp.buf.hover,      { buffer = bufnr })
end

local setup_ls = function(name)
  lspconfig[name].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- make sure these are installed on your system
setup_ls('lua_ls')   -- lua:     lua-language-server (aur)
setup_ls('pyright')  -- python:  pyright (npm)
setup_ls('ts_ls')    -- ts:      typescript-language-server (npm)
setup_ls('clangd')   -- c/c++:   clang
setup_ls('taplo')    -- toml:    taplo-cli (cargo)
