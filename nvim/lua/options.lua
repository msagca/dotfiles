vim.o.breakindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menu,menuone,noinsert'
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
-- set background mode based on Windows theme
vim.o.background = 'dark'
if vim.loop.os_uname().sysname == 'Windows_NT' then
  local path = vim.fn.stdpath 'config' .. '/ps/get_theme.ps1'
  local handle = io.popen('powershell -File "' .. path .. '"')
  if handle ~= nil then
    local result = handle:read '*a'
    handle:close()
    if string.find(result, 'light') then vim.o.background = 'light' end
  end
end
