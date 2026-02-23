vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.keymap.set('n', '<c-c>', vim.cmd.bd, { desc = 'Delete buffer' })
vim.keymap.set('n', '<c-p>', vim.cmd.bprev, { desc = 'Previous buffer' })
vim.keymap.set('n', '<c-n>', vim.cmd.bnext, { desc = 'Next buffer' })
vim.keymap.set('n', '<esc>', vim.cmd.nohlsearch, { desc = 'Remove search highlights' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic message' })
vim.keymap.set('t', '<esc>', '<c-\\><c-n>', { desc = 'Exit terminal mode' })
vim.keymap.set({ 'n', 'v' }, 'H', '^', { desc = 'Move to first character' })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { desc = 'Move to last character' })
vim.keymap.set('n', '<leader>s', function()
  if vim.o.laststatus == 0 then
    vim.o.laststatus = 2
  else
    vim.o.laststatus = 0
  end
end, { desc = 'Toggle statusline' })
vim.keymap.set('n', '<leader>t', function()
  if vim.o.showtabline == 0 then
    vim.o.showtabline = 2
  else
    vim.o.showtabline = 0
  end
end, { desc = 'Toggle tabline' })
vim.keymap.set('n', '<leader>c', function()
  if vim.o.cmdheight == 0 then
    vim.o.cmdheight = 1
  else
    vim.o.cmdheight = 0
  end
end, { desc = 'Toggle command line' })
local font_name = 'Monospace'
local font_height = 11
local font_weight = 99
local function get_font()
  local name, height, weight = vim.o.guifont:match '^(.-):h(%d+):w(%d+)'
  return name or font_name, tonumber(height) or font_height, tonumber(weight) or font_weight
end
local function set_font(name, height, weight)
  local ok = pcall(function() vim.cmd('set guifont=' .. name .. ':h' .. height .. ':w' .. weight) end)
  if ok then
    font_name = name
    font_height = height
    font_weight = weight
  else
    vim.cmd('set guifont=' .. font_name .. ':h' .. font_height .. ':w' .. font_weight)
  end
end
if vim.fn.has 'gui_running' == 1 or vim.g.neovide or vim.g.goneovim then
  vim.keymap.set('n', '<leader>+', function()
    local name, height, weight = get_font()
    set_font(name, height + 1, weight)
  end, { desc = 'Increase font size' })
  vim.keymap.set('n', '<leader>-', function()
    local name, height, weight = get_font()
    set_font(name, height - 1, weight)
  end, { desc = 'Decrease font size' })
end
