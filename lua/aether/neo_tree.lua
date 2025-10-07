-- Neo-tree support for Aether colorscheme
-- This module provides Neo-tree highlight groups

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
	-- Neo-tree highlight groups
	hi("NeoTreeDirectoryName", { fg = colors.base0D })
	hi("NeoTreeDirectoryIcon", { fg = colors.base0D })
	hi("NeoTreeFileName", { fg = colors.base05 })
	hi("NeoTreeFileIcon", { fg = colors.base0C })
	hi("NeoTreeModified", { fg = colors.base0A })
	hi("NeoTreeGitAdded", { fg = colors.base0B })
	hi("NeoTreeGitDeleted", { fg = colors.base08 })
	hi("NeoTreeGitModified", { fg = colors.base0A })
	hi("NeoTreeGitUntracked", { fg = colors.base08 })

	-- Neo-tree selection and cursor
	hi("NeoTreeCursorLine", { bg = colors.base03 })
	hi("NeoTreeSelected", { fg = colors.base05, bg = colors.base0D })
	hi("NeoTreeSelectedFile", { fg = colors.base05, bg = colors.base0D })
	hi("NeoTreeSelectedDirectory", { fg = colors.base05, bg = colors.base0D })

	-- Neo-tree window and borders
	hi("NeoTreeNormal", { fg = colors.base05 })
	hi("NeoTreeNormalNC", { fg = colors.base05 })
	hi("NeoTreeVertSplit", { fg = colors.base03 })
	hi("NeoTreeWinSeparator", { fg = colors.base03 })
end

return M
