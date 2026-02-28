vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank() end })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', '<leader>s', vim.lsp.buf.signature_help, { buffer = args.buf, desc = 'Signature help' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf, desc = 'Go to declaration' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = 'Go to definition' })
  end,
})
