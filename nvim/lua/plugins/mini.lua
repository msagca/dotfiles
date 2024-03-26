return {
  'echasnovski/mini.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('gitsigns').setup()
    require('mini.statusline').setup()
    require('mini.tabline').setup()
  end,
}
