-- Noice.nvim highlights for Aether colorscheme

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
	local config = require("aether").config or {}
	local italic = config.disable_italics and "NONE" or "italic"

	-- Noice command line
	hi("NoiceCmdline", { fg = colors.base05, bg = colors.float_bg })
	hi("NoiceCmdlineIcon", { fg = colors.base08 })
	hi("NoiceCmdlineIconCmdline", { fg = colors.base0D })
	hi("NoiceCmdlineIconFilter", { fg = colors.base0B })
	hi("NoiceCmdlineIconHelp", { fg = colors.base0D })
	hi("NoiceCmdlineIconIncRename", { fg = colors.base0A })
	hi("NoiceCmdlineIconInput", { fg = colors.base0C })
	hi("NoiceCmdlineIconLua", { fg = colors.base08 })
	hi("NoiceCmdlineIconSearch", { fg = colors.base0A })
	hi("NoiceCmdlinePopup", { fg = colors.base05, bg = colors.float_bg })
	hi("NoiceCmdlinePopupBorder", { fg = colors.base03 })
	hi("NoiceCmdlinePopupTitle", { fg = colors.base08, style = "bold" })

	-- Noice popupmenu
	hi("NoicePopupmenu", { fg = colors.base05, bg = colors.float_bg })
	hi("NoicePopupmenuSelected", { fg = colors.base05, bg = colors.selection_bg })
	hi("NoicePopupmenuBorder", { fg = colors.base03, bg = colors.float_bg })

	-- Noice messages
	hi("NoiceConfirm", { fg = colors.base05, bg = colors.float_bg })
	hi("NoiceConfirmBorder", { fg = colors.base03, bg = colors.float_bg })

	-- Noice notifications
	hi("NoiceNotification", { fg = colors.base05, bg = colors.float_bg })
	hi("NoiceNotificationBorder", { fg = colors.base03, bg = colors.float_bg })

	-- Noice format
	hi("NoiceFormatProgressDone", { fg = colors.base0D, bg = colors.float_bg })
	hi("NoiceFormatProgressTodo", { fg = colors.base03, bg = colors.float_bg })

	-- Noice LSP progress
	hi("NoiceLspProgressTitle", { fg = colors.base0D, style = "bold" })
	hi("NoiceLspProgressClient", { fg = colors.base0C })

	-- Noice mini view
	hi("NoiceMini", { fg = colors.base05, bg = colors.float_bg })
	hi("NoiceMiniButton", { fg = colors.base08, bg = colors.float_bg })
	hi("NoiceMiniButtonActive", { fg = colors.base05, bg = colors.selection_bg })
	hi("NoiceMiniButtonSelected", { fg = colors.base0D, bg = colors.selection_bg })

	-- Noice split view
	hi("NoiceSplit", { fg = colors.base05 })
	hi("NoiceSplitBorder", { fg = colors.base03 })

	-- Noice virtual text
	hi("NoiceVirtualText", { fg = colors.base03, style = italic })

	-- Noice confirm dialog (updated)
	hi("NoiceConfirmTitle", { fg = colors.base08, style = "bold" })

	-- Noice notification (updated)
	hi("NoiceNotificationTitle", { fg = colors.base08, style = "bold" })

	-- Noice ruler
	hi("NoiceRuler", { fg = colors.base03, bg = colors.float_bg })

	-- Noice format
	hi("NoiceFormatConfirm", { fg = colors.base0D })
	hi("NoiceFormatConfirmDefault", { fg = colors.base0D, style = "bold" })
	hi("NoiceFormatDate", { fg = colors.base03 })
	hi("NoiceFormatEvent", { fg = colors.base0C })
	hi("NoiceFormatKind", { fg = colors.base0A })
	hi("NoiceFormatLevelDebug", { fg = colors.base03 })
	hi("NoiceFormatLevelError", { fg = colors.base08 })
	hi("NoiceFormatLevelInfo", { fg = colors.base0D })
	hi("NoiceFormatLevelOff", { fg = colors.base03 })
	hi("NoiceFormatLevelTrace", { fg = colors.base03 })
	hi("NoiceFormatLevelWarn", { fg = colors.base0A })
	hi("NoiceFormatTitle", { fg = colors.base08, style = "bold" })

	-- Noice scrollbar
	hi("NoiceScrollbar", { fg = colors.base03, bg = colors.float_bg })
	hi("NoiceScrollbarThumb", { fg = colors.base05, bg = colors.float_bg })

	-- Noice cursor
	hi("NoiceCursor", { fg = colors.base00, bg = colors.base05 })
end

return M
