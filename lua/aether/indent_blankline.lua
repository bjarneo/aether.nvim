-- Indent Blankline highlights for Aether colorscheme
local M = {}

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

function M.setup(colors)
	-- Indent Blankline v2 (legacy)
	hi("IndentBlanklineChar", { fg = colors.base03 })
	hi("IndentBlanklineContextChar", { fg = colors.base0D })
	hi("IndentBlanklineContextStart", { style = "underline" })
	hi("IndentBlanklineSpaceChar", { fg = colors.base03 })
	hi("IndentBlanklineSpaceCharBlankline", { fg = colors.base03 })

	-- Indent Blankline v3 (current)
	hi("IblIndent", { fg = colors.base03 })
	hi("IblWhitespace", { fg = colors.base03 })
	hi("IblScope", { fg = colors.base0D })

	-- Rainbow indent colors for v3
	hi("RainbowDelimiterRed", { fg = colors.base08 })
	hi("RainbowDelimiterYellow", { fg = colors.base0A })
	hi("RainbowDelimiterBlue", { fg = colors.base0D })
	hi("RainbowDelimiterOrange", { fg = colors.base0C })
	hi("RainbowDelimiterGreen", { fg = colors.base0B })
	hi("RainbowDelimiterViolet", { fg = colors.base08 })
	hi("RainbowDelimiterCyan", { fg = colors.base0B })

	-- Indent highlight groups for different nesting levels
	hi("IndentLevel1", { fg = colors.base03 })
	hi("IndentLevel2", { fg = colors.base03 })
	hi("IndentLevel3", { fg = colors.base03 })
	hi("IndentLevel4", { fg = colors.base03 })
	hi("IndentLevel5", { fg = colors.base03 })
	hi("IndentLevel6", { fg = colors.base03 })

	-- Context highlighting
	hi("IndentContext", { fg = colors.base0D })
	hi("IndentContextStart", { style = "underline" })
	hi("IndentContextEnd", { style = "underline" })

	-- Scope highlighting
	hi("IndentScope", { fg = colors.base0D })
	hi("IndentScopeActive", { fg = colors.base0D, style = "bold" })
	hi("IndentScopeInactive", { fg = colors.base03 })

	-- Error highlighting
	hi("IndentError", { fg = colors.base08 })
	hi("IndentWarning", { fg = colors.base0A })

	-- Custom bracket highlighting
	hi("IndentBracket", { fg = colors.base05 })
	hi("IndentBracketActive", { fg = colors.base0D, style = "bold" })

	-- Fold integration
	hi("IndentFold", { fg = colors.base03 })
	hi("IndentFoldActive", { fg = colors.base0D })

	-- Virtual text
	hi("IndentVirtualText", { fg = colors.base03 })
	hi("IndentVirtualTextActive", { fg = colors.base0D })

	-- Line highlighting
	hi("IndentLine", { fg = colors.base03 })
	hi("IndentLineActive", { fg = colors.base0D })
	hi("IndentLineContext", { fg = colors.base0D, bg = colors.cursorline_bg })
end

return M
