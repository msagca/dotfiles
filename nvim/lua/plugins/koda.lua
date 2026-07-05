require('koda').setup {
  styles = { comments = {}, constants = {}, functions = {}, keywords = {}, strings = {} },
  theme = { dark = 'moss', light = 'glade' },
}
vim.cmd.colorscheme 'koda'
