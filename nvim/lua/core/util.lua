local M = {}

--- Get relative path to file
-- @param file (string, default='%') The file to get the relative path for
function M.relative_path(file)
  if (file == nil) then
    file = '%'
  end

  return vim.fn.fnamemodify(
    vim.fn.expand(file),
    ':p:~:.'
  )
end

--- Wrapper around `vim.keymap.set` to include defaults
---@see vim.keymap.set()
---
---@param modes string|table the keymap mode
---@param lhs string left hand side
---@param rhs string|function right hand side
---@param opts nil|table options
---
function M.map(modes, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(modes, lhs, rhs, options)
end

--- Get the home and current path
function M.path()
  local homePath = vim.fn.expand("$HOME")
  local currentPath = vim.fn.getcwd()
  return homePath, currentPath
end

return M
