-- Lsp plugin support for Aether colorscheme
local Util = require("aether.utils")

local M = {}

---@type aether.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- Diagnostics
    DiagnosticError                  = { fg = c.bright_red },
    DiagnosticWarn                   = { fg = c.warning },
    DiagnosticInfo                   = { fg = c.info },
    DiagnosticHint                   = { fg = c.hint },
    DiagnosticVirtualTextError       = { fg = c.bright_red, bg = Util.blend_bg(c.error, 0.1) },
    DiagnosticVirtualTextWarn        = { fg = c.warning, bg = Util.blend_bg(c.warning, 0.1) },
    DiagnosticVirtualTextInfo        = { fg = c.bright_blue, bg = Util.blend_bg(c.info, 0.1) },
    DiagnosticVirtualTextHint        = { fg = c.hint, bg = Util.blend_bg(c.hint, 0.1) },
    DiagnosticUnderlineError         = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn          = { undercurl = true, sp = c.warning },
    DiagnosticUnderlineInfo          = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint          = { undercurl = true, sp = c.hint },

    -- LSP Semantic Tokens
    ["@lsp.type.class"]              = { link = "Structure" },
    ["@lsp.type.decorator"]          = { link = "Function" },
    ["@lsp.type.enum"]               = { link = "Type" },
    ["@lsp.type.enumMember"]         = { link = "Constant" },
    ["@lsp.type.function"]           = { link = "Function" },
    ["@lsp.type.interface"]          = { link = "Structure" },
    ["@lsp.type.macro"]              = { link = "Macro" },
    ["@lsp.type.method"]             = { link = "Function" },
    ["@lsp.type.namespace"]          = { link = "Include" },
    ["@lsp.type.parameter"]          = { link = "Identifier" },
    ["@lsp.type.property"]           = { link = "Identifier" },
    ["@lsp.type.struct"]             = { link = "Structure" },
    ["@lsp.type.type"]               = { link = "Type" },
    ["@lsp.type.typeParameter"]      = { link = "Typedef" },
    ["@lsp.type.variable"]           = { link = "Identifier" },

    -- LSP References and Definitions
    LspReferenceText                 = { bg = c.lighter_bg },
    LspReferenceRead                 = { bg = c.lighter_bg },
    LspReferenceWrite                = { bg = c.lighter_bg, bold = true },
    LspSignatureActiveParameter      = { fg = c.orange, bold = true },
    LspCodeLens                      = { fg = c.muted },
    LspInlayHint                     = { fg = c.muted, bg = Util.blend_bg(c.muted, 0.1) },
  }
end

return M
