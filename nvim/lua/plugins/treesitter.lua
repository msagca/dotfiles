return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'BufRead',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'gitcommit', 'gitignore', 'lua', 'markdown', 'vim', 'vimdoc' },
      auto_install = true,
      sync_install = false,
      ignore_install = {},
      modules = {},
    }
  end,
}
