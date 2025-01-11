return {
  'huggingface/llm.nvim',
  event = 'InsertEnter',
  config = function()
    require('llm').setup {
      backend = 'ollama',
      model = 'llama:3.2',
      url = 'http://localhost:11434/api/generate',
      lsp = { bin_path = vim.api.nvim_call_function('stdpath', { 'data' }) .. '/mason/bin/llm-ls' },
    }
  end,
}
