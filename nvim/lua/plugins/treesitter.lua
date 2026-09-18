local shaderlab = vim.fs.normalize '~/tree-sitter-shaderlab'
local has_shaderlab = vim.uv.fs_stat(vim.fs.joinpath(shaderlab, 'grammar.js')) ~= nil
if has_shaderlab then
  vim.api.nvim_create_autocmd('User', {
    pattern = 'TSUpdate',
    callback = function()
      require('nvim-treesitter.parsers').shaderlab = { install_info = { path = shaderlab, queries = 'queries' } }
    end,
  })
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'shaderlab',
    callback = function(args) pcall(vim.treesitter.start, args.buf) end,
  })
end
local parsers = {
  'bash',
  'c',
  'c_sharp',
  'cmake',
  'cpp',
  'css',
  'gdscript',
  'glsl',
  'go',
  'hlsl',
  'html',
  'javascript',
  'json',
  'kotlin',
  'latex',
  'lua',
  'markdown',
  'markdown_inline',
  'odin',
  'powershell',
  'python',
  'query',
  'ruby',
  'rust',
  'slang',
  'sql',
  'swift',
  'systemverilog',
  'tcl',
  'toml',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
  'zig',
}
if has_shaderlab then table.insert(parsers, 'shaderlab') end
require('nvim-treesitter').install(parsers)
