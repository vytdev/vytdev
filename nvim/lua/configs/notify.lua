local notify = require('notify')

notify.setup({
  stages = 'fade_in_slide_out',
  timeout = 3000,
  top_down = true,
  position = 'top_right',
})

-- override default vim.notify with nvim-notify
vim.notify = notify
