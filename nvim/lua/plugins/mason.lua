return {
  'williamboman/mason.nvim',
  dependencies = { 'WhoIsSethDaniel/mason-tool-installer.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    require('mason').setup()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'autopep8',
        'clang-format',
        'clangd',
        'gdtoolkit',
        'gersemi',
        'glsl_analyzer',
        'lua-language-server',
        'omnisharp',
        'prettier',
        'pyright',
        'shfmt',
        'stylua',
        'taplo',
      },
      auto_update = true,
    }
    local servers = { 'clangd', 'glsl_analyzer', 'lua_ls', 'omnisharp', 'pyright' }
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}
