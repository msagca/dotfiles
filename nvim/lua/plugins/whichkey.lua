return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    local which_key = require 'which-key'
    which_key.setup()
    which_key.add {
      { '<C-f>', group = 'Telescope' },
      { '<leader>', group = 'Debug' },
    }
  end,
}
