-- Trouble.nvim highlights for Aether colorscheme

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
	local config = require("aether").config or {}
	local italic = config.disable_italics and "NONE" or "italic"

	-- Trouble window
	hi("TroubleNormal", { fg = colors.base05 })
	hi("TroubleNormalNC", { fg = colors.base05 })
	hi("TroubleText", { fg = colors.base05 })
	hi("TroubleTextInformation", { fg = colors.base0D })
	hi("TroubleTextWarning", { fg = colors.base0A })
	hi("TroubleTextError", { fg = colors.base08 })
	hi("TroubleTextHint", { fg = colors.base0C })

-- Trouble text
hi("TroubleText", { fg = colors.base05 })
hi("TroubleTextError", { fg = colors.base08 })
hi("TroubleTextWarning", { fg = colors.base0A })
hi("TroubleTextInformation", { fg = colors.base0D })
hi("TroubleTextHint", { fg = colors.base0C })

-- Trouble signs
hi("TroubleSignError", { fg = colors.base08 })
hi("TroubleSignWarning", { fg = colors.base0A })
hi("TroubleSignInformation", { fg = colors.base0D })
hi("TroubleSignHint", { fg = colors.base0C })

-- Trouble file/location
hi("TroubleFile", { fg = colors.base0C })
hi("TroubleLocation", { fg = colors.base03 })
hi("TroubleCode", { fg = colors.base0B })

	-- Trouble folding
	hi("TroubleFoldIcon", { fg = colors.base03 })
	hi("TroubleFoldIconClosed", { fg = colors.base03 })
	hi("TroubleFoldIconOpen", { fg = colors.base03 })

	-- Trouble indent
	hi("TroubleIndent", { fg = colors.base03 })
	hi("TroubleIndentTop", { fg = colors.base03 })
	hi("TroubleIndentMiddle", { fg = colors.base03 })
	hi("TroubleIndentLast", { fg = colors.base03 })
	hi("TroubleIndentFoldOpen", { fg = colors.base03 })
	hi("TroubleIndentFoldClosed", { fg = colors.base03 })
	hi("TroubleIndentWs", { fg = colors.base03 })

	-- Trouble preview
	hi("TroublePreview", { fg = colors.base05, bg = colors.base03 })
	hi("TroublePreviewBorder", { fg = colors.base03 })
	hi("TroublePreviewTitle", { fg = colors.base08, style = "bold" })

	-- Trouble help
	hi("TroubleHelp", { fg = colors.base03, style = italic })
	hi("TroubleHelpHeader", { fg = colors.base08, style = "bold" })

	-- Trouble cursor
	hi("TroubleCursor", { fg = colors.base00, bg = colors.base05 })
	hi("TroubleCursorLine", { bg = colors.base03 })

	-- Trouble match
	hi("TroubleMatch", { fg = colors.base00, bg = colors.base0A })

	-- Trouble virtual text
	hi("TroubleVirtualText", { fg = colors.base03, style = italic })

	-- Trouble pos
	hi("TroublePos", { fg = colors.base03 })

	-- Trouble basename
	hi("TroubleBasename", { fg = colors.base08 })

	-- Trouble dirname
	hi("TroubleDirname", { fg = colors.base0A })

	-- Trouble todo
	hi("TroubleTodo", { fg = colors.base0A, style = "bold" })

	-- Trouble qflist
	hi("TroubleQfListText", { fg = colors.base05 })
	hi("TroubleQfListFileName", { fg = colors.base0B })
	hi("TroubleQfListLineNr", { fg = colors.base03 })
	hi("TroubleQfListPos", { fg = colors.base03 })

	-- Trouble loclist
	hi("TroubleLocListText", { fg = colors.base05 })
	hi("TroubleLocListFileName", { fg = colors.base0B })
	hi("TroubleLocListLineNr", { fg = colors.base03 })
	hi("TroubleLocListPos", { fg = colors.base03 })
end

return M
