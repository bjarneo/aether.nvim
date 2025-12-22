local Util = require("aether.utils")

local M = {}

---@class aether.Palette
---@field bg string Background color
---@field bg_dark string Darker background (sidebars)
---@field bg_dark1 string Even darker background
---@field bg_highlight string Highlighted lines (cursorline)
---@field fg string Default foreground
---@field fg_dark string Darker foreground
---@field fg_gutter string Line numbers, fold column
---@field comment string Comments
---@field blue string Primary blue accent
---@field cyan string Cyan accent
---@field green string Green (strings, success)
---@field magenta string Magenta accent
---@field orange string Orange (numbers, warnings)
---@field purple string Purple (keywords)
---@field red string Red (errors)
---@field teal string Teal accent
---@field yellow string Yellow (types)
local palette = {
  -- Background colors
  bg = "#000000",
  bg_dark = "#000000",
  bg_dark1 = "#000000",
  bg_highlight = "#000000",

  -- Primary accent colors
  blue = "#66d9ef",
  blue0 = "#264f78",
  blue1 = "#66d9ef",
  blue2 = "#66d9ef",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8",
  blue7 = "#1e3a5f",

  -- Neutral colors
  comment = "#585858",
  cyan = "#66d9ef",
  dark3 = "#585858",
  dark5 = "#b8b8b8",

  -- Foreground colors
  fg = "#d8d8d8",
  fg_dark = "#b8b8b8",
  fg_gutter = "#585858",

  -- Semantic colors
  green = "#a6e22e",
  green1 = "#a6e22e",
  green2 = "#73aa6a",

  magenta = "#ae81ff",
  magenta2 = "#ae81ff",

  orange = "#fd971f",
  purple = "#ae81ff",

  red = "#f92672",
  red1 = "#c91f4f",

  teal = "#66d9ef",
  terminal_black = "#282828",
  yellow = "#f4bf75",

  special_char = "#cc6633",
}

---@type table<string, string|string[]> Base16 to semantic color mapping
local base16_map = {
  base00 = { "bg", "bg_dark", "bg_dark1" },
  base01 = "terminal_black",
  base02 = "bg_highlight",
  base03 = { "comment", "dark3", "fg_gutter" },
  base04 = { "dark5", "fg_dark" },
  base05 = "fg",
  base08 = { "red", "red1", "magenta2" },
  base09 = "orange",
  base0A = "yellow",
  base0B = { "green", "green1", "green2" },
  base0C = { "cyan", "teal" },
  base0D = { "blue", "blue1", "blue2" },
  base0E = { "purple", "magenta" },
  base0F = "special_char",
}

---@type table<string, string[]> Color propagation rules (source -> variants)
local propagation = {
  bg = { "bg_dark", "bg_dark1" },
  fg_dark = { "dark5" },
  comment = { "dark3", "fg_gutter", "terminal_black" },
  red = { "red1" },
  green = { "green1", "green2" },
  blue = { "blue0", "blue1", "blue2", "blue5", "blue6", "blue7" },
  cyan = { "teal" },
  magenta = { "magenta2" },
  purple = { "magenta" },
}

---Apply base16 color mappings
---@param colors aether.Palette Colors to modify
---@param opts_colors table User color overrides
local function apply_base16(colors, opts_colors)
  for base_key, targets in pairs(base16_map) do
    local value = opts_colors[base_key]
    if value then
      if type(targets) == "string" then
        colors[targets] = value
      else
        for _, target in ipairs(targets) do
          colors[target] = value
        end
      end
    end
  end
end

---Apply color propagation rules
---@param colors aether.Palette Colors to modify
---@param opts_colors table User color overrides
local function apply_propagation(colors, opts_colors)
  for source, variants in pairs(propagation) do
    if opts_colors[source] then
      for _, variant in ipairs(variants) do
        -- Only propagate if variant wasn't explicitly set
        if colors[variant] == palette[variant] then
          colors[variant] = colors[source]
        end
      end
    end
  end
end

---Setup the color palette
---@param opts aether.Config
---@return ColorScheme
function M.setup(opts)
  opts = require("aether.config").extend(opts)

  ---@class ColorScheme: aether.Palette
  local colors = vim.deepcopy(palette)

  -- Apply user color overrides
  if opts.colors and next(opts.colors) then
    apply_base16(colors, opts.colors)
    colors = vim.tbl_deep_extend("force", colors, opts.colors)
    apply_propagation(colors, opts.colors)
  end

  -- Update Util defaults for blending
  Util.bg = colors.bg
  Util.fg = colors.fg

  colors.none = "NONE"

  -- Git colors (derived from theme)
  colors.git = {
    add = colors.green2,
    delete = colors.red1,
    change = colors.orange,
    ignore = colors.dark3,
  }

  -- Diff colors (blended backgrounds)
  colors.diff = {
    add = Util.blend_bg(colors.green2, 0.25),
    delete = Util.blend_bg(colors.red1, 0.25),
    change = Util.blend_bg(colors.blue7, 0.15),
    text = colors.blue7,
  }

  -- Derived colors
  colors.black = Util.blend_bg(colors.bg, 0.8, colors.bg)
  colors.border_highlight = Util.blend_bg(colors.blue1, 0.8)
  colors.border = colors.black

  -- UI backgrounds
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
    or opts.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_float = opts.styles.floats == "transparent" and colors.none
    or opts.styles.floats == "dark" and colors.bg_dark
    or colors.bg

  -- Selection and search
  colors.bg_visual = Util.blend_bg(colors.blue0, 0.4)
  colors.bg_search = colors.blue0
  colors.fg_sidebar = colors.fg
  colors.fg_float = colors.fg

  -- Diagnostics
  colors.error = colors.red1
  colors.warning = colors.yellow
  colors.info = colors.blue2
  colors.hint = colors.teal
  colors.todo = colors.blue

  -- Subtle highlights
  colors.subtle_bg = Util.blend_bg(colors.fg, 0.10)
  colors.cursorline_bg = Util.blend_bg(colors.fg, 0.20)
  colors.selection_bg = Util.blend_bg(colors.fg, 0.25)
  colors.float_bg = Util.blend_bg(colors.fg, 0.12)

  -- Rainbow colors (for indent guides, etc.)
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

  -- User callback
  if opts.on_colors then
    opts.on_colors(colors)
  end

  return colors
end

return M
