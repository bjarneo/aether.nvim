-- Telescope support for Aether colorscheme
-- This module provides Telescope-related highlight groups

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
  -- Telescope general
  hi("TelescopeSelection", { fg = colors.base05, bg = colors.base00 })
  hi("TelescopeSelectionCaret", { fg = colors.base05, bg = colors.base00 })
  hi("TelescopeMultiSelection", { fg = colors.base05, bg = colors.base00 })
  hi("TelescopeNormal", { fg = colors.base05, bg = colors.base00 })
  hi("TelescopeBorder", { fg = colors.base03, bg = colors.base00 })
  hi("TelescopeMatching", { fg = colors.base0C, style = "bold" })

  -- Telescope prompt
  hi("TelescopePromptNormal", { fg = colors.base05, bg = colors.base00 })
  hi("TelescopePromptBorder", { fg = colors.base03, bg = colors.base00 })
  hi("TelescopePromptTitle", { fg = colors.base0D, style = "bold" })
  hi("TelescopePromptPrefix", { fg = colors.base05 })

  -- Telescope preview
  hi("TelescopePreviewNormal", { fg = colors.base05, bg = colors.base00 })
  hi("TelescopePreviewBorder", { fg = colors.base03, bg = colors.base00 })
  hi("TelescopePreviewTitle", { fg = colors.base0D, style = "bold" })
  hi("TelescopePreviewLine", { bg = colors.base00 })
  hi("TelescopePreviewMatch", { fg = colors.base0C, bg = colors.base00 })

  -- Telescope results
  hi("TelescopeResultsNormal", { fg = colors.base05, bg = colors.base00 })
  hi("TelescopeResultsBorder", { fg = colors.base03, bg = colors.base00 })
  hi("TelescopeResultsTitle", { fg = colors.base08, style = "bold" })

  -- Telescope file browser essentials
  hi("TelescopeResultsDirectory", { fg = colors.base0D, style = "bold" })

  -- Telescope git (if using git features)
  hi("TelescopeResultsGitStatus", { fg = colors.base0A })
  hi("TelescopeResultsGitBranch", { fg = colors.base0B })
end

return M
