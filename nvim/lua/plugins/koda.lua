require('koda').setup {
  styles = { comments = {}, constants = {}, functions = {}, keywords = {}, strings = {} },
  theme = { dark = 'moss', light = 'glade' },
  transparent = true,
}
vim.cmd.colorscheme 'koda'
