-- Lualine theme for Aether colorscheme
-- Uses the injected color palette from aether.colors

local config = require("aether.config")
local colors_setup = require("aether.colors").setup

-- Get the colors with injected palette support
local opts = config.extend()
local colors = colors_setup(opts)

local Util = require("aether.utils")

-- Create blended colors for lualine sections
local subtle_bg = Util.blend_bg(colors.fg, 0.10)
local section_bg = Util.blend_bg(colors.fg, 0.15)

local M = {}

M.normal = {
  a = { bg = colors.yellow, fg = colors.bg, gui = opts.lualine_bold and "bold" or nil },
  b = { bg = section_bg, fg = colors.yellow },
  c = { bg = subtle_bg, fg = colors.fg },
  x = { bg = subtle_bg, fg = colors.fg },
}

M.insert = {
  a = { bg = colors.green, fg = colors.bg, gui = opts.lualine_bold and "bold" or nil },
  b = { bg = section_bg, fg = colors.green },
}

M.command = {
  a = { bg = colors.orange, fg = colors.bg, gui = opts.lualine_bold and "bold" or nil },
  b = { bg = section_bg, fg = colors.orange },
}

M.visual = {
  a = { bg = colors.purple, fg = colors.bg, gui = opts.lualine_bold and "bold" or nil },
  b = { bg = section_bg, fg = colors.purple },
}

M.replace = {
  a = { bg = colors.red, fg = colors.bg, gui = opts.lualine_bold and "bold" or nil },
  b = { bg = section_bg, fg = colors.red },
}

M.inactive = {
  a = { bg = section_bg, fg = colors.comment },
  b = { bg = subtle_bg, fg = colors.comment },
  c = { bg = subtle_bg, fg = colors.comment },
}

return M
