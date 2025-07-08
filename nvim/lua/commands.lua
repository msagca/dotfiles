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
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = args.buf, desc = 'Go to implementation' })
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, { buffer = args.buf, desc = 'Code action' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = 'Go to definition' })
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, { buffer = args.buf, desc = 'Show documentation' })
    vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { buffer = args.buf, desc = 'Rename symbol' })
    vim.keymap.set('n', 'grr', vim.lsp.buf.references, { buffer = args.buf, desc = 'Show references' })
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { buffer = args.buf, desc = 'Show signature' })
  end,
})
