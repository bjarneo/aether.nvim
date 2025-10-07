-- Color definitions for Aether colorscheme
-- Base16 color scheme structure for consistent theming
-- Colors are passed from the terminal or defined by user configuration
local colors = {
	-- Base16 color definitions
	-- Dark to light shades
	base00 = "#000000", -- Default Background
	base01 = "#282828", -- Lighter Background (status bars, line number bg)
	base02 = "#383838", -- Selection Background
	base03 = "#585858", -- Comments, Invisibles
	base04 = "#b8b8b8", -- Dark Foreground (status bars)
	base05 = "#d8d8d8", -- Default Foreground, Caret
	base06 = "#e8e8e8", -- Light Foreground
	base07 = "#f8f8f8", -- Light Background
	
	-- Accent colors
	base08 = "#f92672", -- Red - Variables, XML Tags, Markup Link Text, Errors
	base09 = "#fd971f", -- Orange - Integers, Boolean, Constants, Attributes
	base0A = "#f4bf75", -- Yellow - Classes, Types, Search Highlights
	base0B = "#a6e22e", -- Green - Strings, Inherited Class, Markup Code
	base0C = "#66d9ef", -- Cyan - Support, Regular Expressions, Special
	base0D = "#66d9ef", -- Blue - Functions, Methods, Headings
	base0E = "#ae81ff", -- Magenta - Keywords, Storage, Selector, Markup Italic
	base0F = "#cc6633", -- Brown - Deprecated, Opening/Closing Embedded Language Tags
}

return colors