return {
  'stevearc/conform.nvim',
  event = { 'BufNewFile', 'BufReadPost' },
  config = function()
    local conform = require 'conform'
    conform.setup {
      format_after_save = { lsp_format = 'fallback' },
      formatters_by_ft = {
        bash = { 'shfmt' },
        c = { 'clang-format' },
        cmake = { 'gersemi' },
        cpp = { 'clang-format' },
        csharp = { 'clang-format', lsp_format = 'prefer' },
        css = { 'prettier' },
        gdscript = { 'gdformat' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        kotlin = { 'ktfmt' },
        latex = { 'tex-fmt' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        python = { 'black' },
        rust = { 'rustfmt' },
        scss = { 'prettier' },
        sh = { 'shfmt' },
        sql = { 'sqruff' },
        systemverilog = { 'clang-format', 'verible', stop_after_first = true },
        tex = { 'tex-fmt' },
        toml = { 'taplo' },
        typescript = { 'prettier' },
        verilog = { 'clang-format', 'verible', stop_after_first = true },
        yaml = { 'yamlfmt', 'prettier', stop_after_first = true },
      },
    }
    vim.keymap.set('n', '<leader>F', function() conform.format { async = true, lsp_format = 'fallback' } end, { desc = 'Format buffer' })
  end,
}
