require('lualine').setup {
  options = { theme = 'melange', component_separators = {}, section_separators = { left = '', right = '' } },
  sections = {
    lualine_a = {
      {
        'mode',
        separator = { left = '' },
        fmt = function()
          local icons = {
            ['R'] = ' ',
            ['S'] = ' ',
            ['V'] = ' ',
            ['\22'] = ' ',
            ['c'] = ' ',
            ['i'] = ' ',
            ['s'] = ' ',
            ['t'] = ' ',
            ['v'] = ' ',
          }
          local mode = vim.fn.mode()
          local icon = icons[mode]
          if icon then return icon end
          return ' '
        end,
      },
    },
    lualine_b = { 'filename', 'branch', 'diff' },
    lualine_c = { '%=' },
    lualine_x = {},
    lualine_y = { 'filetype', { 'lsp_status', icons_enabled = false } },
    lualine_z = { { 'location', separator = { right = '' } } },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
