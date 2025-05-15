require("ibl").setup({
  indent = {
    char = "│",
    tab_char = "│",
    smart_indent_cap = true,
    highlight = { "IblIndent" },
  },
  whitespace = {
    highlight = { "Whitespace" },
    remove_blankline_trail = true,
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    highlight = { "IblScope" },
  },
  exclude = {
    filetypes = {
      "help",
      "dashboard",
      "lazy",
      "NvimTree",
      "Trouble",
      "alpha",
      "markdown",
    },
    buftypes = { "terminal", "nofile" },
  },
})

vim.opt.list = true
vim.opt.listchars = {
  space = "·",
  tab = "│ ",
  trail = "·",
  extends = "»",
  precedes = "«",
}
