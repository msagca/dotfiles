vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.cmd 'set autochdir'
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.o.background = 'light'
vim.o.clipboard = 'unnamedplus'
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shell = 'nu'
vim.o.termguicolors = true
vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank() end })
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup {
  { 'lewis6991/gitsigns.nvim', opts = {} },
  { 'numToStr/Comment.nvim', opts = {} },
  { 'windwp/nvim-autopairs', opts = {} },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function() vim.cmd.colorscheme 'catppuccin-latte' end,
  },
  {
    'mbbill/undotree',
    config = function() vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undo tree' }) end,
  },
  {
    'stevearc/conform.nvim',
    opts = {
      format_after_save = { lsp_fallback = true },
      formatters_by_ft = {
        css = { 'prettier' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        scss = { 'prettier' },
        typescript = { 'prettier' },
        yaml = { 'prettier' },
      },
    },
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      local which_key = require 'which-key'
      which_key.setup()
      which_key.register {
        ['<C-f>'] = { name = 'Telescope' },
        ['<C-n>'] = { name = 'Harpoon' },
      }
    end,
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup()
      vim.keymap.set('n', '<leader>e', vim.cmd.Oil, { desc = 'File explorer' })
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
      vim.keymap.set('n', '<C-n>a', function() harpoon:list():append() end, { desc = 'Append' })
      vim.keymap.set('n', '<C-n>u', function() harpoon:list():select(1) end, { desc = 'Select 1' })
      vim.keymap.set('n', '<C-n>j', function() harpoon:list():select(2) end, { desc = 'Select 2' })
      vim.keymap.set('n', '<C-n>k', function() harpoon:list():select(3) end, { desc = 'Select 3' })
      vim.keymap.set('n', '<C-n>l', function() harpoon:list():select(4) end, { desc = 'Select 4' })
      vim.keymap.set('n', '<C-n>m', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Quick menu' })
      vim.keymap.set('n', '<C-n>n', function() harpoon:list():next() end, { desc = 'Next item' })
      vim.keymap.set('n', '<C-n>p', function() harpoon:list():prev() end, { desc = 'Previous item' })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c_sharp', 'lua', 'vim', 'vimdoc' },
        auto_install = true,
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['as'] = '@scope',
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ['(nf'] = '@function.outer',
              ['(nc'] = '@class.outer',
              ['(ns'] = '@scope',
            },
            goto_next_end = {
              [')nf'] = '@function.outer',
              [')nc'] = '@class.outer',
              [')ns'] = '@scope',
            },
            goto_previous_start = {
              ['(pf'] = '@function.outer',
              ['(pc'] = '@class.outer',
              ['(ps'] = '@scope',
            },
            goto_previous_end = {
              [')pf'] = '@function.outer',
              [')pc'] = '@class.outer',
              [')ps'] = '@scope',
            },
          },
        },
      }
    end,
  },
  {
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
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources {
          { name = 'buffer' },
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
        },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(_)
          vim.bo[_.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code action', buffer = _.buf })
          vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol', buffer = _.buf })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition', buffer = _.buf })
          vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { desc = 'Display information', buffer = _.buf })
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Display references', buffer = _.buf })
        end,
      })
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'omnisharp' },
        handlers = { function(_) require('lspconfig')[_].setup {} end },
      }
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'BurntSushi/ripgrep', 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
    event = 'VimEnter',
    config = function()
      local builtin = require 'telescope.builtin'
      require('telescope').load_extension 'fzf'
      vim.keymap.set('n', '<C-f>b', builtin.buffers, { desc = 'Buffers' })
      vim.keymap.set('n', '<C-f>f', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<C-f>g', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<C-f>h', builtin.help_tags, { desc = 'Help tags' })
      vim.keymap.set('n', '<C-f>o', builtin.oldfiles, { desc = 'Old files' })
    end,
  },
}
