return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local whichkey = require 'which-key'
    whichkey.setup()
    vim.keymap.set('n', '<leader>k', whichkey.show, { desc = 'Show key bindings' })
  end,
}
