return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  build = ':TSUpdate',
  event = 'BufRead',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'gitcommit', 'gitignore', 'lua', 'markdown', 'vim', 'vimdoc' },
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
            ['ac'] = { query = '@class.outer', desc = 'class' },
            ['af'] = { query = '@function.outer', desc = 'function' },
            ['as'] = { query = '@local.scope', query_group = 'locals', desc = 'scope' },
            ['ic'] = { query = '@class.inner', desc = 'class' },
            ['if'] = { query = '@function.inner', desc = 'function' },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next = {
            [']c'] = { query = '@class.outer', desc = 'next class' },
            [']f'] = { query = '@function.outer', desc = 'next function' },
            [']s'] = { query = '@local.scope', query_group = 'locals', desc = 'next scope' },
            [']z'] = { query = '@fold', query_group = 'folds', desc = 'next fold' },
          },
          goto_previous = {
            ['[c'] = { query = '@class.outer', desc = 'previous class' },
            ['[f'] = { query = '@function.outer', desc = 'previous function' },
            ['[s'] = { query = '@local.scope', query_group = 'locals', desc = 'previous scope' },
            ['[z'] = { query = '@fold', query_group = 'folds', desc = 'previous fold' },
          },
        },
      },
    }
  end,
}
