require('mini.git').setup()
require('mini.icons').setup()
require('mini.jump').setup()
require('mini.jump2d').setup()
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
local diff = require 'mini.diff'
local extra = require 'mini.extra'
local hipatterns = require 'mini.hipatterns'
local pick = require 'mini.pick'
diff.setup()
extra.setup()
pick.setup { window = { config = { border = 'none' } } }
hipatterns.setup {
  highlighters = {
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
}
vim.keymap.set('n', '<leader>D', diff.toggle_overlay, { desc = 'Toggle diff overlay' })
vim.keymap.set('n', '<leader>H', extra.pickers.git_hunks, { desc = 'Pick from Git hunks' })
vim.keymap.set('n', '<leader>L', extra.pickers.lsp, { desc = 'Pick from LSP' })
vim.keymap.set('n', '<leader>b', pick.builtin.buffers, { desc = 'Pick from buffers' })
vim.keymap.set('n', '<leader>d', extra.pickers.diagnostic, { desc = 'Pick from diagnostics' })
vim.keymap.set('n', '<leader>f', pick.builtin.files, { desc = 'Pick from files' })
vim.keymap.set('n', '<leader>g', pick.builtin.grep, { desc = 'Pick from pattern match' })
vim.keymap.set('n', '<leader>h', pick.builtin.help, { desc = 'Pick from help tags' })
vim.keymap.set('n', '<leader>l', pick.builtin.grep_live, { desc = 'Pick from live pattern match' })
vim.keymap.set('n', '<leader>m', extra.pickers.marks, { desc = 'Pick from marks' })
vim.keymap.set('n', '<leader>r', pick.builtin.resume, { desc = 'Resume latest picker' })
vim.keymap.set('n', '<leader>t', extra.pickers.treesitter, { desc = 'Pick from treesitter' })
