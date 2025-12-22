-- Fidget plugin support for Aether colorscheme
local M = {}

---@type aether.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    FidgetTask = { fg = c.comment },
    FidgetTitle = { fg = c.blue, bold = true },
  }
end

return M
