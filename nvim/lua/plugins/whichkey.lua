return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local which_key = require 'which-key'
    which_key.setup()
    vim.keymap.set('n', '<leader>k', which_key.show, { desc = 'Show key bindings' })
  end,
}
