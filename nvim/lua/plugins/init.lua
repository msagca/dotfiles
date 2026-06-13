vim.pack.add {
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/akinsho/bufferline.nvim',
  'https://github.com/folke/lazydev.nvim',
  'https://github.com/folke/which-key.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nickjvandyke/opencode.nvim',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/savq/melange-nvim',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/stevearc/oil.nvim',
}
require 'plugins.bufferline'
require 'plugins.conform'
require 'plugins.lazydev'
require 'plugins.lualine'
require 'plugins.mason'
require 'plugins.melange'
require 'plugins.mini'
require 'plugins.oil'
require 'plugins.opencode'
require 'plugins.whichkey'
