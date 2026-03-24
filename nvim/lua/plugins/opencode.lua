return {
  'nickjvandyke/opencode.nvim',
  event = 'VeryLazy',
  config = function()
    local opencode = require 'opencode'
    vim.keymap.set('n', '<leader>o', function() opencode.toggle() end, { desc = 'Toggle OpenCode' })
    vim.keymap.set({ 'n', 'x' }, '<c-a>', function() opencode.ask('@this ', { submit = true }) end, { desc = 'Ask OpenCode' })
  end,
}
