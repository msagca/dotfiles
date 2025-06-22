vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank() end })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method 'textDocument/completion' then
      local chars = {}
      for i = 32, 126 do
        table.insert(chars, string.char(i))
      end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    if client:supports_method 'textDocument/code_action' then vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, { buffer = args.buf, desc = 'Code action' }) end
    if client:supports_method 'textDocument/definition' then vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = 'Go to definition' }) end
    if client:supports_method 'textDocument/hover' then vim.keymap.set('n', 'gk', vim.lsp.buf.hover, { buffer = args.buf, desc = 'Show documentation' }) end
    if client:supports_method 'textDocument/references' then vim.keymap.set('n', 'grr', vim.lsp.buf.references, { buffer = args.buf, desc = 'Show references' }) end
    if client:supports_method 'textDocument/rename' then vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { buffer = args.buf, desc = 'Rename symbol' }) end
  end,
})
