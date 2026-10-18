vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.hl.on_yank() end })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf, desc = 'Go to declaration' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = 'Go to definition' })
  end,
})
local function update_tabline()
  local bufs = vim.fn.getbufinfo { buflisted = 1 }
  local tabs = vim.fn.tabpagenr '$'
  vim.o.showtabline = (not vim.g.hide_tabline and (#bufs > 1 or tabs > 1)) and 2 or 0
end
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufDelete', 'BufWipeout', 'VimEnter', 'TabNew', 'TabClosed' }, { callback = update_tabline })
vim.api.nvim_create_autocmd('User', { pattern = 'TablineUpdate', callback = update_tabline })
