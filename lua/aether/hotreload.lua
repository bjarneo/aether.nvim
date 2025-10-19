-- Hot reload configuration for aether.nvim during development
-- This module provides automatic reloading when the plugin is updated via Lazy

local M = {}

--- Check if aether is the currently active colorscheme
local function is_aether_active()
  return vim.g.colors_name == "aether"
end

--- Clear all loaded aether modules from package.loaded, except config
--- The config module should NOT be cleared because it contains the latest
--- options that were set by lazy.nvim's config function during reload
local function clear_aether_modules()
  for module_name, _ in pairs(package.loaded) do
    -- Skip the config module to preserve user options
    if module_name ~= "aether.config" and (module_name:match("^aether") or module_name:match("^lualine%.themes%.aether")) then
      package.loaded[module_name] = nil
    end
  end
end

--- Reload the aether colorscheme with the current configuration
local function reload_colorscheme()
  -- Clear cached modules (except config which has the latest options)
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
    -- This will use the options already stored in the config module
    aether.load()

    vim.notify("aether.nvim reloaded", vim.log.levels.INFO)
  end)
end

--- Setup the hotreload autocmd
function M.setup()
  -- Listen for LazyReload events (triggered after :Lazy reload aether completes)
  -- Note: When lazy.nvim reloads the plugin, it re-runs the config function which
  -- calls setup(opts) with the new options. However, we still need to force a
  -- colorscheme reload to apply the changes to the UI.
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

      -- Defer the reload to ensure it happens after lazy.nvim completes
      -- Lazy.nvim's config function has already been called with new opts by now
      vim.defer_fn(function()
        reload_colorscheme()
      end, 2000)
    end,
  })

  -- Also create a user command for manual reloading
  vim.api.nvim_create_user_command("AetherReload", function()
    if is_aether_active() then
      reload_colorscheme()
    else
      vim.notify("aether is not the active colorscheme", vim.log.levels.WARN)
    end
  end, { desc = "Reload aether colorscheme" })

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

  -- Watch for changes to external theme configuration files (like omarchy)
  -- These files might be symlinked into the Neovim config
  local omarchy_theme_path = vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua")
  if vim.fn.filereadable(omarchy_theme_path) == 1 then
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = omarchy_theme_path,
      callback = function()
        if is_aether_active() then
          -- Defer to allow file changes to propagate and lazy.nvim to reload
          vim.defer_fn(function()
            -- Clear the theme plugin module to pick up new config
            package.loaded["plugins.theme"] = nil

            -- Load the new theme spec to get updated opts
            local ok, theme_spec = pcall(require, "plugins.theme")
            if ok and theme_spec and theme_spec[1] and theme_spec[1].opts then
              -- Clear aether modules except config, then update config with new opts
              clear_aether_modules()

              -- Now update the config with the new options
              local aether = require("aether")
              aether.setup(theme_spec[1].opts)

              -- Reload with new config
              reload_colorscheme()
            end
          end, 100)
        end
      end,
    })
  end
end

return M
