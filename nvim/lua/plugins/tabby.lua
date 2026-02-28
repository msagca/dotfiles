return {
  'nanozuki/tabby.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  ---@type TabbyConfig
  opts = {
    preset = 'active_wins_at_tail',
    option = {
      buf_name = { mode = 'unique' },
      lualine_theme = 'catppuccin',
      nerdfont = true,
      tab_name = { name_fallback = function(tabid) return tabid end },
    },
  },
}
