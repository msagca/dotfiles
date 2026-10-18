local move = require 'nvim-treesitter-textobjects.move'
vim.keymap.set({ 'n', 'x', 'o' }, '[f', function() move.goto_previous_start('@function.outer', 'textobjects') end, { desc = 'Go to previous function start' })
vim.keymap.set({ 'n', 'x', 'o' }, '[k', function() move.goto_previous_start('@class.outer', 'textobjects') end, { desc = 'Go to previous class start' })
vim.keymap.set({ 'n', 'x', 'o' }, ']f', function() move.goto_next_end('@function.outer', 'textobjects') end, { desc = 'Go to next function end' })
vim.keymap.set({ 'n', 'x', 'o' }, ']k', function() move.goto_next_end('@class.outer', 'textobjects') end, { desc = 'Go to next class end' })
