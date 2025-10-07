-- Aether colorscheme for Neovim - Base16 color scheme
-- Maintainer: Bjarne Øverli
-- License: MIT

local M = {}

-- Import color definitions
local colors = require("aether.colorscheme")

-- Import shared utility functions
local utils = require("aether.utils")
local hi = utils.hi

-- Helper function to blend two colors with opacity
local function blend_colors(fg_hex, bg_hex, opacity)
	-- Remove # if present
	fg_hex = fg_hex:gsub("#", "")
	bg_hex = bg_hex:gsub("#", "")
	
	-- Parse hex values
	local fg_r = tonumber(fg_hex:sub(1, 2), 16)
	local fg_g = tonumber(fg_hex:sub(3, 4), 16)
	local fg_b = tonumber(fg_hex:sub(5, 6), 16)
	
	local bg_r = tonumber(bg_hex:sub(1, 2), 16)
	local bg_g = tonumber(bg_hex:sub(3, 4), 16)
	local bg_b = tonumber(bg_hex:sub(5, 6), 16)
	
	-- Blend with opacity (0.0 to 1.0)
	local r = math.floor(fg_r * opacity + bg_r * (1 - opacity))
	local g = math.floor(fg_g * opacity + bg_g * (1 - opacity))
	local b = math.floor(fg_b * opacity + bg_b * (1 - opacity))
	
	return string.format("#%02x%02x%02x", r, g, b)
end

-- Default configuration
local default_config = {
	disable_italics = false,
	colors = {}, -- Allow user to override base16 colors
}

-- Current configuration (module-level, accessible to other modules)
local config = vim.deepcopy(default_config)

