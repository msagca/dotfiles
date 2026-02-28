return {
  'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    local palette = require('catppuccin.palettes').get_palette()
    require('catppuccin').setup {
      auto_integrations = true,
      background = { dark = 'macchiato' },
      dim_inactive = { enabled = true },
      styles = { conditionals = {}, miscs = {} },
      term_colors = true,
      custom_highlights = function()
        return {
          MiniHipatternsFixme = { bg = palette.peach },
          MiniHipatternsHack = { bg = palette.mauve },
          MiniHipatternsNote = { bg = palette.green },
          MiniHipatternsTodo = { bg = palette.blue },
        }
      end,
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
