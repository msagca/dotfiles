vim.o.background = 'dark'
vim.o.breakindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.linebreak = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.signcolumn = 'auto'
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.wrap = true
if vim.loop.os_uname().sysname == 'Windows_NT' then
  local handle = io.popen 'reg query HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize /v AppsUseLightTheme'
  local result = handle:read '*a'
  handle:close()
  if not result:match '0x0' then vim.o.background = 'light' end
end
