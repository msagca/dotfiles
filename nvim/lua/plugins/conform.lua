return {
  'stevearc/conform.nvim',
  event = 'BufRead',
  config = function()
    require('conform').setup {
      format_after_save = { lsp_format = 'fallback' },
      formatters_by_ft = {
        bash = { 'shfmt' },
        c = { 'clang-format' },
        cmake = { 'gersemi' },
        cpp = { 'clang-format' },
        csharp = { 'clang-format', 'csharpier', lsp_format = 'prefer' },
        css = { 'prettier' },
        gdscript = { 'gdformat' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        python = { 'autopep8' },
        rust = { 'rustfmt' },
        scss = { 'prettier' },
        sh = { 'shfmt' },
        systemverilog = { 'verible', 'clang-format', stop_after_first = true },
        toml = { 'taplo' },
        typescript = { 'prettier' },
        verilog = { 'verible', 'clang-format', stop_after_first = true },
        yaml = { 'prettier' },
      },
    }
  end,
}
