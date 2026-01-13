require 'bootstrap'
require 'options'
require 'mappings'
require 'commands'
pcall(function()
  local lazy = require 'lazy'
  lazy.setup {
    require 'plugins.catppuccin',
    require 'plugins.conform',
    require 'plugins.lazydev',
    require 'plugins.mason-lspconfig',
    require 'plugins.mason-tool-installer',
    require 'plugins.mini',
    require 'plugins.oil',
    require 'plugins.whichkey',
  }
  vim.keymap.set('n', '<leader>L', function() lazy.update() end, { desc = 'Lazy update' })
end)
