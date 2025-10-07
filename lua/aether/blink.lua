-- Blink.cmp highlights for Aether colorscheme

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
	local config = require("aether").config or {}
	local italic = config.disable_italics and "NONE" or "italic"

	-- Blink completion menu
	hi("BlinkCmpMenu", { fg = colors.base05, bg = colors.float_bg })
	hi("BlinkCmpMenuBorder", { fg = colors.base03 })
	hi("BlinkCmpMenuSelection", { fg = colors.base05, bg = colors.selection_bg })
	hi("BlinkCmpMenuSearchMatch", { fg = colors.base00, bg = colors.base0A })

	-- Blink completion items
	hi("BlinkCmpLabel", { fg = colors.base05 })
	hi("BlinkCmpLabelDetail", { fg = colors.base03 })
	hi("BlinkCmpLabelDescription", { fg = colors.base03, style = italic })
	hi("BlinkCmpLabelMatch", { fg = colors.base08, style = "bold" })
	hi("BlinkCmpLabelDeprecated", { fg = colors.base03, style = "strikethrough" })

	-- Blink signature help
	hi("BlinkCmpSignature", { fg = colors.base05, bg = colors.float_bg })
	hi("BlinkCmpSignatureBorder", { fg = colors.base03, bg = colors.float_bg })
	hi("BlinkCmpSignatureActiveParameter", { fg = colors.base08, bg = colors.float_bg })

	-- Blink scrollbar
	hi("BlinkCmpScrollbar", { fg = colors.base03, bg = colors.float_bg })
	hi("BlinkCmpScrollbarThumb", { fg = colors.base05, bg = colors.float_bg })

	-- Blink completion documentation
	hi("BlinkCmpDoc", { fg = colors.base05, bg = colors.float_bg })
	hi("BlinkCmpDocBorder", { fg = colors.base03 })
	hi("BlinkCmpDocSeparator", { fg = colors.base03 })

	-- Blink completion ghost text
	hi("BlinkCmpGhostText", { fg = colors.base03, style = italic })

	-- Blink completion fuzzy matching
	hi("BlinkCmpFuzzy", { fg = colors.base08, style = "bold" })
	hi("BlinkCmpFuzzyMatch", { fg = colors.base00, bg = colors.base0A })

	-- Blink completion preview
	hi("BlinkCmpPreview", { fg = colors.base05, bg = colors.float_bg })
	hi("BlinkCmpPreviewBorder", { fg = colors.base03 })
	hi("BlinkCmpPreviewTitle", { fg = colors.base08, style = "bold" })
end

return M
