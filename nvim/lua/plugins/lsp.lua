return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  event = 'BufRead',
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration', buffer = args.buf })
        vim.keymap.set('n', 'gI', vim.lsp.buf.hover, { desc = 'Display information', buffer = args.buf })
        vim.keymap.set('n', 'gR', vim.lsp.buf.rename, { desc = 'Rename symbol', buffer = args.buf })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition', buffer = args.buf })
        vim.keymap.set({ 'n', 'v' }, 'gA', vim.lsp.buf.code_action, { desc = 'Code action', buffer = args.buf })
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
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('mason-lspconfig').setup {
      ensure_installed = { 'clangd', 'glsl_analyzer', 'lua_ls', 'omnisharp_mono', 'pyright', 'rust_analyzer', 'zls' },
      automatic_installation = false,
      handlers = { function(server) require('lspconfig')[server].setup { capabilities = capabilities } end },
    }
  end,
}
