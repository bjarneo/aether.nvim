-- Comment plugin support for Aether colorscheme
local Util = require("aether.utils")

local M = {}

---@type aether.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    CommentNormal = { fg = c.comment, style = opts.styles.comments },
    CommentBold   = { fg = c.comment, bold = true },
    CommentItalic = { fg = c.comment, italic = true },
    CommentURL    = { fg = c.blue, underline = true },
  }
end

return M
