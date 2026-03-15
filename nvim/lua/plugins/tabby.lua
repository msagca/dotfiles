return {
  'nanozuki/tabby.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  ---@type TabbyConfig
  opts = { preset = 'active_wins_at_tail', option = { lualine_theme = 'catppuccin-nvim' } },
}
