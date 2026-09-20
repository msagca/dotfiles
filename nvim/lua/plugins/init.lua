vim.pack.add {
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/folke/lazydev.nvim',
  'https://github.com/folke/sidekick.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/msagca/shaderlab-ls',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  'https://github.com/oskarnurm/koda.nvim',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/stevearc/oil.nvim',
}
require 'plugins.conform'
require 'plugins.koda'
require 'plugins.lazydev'
require 'plugins.mason'
require 'plugins.mini'
require 'plugins.oil'
require 'plugins.shaderlab-ls'
require 'plugins.sidekick'
require 'plugins.treesitter'
require 'plugins.treesitter-textobjects'
