-- Splash text for nvim.
-- See 'nvim/lua/configs/lualine.lua'

local update_interval = 20 * 1000  -- 20 secs

local msgs = {
  'Hello, world!!',
  'Vim\'s a legend.',
  '// TODO: make *chocolate*',
  ':wq -- and off you go',
  'The sacred tool of wisdom.',
  'Vim is not a cult... probably',
  ':term, :term, :term!!',
  'Use fzf.',
  'Tip: Use `<Leader>ff` to fuzzy find files.',
  'Tip: Use `<Leader>fg` to search on your cwd.',
  'Tip: Use `<Leader>fr` to list recent files.',
  'Fancy a project tree? Use `<Leader>e`.',
  '`<Leader>a`: Show the symbols!',
  'Use `gd` to jump to definition.',
  'Press `zz` to center the cursor vertically.',
}

local idx = 1

-- get a random text
local function get_random()
  return msgs[math.random(#msgs)]
end

-- returns the current text
local function get_splash()
  return msgs[idx]
end

-- change the splash text at every `update_interval`
local timer = vim.loop.new_timer()
timer:start(0, update_interval, vim.schedule_wrap(function()
  idx = math.random(#msgs)
end))


return {
  update_interval = update_interval,
  message_list = msgs,
  get_random = get_random,
  get_splash = get_splash,
}
