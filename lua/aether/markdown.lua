-- Markdown highlights for Aether colorscheme

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
	local config = require("aether").config or {}
	local italic = config.disable_italics and "NONE" or "italic"

	-- Markdown headings
	hi("markdownHeadingDelimiter", { fg = colors.base0D, style = "bold" })
	hi("markdownH1", { fg = colors.base0D, style = "bold" })
	hi("markdownH2", { fg = colors.base0D, style = "bold" })
	hi("markdownH3", { fg = colors.base0D, style = "bold" })
	hi("markdownH4", { fg = colors.base0D, style = "bold" })
	hi("markdownH5", { fg = colors.base0D, style = "bold" })
	hi("markdownH6", { fg = colors.base0D, style = "bold" })
	hi("markdownH1Delimiter", { fg = colors.base0D, style = "bold" })
	hi("markdownH2Delimiter", { fg = colors.base0D, style = "bold" })
	hi("markdownH3Delimiter", { fg = colors.base0D, style = "bold" })
	hi("markdownH4Delimiter", { fg = colors.base0D, style = "bold" })
	hi("markdownH5Delimiter", { fg = colors.base0D, style = "bold" })
	hi("markdownH6Delimiter", { fg = colors.base0D, style = "bold" })

	-- Markdown text formatting
	hi("markdownBold", { fg = colors.base05, style = "bold" })
	hi("markdownBoldDelimiter", { fg = colors.base05, style = "bold" })
	hi("markdownItalic", { fg = colors.base05, style = italic })
	hi("markdownItalicDelimiter", { fg = colors.base05, style = italic })
	hi("markdownBoldItalic", { fg = colors.base05, style = config.disable_italics and "bold" or "bold,italic" })
	hi("markdownBoldItalicDelimiter", { fg = colors.base05, style = config.disable_italics and "bold" or "bold,italic" })
	hi("markdownStrike", { fg = colors.base05, style = "strikethrough" })
	hi("markdownStrikeDelimiter", { fg = colors.base05, style = "strikethrough" })

-- Markdown code
hi("markdownCode", { fg = colors.base0B })
hi("markdownCodeBlock", { fg = colors.base0B })
hi("markdownCodeDelimiter", { fg = colors.base05 })

-- Markdown links
hi("markdownLink", { fg = colors.base0C, style = "underline" })
hi("markdownLinkText", { fg = colors.base0C, style = "underline" })
hi("markdownUrl", { fg = colors.base0C, style = "underline" })
hi("markdownLinkDelimiter", { fg = colors.base05 })

-- Markdown lists
hi("markdownListMarker", { fg = colors.base0D })
hi("markdownOrderedListMarker", { fg = colors.base0D })
hi("markdownRule", { fg = colors.base0D, style = "bold" })

	-- Markdown quotes
	hi("markdownBlockquote", { fg = colors.base03, style = italic })
	hi("markdownBlockquoteDelimiter", { fg = colors.base03, style = italic })

