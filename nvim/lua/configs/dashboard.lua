local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
  [[               _      _              ]],
  [[  __   ___   _| |_ __| | _____   __  ]],
  [[  \ \ / / | | | __/ _` |/ _ \ \ / /  ]],
  [[   \ V /| |_| | || (_| |  __/\ V /   ]],
  [[    \_/  \__, |\__\__,_|\___| \_/    ]],
  [[         |___/                       ]],
}

dashboard.section.buttons.val = {
  dashboard.button('f', '  Find file', ':Telescope find_files <CR>'),
  dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('r', '  Recently used files', ':Telescope oldfiles <CR>'),
  dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
  dashboard.button('c', '  Configuration', ':e ~/.config/nvim/init.lua<CR>'),
  dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
}

local function footer()
  return 'hmmm...'
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = 'Type'
dashboard.section.header.opts.hl = 'Include'
dashboard.section.buttons.opts.hl = 'Keyword'

require('alpha').setup(dashboard.opts)
