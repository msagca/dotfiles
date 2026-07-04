require('koda').setup {
  styles = { functions = {}, keywords = {}, comments = {}, strings = {}, constants = {} },
  theme = { light = 'glade', dark = 'moss' },
}
vim.cmd.colorscheme 'koda'
