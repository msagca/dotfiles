vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
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
-- set background mode
vim.o.background = 'dark'
if vim.loop.os_uname().sysname == 'Windows_NT' then
  local path = vim.fn.stdpath 'config' .. '/ps/get_theme.ps1'
  local handle = io.popen('powershell -File "' .. path .. '"')
  if handle ~= nil then
    local result = handle:read '*a'
    handle:close()
    if string.find(result, 'light') then vim.o.background = 'light' end
  end
end
vim.keymap.set('n', '<C-c>', vim.cmd.bd)
vim.keymap.set('n', '<C-h>', vim.cmd.bprev)
vim.keymap.set('n', '<C-l>', vim.cmd.bnext)
vim.keymap.set('n', '<C-t>', vim.cmd.tabnew)
vim.keymap.set('n', '<C-x>', vim.cmd.tabclose)
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'L', '$')
vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank() end })
vim.cmd 'set autochdir'
-- bootstrap lazy
local path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(path) then
  local repo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', repo, path }
end
vim.opt.rtp:prepend(path)
require('lazy').setup {
  require 'plugins.catppuccin',
  require 'plugins.conform',
  -- require 'plugins.dap',
  require 'plugins.lazydev',
  -- require 'plugins.llm',
  require 'plugins.lsp',
  require 'plugins.mini',
  require 'plugins.oil',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.undotree',
  require 'plugins.whichkey',
}
