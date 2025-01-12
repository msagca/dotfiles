-- NOTE: keymaps for plugins are set inside their config functions
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<C-c>', vim.cmd.bd, { desc = 'Delete buffer' })
vim.keymap.set('n', '<C-h>', vim.cmd.bprev, { desc = 'Previous buffer' })
vim.keymap.set('n', '<C-l>', vim.cmd.bnext, { desc = 'Next buffer' })
vim.keymap.set('n', '<C-t>', vim.cmd.tabnew, { desc = 'New tab' })
vim.keymap.set('n', '<C-x>', vim.cmd.tabclose, { desc = 'Close tab' })
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch, { desc = 'Remove highlighting' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Close terminal' })
vim.keymap.set({ 'n', 'v' }, 'H', '^', { desc = 'Move to first character' })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { desc = 'Move to last character' })
