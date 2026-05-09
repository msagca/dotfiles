vim.pack.add {
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/catppuccin/nvim',
  'https://github.com/folke/lazydev.nvim',
  'https://github.com/folke/which-key.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nickjvandyke/opencode.nvim',
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/stevearc/oil.nvim',
}
require 'plugins.catppuccin'
require 'plugins.conform'
require 'plugins.lazydev'
require 'plugins.mason'
require 'plugins.mini'
require 'plugins.oil'
require 'plugins.opencode'
require 'plugins.whichkey'
