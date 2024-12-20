return {
  'neovim/nvim-lspconfig',
  dependencies = { 'WhoIsSethDaniel/mason-tool-installer.nvim', 'williamboman/mason-lspconfig.nvim', 'williamboman/mason.nvim' },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(_)
        vim.bo[_.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition', buffer = _.buf })
        vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { desc = 'Display information', buffer = _.buf })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Display references', buffer = _.buf })
        vim.keymap.set('n', 'gR', vim.lsp.buf.rename, { desc = 'Rename symbol', buffer = _.buf })
        vim.keymap.set({ 'n', 'v' }, 'gA', vim.lsp.buf.code_action, { desc = 'Code action', buffer = _.buf })
      end,
    })
    require('mason').setup()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'autopep8',
        'clang-format',
        'gersemi',
        'llm-ls',
        'prettier',
        'shfmt',
        'stylua',
        'taplo',
      },
    }
    require('mason-lspconfig').setup {
      ensure_installed = { 'clangd', 'glsl_analyzer', 'lua_ls', 'omnisharp_mono', 'pyright' },
      handlers = { function(_) require('lspconfig')[_].setup {} end },
    }
  end,
}
