return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  config = function()
    local language_servers = {
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
      'pyright',
      'rust_analyzer',
      'taplo',
      'ts_ls',
      'verible',
      'yamlls',
      'zls',
    }
    vim.lsp.enable(language_servers)
  end,
}
