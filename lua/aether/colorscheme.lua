-- Aether colorscheme colors for use by external tools like lualine
-- This module provides access to the currently active color palette
-- Colors are cached after the theme is loaded to avoid re-initialization

local M = {}

-- Cache for the color palette
local cached_colors = nil

-- Get the current color palette
function M.get()
  if cached_colors then
    return cached_colors
  end
  
  -- Colors haven't been set up yet, do initial setup
  local config = require("aether.config")
  local colors_module = require("aether.colors")
  local opts = config.extend()
  cached_colors = colors_module.setup(opts)
  
  return cached_colors
end

-- Set the cached colors (called by theme.lua after setup)
function M.set(colors)
  cached_colors = colors
end

-- For compatibility with simple require() calls
setmetatable(M, {
  __index = function(_, key)
    local colors = M.get()
    return colors[key]
  end
})

return M
