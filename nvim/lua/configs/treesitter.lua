require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", "python", "javascript", "typescript", "html",
    "css", "bash", "json", "c", "cpp"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})
