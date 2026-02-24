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
  local name = vim.o.guifont:match '^(.-):' or vim.o.guifont
  local height = vim.o.guifont:match ':h(%d+)'
  local weight = vim.o.guifont:match ':w(%d+)'
  font_name = name:gsub(' ', '\\ ')
  font_height = tonumber(height) or font_height
  font_weight = tonumber(weight) or font_weight
  return font_name, font_height, font_weight
end
local function set_font(name, height, weight)
  local success = pcall(function() vim.cmd('set guifont=' .. name .. ':h' .. height .. ':w' .. weight) end)
  if success then vim.notify(vim.o.guifont, vim.log.levels.INFO) end
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
