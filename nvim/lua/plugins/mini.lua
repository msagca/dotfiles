return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  config = function()
    local comment = require 'mini.comment'
    comment.setup {
      mappings = {
        comment = 'gc',
        comment_line = 'gcc',
        comment_visual = 'gc',
        textobject = 'gc',
      },
    }
    require('mini.cursorword').setup()
    local diff = require 'mini.diff'
    diff.setup {
      mappings = {
        apply = 'gh',
        reset = 'gH',
        textobject = 'gh',
        goto_first = '[H',
        goto_prev = '[h',
        goto_next = ']h',
        goto_last = ']H',
      },
    }
    vim.keymap.set('n', 'gO', diff.toggle_overlay, { desc = 'Diff overlay' })
    require('mini.git').setup()
    local hipatterns = require 'mini.hipatterns'
    vim.api.nvim_set_hl(0, 'MiniHipatternsTemp', { fg = 'white', bg = '#E8C3E8', bold = true })
    hipatterns.setup {
      highlighters = {
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
        temp = { pattern = '%f[%w]()TEMP()%f[%W]', group = 'MiniHipatternsTemp' },
        todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    }
    local indentscope = require 'mini.indentscope'
    indentscope.setup {
      mappings = {
        goto_bottom = ']i',
        goto_top = '[i',
        object_scope = 'ii',
        object_scope_with_border = 'ai',
      },
    }
    local jump = require 'mini.jump'
    jump.setup {
      mappings = {
        forward = 'f',
        backward = 'F',
        forward_till = 't',
        backward_till = 'T',
        repeat_jump = ';',
      },
    }
    local move = require 'mini.move'
    move.setup {
      mappings = {
        left = '<M-h>',
        right = '<M-l>',
        down = '<M-j>',
        up = '<M-k>',
        line_left = '<M-h>',
        line_right = '<M-l>',
        line_down = '<M-j>',
        line_up = '<M-k>',
      },
    }
    require('mini.notify').setup()
    local pairs = require 'mini.pairs'
    pairs.setup {
      mappings = {
        ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
        ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
        ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
        [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
        ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
        [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
        ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
        ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
        ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
      },
    }
    require('mini.statusline').setup()
    local surround = require 'mini.surround'
    surround.setup {
      mappings = {
        add = 'sa',
        delete = 'sd',
        find = '',
        find_left = '',
        highlight = '',
        replace = 'sr',
        suffix_last = '',
        suffix_next = '',
        update_n_lines = '',
      },
    }
    require('mini.tabline').setup()
  end,
}
