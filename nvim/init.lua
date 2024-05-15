vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.background = 'light'
vim.o.breakindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.linebreak = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.signcolumn = 'auto'
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.wrap = true
vim.keymap.set('n', '<C-h>', vim.cmd.bprev)
vim.keymap.set('n', '<C-l>', vim.cmd.bnext)
vim.keymap.set('n', '<C-t>', vim.cmd.tabnew)
vim.keymap.set('n', '<C-x>', vim.cmd.tabclose)
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)
vim.keymap.set('n', 'B', 'L')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'T', 'H')
vim.keymap.set('n', 'X', vim.cmd.bd)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.cmd 'set autochdir'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup {
  { 'numToStr/Comment.nvim', opts = {} },
  { 'windwp/nvim-autopairs', opts = {} },
  require 'plugins.catppuccin',
  require 'plugins.cmp',
  require 'plugins.conform',
  -- require 'plugins.llm',
  require 'plugins.lsp',
  require 'plugins.mini',
  require 'plugins.oil',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.undotree',
  require 'plugins.whichkey',
}