-- Markdown tables
hi("markdownTable", { fg = colors.base05 })
hi("markdownTableHead", { fg = colors.base0D, style = "bold" })
hi("markdownTableDelimiter", { fg = colors.base05 })

	-- Markdown escape sequences
	hi("markdownEscape", { fg = colors.base0C })
	hi("markdownError", { fg = colors.base08 })

	-- Markdown math
	hi("markdownMath", { fg = colors.base0C })
	hi("markdownMathDelimiter", { fg = colors.base05 })
	hi("markdownMathBlock", { fg = colors.base0C })
	hi("markdownMathBlockDelimiter", { fg = colors.base05 })

	-- Markdown YAML frontmatter
	hi("markdownYAMLHeader", { fg = colors.base03 })
	hi("markdownYAMLKeyword", { fg = colors.base0C })
	hi("markdownYAMLString", { fg = colors.base0B })

	-- Markdown HTML
	hi("markdownHTML", { fg = colors.base0D })
	hi("markdownHTMLTag", { fg = colors.base0D })
	hi("markdownHTMLEndTag", { fg = colors.base0D })
	hi("markdownHTMLArg", { fg = colors.base0C })
	hi("markdownHTMLValue", { fg = colors.base0B })
	hi("markdownHTMLTitle", { fg = colors.base0B })
	hi("markdownHTMLComment", { fg = colors.base03, style = italic })

	-- Markdown line break
	hi("markdownLineBreak", { fg = colors.base00, bg = colors.base03 })

	-- Treesitter markdown highlights
	hi("@markup.heading.1.markdown", { fg = colors.base0D, style = "bold" })
	hi("@markup.heading.2.markdown", { fg = colors.base0D, style = "bold" })
	hi("@markup.heading.3.markdown", { fg = colors.base0D, style = "bold" })
	hi("@markup.heading.4.markdown", { fg = colors.base0D, style = "bold" })
	hi("@markup.heading.5.markdown", { fg = colors.base0D, style = "bold" })
	hi("@markup.heading.6.markdown", { fg = colors.base0D, style = "bold" })
	hi("@markup.heading.1.marker.markdown", { fg = colors.base0D, style = "bold" })
	hi("@markup.heading.2.marker.markdown", { fg = colors.base0D, style = "bold" })
	hi("@markup.heading.3.marker.markdown", { fg = colors.base0D, style = "bold" })
	hi("@markup.heading.4.marker.markdown", { fg = colors.base0D, style = "bold" })
	hi("@markup.heading.5.marker.markdown", { fg = colors.base0D, style = "bold" })
	hi("@markup.heading.6.marker.markdown", { fg = colors.base0D, style = "bold" })

	hi("@markup.strong.markdown_inline", { fg = colors.base05, style = "bold" })
	hi("@markup.italic.markdown_inline", { fg = colors.base05, style = italic })
	hi("@markup.strikethrough.markdown_inline", { fg = colors.base05, style = "strikethrough" })
	hi("@markup.raw.markdown_inline", { fg = colors.base0B })
	hi("@markup.raw.block.markdown", { fg = colors.base0B })
	hi("@markup.link.markdown_inline", { fg = colors.base0C, style = "underline" })
	hi("@markup.link.url.markdown_inline", { fg = colors.base0C, style = "underline" })
	hi("@markup.link.label.markdown_inline", { fg = colors.base0C })
	hi("@markup.list.markdown", { fg = colors.base0D })
	hi("@markup.list.checked.markdown", { fg = colors.base0B, style = "bold" })
	hi("@markup.list.unchecked.markdown", { fg = colors.base03, style = "bold" })
	hi("@markup.quote.markdown", { fg = colors.base03, style = italic })

	-- Markdown plugins
	hi("MarkdownError", { fg = colors.base08 })
	hi("MarkdownWarning", { fg = colors.base0A })
	hi("MarkdownInfo", { fg = colors.base0D })
	hi("MarkdownHint", { fg = colors.base0C })

	-- Render markdown
	hi("RenderMarkdownH1", { fg = colors.base0D, style = "bold" })
	hi("RenderMarkdownH2", { fg = colors.base0D, style = "bold" })
	hi("RenderMarkdownH3", { fg = colors.base0D, style = "bold" })
	hi("RenderMarkdownH4", { fg = colors.base0D, style = "bold" })
	hi("RenderMarkdownH5", { fg = colors.base0D, style = "bold" })
	hi("RenderMarkdownH6", { fg = colors.base0D, style = "bold" })
	hi("RenderMarkdownCode", { fg = colors.base0B, bg = colors.base03 })
	hi("RenderMarkdownCodeInline", { fg = colors.base0B, bg = colors.base03 })
	hi("RenderMarkdownBullet", { fg = colors.base0D })
	hi("RenderMarkdownTableHead", { fg = colors.base0D, style = "bold" })
	hi("RenderMarkdownTableRow", { fg = colors.base05 })
	hi("RenderMarkdownSuccess", { fg = colors.base0B })
	hi("RenderMarkdownInfo", { fg = colors.base0D })
	hi("RenderMarkdownHint", { fg = colors.base0C })
	hi("RenderMarkdownWarn", { fg = colors.base0A })
	hi("RenderMarkdownError", { fg = colors.base08 })
	hi("RenderMarkdownQuote", { fg = colors.base03, style = italic })
	hi("RenderMarkdownLink", { fg = colors.base0C, style = "underline" })
	hi("RenderMarkdownImage", { fg = colors.base08 })
end

return M
