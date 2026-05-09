local which_key = require 'which-key'
which_key.setup()
vim.keymap.set('n', '<leader>K', which_key.show, { desc = 'Show key bindings' })
