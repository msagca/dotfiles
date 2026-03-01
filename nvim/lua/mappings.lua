vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.keymap.set('n', '<c-b>', vim.cmd.enew, { desc = 'New buffer' })
vim.keymap.set('n', '<c-c>', vim.cmd.bdelete, { desc = 'Delete buffer' })
vim.keymap.set('n', '<c-n>', vim.cmd.bnext, { desc = 'Next buffer' })
vim.keymap.set('n', '<c-p>', vim.cmd.bprev, { desc = 'Previous buffer' })
vim.keymap.set('n', '<c-t>', vim.cmd.tabnew, { desc = 'New tab' })
vim.keymap.set('n', '<esc>', vim.cmd.nohlsearch, { desc = 'Remove search highlights' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic message' })
vim.keymap.set('t', '<esc>', '<c-\\><c-n>', { desc = 'Exit terminal mode' })
vim.keymap.set({ 'n', 'v' }, 'H', '^', { desc = 'Move to first character' })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { desc = 'Move to last character' })
vim.keymap.set('n', '<leader>S', function()
  if vim.o.laststatus == 0 then
    vim.o.laststatus = 2
  else
    vim.o.laststatus = 0
  end
end, { desc = 'Toggle statusline' })
vim.keymap.set('n', '<leader>T', function()
  if vim.o.showtabline == 0 then
    vim.o.showtabline = 1
  else
    vim.o.showtabline = 0
  end
end, { desc = 'Toggle tabline' })
vim.keymap.set('n', '<leader>C', function()
  if vim.o.cmdheight == 0 then
    vim.o.cmdheight = 1
  else
    vim.o.cmdheight = 0
  end
end, { desc = 'Toggle command line' })
