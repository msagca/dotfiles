if vim.fn.has 'gui_running' ~= 1 then return end
local fonts = {
  'Hurmit Nerd Font',
  'RobotoMono Nerd Font',
  'JetBrainsMono Nerd Font',
  'FiraCode Nerd Font',
  'FiraMono Nerd Font',
  'ShureTechMono Nerd Font',
  'UbuntuMono Nerd Font',
  'Hermit',
  'Geist Mono',
  'Roboto Mono',
  'JetBrains Mono',
  'Red Hat Mono',
  'Reddit Mono',
  'Fira Code',
  'Fira Mono',
  'PT Mono',
  'Consolas',
  'Ubuntu Sans Mono',
  'Ubuntu Mono',
  'DejaVu Sans Mono',
  'Monospace',
}
local font_height = 11
local font_weight = vim.g.neovide and 0 or 99
local setting_font = false
local function set_font_height(new_height)
  new_height = new_height or font_height
  for _, f in ipairs(fonts) do
    local name = f:gsub(' ', '\\ ')
    setting_font = true
    local ok = pcall(vim.cmd, 'set guifont=' .. name .. ':h' .. new_height .. ':w' .. font_weight)
    setting_font = false
    if ok then
      font_height = new_height
      vim.notify(vim.o.guifont, vim.log.levels.INFO)
      return
    end
  end
  vim.notify('No available fonts found', vim.log.levels.WARN)
end
vim.schedule(set_font_height)
vim.keymap.set('n', '<leader>+', function() set_font_height(font_height + 1) end, { desc = 'Increase font size' })
vim.keymap.set('n', '<leader>-', function() set_font_height(font_height - 1) end, { desc = 'Decrease font size' })
vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'guifont',
  callback = function()
    if setting_font then return end
    local guifont = vim.o.guifont
    if #guifont > 0 then
      local height = vim.o.guifont:match ':h(%d+)'
      local weight = vim.o.guifont:match ':w(%d+)'
      font_height = tonumber(height) or font_height
      font_weight = tonumber(weight) or font_weight
      local name = vim.o.guifont:match '^(.-):'
      if name then
        local index = 0
        for i, f in ipairs(fonts) do
          if f == name then
            index = i
            break
          end
        end
        if index > 0 then
          local font = table.remove(fonts, index)
          -- move the user specified font to the front
          table.insert(fonts, 1, font)
          return
        end
        vim.notify('New font found: ' .. name, vim.log.levels.INFO)
        table.insert(fonts, 1, name)
      end
    end
  end,
})
