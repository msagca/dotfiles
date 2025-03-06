return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'BurntSushi/ripgrep', 'nvim-lua/plenary.nvim' },
  event = 'VeryLazy',
  config = function()
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '\\b', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '\\C', builtin.git_commits, { desc = 'Git commits' })
    vim.keymap.set('n', '\\c', builtin.commands, { desc = 'Commands' })
    vim.keymap.set('n', '\\d', builtin.diagnostics, { desc = 'Diagnostics' })
    vim.keymap.set('n', '\\f', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '\\G', builtin.git_status, { desc = 'Git status' })
    vim.keymap.set('n', '\\g', builtin.live_grep, { desc = 'Live grep' })
    vim.keymap.set('n', '\\h', builtin.help_tags, { desc = 'Help tags' })
    vim.keymap.set('n', '\\k', builtin.keymaps, { desc = 'Keymaps' })
    vim.keymap.set('n', '\\m', builtin.marks, { desc = 'Marks' })
    vim.keymap.set('n', '\\o', builtin.oldfiles, { desc = 'Old files' })
    vim.keymap.set('n', '\\s', builtin.lsp_document_symbols, { desc = 'Document symbols' })
    vim.keymap.set('n', '\\S', builtin.lsp_workspace_symbols, { desc = 'Workspace symbols' })
    vim.keymap.set('n', '\\t', builtin.treesitter, { desc = 'Treesitter' })
  end,
}
