return {
  'stevearc/oil.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  event = 'VimEnter',
  config = function()
    require('mini.icons').setup()
    require('oil').setup {
      use_default_keymaps = false,
      keymaps = {
        ['-'] = 'actions.parent',
        ['<C-c>'] = 'actions.close',
        ['<C-s>'] = 'actions.select_vsplit',
        ['<CR>'] = 'actions.select',
        ['g?'] = 'actions.show_help',
      },
      view_options = { show_hidden = true },
    }
    vim.keymap.set('n', '-', vim.cmd.Oil, { desc = 'File explorer' })
  end,
}
