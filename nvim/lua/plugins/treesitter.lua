return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      modules = {},
      ensure_installed = { 'lua', 'vim', 'vimdoc' },
      auto_install = true,
      sync_install = false,
      ignore_install = {},
    }
  end,
}
