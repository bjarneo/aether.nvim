local colors = require("aether.colorscheme")

return {
  normal = {
    a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_dark, fg = colors.yellow },
    c = { bg = colors.bg, fg = colors.fg },
    x = { bg = colors.bg, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.green, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_dark, fg = colors.green },
  },
  command = {
    a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_dark, fg = colors.orange },
  },
  visual = {
    a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_dark, fg = colors.purple },
  },
  replace = {
    a = { bg = colors.red, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_dark, fg = colors.red },
  },
  inactive = {
    a = { bg = colors.bg_dark, fg = colors.comment },
    b = { bg = colors.bg, fg = colors.comment },
  },
}
