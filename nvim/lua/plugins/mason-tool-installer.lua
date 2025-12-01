return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = { 'mason-org/mason.nvim' },
  event = 'VeryLazy',
  config = function()
    local installer = require 'mason-tool-installer'
    installer.setup {
      ensure_installed = {
        'autopep8',
        'bash-language-server',
        'clang-format',
        'clangd',
        'css-lsp',
        'gdtoolkit',
        'gersemi',
        'glsl_analyzer',
        'gopls',
        'html-lsp',
        'jdtls',
        'lua-language-server',
        'ols',
        'omnisharp',
        'omnisharp-mono',
        'prettier',
        'pyright',
        'rust-analyzer',
        'shfmt',
        'stylua',
        'taplo',
        'typescript-language-server',
        'verible',
        'yaml-language-server',
        'zls',
      },
    }
    vim.keymap.set('n', '<leader>m', function() installer.check_install(true, false) end, { desc = 'Mason tools update' })
  end,
}
