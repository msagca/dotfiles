return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
  },
  opts = {
    ensure_installed = {
      'black',
      'clang-format',
      'gdtoolkit',
      'gersemi',
      'ktfmt',
      'prettier',
      'shfmt',
      'sqruff',
      'stylua',
      'taplo',
      'tex-fmt',
      'yamlfmt',
    },
  },
}
