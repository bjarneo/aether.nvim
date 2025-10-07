-- nvim-lint highlights for Aether colorscheme

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
	local config = require("aether").config or {}
	local italic = config.disable_italics and "NONE" or "italic"

	-- Lint signs
	hi("LintError", { fg = colors.base08 })
	hi("LintWarning", { fg = colors.base0A })
	hi("LintInfo", { fg = colors.base0D })
	hi("LintHint", { fg = colors.base0C })
	hi("LintSignError", { fg = colors.base08 })
	hi("LintSignWarning", { fg = colors.base0A })
	hi("LintSignInfo", { fg = colors.base0D })
	hi("LintSignHint", { fg = colors.base0C })

	-- Lint virtual text
	hi("LintVirtualTextError", { fg = colors.base08, style = italic })
	hi("LintVirtualTextWarning", { fg = colors.base0A, style = italic })
	hi("LintVirtualTextInfo", { fg = colors.base0D, style = italic })
	hi("LintVirtualTextHint", { fg = colors.base0C, style = italic })

	-- Lint underline
	hi("LintUnderlineError", { fg = colors.base08, style = "underline" })
	hi("LintUnderlineWarning", { fg = colors.base0A, style = "underline" })
	hi("LintUnderlineInfo", { fg = colors.base0D, style = "underline" })
	hi("LintUnderlineHint", { fg = colors.base0C, style = "underline" })

	-- Lint floating window
	hi("LintFloatBorder", { fg = colors.base03 })
	hi("LintFloatTitle", { fg = colors.base08, style = "bold" })
	hi("LintFloatError", { fg = colors.base08 })
	hi("LintFloatWarning", { fg = colors.base0A })
	hi("LintFloatInfo", { fg = colors.base0D })
	hi("LintFloatHint", { fg = colors.base0C })
end

return M
