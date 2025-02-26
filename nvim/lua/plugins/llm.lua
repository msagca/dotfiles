return {
  'huggingface/llm.nvim',
  event = 'InsertEnter',
  config = function()
    require('llm').setup {
      backend = 'ollama',
      model = 'deepseek-r1:8b',
      url = 'http://localhost:11434/api/generate',
      lsp = { bin_path = vim.api.nvim_call_function('stdpath', { 'data' }) .. '/mason/bin/llm-ls' },
    }
  end,
}
