return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
  },
  config = function()
    local installer = require 'mason-tool-installer'
    installer.setup {
      ensure_installed = {
        'autopep8',
        'clang-format',
        'gdtoolkit',
        'gersemi',
        'prettier',
        'shfmt',
        'stylua',
      },
    }
    vim.keymap.set('n', '<leader>m', function() installer.check_install(true, false) end, { desc = 'Mason tools update' })
  end,
}
