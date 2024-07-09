return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.comment').setup()
    require('mini.diff').setup { mappings = {} }
    require('mini.git').setup()
    require('mini.icons').setup()
    require('mini.notify').setup()
    require('mini.pairs').setup()
    require('mini.statusline').setup()
    require('mini.tabline').setup()
    vim.keymap.set('n', 'go', ':lua MiniDiff.toggle_overlay()<CR>', { desc = 'Diff overlay' })
  end,
}
