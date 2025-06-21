require 'options'
require 'keymaps'
-- plugins
local path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(path) then
  local repo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', repo, path }
end
vim.opt.rtp:prepend(path)
require('lazy').setup {
  require 'plugins.catppuccin',
  require 'plugins.cmp',
  -- require 'plugins.codecompanion',
  require 'plugins.conform',
  -- require 'plugins.dap',
  require 'plugins.lazydev',
  require 'plugins.lsp',
  require 'plugins.mini',
  require 'plugins.oil',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.undotree',
  require 'plugins.whichkey',
}
