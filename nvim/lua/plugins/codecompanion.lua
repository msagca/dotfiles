return {
  'olimorris/codecompanion.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
  event = 'BufRead',
  config = function()
    require('codecompanion').setup {
      strategies = {
        chat = {
          adapter = 'ollama',
        },
        inline = {
          adapter = 'ollama',
          keymaps = {
            accept_change = {
              modes = { n = 'gA' },
              description = 'Accept the suggested change',
            },
            reject_change = {
              modes = { n = 'gR' },
              description = 'Reject the suggested change',
            },
          },
        },
      },
    }
  end,
}
