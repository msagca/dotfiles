require('mini.git').setup()
require('mini.icons').setup()
require('mini.jump').setup()
require('mini.jump2d').setup()
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.tabline').setup { show_icons = false }
local diff = require 'mini.diff'
local extra = require 'mini.extra'
local hipatterns = require 'mini.hipatterns'
local pick = require 'mini.pick'
local statusline = require 'mini.statusline'
diff.setup()
extra.setup()
hipatterns.setup {
  highlighters = {
    fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
    hack = { pattern = 'HACK', group = 'MiniHipatternsHack' },
    todo = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
    note = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
  },
}
pick.setup { source = { show = pick.default_show }, window = { config = { border = 'none' } } }
statusline.setup {
  content = {
    active = function()
      local icons = {
        ['R'] = '',
        ['S'] = '',
        ['V'] = '',
        ['\22'] = '',
        ['c'] = '',
        ['i'] = '',
        ['s'] = '',
        ['t'] = '',
        ['v'] = '',
      }
      local mode = vim.fn.mode()
      local icon = icons[mode]
      if not icon then icon = '' end
      local _, mode_hl = statusline.section_mode {}
      local diagnostics = statusline.section_diagnostics {}
      local fileinfo = statusline.section_fileinfo {}
      local filename = statusline.section_filename {}
      local location = statusline.section_location {}
      local search = statusline.section_searchcount {}
      return statusline.combine_groups {
        { hl = mode_hl, strings = { icon } },
        { hl = 'MiniStatuslineDevinfo', strings = { diagnostics } },
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=',
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl, strings = { search, location } },
      }
    end,
    inactive = function()
      local fileinfo = statusline.section_fileinfo {}
      local filename = statusline.section_filename {}
      return statusline.combine_groups {
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=',
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
      }
    end,
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
