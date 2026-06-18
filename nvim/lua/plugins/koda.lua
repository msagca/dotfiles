require('koda').setup {
  styles = { functions = {}, keywords = {}, comments = { italic = true }, strings = {}, constants = {} },
  theme = { light = 'glade', dark = 'moss' },
}
vim.cmd.colorscheme 'koda'