-- Setup basic colorscheme settings
function M.setup(opts)
	-- Merge user config with defaults
	config = vim.tbl_deep_extend("force", default_config, opts or {})
	
	-- Merge user-provided colors with default colors
	if config.colors and next(config.colors) then
		colors = vim.tbl_deep_extend("force", colors, config.colors)
	end

	-- Clear existing highlights
	vim.cmd("highlight clear")

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	-- Set colorscheme name
	vim.g.colors_name = "aether"

	-- Set background
	vim.opt.background = "dark"

	-- Enable termguicolors to use hex color values
	vim.opt.termguicolors = true

	-- Create blended colors for subtle highlights with different opacity levels
	local subtle_bg = blend_colors(colors.base05, colors.base00, 0.10) -- 10% opacity for very subtle backgrounds
	local cursorline_bg = blend_colors(colors.base05, colors.base00, 0.20) -- 20% opacity for cursor line
	local selection_bg = blend_colors(colors.base05, colors.base00, 0.25) -- 25% opacity for selections
	local float_bg = blend_colors(colors.base05, colors.base00, 0.12) -- 12% opacity for floating windows
	
	-- Export blended colors for use in other modules
	colors.subtle_bg = subtle_bg
	colors.cursorline_bg = cursorline_bg
	colors.selection_bg = selection_bg
	colors.float_bg = float_bg

	-- Basic highlight groups - using base16 colors
	hi("Normal", { fg = colors.base05, bg = colors.base00 })
	hi("Cursor", { fg = colors.base00, bg = colors.base05 })
	hi("CursorLine", { bg = cursorline_bg }) -- 20% opacity subtle highlight
	hi("CursorColumn", { bg = cursorline_bg }) -- 20% opacity subtle highlight
	hi("LineNr", { fg = colors.base03 })
	hi("CursorLineNr", { fg = colors.base05, style = "bold" })

	-- Syntax highlighting - using base16 colors
	local italic = config.disable_italics and "NONE" or "italic"
	hi("Comment", { fg = colors.base03, style = italic })
	hi("String", { fg = colors.base0B })
	hi("Character", { fg = colors.base0B })
	hi("Number", { fg = colors.base09 })
	hi("Float", { fg = colors.base09 })
	hi("Boolean", { fg = colors.base09 })
	hi("Constant", { fg = colors.base0E })
	hi("Identifier", { fg = colors.base05 })
	hi("Function", { fg = colors.base08, style = "bold" })
	hi("Statement", { fg = colors.base0D, style = "bold" })
	hi("Conditional", { fg = colors.base0E })
	hi("Repeat", { fg = colors.base0E })
	hi("Label", { fg = colors.base0A })
	hi("Operator", { fg = colors.base05 })
	hi("Keyword", { fg = colors.base0E, style = "bold" })
	hi("Exception", { fg = colors.base08 })
	hi("PreProc", { fg = colors.base0C })
	hi("Include", { fg = colors.base0D })
	hi("Define", { fg = colors.base0E })
	hi("Macro", { fg = colors.base0C })
	hi("PreCondit", { fg = colors.base0C })
	hi("Type", { fg = colors.base0A, style = "bold" })
	hi("StorageClass", { fg = colors.base0A })
	hi("Structure", { fg = colors.base0A })
	hi("Typedef", { fg = colors.base0A })
	hi("Special", { fg = colors.base0C })
	hi("SpecialChar", { fg = colors.base0F })
	hi("Tag", { fg = colors.base08 })
	hi("Delimiter", { fg = colors.base05 })
	hi("SpecialComment", { fg = colors.base03, style = italic })
	hi("Debug", { fg = colors.base08 })

	-- Additional syntax highlighting
	hi("Class", { fg = colors.base0A, style = "bold" })
	hi("Variable", { fg = colors.base05 })
	hi("Property", { fg = colors.base0C })
	hi("Method", { fg = colors.base08 })

	-- UI elements
	hi("Visual", { bg = selection_bg }) -- 25% opacity for visual selection
	hi("Search", { fg = colors.base00, bg = colors.base0A, style = "bold" })
	hi("IncSearch", { fg = colors.base00, bg = colors.base09, style = "bold" })
	hi("StatusLine", { fg = colors.base05, bg = selection_bg, style = "bold" })
	hi("StatusLineNC", { fg = colors.base03, bg = subtle_bg })
	hi("VertSplit", { fg = colors.base03, bg = colors.base00 })
	hi("Pmenu", { fg = colors.base05, bg = float_bg }) -- 12% opacity for popup menu
	hi("PmenuSel", { fg = colors.base00, bg = colors.base0D, style = "bold" })
	hi("PmenuSbar", { bg = subtle_bg })
	hi("PmenuThumb", { bg = colors.base05 })
	hi("TabLine", { fg = colors.base03, bg = subtle_bg })
	hi("TabLineFill", { bg = colors.base00 })
	hi("TabLineSel", { fg = colors.base05, bg = selection_bg, style = "bold" })

	-- Diff highlighting
	hi("DiffAdd", { fg = colors.base0B, bg = subtle_bg, style = "bold" })
	hi("DiffChange", { fg = colors.base0A, bg = subtle_bg })
	hi("DiffDelete", { fg = colors.base08, bg = subtle_bg, style = "bold" })
	hi("DiffText", { fg = colors.base0D, bg = cursorline_bg, style = "bold" })

	-- Error and warning
	hi("Error", { fg = colors.base08, style = "bold" })
	hi("Warning", { fg = colors.base0A, style = "bold" })
	hi("ErrorMsg", { fg = colors.base08, style = "bold" })
	hi("WarningMsg", { fg = colors.base0A, style = "bold" })
	hi("Question", { fg = colors.base0B, style = "bold" })
	hi("MoreMsg", { fg = colors.base0B, style = "bold" })

	-- Folding
	hi("Folded", { fg = colors.base03, bg = subtle_bg, style = italic })
	hi("FoldColumn", { fg = colors.base03, bg = subtle_bg })

	-- Spelling
	hi("SpellBad", { sp = colors.base08, style = "undercurl" })
	hi("SpellCap", { sp = colors.base0D, style = "undercurl" })
	hi("SpellLocal", { sp = colors.base0C, style = "undercurl" })
	hi("SpellRare", { sp = colors.base0E, style = "undercurl" })

	-- Floating windows
	hi("NormalFloat", { fg = colors.base05, bg = float_bg }) -- 12% opacity for floating windows
	hi("FloatBorder", { fg = colors.base03, bg = float_bg })
	hi("FloatTitle", { fg = colors.base0D, bg = float_bg, style = "bold" })

	-- File explorer and tree colors
	hi("Directory", { fg = colors.base0D, style = "bold" })

	-- Load plugin-specific highlight modules
	require("aether.git").setup(colors)
	require("aether.lsp").setup(colors)
	require("aether.treesitter").setup(colors)
	require("aether.telescope").setup(colors)
	require("aether.nvimtree").setup(colors)
	require("aether.neo_tree").setup(colors)
	require("aether.gitsigns").setup(colors)
	require("aether.mason").setup(colors)
	require("aether.trouble").setup(colors)
	require("aether.indent_blankline").setup(colors)
	require("aether.flash").setup(colors)
	require("aether.noice").setup(colors)
	require("aether.whichkey").setup(colors)
	require("aether.fidget").setup(colors)
	require("aether.diffview").setup(colors)
	require("aether.conform").setup(colors)
	require("aether.comment").setup(colors)
	require("aether.lint").setup(colors)
	require("aether.nvim-dap").setup(colors)
	require("aether.mini").setup(colors)
	require("aether.markdown").setup(colors)
	require("aether.snacks").setup(colors)
	require("aether.blink").setup(colors)
end

-- Export colors and config for use in other modules
M.colors = colors
M.config = config

return M
