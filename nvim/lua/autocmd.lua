vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank() end })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', '<leader>s', vim.lsp.buf.signature_help, { buffer = args.buf, desc = 'Signature help' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf, desc = 'Go to declaration' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = 'Go to definition' })
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end
    if client:supports_method 'textDocument/completion' then vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true }) end
  end,
})
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufDelete', 'BufWipeout', 'VimEnter', 'TabNew', 'TabClosed' }, {
  callback = function()
    local bufs = vim.fn.getbufinfo { buflisted = 1 }
    local tabs = vim.fn.tabpagenr '$'
    vim.o.showtabline = (#bufs > 1 or tabs > 1) and 2 or 0
  end,
})
