-- Lualine theme for Aether colorscheme
local colors = require("aether.colorscheme")

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

-- Create blended colors for lualine
local subtle_bg = blend_colors(colors.base05, colors.base00, 0.10) -- 10% opacity
local section_bg = blend_colors(colors.base05, colors.base00, 0.15) -- 15% opacity for sections

local M = {}

M.normal = {
	a = { bg = colors.base0A, fg = colors.base00, gui = "bold" },
	b = { bg = section_bg, fg = colors.base0A },
	c = {
		bg = subtle_bg,
		fg = colors.base05,
	},
	x = {
		bg = subtle_bg,
		fg = colors.base05,
	},
}

M.insert = {
	a = { bg = colors.base0B, fg = colors.base00 },
	b = { bg = section_bg, fg = colors.base0B },
}

M.command = {
	a = { bg = colors.base0A, fg = colors.base00 },
	b = { bg = section_bg, fg = colors.base0A },
}

M.visual = {
	a = { bg = colors.base0E, fg = colors.base00 },
	b = { bg = section_bg, fg = colors.base0E },
}

M.replace = {
	a = { bg = colors.base08, fg = colors.base00 },
	b = { bg = section_bg, fg = colors.base08 },
}

M.inactive = {
	a = { bg = section_bg, fg = colors.base03 },
	b = { bg = subtle_bg, fg = colors.base03 },
}

return M
