return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup()
    require('mini.bracketed').setup()
    local clue = require 'mini.clue'
    clue.setup {
      triggers = {
        { mode = 'c', keys = '<C-r>' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'i', keys = '<C-x>' },
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '"' },
        { mode = 'n', keys = '<C-f>' },
        { mode = 'n', keys = '<C-w>' },
        { mode = 'n', keys = '<Leader>' },
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },
        { mode = 'n', keys = '`' },
        { mode = 'n', keys = 'g' },
        { mode = 'n', keys = 's' },
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '"' },
        { mode = 'x', keys = '<Leader>' },
        { mode = 'x', keys = '`' },
        { mode = 'x', keys = 'g' },
        { mode = 'x', keys = 's' },
        { mode = 'x', keys = 'z' },
      },
      clues = {
        clue.gen_clues.builtin_completion(),
        clue.gen_clues.g(),
        clue.gen_clues.marks(),
        clue.gen_clues.registers(),
        clue.gen_clues.windows(),
        clue.gen_clues.z(),
      },
      window = {
        scroll_down = '<C-n>',
        scroll_up = '<C-p>',
      },
    }
    require('mini.comment').setup()
    require('mini.completion').setup()
    require('mini.cursorword').setup()
    require('mini.diff').setup { mappings = {} }
    require('mini.git').setup()
    local hipatterns = require 'mini.hipatterns'
    hipatterns.setup {
      highlighters = {
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    }
    require('mini.icons').setup()
    require('mini.indentscope').setup()
    require('mini.jump').setup()
    require('mini.jump2d').setup()
    require('mini.move').setup()
    require('mini.notify').setup()
    require('mini.pairs').setup()
    require('mini.splitjoin').setup()
    require('mini.starter').setup()
    require('mini.statusline').setup()
    require('mini.surround').setup()
    require('mini.tabline').setup()
    vim.keymap.set('n', 'gO', ':lua MiniDiff.toggle_overlay()<CR>', { desc = 'Diff overlay' })
  end,
}
