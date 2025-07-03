return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'BurntSushi/ripgrep',
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
    },
  },
  event = 'VeryLazy',
  config = function()
    require('telescope').load_extension 'fzf'
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<C-f>b', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<C-f>c', builtin.commands, { desc = 'Commands' })
    vim.keymap.set('n', '<C-f>d', builtin.diagnostics, { desc = 'Diagnostics' })
    vim.keymap.set('n', '<C-f>f', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<C-f>g', builtin.live_grep, { desc = 'Live grep' })
    vim.keymap.set('n', '<C-f>h', builtin.help_tags, { desc = 'Help tags' })
    vim.keymap.set('n', '<C-f>k', builtin.keymaps, { desc = 'Keymaps' })
    vim.keymap.set('n', '<C-f>m', builtin.marks, { desc = 'Marks' })
    vim.keymap.set('n', '<C-f>o', builtin.oldfiles, { desc = 'Old files' })
    vim.keymap.set('n', '<C-f>s', builtin.lsp_document_symbols, { desc = 'Document symbols' })
    vim.keymap.set('n', '<C-f>w', builtin.lsp_workspace_symbols, { desc = 'Workspace symbols' })
  end,
}
