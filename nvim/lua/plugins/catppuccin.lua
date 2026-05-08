return {
  'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    local palette = require('catppuccin.palettes').get_palette()
    require('catppuccin').setup {
      auto_integrations = true,
      background = { dark = 'macchiato' },
      dim_inactive = { enabled = true },
      no_italic = true,
      term_colors = true,
      custom_highlights = function()
        return {
          MiniHipatternsFixme = { bg = palette.maroon }, -- FIXME
          MiniHipatternsHack = { bg = palette.peach }, -- HACK
          MiniHipatternsNote = { bg = palette.mauve }, -- NOTE
          MiniHipatternsTodo = { bg = palette.lavender }, -- TODO
        }
      end,
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
