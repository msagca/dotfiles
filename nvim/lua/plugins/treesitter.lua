vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').shaderlab = { install_info = { url = 'https://github.com/msagca/tree-sitter-shaderlab', queries = 'queries' } }
  end,
})
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name ~= 'nvim-treesitter' or ev.data.kind ~= 'update' then return end
    if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
    vim.cmd.TSUpdate()
  end,
})
vim.api.nvim_create_autocmd('FileType', { callback = function(args) pcall(vim.treesitter.start, args.buf) end })
local parsers = {
  'bash',
  'c',
  'c_sharp',
  'cmake',
  'cpp',
  -- 'css',
  -- 'gdscript',
  'glsl',
  -- 'go',
  'hlsl',
  -- 'html',
  -- 'javascript',
  'json',
  -- 'kotlin',
  'latex',
  'lua',
  'markdown',
  'markdown_inline',
  -- 'odin',
  -- 'powershell',
  'python',
  -- 'query',
  -- 'ruby',
  -- 'rust',
  'shaderlab',
  -- 'slang',
  -- 'sql',
  -- 'swift',
  -- 'systemverilog',
  -- 'tcl',
  'toml',
  -- 'typescript',
  'vim',
  'vimdoc',
  'yaml',
  -- 'zig',
}
require('nvim-treesitter').install(parsers)
