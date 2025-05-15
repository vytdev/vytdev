require('aerial').setup({
  backends = { 'lsp', 'treesitter', 'markdown' },
  layout = {
    default_direction = 'prefer_right',
    placement = 'window',
    resize_to_content = true,
    min_width = 20,
    max_width = { 40, 0.2 },
  },
  show_guides = true,
})
