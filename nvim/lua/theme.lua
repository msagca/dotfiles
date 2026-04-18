if vim.uv.os_uname().sysname == 'Windows_NT' then
  local handle = io.popen 'reg query HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize /v AppsUseLightTheme'
  local result = handle:read '*a'
  handle:close()
  if result:match '0x1' then vim.o.background = 'light' end
end
