return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup {
      format_after_save = { lsp_fallback = true },
      formatters_by_ft = {
        bash = { 'shfmt' },
        c = { 'clang-format' },
        cmake = { 'gersemi' },
        cpp = { 'clang-format' },
        csharp = { 'clang-format' },
        css = { 'prettier' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        python = { 'autopep8' },
        rust = { 'rustfmt' },
        scss = { 'prettier' },
        sh = { 'shfmt' },
        systemverilog = { 'clang-format' },
        toml = { 'taplo' },
        typescript = { 'prettier' },
        verilog = { 'clang-format' },
        yaml = { 'prettier' },
      },
    }
  end,
}
