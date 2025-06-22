return { 'mbbill/undotree', event = 'BufRead', config = function() vim.keymap.set('n', '<BS>', vim.cmd.UndotreeToggle, { desc = 'Undo tree' }) end }
