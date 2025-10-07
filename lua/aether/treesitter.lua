-- Treesitter support for Aether colorscheme
-- This module provides Treesitter-related highlight groups

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
  local config = require("aether").config or {}
  local italic = config.disable_italics and "NONE" or "italic"

  -- Treesitter highlights
  hi("@annotation", { fg = colors.base0D })
  hi("@attribute", { fg = colors.base0D })
  hi("@boolean", { fg = colors.base09 })
  hi("@character", { fg = colors.base0B })
  hi("@character.special", { fg = colors.base0F })

  -- Comments
  hi("@comment", { fg = colors.base03, style = italic })
  hi("@comment.documentation", { fg = colors.base03, style = italic })

  -- Control flow
  hi("@conditional", { fg = colors.base0E, style = "bold" })
  hi("@repeat", { fg = colors.base0E, style = "bold" })
  hi("@exception", { fg = colors.base08 })
  hi("@keyword", { fg = colors.base0E })
  hi("@keyword.function", { fg = colors.base0E })
  hi("@keyword.operator", { fg = colors.base0E })
  hi("@keyword.return", { fg = colors.base0E })

  -- Constants and variables
  hi("@constant", { fg = colors.base09 })
  hi("@constant.builtin", { fg = colors.base09 })
  hi("@constant.macro", { fg = colors.base09 })
  hi("@variable", { fg = colors.base05 })
  hi("@variable.builtin", { fg = colors.base09 })
  hi("@parameter", { fg = colors.base05 })
  hi("@parameter.reference", { fg = colors.base05 })

  -- Functions and methods
  hi("@function", { fg = colors.base08 })
  hi("@function.builtin", { fg = colors.base08, style = "bold" })
  hi("@function.call", { fg = colors.base08 })
  hi("@function.macro", { fg = colors.base08, style = "bold" })
  hi("@method", { fg = colors.base08 })
  hi("@method.call", { fg = colors.base08 })
  hi("@constructor", { fg = colors.base0A })

  -- Types and structures
  hi("@type", { fg = colors.base0A })
  hi("@type.builtin", { fg = colors.base0A })
  hi("@type.definition", { fg = colors.base0A })
  hi("@type.qualifier", { fg = colors.base0E })
  hi("@namespace", { fg = colors.base0A })
  hi("@storageclass", { fg = colors.base0E })

  -- Properties and fields
  hi("@property", { fg = colors.base0C })
  hi("@field", { fg = colors.base0C })

  -- Strings and numbers
  hi("@string", { fg = colors.base0B })
  hi("@string.escape", { fg = colors.base0F, style = "bold" })
  hi("@string.regex", { fg = colors.base0B })
  hi("@string.special", { fg = colors.base0F })
  hi("@number", { fg = colors.base09 })
  hi("@float", { fg = colors.base09 })

  -- Operators and punctuation
  hi("@operator", { fg = colors.base05 })
  hi("@punctuation.bracket", { fg = colors.base05 })
  hi("@punctuation.delimiter", { fg = colors.base05 })
  hi("@punctuation.special", { fg = colors.base0F })

  -- Special elements
  hi("@symbol", { fg = colors.base0E })
  hi("@label", { fg = colors.base0A })
  hi("@include", { fg = colors.base0D, style = italic })
  hi("@define", { fg = colors.base0E })
  hi("@debug", { fg = colors.base08 })
  hi("@error", { fg = colors.base08 })

  -- Tags (HTML/XML)
  hi("@tag", { fg = colors.base08 })
  hi("@tag.attribute", { fg = colors.base0C })
  hi("@tag.delimiter", { fg = colors.base05 })

  -- Text elements (Markdown, etc.)
  hi("@text", { fg = colors.base05 })
  hi("@text.strong", { fg = colors.base05, style = "bold" })
  hi("@text.emphasis", { fg = colors.base05, style = italic })
  hi("@text.underline", { fg = colors.base05, style = "underline" })
  hi("@text.strike", { fg = colors.base05, style = "strikethrough" })
  hi("@text.title", { fg = colors.base0D, style = "bold" })
  hi("@text.literal", { fg = colors.base0B })
  hi("@text.uri", { fg = colors.base0C, style = "underline" })
  hi("@text.math", { fg = colors.base0C })
  hi("@text.environment", { fg = colors.base0D })
  hi("@text.environment.name", { fg = colors.base0A })
  hi("@text.reference", { fg = colors.base0C })
  hi("@text.todo", { fg = colors.base03, style = "bold" })
  hi("@text.note", { fg = colors.base0D, style = "bold" })
  hi("@text.warning", { fg = colors.base0A, style = "bold" })
  hi("@text.danger", { fg = colors.base08, style = "bold" })

  -- Language-specific highlights
  hi("@variable.builtin.vim", { fg = colors.base09 })
  hi("@function.builtin.vim", { fg = colors.base08 })

  -- HTML
  hi("@tag.html", { fg = colors.base08 })
  hi("@tag.delimiter.html", { fg = colors.base05 })
  hi("@tag.attribute.html", { fg = colors.base0C })

  -- CSS
  hi("@property.css", { fg = colors.base0C })
  hi("@type.css", { fg = colors.base0D })
  hi("@string.css", { fg = colors.base0B })
  hi("@number.css", { fg = colors.base09 })

  -- JavaScript/TypeScript
  hi("@constructor.javascript", { fg = colors.base0A })
  hi("@constructor.typescript", { fg = colors.base0A })
  hi("@variable.builtin.javascript", { fg = colors.base09 })
  hi("@variable.builtin.typescript", { fg = colors.base09 })
end

return M
