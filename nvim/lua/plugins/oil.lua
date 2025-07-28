return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      use_default_keymaps = false,
      keymaps = {
        ['-'] = { 'actions.parent', mode = 'n' },
        ['<C-c>'] = { 'actions.close', mode = 'n' },
        ['<C-p>'] = 'actions.preview',
        ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
        ['<CR>'] = 'actions.select',
        ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
        ['g?'] = { 'actions.show_help', mode = 'n' },
      },
      view_options = { show_hidden = true },
    }
    vim.keymap.set('n', '-', vim.cmd.Oil, { desc = 'File explorer' })
  end,
}
