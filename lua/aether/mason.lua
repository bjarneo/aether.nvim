-- Mason.nvim highlights for Aether colorscheme

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
	local config = require("aether").config or {}
	local italic = config.disable_italics and "NONE" or "italic"

	-- Mason window
	hi("MasonNormal", { fg = colors.base05, bg = colors.base03 })
	hi("MasonHeader", { fg = colors.base08, bg = colors.base03, style = "bold" })
	hi("MasonHeaderSecondary", { fg = colors.base0C, bg = colors.base03, style = "bold" })

-- Mason highlights (primary and secondary)
hi("MasonHighlight", { fg = colors.base08 })
hi("MasonHighlightSecondary", { fg = colors.base0C })

-- Mason diagnostic messages
hi("MasonError", { fg = colors.base08 })
hi("MasonWarning", { fg = colors.base0A })
hi("MasonInfo", { fg = colors.base0D })
hi("MasonMuted", { fg = colors.base03 })

-- Mason package states (essential)
hi("MasonPackageInstalled", { fg = colors.base0D })
hi("MasonPackagePending", { fg = colors.base0A })
hi("MasonPackageUninstalled", { fg = colors.base08 })

-- Mason headings/titles
hi("MasonHeading", { fg = colors.base08, style = "bold" })

	-- Mason warning
	hi("MasonWarning", { fg = colors.base0A })

	-- Mason info
	hi("MasonInfo", { fg = colors.base0D })

	-- Mason hint
	hi("MasonHint", { fg = colors.base0C })

	-- Mason progress
	hi("MasonProgress", { fg = colors.base08 })

	-- Mason directory/file
	hi("MasonDir", { fg = colors.base0A })
	hi("MasonFile", { fg = colors.base0B })

	-- Mason package states
	hi("MasonPackageInstalled", { fg = colors.base0D })
	hi("MasonPackagePending", { fg = colors.base0A })
	hi("MasonPackageOutdated", { fg = colors.base03 })
	hi("MasonPackageUninstalled", { fg = colors.base08 })

	-- Mason heading
	hi("MasonHeading", { fg = colors.base08, style = "bold" })

	-- Mason button
	hi("MasonButton", { fg = colors.base00, bg = colors.base08 })
	hi("MasonButtonSecondary", { fg = colors.base00, bg = colors.base0C })

	-- Mason log
	hi("MasonLogInfo", { fg = colors.base0D })
	hi("MasonLogWarn", { fg = colors.base0A })
	hi("MasonLogError", { fg = colors.base08 })
	hi("MasonLogDebug", { fg = colors.base03 })
	hi("MasonLogTrace", { fg = colors.base03 })

	-- Mason install/uninstall
	hi("MasonInstallSuccess", { fg = colors.base0D })
	hi("MasonInstallFailed", { fg = colors.base08 })
	hi("MasonInstallPending", { fg = colors.base0A })
	hi("MasonUninstallSuccess", { fg = colors.base0D })
	hi("MasonUninstallFailed", { fg = colors.base08 })
	hi("MasonUninstallPending", { fg = colors.base0A })

	-- Mason update
	hi("MasonUpdateSuccess", { fg = colors.base0D })
	hi("MasonUpdateFailed", { fg = colors.base08 })
	hi("MasonUpdatePending", { fg = colors.base0A })

	-- Mason source
	hi("MasonSource", { fg = colors.base03 })

	-- Mason version
	hi("MasonVersion", { fg = colors.base0C })

	-- Mason language
	hi("MasonLanguage", { fg = colors.base0A })

	-- Mason category
	hi("MasonCategory", { fg = colors.base0D })

	-- Mason description
	hi("MasonDescription", { fg = colors.base03, style = italic })

	-- Mason homepage
	hi("MasonHomepage", { fg = colors.base0D, style = "underline" })

	-- Mason license
	hi("MasonLicense", { fg = colors.base03 })

	-- Mason size
	hi("MasonSize", { fg = colors.base0C })

	-- Mason date
	hi("MasonDate", { fg = colors.base03 })

	-- Mason count
	hi("MasonCount", { fg = colors.base0C, style = "bold" })

	-- Mason separator
	hi("MasonSeparator", { fg = colors.base03 })

	-- Mason spinner
	hi("MasonSpinner", { fg = colors.base08 })

	-- Mason checkmark
	hi("MasonCheckmark", { fg = colors.base0D })

	-- Mason cross
	hi("MasonCross", { fg = colors.base08 })

	-- Mason dash
	hi("MasonDash", { fg = colors.base03 })

	-- Mason arrow
	hi("MasonArrow", { fg = colors.base08 })

	-- Mason border
	hi("MasonBorder", { fg = colors.base03 })

	-- Mason title
	hi("MasonTitle", { fg = colors.base08, style = "bold" })

	-- Mason subtitle
	hi("MasonSubtitle", { fg = colors.base0C })

	-- Mason text
	hi("MasonText", { fg = colors.base05 })

	-- Mason help
	hi("MasonHelp", { fg = colors.base03, style = italic })

	-- Mason toggle
	hi("MasonToggle", { fg = colors.base0D })

	-- Mason filter
	hi("MasonFilter", { fg = colors.base08 })

	-- Mason search
	hi("MasonSearch", { fg = colors.base00, bg = colors.base0A })

	-- Mason match
	hi("MasonMatch", { fg = colors.base08, style = "bold" })

	-- Mason prompt
	hi("MasonPrompt", { fg = colors.base0D, style = "bold" })

	-- Mason cursor
	hi("MasonCursor", { fg = colors.base00, bg = colors.base05 })

	-- Mason virtual text
	hi("MasonVirtualText", { fg = colors.base03, style = italic })
end

return M
