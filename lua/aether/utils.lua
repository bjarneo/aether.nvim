--- Utility functions for the Aether colorscheme
local M = {}

--- Helper function to set highlight groups with color values
--- This function builds a vim highlight command string and executes it
--- @param group string The highlight group name to set
--- @param opts table Table containing highlight options:
---   - fg: string Foreground color (hex color value)
---   - bg: string Background color (hex color value)
---   - sp: string Special color for underlines/undercurls (hex color value)
---   - style: string Style attributes (bold, italic, underline, etc.)
---   - blend: number Transparency level (0-100, where 0 is opaque and 100 is fully transparent)
function M.hi(group, opts)
  -- Start building the highlight command string
  local cmd = "highlight " .. group

  -- Add GUI foreground color if specified
  if opts.fg then
    cmd = cmd .. " guifg=" .. opts.fg
  end

  -- Add GUI background color if specified
  if opts.bg then
    cmd = cmd .. " guibg=" .. opts.bg
  end

  -- Add special color for underlines if specified
  if opts.sp then
    cmd = cmd .. " guisp=" .. opts.sp
  end

  -- Add style attributes (bold, italic, etc.) if specified
  if opts.style then
    cmd = cmd .. " gui=" .. opts.style
  end

  -- Add blend/transparency if specified
  if opts.blend then
    cmd = cmd .. " blend=" .. opts.blend
  end

  -- Execute the highlight command
  vim.cmd(cmd)
end

return M