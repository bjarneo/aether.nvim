-- Mini.nvim highlights for Aether colorscheme
-- Only includes commonly used mini plugins

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
-- Mini.ai (textobjects) - commonly used
hi("MiniAiTextobject", { fg = colors.base08, bg = colors.base03 })

-- Mini.cursorword - commonly used
hi("MiniCursorword", { bg = colors.base03 })
hi("MiniCursorwordCurrent", { bg = colors.base03 })

-- Mini.diff - commonly used
hi("MiniDiffSignAdd", { fg = colors.base0B })
hi("MiniDiffSignChange", { fg = colors.base0A })
hi("MiniDiffSignDelete", { fg = colors.base08 })
hi("MiniDiffOverAdd", { fg = colors.base0B, bg = colors.base03 })
hi("MiniDiffOverChange", { fg = colors.base0A, bg = colors.base03 })
hi("MiniDiffOverDelete", { fg = colors.base08, bg = colors.base03 })

-- Mini.files - commonly used
hi("MiniFilesFile", { fg = colors.base05 })
hi("MiniFilesDirectory", { fg = colors.base0A })
hi("MiniFilesBorder", { fg = colors.base03 })
hi("MiniFilesCursorLine", { bg = colors.base03 })
hi("MiniFilesTitle", { fg = colors.base08, style = "bold" })

-- Mini.hipatterns (TODO/FIXME/etc) - commonly used
hi("MiniHipatternsFixme", { fg = colors.base08, bg = colors.base00, style = "bold" })
hi("MiniHipatternsHack", { fg = colors.base0A, bg = colors.base00, style = "bold" })
hi("MiniHipatternsNote", { fg = colors.base0D, bg = colors.base00, style = "bold" })
hi("MiniHipatternsTodo", { fg = colors.base0A, bg = colors.base00, style = "bold" })

-- Mini.icons - commonly used
hi("MiniIconsAzure", { fg = colors.base0D })
hi("MiniIconsBlue", { fg = colors.base08 })
hi("MiniIconsCyan", { fg = colors.base0C })
hi("MiniIconsGreen", { fg = colors.base0B })
hi("MiniIconsGrey", { fg = colors.base03 })
hi("MiniIconsOrange", { fg = colors.base0A })
hi("MiniIconsPurple", { fg = colors.base0A })
hi("MiniIconsRed", { fg = colors.base08 })
hi("MiniIconsYellow", { fg = colors.base0D })

-- Mini.indentscope - commonly used
hi("MiniIndentscopeSymbol", { fg = colors.base0C })
hi("MiniIndentscopeSymbolOff", { fg = colors.base03 })

-- Mini.jump/jump2d - commonly used
hi("MiniJumpSpot", { fg = colors.base00, bg = colors.base08, style = "bold" })
hi("MiniJump2dSpot", { fg = colors.base00, bg = colors.base08, style = "bold" })

-- Mini.notify - commonly used
hi("MiniNotifyBorder", { fg = colors.base03 })
hi("MiniNotifyNormal", { fg = colors.base05, bg = colors.base03 })
hi("MiniNotifyTitle", { fg = colors.base08, style = "bold" })

-- Mini.starter (dashboard) - commonly used
hi("MiniStarterCurrent", { fg = colors.base08, style = "bold" })
hi("MiniStarterHeader", { fg = colors.base08, style = "bold" })
hi("MiniStarterItem", { fg = colors.base05 })
hi("MiniStarterSection", { fg = colors.base0A, style = "bold" })

-- Mini.statusline - commonly used
hi("MiniStatuslineDevinfo", { fg = colors.base03, bg = colors.base03 })
hi("MiniStatuslineFileinfo", { fg = colors.base05, bg = colors.base03 })
hi("MiniStatuslineFilename", { fg = colors.base08, bg = colors.base03 })
hi("MiniStatuslineInactive", { fg = colors.base03, bg = colors.base03 })
hi("MiniStatuslineModeCommand", { fg = colors.base00, bg = colors.base0A, style = "bold" })
hi("MiniStatuslineModeInsert", { fg = colors.base00, bg = colors.base0B, style = "bold" })
hi("MiniStatuslineModeNormal", { fg = colors.base00, bg = colors.base08, style = "bold" })
hi("MiniStatuslineModeVisual", { fg = colors.base00, bg = colors.base0A, style = "bold" })

-- Mini.surround - commonly used
hi("MiniSurroundInput", { fg = colors.base00, bg = colors.base0C })

-- Mini.trailspace - commonly used
hi("MiniTrailspace", { fg = colors.base08, bg = colors.base00 })
end

return M
