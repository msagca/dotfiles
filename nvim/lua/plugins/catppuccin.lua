return {
  'catppuccin/nvim',
  name = 'catppuccin',
  event = 'VeryLazy',
  config = function()
    require('catppuccin').setup {
      background = { dark = 'macchiato' },
      dim_inactive = { enabled = true, percentage = 0.1 },
      float = { transparent = true, solid = false },
      styles = { conditionals = {}, miscs = {} },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
