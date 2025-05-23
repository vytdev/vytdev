local dashboard = require('alpha.themes.dashboard')
local alpha = require('alpha')

dashboard.section.header.opts.hl  = 'DashboardHeader'
dashboard.section.footer.opts.hl  = 'DashboardFooter'

local function get_time()
  local date = os.date('%Y %b %d')
  local time = os.date('%H:%M:%S')
  return ' ' .. date .. '  ' .. time
end

local function get_cwd()
  local cwd = vim.fn.getcwd()
  return ' ' .. cwd
end

local function get_nvim_version()
  local v = vim.version()
  return string.format(' Neovim %d.%d.%d', v.major, v.minor, v.patch)
end

dashboard.section.header.val = {
  [[  *                            _.                          ]],
  [[                                                           ]],
  [[  +-----+    +-----+                              `        ]],
  [[  |   __|    |__   |    Hello,       _      _              ]],
  [[  |  |##|    |##|  |    __   ___   _| |_ __| | _____   __  ]],
  [[  +--+--|____|--+--+    \ \ / / | | | __/ _` |/ _ \ \ / /  ]],
  [[     ___|    |___        \ V /| |_| | || (_| |  __/\ V /   ]],
  [[     |          |         \_/  \__, |\__\__,_|\___| \_/    ]],
  [[     |   +--+   |              |___/                   o   ]],
  [[     |___|  |___|                                          ]],
  [[                        -                         +=       ]],
  [[                                                           ]],
}

local btn = dashboard.button
dashboard.section.buttons.val = {
  btn('e', '  New',         '<cmd>ene <BAR> startinsert<CR>'),
  btn('r', '  Recent',      '<cmd>Telescope oldfiles<CR>'),
  btn('f', '  Find file',   '<cmd>Telescope find_files<CR>'),
  btn('t', '  Find text',   '<cmd>Telescope live_grep<CR>'),
  btn('h', '  Help index',  '<cmd>Telescope help_tags<CR>'),
  btn('x', '  Terminal',    '<cmd>terminal $SHELL<CR>'),
  btn('p', '  Plugins',     '<cmd>Lazy<CR>'),
  btn('c', '  Config',      '<cmd>e ~/.config/nvim/init.lua<CR>'),
  btn('q', '  Quit Neovim', '<cmd>qa<CR>'),
}

dashboard.section.footer.val = {
  get_time(),
  get_cwd(),
  get_nvim_version(),
}

alpha.setup(dashboard.opts)
