require 'bootstrap'
require 'options'
require 'mappings'
require 'commands'
require 'gui'
pcall(
  function()
    require('lazy').setup {
      require 'plugins.catppuccin',
      require 'plugins.conform',
      require 'plugins.lazydev',
      require 'plugins.lualine',
      require 'plugins.mason-lspconfig',
      require 'plugins.mason-tool-installer',
      require 'plugins.mini',
      require 'plugins.oil',
      require 'plugins.opencode',
      require 'plugins.tabby',
      require 'plugins.whichkey',
    }
  end
)
