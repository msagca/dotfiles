return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
  },
  config = function()
    local installer = require 'mason-tool-installer'
    installer.setup {
      ensure_installed = {
        'black',
        'clang-format',
        'gdtoolkit',
        'gersemi',
        'ktfmt',
        'prettier',
        'shfmt',
        'sqruff',
        'stylua',
        'tex-fmt',
        'yamlfmt',
      },
    }
    vim.keymap.set('n', '<leader>M', function() installer.check_install(true, false) end, { desc = 'Mason update' })
  end,
}
