return {
  'huggingface/llm.nvim',
  config = function()
    require('llm').setup {
      backend = 'ollama',
      model = 'codellama',
      url = 'http://localhost:11434/api/generate',
      lsp = { bin_path = vim.api.nvim_call_function('stdpath', { 'data' }) .. '/mason/bin/llm-ls' },
    }
  end,
}
