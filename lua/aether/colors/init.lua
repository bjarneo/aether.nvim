local Util = require("aether.utils")

local M = {}

---@class Palette
local default_palette = {
	-- Background colors
	bg = "#000000",           -- Default background
	bg_dark = "#000000",      -- Darker background (sidebars, statusline)
	bg_dark1 = "#000000",     -- Even darker background
	bg_highlight = "#000000", -- Highlighted lines (cursorline)

	-- Primary accent colors
	blue = "#66d9ef",         -- Functions, keywords, info diagnostics
	blue0 = "#264f78",        -- Search background, visual selection base
	blue1 = "#66d9ef",        -- Links, special syntax
	blue2 = "#66d9ef",        -- Info diagnostics
	blue5 = "#89ddff",        -- Lighter blue accents
	blue6 = "#b4f9f8",        -- Brightest blue accents
	blue7 = "#1e3a5f",        -- Diff change background base

	-- Neutral colors
	comment = "#585858",      -- Comments
	cyan = "#66d9ef",         -- Regex, escape sequences

	dark3 = "#585858",        -- Non-text, special keys
	dark5 = "#b8b8b8",        -- Conceal, dark foreground

	-- Foreground colors
	fg = "#d8d8d8",           -- Default foreground text
	fg_dark = "#b8b8b8",      -- Darker foreground (statusline, inactive)
	fg_gutter = "#585858",    -- Line numbers, fold column

	-- Semantic colors
	green = "#a6e22e",        -- Strings, success, git additions
	green1 = "#a6e22e",       -- String variants
	green2 = "#73aa6a",       -- Git add, diff add

	magenta = "#ae81ff",      -- Storage, special keywords
	magenta2 = "#ae81ff",     -- Functions, identifiers

	orange = "#fd971f",       -- Numbers, constants, warnings
	purple = "#ae81ff",       -- Keywords, tags

	red = "#f92672",          -- Errors, deletions, important
	red1 = "#c91f4f",         -- Git delete, diff delete

	teal = "#66d9ef",         -- Hints, support
	terminal_black = "#282828", -- Terminal black, lighter backgrounds

	yellow = "#f4bf75",       -- Types, classes, warnings

	-- Git colors will be calculated from the palette colors above
	git = {},

	special_char = "#cc6633", -- Escape sequences, special characters
}

