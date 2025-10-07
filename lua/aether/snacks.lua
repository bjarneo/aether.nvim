-- Snacks.nvim highlights for Aether colorscheme

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
	-- Snacks dashboard
	hi("SnacksDashboardHeader", { fg = colors.base08, style = "bold" })
	hi("SnacksDashboardFooter", { fg = colors.base03 })
	hi("SnacksDashboardKey", { fg = colors.base0D, style = "bold" })
	hi("SnacksDashboardDesc", { fg = colors.base05 })
	hi("SnacksDashboardIcon", { fg = colors.base0C })

	-- Snacks notifications
	hi("SnacksNotification", { fg = colors.base05, bg = colors.float_bg })
	hi("SnacksNotificationError", { fg = colors.base08 })
	hi("SnacksNotificationWarn", { fg = colors.base0A })
	hi("SnacksNotificationInfo", { fg = colors.base0D })
	hi("SnacksNotificationBorder", { fg = colors.base03, bg = colors.float_bg })

	-- Snacks input
	hi("SnacksInputNormal", { fg = colors.base05, bg = colors.float_bg })
	hi("SnacksInputBorder", { fg = colors.base03, bg = colors.float_bg })
	hi("SnacksInputTitle", { fg = colors.base0D, style = "bold" })

	-- Snacks picker (file picker)
	hi("SnacksPickerNormal", { fg = colors.base05, bg = colors.float_bg })
	hi("SnacksPickerBorder", { fg = colors.base03, bg = colors.float_bg })
	hi("SnacksPickerMatch", { fg = colors.base0C, style = "bold" })
end

return M
