require('sidekick').setup { cli = { win = { split = { height = 0, width = 0 } } }, nes = { enabled = false } }
local cli = require 'sidekick.cli'
vim.keymap.set({ 'n', 'x' }, '<leader>a', function()
  vim.ui.input({ default = '{this} ' }, function(input)
    if input then cli.send(input) end
  end)
end, { desc = 'Ask Sidekick' })
vim.keymap.set('n', '<leader>s', cli.toggle, { desc = 'Toggle Sidekick' })
