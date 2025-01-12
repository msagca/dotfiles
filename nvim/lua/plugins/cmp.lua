return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'onsails/lspkind.nvim',
  },
  event = { 'InsertEnter', 'CmdlineEnter' },
  config = function()
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'
    cmp.setup {
      sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
      },
      snippet = {
        expand = function(args)
          vim.fn['vsnip#anonymous'](args.body)
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-c>'] = cmp.mapping.abort(),
        ['<C-t>'] = cmp.mapping.complete(),
      },
      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = lspkind.cmp_format(),
        expandable_indicator = true,
      },
    }
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'cmdline' },
        { name = 'path' },
      },
    })
  end,
}
