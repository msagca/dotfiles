return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
  opts = {
    ensure_installed = {
      'bashls',
      'clangd',
      'cssls',
      'glsl_analyzer',
      'gopls',
      'html',
      'jdtls',
      'lua_ls',
      'ols',
      'omnisharp',
      'powershell_es',
      'pyright',
      'rust_analyzer',
      'taplo',
      'ts_ls',
      'verible',
      'yamlls',
      'zls',
    },
  },
}
