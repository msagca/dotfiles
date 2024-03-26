return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  },
  event = 'InsertEnter',
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}
    require('luasnip.loaders.from_vscode').lazy_load()
    cmp.setup {
      completion = { completeopt = 'menu,menuone,noinsert' },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-x>'] = cmp.mapping.abort(),
      },
      sources = cmp.config.sources {
        { name = 'buffer' },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
      },
    }
  end,
}
