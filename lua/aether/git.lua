-- Git support for Aether colorscheme
-- This module provides Git-related highlight groups

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)

  -- Git gutter highlight groups
  hi("GitGutterAdd", { fg = colors.base0B })
  hi("GitGutterChange", { fg = colors.base0A })
  hi("GitGutterDelete", { fg = colors.base08 })
  hi("GitGutterChangeDelete", { fg = colors.base0E })
end

return M