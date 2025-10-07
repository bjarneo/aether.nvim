-- Flash.nvim highlights for Aether colorscheme
local M = {}

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

function M.setup(colors)
	-- Flash main highlights
	hi("FlashBackdrop", { fg = colors.base03 })
	hi("FlashLabel", { fg = colors.base00, bg = colors.base08, style = "bold" })
	hi("FlashMatch", { fg = colors.base00, bg = colors.base0A })
	hi("FlashCurrent", { fg = colors.base00, bg = colors.base0A })
	hi("FlashPrompt", { fg = colors.base0D, style = "bold" })
	hi("FlashPromptIcon", { fg = colors.base08 })
	hi("FlashCursor", { fg = colors.base00, bg = colors.base05 })

	-- Flash treesitter
	hi("FlashTreachery", { fg = colors.base08, style = "bold" })

	-- Flash leap compatibility
	hi("LeapMatch", { fg = colors.base00, bg = colors.base0A })
	hi("LeapLabelPrimary", { fg = colors.base00, bg = colors.base08, style = "bold" })
	hi("LeapLabelSecondary", { fg = colors.base00, bg = colors.base0C, style = "bold" })
	hi("LeapBackdrop", { fg = colors.base03 })

	-- Flash hop compatibility
	hi("HopNextKey", { fg = colors.base00, bg = colors.base08, style = "bold" })
	hi("HopNextKey1", { fg = colors.base00, bg = colors.base0C, style = "bold" })
	hi("HopNextKey2", { fg = colors.base00, bg = colors.base0A, style = "bold" })
	hi("HopUnmatched", { fg = colors.base03 })

	-- Flash lightspeed compatibility
	hi("LightspeedGreyWash", { fg = colors.base03 })
	hi("LightspeedLabel", { fg = colors.base00, bg = colors.base08, style = "bold" })
	hi("LightspeedLabelDistant", { fg = colors.base00, bg = colors.base0C, style = "bold" })
	hi("LightspeedLabelDistantOverlapped", { fg = colors.base00, bg = colors.base0A, style = "bold" })
	hi("LightspeedLabelOverlapped", { fg = colors.base00, bg = colors.base0A, style = "bold" })
	hi("LightspeedMaskedChar", { fg = colors.base03 })
	hi("LightspeedOneCharMatch", { fg = colors.base00, bg = colors.base0A })
	hi("LightspeedPendingOpArea", { fg = colors.base05, bg = colors.subtle_bg })
	hi("LightspeedShort", { fg = colors.base00, bg = colors.base08, style = "bold" })
	hi("LightspeedShortCut", { fg = colors.base00, bg = colors.base0C, style = "bold" })
	hi("LightspeedUniqueChar", { fg = colors.base08, style = "bold" })
	hi("LightspeedUnlabeledMatch", { fg = colors.base00, bg = colors.base0A })

	-- Flash custom modes
	hi("FlashChar", { fg = colors.base08, style = "bold" })
	hi("FlashWord", { fg = colors.base0D, style = "bold" })
	hi("FlashLine", { fg = colors.base0C, style = "bold" })
	hi("FlashRemote", { fg = colors.base0A, style = "bold" })

	-- Flash search
	hi("FlashSearch", { fg = colors.base00, bg = colors.base0A })
	hi("FlashSearchMatch", { fg = colors.base08, bg = colors.subtle_bg })
	hi("FlashSearchCursor", { fg = colors.base00, bg = colors.base05 })

	-- Flash substitute
	hi("FlashSubstitute", { fg = colors.base00, bg = colors.base0A })
	hi("FlashSubstituteMatch", { fg = colors.base0A, bg = colors.subtle_bg })

	-- Flash yank
	hi("FlashYank", { fg = colors.base00, bg = colors.base0D })
	hi("FlashYankMatch", { fg = colors.base0D, bg = colors.subtle_bg })

	-- Flash motion
	hi("FlashMotion", { fg = colors.base00, bg = colors.base0C })
	hi("FlashMotionMatch", { fg = colors.base0C, bg = colors.subtle_bg })

	-- Flash range
	hi("FlashRange", { fg = colors.base00, bg = colors.base0A })
	hi("FlashRangeMatch", { fg = colors.base0A, bg = colors.subtle_bg })

	-- Flash error
	hi("FlashError", { fg = colors.base08, style = "bold" })
	hi("FlashErrorMatch", { fg = colors.base08, bg = colors.subtle_bg })

	-- Flash warning
	hi("FlashWarning", { fg = colors.base0A, style = "bold" })
	hi("FlashWarningMatch", { fg = colors.base0A, bg = colors.subtle_bg })

	-- Flash info
	hi("FlashInfo", { fg = colors.base0D, style = "bold" })
	hi("FlashInfoMatch", { fg = colors.base0D, bg = colors.subtle_bg })

	-- Flash hint
	hi("FlashHint", { fg = colors.base0C, style = "bold" })
	hi("FlashHintMatch", { fg = colors.base0C, bg = colors.subtle_bg })
end

return M
