-- NvimTree highlights for Aether colorscheme

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
	local config = require("aether").config or {}
	local italic = config.disable_italics and "NONE" or "italic"

	-- NvimTree general
	hi("NvimTreeNormal", { fg = colors.base05 })
	hi("NvimTreeNormalFloat", { fg = colors.base05 })
	hi("NvimTreeNormalNC", { fg = colors.base05 })
	hi("NvimTreeVertSplit", { fg = colors.base03 })
	hi("NvimTreeWinSeparator", { fg = colors.base03 })
	hi("NvimTreeEndOfBuffer", { fg = colors.base00 })
	hi("NvimTreeCursorLine", { bg = colors.base03 })
	hi("NvimTreeCursorColumn", { bg = colors.base03 })
	hi("NvimTreeStatusLine", { fg = colors.base00 })
	hi("NvimTreeStatusLineNC", { fg = colors.base00 })

	-- NvimTree folders
	hi("NvimTreeFolderName", { fg = colors.base0D })
	hi("NvimTreeFolderIcon", { fg = colors.base0D })
	hi("NvimTreeOpenedFolderName", { fg = colors.base0D, style = "bold" })
	hi("NvimTreeClosedFolderIcon", { fg = colors.base0D })
	hi("NvimTreeOpenedFolderIcon", { fg = colors.base0D })
	hi("NvimTreeEmptyFolderName", { fg = colors.base03 })
	hi("NvimTreeSymlinkFolderName", { fg = colors.base0C })

	-- NvimTree files
	hi("NvimTreeFileName", { fg = colors.base05 })
	hi("NvimTreeFileIcon", { fg = colors.base05 })
	hi("NvimTreeExecFile", { fg = colors.base0B, style = "bold" })
	hi("NvimTreeOpenedFile", { fg = colors.base05, style = italic })
	hi("NvimTreeModifiedFile", { fg = colors.base0A, style = italic })
	hi("NvimTreeSpecialFile", { fg = colors.base0C, style = "bold" })
	hi("NvimTreeImageFile", { fg = colors.base08 })
	hi("NvimTreeMarkdownFile", { fg = colors.base0D })
	hi("NvimTreeSymlink", { fg = colors.base0C })

	-- NvimTree root
	hi("NvimTreeRootFolder", { fg = colors.base0D, style = "bold" })

	-- NvimTree indent
	hi("NvimTreeIndentMarker", { fg = colors.base03 })
	hi("NvimTreeLiveFilterPrefix", { fg = colors.base0C, style = "bold" })
	hi("NvimTreeLiveFilterValue", { fg = colors.base0B, style = "bold" })

	-- NvimTree git integration
	hi("NvimTreeGitDirty", { fg = colors.base0A })
	hi("NvimTreeGitStaged", { fg = colors.base0B })
	hi("NvimTreeGitMerge", { fg = colors.base0A })
	hi("NvimTreeGitRenamed", { fg = colors.base0A })
	hi("NvimTreeGitNew", { fg = colors.base0B })
	hi("NvimTreeGitDeleted", { fg = colors.base08 })
	hi("NvimTreeGitIgnored", { fg = colors.base03 })

	-- NvimTree file status
	hi("NvimTreeFileRenamed", { fg = colors.base0A })
	hi("NvimTreeFileStaged", { fg = colors.base0B })
	hi("NvimTreeFileNew", { fg = colors.base0B })
	hi("NvimTreeFileDeleted", { fg = colors.base08 })
	hi("NvimTreeFileDirty", { fg = colors.base0A })
	hi("NvimTreeFileIgnored", { fg = colors.base03 })
	hi("NvimTreeFileMerge", { fg = colors.base0A })

	-- NvimTree diagnostics
	hi("NvimTreeLspDiagnosticsError", { fg = colors.base08 })
	hi("NvimTreeLspDiagnosticsWarning", { fg = colors.base0A })
	hi("NvimTreeLspDiagnosticsInformation", { fg = colors.base0D })
	hi("NvimTreeLspDiagnosticsHint", { fg = colors.base0C })

	-- NvimTree bookmarks
	hi("NvimTreeBookmark", { fg = colors.base0C, style = "bold" })
	hi("NvimTreeBookmarkHL", { fg = colors.base0C, bg = colors.base03 })

	-- NvimTree window picker
	hi("NvimTreeWindowPicker", { fg = colors.base00, bg = colors.base0C, style = "bold" })

	-- NvimTree popup
	hi("NvimTreePopup", { fg = colors.base05, bg = colors.base03 })
	hi("NvimTreePopupBorder", { fg = colors.base03, bg = colors.base03 })

	-- NvimTree copy/cut
	hi("NvimTreeCopiedHL", { fg = colors.base0B, bg = colors.base03 })
	hi("NvimTreeCutHL", { fg = colors.base08, bg = colors.base03 })
end

return M
