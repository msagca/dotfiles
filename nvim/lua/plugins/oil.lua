return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      use_default_keymaps = false,
      keymaps = {
        ['-'] = { 'actions.parent', mode = 'n', desc = 'Open parent directory' },
        ['<c-s>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open file in split view' },
        ['<cr>'] = { 'actions.select', desc = 'Open file' },
        ['<esc>'] = { 'actions.close', mode = 'n', desc = 'Close file explorer' },
        ['<leader>.'] = { 'actions.toggle_hidden', mode = 'n', desc = 'Toggle hidden files' },
        ['<leader>?'] = { 'actions.show_help', mode = 'n', desc = 'Show help' },
        ['<tab>'] = { 'actions.preview', desc = 'Preview file' },
      },
      view_options = { show_hidden = true },
    }
    vim.keymap.set('n', '-', vim.cmd.Oil, { desc = 'Open file explorer' })
  end,
}
