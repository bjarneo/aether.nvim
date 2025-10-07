-- nvim-dap highlights for Aether colorscheme

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
	local config = require("aether").config or {}
	local italic = config.disable_italics and "NONE" or "italic"

	-- DAP breakpoints
	hi("DapBreakpoint", { fg = colors.base08 })
	hi("DapBreakpointCondition", { fg = colors.base0A })
	hi("DapBreakpointRejected", { fg = colors.base03 })
	hi("DapLogPoint", { fg = colors.base0D })
	hi("DapStopped", { fg = colors.base08 })

	-- DAP signs
	hi("DapBreakpointSign", { fg = colors.base08 })
	hi("DapBreakpointConditionSign", { fg = colors.base0A })
	hi("DapBreakpointRejectedSign", { fg = colors.base03 })
	hi("DapLogPointSign", { fg = colors.base0D })
	hi("DapStoppedSign", { fg = colors.base08 })

	-- DAP line highlights
	hi("DapBreakpointLine", { bg = colors.base03 })
	hi("DapStoppedLine", { bg = colors.base03 })

	-- DAP UI
	hi("DapUIVariable", { fg = colors.base05 })
	hi("DapUIScope", { fg = colors.base0A })
	hi("DapUIType", { fg = colors.base0A })
	hi("DapUIValue", { fg = colors.base0B })
	hi("DapUIModifiedValue", { fg = colors.base0A })
	hi("DapUIDecoration", { fg = colors.base03 })
	hi("DapUIThread", { fg = colors.base08 })
	hi("DapUIStoppedThread", { fg = colors.base08 })
	hi("DapUIFrameName", { fg = colors.base08 })
	hi("DapUISource", { fg = colors.base0B })
	hi("DapUILineNumber", { fg = colors.base03 })
	hi("DapUIFloatBorder", { fg = colors.base03 })
	hi("DapUIWatchesEmpty", { fg = colors.base03 })
	hi("DapUIWatchesValue", { fg = colors.base0B })
	hi("DapUIWatchesError", { fg = colors.base08 })
	hi("DapUIBreakpointsPath", { fg = colors.base0B })
	hi("DapUIBreakpointsInfo", { fg = colors.base0D })
	hi("DapUIBreakpointsCurrentLine", { fg = colors.base08, style = "bold" })
	hi("DapUIBreakpointsLine", { fg = colors.base03 })
	hi("DapUIBreakpointsDisabledLine", { fg = colors.base03 })
	hi("DapUICurrentFrameName", { fg = colors.base08, style = "bold" })
	hi("DapUIStepOver", { fg = colors.base08 })
	hi("DapUIStepInto", { fg = colors.base08 })
	hi("DapUIStepBack", { fg = colors.base08 })
	hi("DapUIStepOut", { fg = colors.base08 })
	hi("DapUIStop", { fg = colors.base08 })
	hi("DapUIRestart", { fg = colors.base0A })
	hi("DapUIPlayPause", { fg = colors.base0D })
	hi("DapUIUnavailable", { fg = colors.base03 })
	hi("DapUIWinSelect", { fg = colors.base08, style = "bold" })
	hi("DapUIEndCollapseColor", { fg = colors.base03 })
	hi("DapUIFloatNormal", { fg = colors.base05, bg = colors.base03 })
	hi("DapUIFloatTitle", { fg = colors.base08, style = "bold" })
	hi("DapUIControl", { fg = colors.base08 })
	hi("DapUIStepOverNC", { fg = colors.base08 })
	hi("DapUIStepIntoNC", { fg = colors.base08 })
	hi("DapUIStepBackNC", { fg = colors.base08 })
	hi("DapUIStepOutNC", { fg = colors.base08 })
	hi("DapUIStopNC", { fg = colors.base08 })
	hi("DapUIRestartNC", { fg = colors.base0A })
	hi("DapUIPlayPauseNC", { fg = colors.base0D })
	hi("DapUIUnavailableNC", { fg = colors.base03 })
	hi("DapUIWinSelectNC", { fg = colors.base08 })

	-- DAP virtual text
	hi("DapVirtualText", { fg = colors.base03, style = italic })
end

return M
