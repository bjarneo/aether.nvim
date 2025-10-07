-- WhichKey highlights for Aether colorscheme

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
	local config = require("aether").config or {}
	local italic = config.disable_italics and "NONE" or "italic"

	-- WhichKey main elements
	hi("WhichKey", { fg = colors.base08, style = "bold" })
	hi("WhichKeyGroup", { fg = colors.base0D })
	hi("WhichKeyDesc", { fg = colors.base0D })
	hi("WhichKeySeperator", { fg = colors.base03 })
	hi("WhichKeySeparator", { fg = colors.base03 })
	hi("WhichKeyFloat", { bg = colors.float_bg })
	hi("WhichKeyValue", { fg = colors.base0B })
	hi("WhichKeyBorder", { fg = colors.base03, bg = colors.float_bg })

	-- WhichKey specific key types
	hi("WhichKeyNormal", { fg = colors.base05, bg = colors.float_bg })
	hi("WhichKeyTitle", { fg = colors.base0D, style = "bold" })
	hi("WhichKeyIcon", { fg = colors.base0C })
	hi("WhichKeyIconAzure", { fg = colors.base0D })
	hi("WhichKeyIconBlue", { fg = colors.base0D })
	hi("WhichKeyIconCyan", { fg = colors.base0B })
	hi("WhichKeyIconGreen", { fg = colors.base0B })
	hi("WhichKeyIconGrey", { fg = colors.base03 })
	hi("WhichKeyIconOrange", { fg = colors.base0C })
	hi("WhichKeyIconPurple", { fg = colors.base08 })
	hi("WhichKeyIconRed", { fg = colors.base08 })
	hi("WhichKeyIconYellow", { fg = colors.base0A })

	-- WhichKey buffer/window
	hi("WhichKeyBg", { bg = colors.float_bg })

	-- WhichKey modes
	hi("WhichKeyNormalMode", { fg = colors.base0D, style = "bold" })
	hi("WhichKeyInsertMode", { fg = colors.base0B, style = "bold" })
	hi("WhichKeyVisualMode", { fg = colors.base08, style = "bold" })
	hi("WhichKeyCommandMode", { fg = colors.base0A, style = "bold" })
	hi("WhichKeyTerminalMode", { fg = colors.base0C, style = "bold" })

	-- WhichKey operators
	hi("WhichKeyOperator", { fg = colors.base05 })
	hi("WhichKeyMotion", { fg = colors.base0A })
	hi("WhichKeyTextObject", { fg = colors.base0C })

	-- WhichKey special
	hi("WhichKeySpecial", { fg = colors.base0C, style = "bold" })
	hi("WhichKeyBuffer", { fg = colors.base03 })
	hi("WhichKeyWindow", { fg = colors.base03 })

	-- WhichKey hints
	hi("WhichKeyHint", { fg = colors.base0C, style = italic })
	hi("WhichKeyMapping", { fg = colors.base05 })
	hi("WhichKeyCommand", { fg = colors.base08 })
	hi("WhichKeyPrefix", { fg = colors.base0D, style = "bold" })

	-- WhichKey registers
	hi("WhichKeyRegister", { fg = colors.base0C })
	hi("WhichKeyMark", { fg = colors.base0E })

	-- WhichKey numbers
	hi("WhichKeyNumber", { fg = colors.base0C })
	hi("WhichKeyCount", { fg = colors.base0C, style = "bold" })
end

return M
