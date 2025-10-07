-- GitSigns highlights for Aether colorscheme
local M = {}

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

function M.setup(colors)
	local config = require("aether").config or {}
	local italic = config.disable_italics and "NONE" or "italic"

	-- GitSigns basic signs
	hi("GitSignsAdd", { fg = colors.base0B })
	hi("GitSignsChange", { fg = colors.base0A })
	hi("GitSignsDelete", { fg = colors.base08 })
	hi("GitSignsTopdelete", { fg = colors.base08 })
	hi("GitSignsChangedelete", { fg = colors.base0A })
	hi("GitSignsUntracked", { fg = colors.base0B })

	-- GitSigns line highlights
	hi("GitSignsAddLn", { fg = colors.base0B })
	hi("GitSignsChangeLn", { fg = colors.base0A })
	hi("GitSignsDeleteLn", { fg = colors.base08 })
	hi("GitSignsTopdeleteN", { fg = colors.base08 })
	hi("GitSignsChangedeleteLn", { fg = colors.base0A })
	hi("GitSignsUntrackedLn", { fg = colors.base0B })

	-- GitSigns number highlights
	hi("GitSignsAddNr", { fg = colors.base0B })
	hi("GitSignsChangeNr", { fg = colors.base0A })
	hi("GitSignsDeleteNr", { fg = colors.base08 })
	hi("GitSignsTopdeleteNr", { fg = colors.base08 })
	hi("GitSignsChangedeleteNr", { fg = colors.base0A })
	hi("GitSignsUntrackedNr", { fg = colors.base0B })

	-- GitSigns preview
	hi("GitSignsAddPreview", { fg = colors.base0B, bg = colors.base00 })
	hi("GitSignsDeletePreview", { fg = colors.base08, bg = colors.base00 })
	hi("GitSignsChangePreview", { fg = colors.base0A, bg = colors.base00 })

	-- GitSigns current line blame
	hi("GitSignsCurrentLineBlame", { fg = colors.base03, bg = colors.base00, style = italic })

	-- GitSigns word diff
	hi("GitSignsAddWord", { fg = colors.base00, bg = colors.base0B })
	hi("GitSignsChangeWord", { fg = colors.base00, bg = colors.base0A })
	hi("GitSignsDeleteWord", { fg = colors.base00, bg = colors.base08 })

	-- GitSigns virtual text
	hi("GitSignsAddVirtLn", { fg = colors.base0B })
	hi("GitSignsChangeVirtLn", { fg = colors.base0A })
	hi("GitSignsDeleteVirtLn", { fg = colors.base08 })

	-- GitSigns inline highlights
	hi("GitSignsAddInline", { fg = colors.base00, bg = colors.base0B })
	hi("GitSignsChangeInline", { fg = colors.base00, bg = colors.base0A })
	hi("GitSignsDeleteInline", { fg = colors.base00, bg = colors.base08 })

	-- GitSigns staging area
	hi("GitSignsAddStaged", { fg = colors.base0B, bg = colors.base00 })
	hi("GitSignsChangeStaged", { fg = colors.base0A, bg = colors.base00 })
	hi("GitSignsDeleteStaged", { fg = colors.base08, bg = colors.base00 })

	-- GitSigns diff
	hi("GitSignsDiffAdd", { fg = colors.base0B })
	hi("GitSignsDiffChange", { fg = colors.base0A })
	hi("GitSignsDiffDelete", { fg = colors.base08 })
	hi("GitSignsDiffText", { fg = colors.base0A, bg = colors.base00 })

	-- GitSigns blame
	hi("GitSignsBlame", { fg = colors.base03, style = italic })
	hi("GitSignsBlameHash", { fg = colors.base03 })
	hi("GitSignsBlameAuthor", { fg = colors.base0C })
	hi("GitSignsBlameDate", { fg = colors.base03 })
	hi("GitSignsBlameSummary", { fg = colors.base05 })

	-- GitSigns merge conflicts
	hi("GitSignsConflictOurs", { fg = colors.base0D })
	hi("GitSignsConflictTheirs", { fg = colors.base08 })
	hi("GitSignsConflictAncestor", { fg = colors.base0A })
end

return M
