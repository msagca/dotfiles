return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      use_default_keymaps = false,
      keymaps = {
        ['-'] = { 'actions.parent', mode = 'n' },
        ['<c-c>'] = { 'actions.close', mode = 'n' },
        ['<c-p>'] = 'actions.preview',
        ['<c-s>'] = { 'actions.select', opts = { vertical = true } },
        ['<cr>'] = 'actions.select',
        ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
        ['g?'] = { 'actions.show_help', mode = 'n' },
      },
      view_options = { show_hidden = true },
    }
    vim.keymap.set('n', '-', vim.cmd.Oil, { desc = 'File explorer' })
  end,
}
