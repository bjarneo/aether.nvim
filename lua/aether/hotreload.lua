-- Hot reload configuration for aether.nvim during development
-- This module provides automatic reloading when the plugin is updated via Lazy

local M = {}

--- Check if aether is the currently active colorscheme
local function is_aether_active()
  return vim.g.colors_name == "aether"
end

--- Clear all loaded aether modules from package.loaded
local function clear_aether_modules()
  for module_name, _ in pairs(package.loaded) do
    if module_name:match("^aether") or module_name:match("^lualine%.themes%.aether") then
      package.loaded[module_name] = nil
    end
  end
end

--- Reload the aether colorscheme with the current configuration
local function reload_colorscheme()
  -- Clear cached modules
  clear_aether_modules()

  -- Reload and reapply the theme
  vim.schedule(function()
    -- Force clear highlight groups
    vim.cmd("hi clear")

    local ok, aether = pcall(require, "aether")
    if not ok then
      vim.notify("Failed to reload aether.nvim", vim.log.levels.ERROR)
      return
    end

    -- Reapply the colorscheme by calling load directly
    aether.load()

    vim.notify("aether.nvim reloaded", vim.log.levels.INFO)
  end)
end

--- Setup the hotreload autocmd
function M.setup()
  -- Listen for LazyReload events (triggered when any plugin is reloaded via :Lazy reload)
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyReload",
    callback = function(event)
      -- Only proceed if aether is the active colorscheme
      if not is_aether_active() then
        return
      end

      -- Check if aether.nvim was reloaded (event.data contains plugin name)
      if event.data and event.data ~= "aether.nvim" then
        return
      end

      -- Reload aether colorscheme
      reload_colorscheme()
    end,
  })

  -- Also listen for BufWritePost events in the aether.nvim directory
  -- This provides instant feedback during development
  local plugin_path = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h:h:h")

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = plugin_path .. "/lua/**/*.lua",
    callback = function()
      -- Only reload if aether is active
      if is_aether_active() then
        reload_colorscheme()
      end
    end,
  })
end

return M
