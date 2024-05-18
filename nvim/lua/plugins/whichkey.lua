return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    local which_key = require 'which-key'
    which_key.setup()
    which_key.register {
      ['<C-f>'] = { name = 'Telescope' },
      ['<leader>'] = { name = 'Debug' },
    }
  end,
}
