vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.background = 'light'
vim.o.clipboard = 'unnamedplus'
vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.termguicolors = true
vim.keymap.set('n', '<C-h>', vim.cmd.bprev)
vim.keymap.set('n', '<C-l>', vim.cmd.bnext)
vim.keymap.set('n', '<C-t>', vim.cmd.tabnew)
vim.keymap.set('n', '<C-x>', vim.cmd.tabclose)
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'X', vim.cmd.bd)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank() end })
vim.cmd 'set autochdir'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup {
  { 'numToStr/Comment.nvim', opts = {} },
  { 'lewis6991/gitsigns.nvim', opts = {} },
  { 'windwp/nvim-autopairs', opts = {} },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function() vim.cmd.colorscheme 'catppuccin-latte' end,
  },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.statusline').setup()
      require('mini.tabline').setup()
    end,
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
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        css = { 'prettier' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        python = { 'autopep8' },
        rust = { 'rustfmt' },
        scss = { 'prettier' },
        typescript = { 'prettier' },
        xml = { 'xmlformatter' },
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
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'c_sharp', 'cpp', 'lua', 'markdown', 'rust', 'vim', 'vimdoc' },
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
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ['(f'] = '@function.outer',
              ['(c'] = '@class.outer',
            },
            goto_next_end = {
              [')f'] = '@function.outer',
              [')c'] = '@class.outer',
            },
            goto_previous_start = {
              ['[f'] = '@function.outer',
              ['[c'] = '@class.outer',
            },
            goto_previous_end = {
              [']f'] = '@function.outer',
              [']c'] = '@class.outer',
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
          ['<C-x>'] = cmp.mapping.abort(),
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
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(_)
          vim.bo[_.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          vim.keymap.set('n', '<leader>d', vim.lsp.buf.type_definition, { desc = 'Go to type definition', buffer = _.buf })
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration', buffer = _.buf })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition', buffer = _.buf })
          vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { desc = 'Hover information', buffer = _.buf })
          vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = 'Go to implementation', buffer = _.buf })
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Symbol references', buffer = _.buf })
          vim.keymap.set('n', 'gR', vim.lsp.buf.rename, { desc = 'Rename symbol', buffer = _.buf })
          vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { desc = 'Signature help', buffer = _.buf })
          vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, { desc = 'Code action', buffer = _.buf })
        end,
      })
      require('mason').setup()
      require('mason-tool-installer').setup {
        ensure_installed = { 'autopep8', 'clang-format', 'llm-ls', 'prettier', 'stylua', 'xmlformatter' },
      }
      require('mason-lspconfig').setup {
        ensure_installed = { 'clangd', 'lua_ls', 'omnisharp', 'pyright', 'rust_analyzer' },
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
      vim.keymap.set('n', '<C-f>c', builtin.commands, { desc = 'Commands' })
      vim.keymap.set('n', '<C-f>d', builtin.diagnostics, { desc = 'Diagnostics' })
      vim.keymap.set('n', '<C-f>f', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<C-f>G', builtin.git_status, { desc = 'Git status' })
      vim.keymap.set('n', '<C-f>g', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<C-f>h', builtin.help_tags, { desc = 'Help tags' })
      vim.keymap.set('n', '<C-f>k', builtin.keymaps, { desc = 'Keymaps' })
      vim.keymap.set('n', '<C-f>m', builtin.marks, { desc = 'Marks' })
      vim.keymap.set('n', '<C-f>o', builtin.oldfiles, { desc = 'Old files' })
      vim.keymap.set('n', '<C-f>s', builtin.lsp_document_symbols, { desc = 'Document symbols' })
      vim.keymap.set('n', '<C-f>S', builtin.lsp_workspace_symbols, { desc = 'Workspace symbols' })
      vim.keymap.set('n', '<C-f>t', builtin.treesitter, { desc = 'Treesitter' })
    end,
  },
  {
    'huggingface/llm.nvim',
    config = function()
      require('llm').setup {
        backend = 'ollama',
        model = 'codellama',
        url = 'http://localhost:11434/api/generate',
        lsp = { bin_path = vim.api.nvim_call_function('stdpath', { 'data' }) .. '/mason/bin/llm-ls' },
      }
    end,
  },
}
