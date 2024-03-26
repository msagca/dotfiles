return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup {
      format_after_save = { lsp_fallback = true },
      formatters_by_ft = {
        c = { 'clang-format' },
        cmake = { 'gersemi' },
        cpp = { 'clang-format' },
        css = { 'prettier' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        python = { 'autopep8' },
        rust = { 'rustfmt' },
        scss = { 'prettier' },
        toml = { 'taplo' },
        typescript = { 'prettier' },
        xml = { 'xmlformatter' },
        yaml = { 'prettier' },
      },
    }
  end,
}
