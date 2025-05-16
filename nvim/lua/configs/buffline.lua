require('bufferline').setup({
  options = {
    mode = 'buffers',
    diagnostics = 'nvim_lsp',
    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = 'slant',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'Explorer',
        text_align = 'center',
        separator = true,
      }
    }
  }
})
