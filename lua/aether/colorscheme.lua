---Provides color access for external tools (lualine, etc.)
---@class aether.ColorScheme
local M = {}

---Get the current color palette
---@return ColorScheme
function M.get()
  local opts = require("aether.config").extend()
  return require("aether.colors").setup(opts)
end

-- Allow direct color access via metatable
return setmetatable(M, {
  __index = function(_, key)
    return M.get()[key]
  end,
})
