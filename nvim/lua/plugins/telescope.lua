return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'BurntSushi/ripgrep',
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  event = 'VimEnter',
  config = function()
    local builtin = require 'telescope.builtin'
    require('telescope').load_extension 'fzf'
    vim.keymap.set('n', '<C-f>b', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<C-f>c', builtin.commands, { desc = 'Commands' })
    vim.keymap.set('n', '<C-f>d', builtin.diagnostics, { desc = 'Diagnostics' })
    vim.keymap.set('n', '<C-f>f', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<C-f>G', builtin.git_status, { desc = 'Git status' })
    vim.keymap.set('n', '<C-f>g', builtin.live_grep, { desc = 'Live grep' })
    vim.keymap.set('n', '<C-f>h', builtin.help_tags, { desc = 'Help tags' })
    vim.keymap.set('n', '<C-f>k', builtin.keymaps, { desc = 'Keymaps' })
    vim.keymap.set('n', '<C-f>m', builtin.marks, { desc = 'Marks' })
    vim.keymap.set('n', '<C-f>o', builtin.oldfiles, { desc = 'Old files' })
    vim.keymap.set('n', '<C-f>s', builtin.lsp_document_symbols, { desc = 'Document symbols' })
    vim.keymap.set('n', '<C-f>S', builtin.lsp_workspace_symbols, { desc = 'Workspace symbols' })
    vim.keymap.set('n', '<C-f>t', builtin.treesitter, { desc = 'Treesitter' })
  end,
}