---@param opts? aether.Config
function M.setup(opts)
	opts = require("aether.config").extend(opts)

	-- Color Palette
	---@class ColorScheme: Palette
	local colors = vim.deepcopy(default_palette)

	if opts.colors and next(opts.colors) then
		-- Backwards compatibility: map base16 colors to semantic names
		if opts.colors.base00 then
			colors.bg = opts.colors.base00
			colors.bg_dark = opts.colors.base00
			colors.bg_dark1 = opts.colors.base00
		end
		if opts.colors.base01 then
			colors.terminal_black = opts.colors.base01
		end
		if opts.colors.base02 then
			colors.bg_highlight = opts.colors.base02
		end
		if opts.colors.base03 then
			colors.comment = opts.colors.base03
			colors.dark3 = opts.colors.base03
			colors.fg_gutter = opts.colors.base03
		end
		if opts.colors.base04 then
			colors.dark5 = opts.colors.base04
			colors.fg_dark = opts.colors.base04
		end
		if opts.colors.base05 then
			colors.fg = opts.colors.base05
		end
		if opts.colors.base08 then
			colors.red = opts.colors.base08
			colors.red1 = opts.colors.base08
			colors.magenta2 = opts.colors.base08
		end
		if opts.colors.base09 then
			colors.orange = opts.colors.base09
		end
		if opts.colors.base0A then
			colors.yellow = opts.colors.base0A
		end
		if opts.colors.base0B then
			colors.green = opts.colors.base0B
			colors.green1 = opts.colors.base0B
			colors.green2 = opts.colors.base0B
		end
		if opts.colors.base0C then
			colors.cyan = opts.colors.base0C
			colors.teal = opts.colors.base0C
		end
		if opts.colors.base0D then
			colors.blue = opts.colors.base0D
			colors.blue1 = opts.colors.base0D
			colors.blue2 = opts.colors.base0D
		end
		if opts.colors.base0E then
			colors.purple = opts.colors.base0E
			colors.magenta = opts.colors.base0E
		end
		if opts.colors.base0F then
			colors.special_char = opts.colors.base0F
		end

		-- Apply direct semantic overrides
		colors = vim.tbl_deep_extend("force", colors, opts.colors)

		-- Propagate injected semantic colors to their variants
		if opts.colors.bg then
			colors.bg_dark = colors.bg_dark == default_palette.bg_dark and colors.bg or colors.bg_dark
			colors.bg_dark1 = colors.bg_dark1 == default_palette.bg_dark1 and colors.bg or colors.bg_dark1
		end
		if opts.colors.comment then
			colors.dark3 = colors.dark3 == default_palette.dark3 and colors.comment or colors.dark3
			colors.fg_gutter = colors.fg_gutter == default_palette.fg_gutter and colors.comment or colors.fg_gutter
		end
		if opts.colors.red then
			colors.red1 = colors.red1 == default_palette.red1 and colors.red or colors.red1
		end
		if opts.colors.green then
			colors.green1 = colors.green1 == default_palette.green1 and colors.green or colors.green1
			colors.green2 = colors.green2 == default_palette.green2 and colors.green or colors.green2
		end
		if opts.colors.blue then
			colors.blue1 = colors.blue1 == default_palette.blue1 and colors.blue or colors.blue1
			colors.blue2 = colors.blue2 == default_palette.blue2 and colors.blue or colors.blue2
		end
		if opts.colors.cyan then
			colors.teal = colors.teal == default_palette.teal and colors.cyan or colors.teal
		end
		if opts.colors.magenta then
			colors.magenta2 = colors.magenta2 == default_palette.magenta2 and colors.magenta or colors.magenta2
		end
		if opts.colors.purple then
			colors.magenta = colors.magenta == default_palette.magenta and colors.purple or colors.magenta
		end
	end

	Util.bg = colors.bg
	Util.fg = colors.fg

	colors.none = "NONE"

	-- Always update git colors to use the palette colors (either default or injected)
	-- This ensures git colors are derived from the theme colors
	colors.git.add = colors.green2 or colors.green
	colors.git.delete = colors.red1 or colors.red
	colors.git.change = colors.orange or colors.yellow

	-- Diff colors using tokyonight approach
	colors.diff = {
		add = Util.blend_bg(colors.green2 or colors.green, 0.25),
		delete = Util.blend_bg(colors.red1 or colors.red, 0.25),
		change = Util.blend_bg(colors.blue7 or colors.blue, 0.15),
		text = colors.blue7 or colors.blue,
	}

	colors.git.ignore = colors.dark3
	colors.black = Util.blend_bg(colors.bg, 0.8, colors.bg)
	colors.border_highlight = Util.blend_bg(colors.blue1, 0.8)
	colors.border = colors.black

	-- Popups and statusline always get a dark background
	colors.bg_popup = colors.bg_dark
	colors.bg_statusline = colors.bg_dark

	-- Sidebar and Floats are configurable
	colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
		or opts.styles.sidebars == "dark" and colors.bg_dark
		or colors.bg

	colors.bg_float = opts.styles.floats == "transparent" and colors.none
		or opts.styles.floats == "dark" and colors.bg_dark
		or colors.bg

	colors.bg_visual = Util.blend_bg(colors.blue0, 0.4)
	colors.bg_search = colors.blue0
	colors.fg_sidebar = colors.fg
	colors.fg_float = colors.fg

	colors.error = colors.red1
	colors.todo = colors.blue
	colors.warning = colors.yellow
	colors.info = colors.blue2
	colors.hint = colors.teal

	-- Create blended colors for subtle highlights
	colors.subtle_bg = Util.blend_bg(colors.fg, 0.10)
	colors.cursorline_bg = Util.blend_bg(colors.fg, 0.20)
	colors.selection_bg = Util.blend_bg(colors.fg, 0.25)
	colors.float_bg = Util.blend_bg(colors.fg, 0.12)

	colors.rainbow = {
		colors.blue,
		colors.yellow,
		colors.green,
		colors.teal,
		colors.magenta,
		colors.purple,
		colors.orange,
		colors.red,
	}

	-- Terminal colors
	colors.terminal = {
		black = colors.black,
		black_bright = colors.terminal_black,
		red = colors.red,
		red_bright = colors.red,
		green = colors.green,
		green_bright = colors.green,
		yellow = colors.yellow,
		yellow_bright = colors.yellow,
		blue = colors.blue,
		blue_bright = colors.blue,
		magenta = colors.magenta,
		magenta_bright = colors.magenta,
		cyan = colors.cyan,
		cyan_bright = colors.cyan,
		white = colors.fg_dark,
		white_bright = colors.fg,
	}

	-- Call user's on_colors callback for further customization
	opts.on_colors(colors)

	return colors, opts
end

return M
