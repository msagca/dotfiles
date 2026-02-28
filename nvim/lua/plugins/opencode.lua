return {
  'nickjvandyke/opencode.nvim',
  event = 'VeryLazy',
  config = function()
    vim.o.autoread = true
    local opencode = require 'opencode'
    vim.keymap.set('n', '<leader>o', function() opencode.toggle() end, { desc = 'Toggle opencode' })
    vim.keymap.set({ 'n', 'x' }, '<c-a>', function() opencode.ask('@this: ', { submit = true }) end, { desc = 'Ask opencode' })
    vim.keymap.set({ 'n', 'x' }, '<c-x>', function() opencode.select() end, { desc = 'Execute opencode action' })
  end,
}
