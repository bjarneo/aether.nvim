-- Comment.nvim highlights for Aether colorscheme
local M = {}

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

function M.setup(colors)
	local config = require("aether").config or {}
	local italic = config.disable_italics and "NONE" or "italic"

	-- Comment basic
	hi("CommentNormal", { fg = colors.base03 })
	hi("CommentBold", { fg = colors.base03, style = "bold" })
	hi("CommentItalic", { fg = colors.base03, style = italic })
	hi("CommentUnderline", { fg = colors.base03, style = "underline" })
	hi("CommentStrikethrough", { fg = colors.base03, style = "strikethrough" })

	-- Special comment annotations (TODO, FIXME, etc.)
	-- These are commonly recognized by plugins like todo-comments.nvim
	hi("CommentTodo", { fg = colors.base0A, style = "bold" })
	hi("CommentNote", { fg = colors.base0D, style = "bold" })
	hi("CommentFixme", { fg = colors.base08, style = "bold" })
	hi("CommentHack", { fg = colors.base08, style = "bold" })
	hi("CommentWarning", { fg = colors.base0A, style = "bold" })
	hi("CommentBug", { fg = colors.base08, style = "bold" })
end

return M
