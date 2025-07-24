return {
  'williamboman/mason.nvim',
  dependencies = { 'WhoIsSethDaniel/mason-tool-installer.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    require('mason').setup()
    require('mason-tool-installer').setup {
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
        'omnisharp',
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
      auto_update = true,
    }
    local servers = {
      'bashls',
      'clangd',
      'cssls',
      'glsl_analyzer',
      'gopls',
      'html',
      'jdtls',
      'lua_ls',
      'omnisharp',
      'pyright',
      'rust_analyzer',
      'ts_ls',
      'verible',
      'yamlls',
      'zls',
    }
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}
