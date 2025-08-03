return {
  'echasnovski/mini.nvim',
  dependencies = { 'BurntSushi/ripgrep', 'rafamadriz/friendly-snippets' },
  event = 'VeryLazy',
  config = function()
    require('mini.comment').setup()
    require('mini.completion').setup()
    require('mini.cursorword').setup()
    require('mini.git').setup()
    require('mini.icons').setup()
    require('mini.jump').setup()
    require('mini.jump2d').setup()
    require('mini.move').setup()
    require('mini.notify').setup()
    require('mini.pairs').setup()
    require('mini.statusline').setup()
    require('mini.surround').setup()
    require('mini.tabline').setup()
    local diff = require 'mini.diff'
    diff.setup()
    vim.keymap.set('n', 'gO', diff.toggle_overlay, { desc = 'Diff overlay' })
    local hipatterns = require 'mini.hipatterns'
    hipatterns.setup {
      highlighters = {
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
        todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    }
    local pick = require 'mini.pick'
    pick.setup()
    vim.keymap.set('n', '<Leader>b', pick.builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<Leader>f', pick.builtin.files, { desc = 'Files' })
    vim.keymap.set('n', '<Leader>g', pick.builtin.grep, { desc = 'Pattern match' })
    vim.keymap.set('n', '<Leader>h', pick.builtin.help, { desc = 'Help tags' })
    vim.keymap.set('n', '<Leader>l', pick.builtin.grep_live, { desc = 'Live pattern match' })
    local snippets = require 'mini.snippets'
    snippets.setup { snippets = { snippets.gen_loader.from_lang() } }
  end,
}
