return {
  'yetone/avante.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
  build = vim.fn.has 'win32' ~= 0 and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false'
    or 'make BUILD_FROM_SOURCE=false',
  event = 'VeryLazy',
  version = false,
  opts = {
    instructions_file = 'avante.md',
    provider = 'ollama',
    providers = {
      ollama = {
        endpoint = 'http://localhost:11434',
        model = 'deepseek-r1:8b',
      },
    },
  },
}
