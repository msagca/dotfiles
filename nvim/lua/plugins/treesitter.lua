return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  build = ':TSUpdate',
  event = 'BufRead',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'lua', 'vim', 'vimdoc' },
      auto_install = true,
      sync_install = false,
      ignore_install = {},
      modules = {},
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_decremental = 'grm',
          node_incremental = 'grn',
          scope_incremental = 'grc',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['ac'] = { query = '@class.outer', desc = 'Select class outer' },
            ['af'] = { query = '@function.outer', desc = 'Select function outer' },
            ['as'] = { query = '@local.scope', query_group = 'locals', desc = 'Select scope' },
            ['ic'] = { query = '@class.inner', desc = 'Select class inner' },
            ['if'] = { query = '@function.inner', desc = 'Select function inner' },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next = {
            [']c'] = { query = '@class.outer', desc = 'Move to next class' },
            [']f'] = { query = '@function.outer', desc = 'Move to next function' },
            [']s'] = { query = '@local.scope', query_group = 'locals', desc = 'Move to next scope' },
            [']z'] = { query = '@fold', query_group = 'folds', desc = 'Move to next fold' },
          },
          goto_previous = {
            ['[c'] = { query = '@class.outer', desc = 'Move to previous class' },
            ['[f'] = { query = '@function.outer', desc = 'Move to previous function' },
            ['[s'] = { query = '@local.scope', query_group = 'locals', desc = 'Move to previous scope' },
            ['[z'] = { query = '@fold', query_group = 'folds', desc = 'Move to previous fold' },
          },
        },
      },
    }
  end,
}
