local config = vim.lsp.config.shaderlab_ls
if config and vim.fn.executable(config.cmd[1]) == 1 then vim.lsp.enable 'shaderlab_ls' end
