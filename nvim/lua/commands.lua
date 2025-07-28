vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank() end })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local caps = client.server_capabilities
    if caps.completionProvider then
      local chars = {}
      for i = 32, 126 do
        chars[#chars + 1] = string.char(i)
      end
      caps.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf, desc = 'Go to declaration' })
    vim.keymap.set('n', 'gF', vim.lsp.buf.format, { buffer = args.buf, desc = 'Format buffer' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = 'Go to definition' })
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { buffer = args.buf, desc = 'Signature help' })
  end,
})
