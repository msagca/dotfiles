local shaderlab_build = vim.fn.has 'win32' == 1 and { 'cmd.exe', '/c', 'build.cmd' } or { 'sh', 'build.sh' }
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(args)
    local data = args.data
    if data.spec.name ~= 'shaderlab-ls' or data.kind == 'delete' then return end
    vim.system(shaderlab_build, { cwd = data.path }, function(result)
      vim.schedule(function()
        if result.code == 0 then
          vim.notify 'shaderlab-ls built'
        else
          vim.notify('shaderlab-ls build failed:\n' .. result.stderr, vim.log.levels.ERROR)
        end
      end)
    end)
  end,
})
