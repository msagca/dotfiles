return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      use_default_keymaps = false,
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-v>'] = 'actions.select_vsplit',
        ['<C-c>'] = 'actions.close',
      },
      view_options = { show_hidden = true },
    }
    vim.keymap.set('n', '<leader>e', vim.cmd.Oil, { desc = 'File explorer' })
  end,
}
