local opencode = require 'opencode'
vim.keymap.set({ 'n', 'x' }, '<leader>a', function()
  vim.ui.input({ default = '@this ' }, function(input)
    if input then opencode.ask(input) end
  end)
end, { desc = 'Ask OpenCode' })
