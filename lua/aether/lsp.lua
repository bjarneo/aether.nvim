-- LSP support for Aether colorscheme
-- This module provides LSP-related highlight groups

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
	local config = require("aether").config or {}
	local italic = config.disable_italics and "NONE" or "italic"

	-- LSP semantic tokens
	hi("@lsp.type.class", { fg = colors.base0A })
	hi("@lsp.type.comment", { fg = colors.base03 })
	hi("@lsp.type.decorator", { fg = colors.base0D })
	hi("@lsp.type.enum", { fg = colors.base0A })
	hi("@lsp.type.enumMember", { fg = colors.base09 })
	hi("@lsp.type.event", { fg = colors.base08 })
	hi("@lsp.type.function", { fg = colors.base08 })
	hi("@lsp.type.interface", { fg = colors.base0A })
	hi("@lsp.type.keyword", { fg = colors.base0E })
	hi("@lsp.type.macro", { fg = colors.base0C })
	hi("@lsp.type.method", { fg = colors.base08 })
	hi("@lsp.type.modifier", { fg = colors.base0E })
	hi("@lsp.type.namespace", { fg = colors.base0A })
	hi("@lsp.type.number", { fg = colors.base09 })
	hi("@lsp.type.operator", { fg = colors.base05 })
	hi("@lsp.type.parameter", { fg = colors.base05 })
	hi("@lsp.type.property", { fg = colors.base0C })
	hi("@lsp.type.regexp", { fg = colors.base0B })
	hi("@lsp.type.string", { fg = colors.base0B })
	hi("@lsp.type.struct", { fg = colors.base0A })
	hi("@lsp.type.type", { fg = colors.base0A })
	hi("@lsp.type.typeParameter", { fg = colors.base0A })
	hi("@lsp.type.variable", { fg = colors.base05 })

	-- Diagnostic highlights
	hi("DiagnosticError", { fg = colors.base08 })
	hi("DiagnosticWarn", { fg = colors.base0A })
	hi("DiagnosticInfo", { fg = colors.base0D })
	hi("DiagnosticHint", { fg = colors.base0C })
	hi("DiagnosticOk", { fg = colors.base0B })

	-- Diagnostic virtual text
	hi("DiagnosticVirtualTextError", { fg = colors.base08 })
	hi("DiagnosticVirtualTextWarn", { fg = colors.base0A })
	hi("DiagnosticVirtualTextInfo", { fg = colors.base0D })
	hi("DiagnosticVirtualTextHint", { fg = colors.base0C })
	hi("DiagnosticVirtualTextOk", { fg = colors.base0B })

	-- Diagnostic underlines
	hi("DiagnosticUnderlineError", { sp = colors.base08, style = "underline" })
	hi("DiagnosticUnderlineWarn", { sp = colors.base0A, style = "underline" })
	hi("DiagnosticUnderlineInfo", { sp = colors.base0D, style = "underline" })
	hi("DiagnosticUnderlineHint", { sp = colors.base0C, style = "underline" })
	hi("DiagnosticUnderlineOk", { sp = colors.base0B, style = "underline" })

	-- Diagnostic signs
	hi("DiagnosticSignError", { fg = colors.base08 })
	hi("DiagnosticSignWarn", { fg = colors.base0A })
	hi("DiagnosticSignInfo", { fg = colors.base0D })
	hi("DiagnosticSignHint", { fg = colors.base0C })
	hi("DiagnosticSignOk", { fg = colors.base0B })

	-- Floating window highlights
	hi("DiagnosticFloatingError", { fg = colors.base08, bg = colors.float_bg })
	hi("DiagnosticFloatingWarn", { fg = colors.base0A, bg = colors.float_bg })
	hi("DiagnosticFloatingInfo", { fg = colors.base0D, bg = colors.float_bg })
	hi("DiagnosticFloatingHint", { fg = colors.base0C, bg = colors.float_bg })
	hi("DiagnosticFloatingOk", { fg = colors.base0B, bg = colors.float_bg })

	-- LSP references
	hi("LspReferenceText", { bg = colors.selection_bg })
	hi("LspReferenceRead", { bg = colors.selection_bg })
	hi("LspReferenceWrite", { bg = colors.selection_bg })

	-- LSP signature help
	hi("LspSignatureActiveParameter", { fg = colors.base0C, style = "bold" })

	-- LSP code lens
	hi("LspCodeLens", { fg = colors.base03, style = italic })
	hi("LspCodeLensSeparator", { fg = colors.base03 })

	-- LSP inlay hints
	hi("LspInlayHint", { fg = colors.base03, bg = colors.subtle_bg, style = italic })
end

return M
