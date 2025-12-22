---@class aether
---@field config aether.Config
---@field colors ColorScheme
local M = {}

---Load the colorscheme
---@param opts? aether.Config
---@return ColorScheme colors
---@return table<string, vim.api.keyset.highlight> groups
---@return aether.Config opts
function M.load(opts)
  opts = require("aether.config").extend(opts)
  return require("aether.theme").setup(opts)
end

---Configure aether
---@param opts? aether.Config
function M.setup(opts)
  require("aether.config").setup(opts)
end

return M
