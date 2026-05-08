vim.o.autocomplete = true
vim.o.autoread = true
vim.o.background = 'dark'
vim.o.breakindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.cmdheight = 1
vim.o.completeopt = 'fuzzy,menuone,noselect'
vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.laststatus = 3
vim.o.linebreak = true
vim.o.list = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = true
vim.o.showtabline = 1
vim.o.signcolumn = 'auto'
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.wrap = true
vim.opt.complete:append 'o'
vim.diagnostic.config {
  float = false,
  underline = true,
  update_in_insert = false,
  virtual_text = { severity = { min = vim.diagnostic.severity.WARN }, spacing = 0, prefix = '' },
}
