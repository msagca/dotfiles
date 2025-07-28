local path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(path) then
  local repo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', repo, path }
end
vim.opt.rtp:prepend(path)
require('lazy').setup {
  require 'plugins.catppuccin',
  require 'plugins.conform',
  require 'plugins.lazydev',
  require 'plugins.mason',
  require 'plugins.mini',
  require 'plugins.oil',
  require 'plugins.whichkey',
}
require 'options'
require 'keymaps'
require 'commands'
