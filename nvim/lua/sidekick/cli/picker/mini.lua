---@module 'mini.pick'
local M = {}
M.sources = {
  buffers = 'buffers',
  files = 'files',
  grep = 'grep',
}
---@param source string
---@param cb fun(items:sidekick.context.Loc[])
---@param opts? table
function M.open(source, cb, opts)
  opts = opts or {}
  if opts.on_show then opts.on_show() end
  local pick_opts = vim.tbl_deep_extend('force', opts, {
    source = {
      choose = function(item)
        cb(M._items_to_locs { item })
        return false
      end,
      choose_marked = function(items)
        cb(M._items_to_locs(items))
        return false
      end,
    },
  })
  local builtin = require('mini.pick').builtin[M.sources[source] or source]
  if builtin then builtin(nil, pick_opts) end
end
---@param cb fun(items:sidekick.context.Loc[])
function M.action(cb)
  return function(items)
    if not items or #items == 0 then return end
    cb(M._items_to_locs(items))
  end
end
function M.send(items) M.action(require('sidekick.cli.picker')._send_cb())(items) end
---@param items table[]
---@return sidekick.context.Loc[]
function M._items_to_locs(items)
  local ret = {} ---@type sidekick.context.Loc[]
  for _, item in ipairs(items) do
    local loc = M._item_to_loc(item)
    if loc then ret[#ret + 1] = loc end
  end
  return ret
end
---@param item any
---@return sidekick.context.Loc?
function M._item_to_loc(item)
  if type(item) == 'string' then return { name = item, cwd = vim.fn.getcwd() } end
  if type(item) == 'number' then
    local name = vim.api.nvim_buf_get_name(item)
    return { buf = item, name = name, cwd = vim.fn.getcwd() }
  end
  if type(item) == 'table' then
    local loc = { cwd = vim.fn.getcwd() } ---@type sidekick.context.Loc
    local buf_id = item.bufnr or item.buf_id or item.buf
    if buf_id then loc.buf = buf_id end
    loc.name = item.path
    if not loc.name and loc.buf then loc.name = vim.api.nvim_buf_get_name(loc.buf) end
    if item.lnum then loc.row = item.lnum end
    if item.col then loc.col = item.col end
    if item.end_lnum then loc.range = { from = { item.lnum or 1, item.col or 1 }, to = { item.end_lnum, item.end_col or 1 }, kind = 'line' } end
    return loc
  end
  return nil
end
return M
