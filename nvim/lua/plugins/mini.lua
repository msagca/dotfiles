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
    require('mini.pairs').setup()
    require('mini.statusline').setup()
    require('mini.surround').setup()
    require('mini.tabline').setup()
    local diff = require 'mini.diff'
    diff.setup()
    vim.keymap.set('n', 'go', diff.toggle_overlay, { desc = 'Diff overlay' })
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
    local config = { window = { config = { border = 'none' } } }
    local notify = require 'mini.notify'
    notify.setup(config)
    local pick = require 'mini.pick'
    pick.setup(config)
    vim.keymap.set('n', '<Leader>b', pick.builtin.buffers, { desc = 'Pick from buffers' })
    vim.keymap.set('n', '<Leader>f', pick.builtin.files, { desc = 'Pick from files' })
    vim.keymap.set('n', '<Leader>g', pick.builtin.grep, { desc = 'Pick from pattern match' })
    vim.keymap.set('n', '<Leader>h', pick.builtin.help, { desc = 'Pick from help tags' })
    vim.keymap.set('n', '<Leader>l', pick.builtin.grep_live, { desc = 'Pick from live pattern match' })
    vim.keymap.set('n', '<Leader>r', pick.builtin.resume, { desc = 'Resume latest picker' })
    local snippets = require 'mini.snippets'
    snippets.setup { snippets = { snippets.gen_loader.from_lang() } }
  end,
}
