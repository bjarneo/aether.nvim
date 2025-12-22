local Util = require("aether.utils")

local M = {}

---@type table<string, string> Plugin name to group file mapping
M.plugins = {
  ["blink.cmp"] = "blink",
  ["Comment.nvim"] = "comment",
  ["conform.nvim"] = "conform",
  ["diffview.nvim"] = "diffview",
  ["fidget.nvim"] = "fidget",
  ["flash.nvim"] = "flash",
  ["gitsigns.nvim"] = "gitsigns",
  ["indent-blankline.nvim"] = "indent-blankline",
  ["mason.nvim"] = "mason",
  ["mini.nvim"] = "mini",
  ["neo-tree.nvim"] = "neo-tree",
  ["noice.nvim"] = "noice",
  ["nvim-dap"] = "dap",
  ["nvim-lint"] = "lint",
  ["nvim-tree.lua"] = "nvim-tree",
  ["snacks.nvim"] = "snacks",
  ["telescope.nvim"] = "telescope",
  ["trouble.nvim"] = "trouble",
  ["which-key.nvim"] = "which-key",
}

---Load a highlight group module
---@param name string Group name
---@return table|nil Module or nil if not found
local function get_group(name)
  local ok, mod = pcall(require, "aether.groups." .. name)
  return ok and mod or nil
end

---Get highlights from a group module
---@param name string Group name
---@param colors ColorScheme Color palette
---@param opts aether.Config Configuration
---@return table<string, aether.Highlight>
local function get(name, colors, opts)
  local mod = get_group(name)
  return mod and mod.get and mod.get(colors, opts) or {}
end

---Setup all highlight groups
---@param colors ColorScheme Color palette
---@param opts aether.Config Configuration
---@return table<string, vim.api.keyset.highlight>
function M.setup(colors, opts)
  -- Always load core groups
  local ret = get("base", colors, opts)
  ret = vim.tbl_deep_extend("force", ret, get("treesitter", colors, opts))
  ret = vim.tbl_deep_extend("force", ret, get("lsp", colors, opts))
  ret = vim.tbl_deep_extend("force", ret, get("markdown", colors, opts))
  ret = vim.tbl_deep_extend("force", ret, get("git", colors, opts))

  -- Load plugin groups based on configuration
  for plugin, group_name in pairs(M.plugins) do
    if opts.plugins.all or (opts.plugins[plugin] ~= false) then
      ret = vim.tbl_deep_extend("force", ret, get(group_name, colors, opts))
    end
  end

  -- Apply user customizations
  if opts.on_highlights then
    opts.on_highlights(ret, colors)
  end

  return Util.resolve(ret)
end

return M
