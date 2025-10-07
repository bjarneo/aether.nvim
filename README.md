# Aether.nvim

A Neovim colorscheme inspired by TokyoNight, using a well-structured architecture for consistent, customizable theming across your development environment.

![Aether.nvim](theme.png)

## Philosophy

Aether.nvim provides a dark, elegant theme with carefully chosen colors that create a cohesive visual experience. The architecture is inspired by TokyoNight, offering extensive customization options and plugin support.

## Features

- **Modern Architecture**: Clean, modular design inspired by TokyoNight
- **Customizable Colors**: Fine-grained control over all color aspects
- **True Color Support**: Full 24-bit color support with `termguicolors`
- **Extensive Plugin Support**: Built-in support for popular Neovim plugins
- **Configurable Styles**: Control italics, bold, and other style attributes
- **Transparent Background**: Optional transparent background support
- **Multiple Color Variants**: Support for subtle backgrounds and accents

## Requirements

- **Neovim 0.8+** (Lua support required)
- Terminal emulator with true color support

## Installation

### Using lazy.nvim

```lua
{
  "bjarneo/aether.nvim",
  priority = 1000,
  config = function()
    require("aether").setup({
      -- Your configuration here
    })
    vim.cmd.colorscheme("aether")
  end,
}
```

### Using packer.nvim

```lua
use {
  "bjarneo/aether.nvim",
  config = function()
    require("aether").setup()
    vim.cmd.colorscheme("aether")
  end,
}
```

### Using vim-plug

```vim
Plug 'bjarneo/aether.nvim'
```

Then in your `init.lua`:

```lua
require("aether").setup()
vim.cmd.colorscheme("aether")
```

## Configuration

Aether.nvim can be configured with the following options:

```lua
require("aether").setup({
  transparent = false, -- Disable background color
  terminal_colors = true, -- Configure terminal colors
  styles = {
    -- Style applied to different syntax groups
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles for sidebars and floats
    sidebars = "dark", -- "dark", "transparent" or "normal"
    floats = "dark", -- "dark", "transparent" or "normal"
  },
  dim_inactive = false, -- Dim inactive windows
  lualine_bold = false, -- Bold lualine section headers
  
  --- Override colors
  ---@param colors ColorScheme
  on_colors = function(colors)
    -- Modify colors here
    -- colors.bg = "#000000"
  end,
  
  --- Override highlight groups
  ---@param highlights table
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors)
    -- Modify highlights here
    -- highlights.Comment = { fg = colors.comment, italic = true }
  end,
  
  cache = true, -- Enable caching for better performance
  
  plugins = {
    -- Enable all plugins by default (when not using lazy.nvim)
    all = package.loaded.lazy == nil,
    -- Auto-enable plugins (detects loaded plugins)
    auto = true,
    -- Or manually enable/disable specific plugins
    -- telescope = true,
  },
})
```

### Example Configurations

#### Transparent Background

```lua
require("aether").setup({
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
})
```

#### Base16 Color Injection (Legacy Support)

Aether supports direct base16 color injection for easy customization:

```lua
require("aether").setup({
  colors = {
    -- Monotone shades
    base00 = "#1e1e2e",  -- Background
    base01 = "#282828",  -- Lighter background
    base02 = "#383838",  -- Selection background
    base03 = "#585858",  -- Comments
    base04 = "#b8b8b8",  -- Dark foreground
    base05 = "#d8d8d8",  -- Default foreground
    base06 = "#e8e8e8",  -- Light foreground
    base07 = "#f8f8f8",  -- Light background
    
    -- Accent colors
    base08 = "#f92672",  -- Red
    base09 = "#fd971f",  -- Orange
    base0A = "#f4bf75",  -- Yellow
    base0B = "#a6e22e",  -- Green
    base0C = "#66d9ef",  -- Cyan
    base0D = "#66d9ef",  -- Blue
    base0E = "#ae81ff",  -- Magenta
    base0F = "#cc6633",  -- Brown
  }
})
```

#### Customize Colors (Modern Approach)

```lua
require("aether").setup({
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
    colors.bg = "#1e1e2e"
  end
})
```

#### Customize Highlight Groups

```lua
require("aether").setup({
  on_highlights = function(hl, c)
    hl.Comment = { fg = c.dark5, italic = true }
    hl.Keyword = { fg = c.purple, bold = true }
    hl["@variable"] = { fg = c.fg }
  end,
})
```

## Supported Plugins

Aether.nvim includes highlight groups for popular Neovim plugins:

### Core Language Support
- **LSP**: Diagnostic colors, semantic highlighting, hover windows
- **Treesitter**: All `@` capture groups for syntax highlighting

### File Management & Navigation
- **Telescope**: Fuzzy finder interface, previews, selections
- **NvimTree**: File explorer with git integration
- **Neo-tree**: Modern file explorer with enhanced features

### Git Integration
- **GitSigns**: Git diff indicators in sign column
- **Diffview**: Side-by-side diff viewer

### Code Enhancement
- **Flash**: Jump/search highlighting
- **Trouble**: Diagnostics and quickfix lists
- **WhichKey**: Keybinding popup interface
- **Indent Blankline**: Indentation guides

### UI & Notifications
- **Noice**: Enhanced UI components and notifications
- **Snacks**: UI utilities and components
- **Fidget**: LSP progress notifications
- **Lualine**: Status line theme included

### Development Tools
- **Blink.cmp**: Completion menu styling
- **nvim-dap**: Debugger interface
- **Conform**: Code formatting integration
- **Lint**: Linting integration
- **Mini.nvim**: Mini modules support
- **Mason**: Package manager interface

## Color Palette

Aether uses a carefully selected color palette based on these core colors:

- **Background**: `#000000` - Pure black
- **Foreground**: `#d8d8d8` - Light gray
- **Red**: `#f92672` - Vibrant red
- **Orange**: `#fd971f` - Bright orange
- **Yellow**: `#f4bf75` - Soft yellow
- **Green**: `#a6e22e` - Vivid green
- **Cyan**: `#66d9ef` - Bright cyan
- **Blue**: `#66d9ef` - Same as cyan
- **Purple**: `#ae81ff` - Soft purple
- **Magenta**: `#ae81ff` - Same as purple

These colors are used consistently throughout the theme with various opacity levels for subtle backgrounds and accents.

## Architecture

Aether.nvim follows a modular architecture inspired by TokyoNight:

```
lua/aether/
├── init.lua           -- Main entry point
├── config.lua         -- Configuration options
├── theme.lua          -- Theme setup logic
├── utils.lua          -- Utility functions
├── colors/
│   └── init.lua       -- Color palette and processing
└── groups/
    ├── init.lua       -- Highlight group loader
    ├── base.lua       -- Base highlight groups
    ├── treesitter.lua -- Treesitter groups
    └── [plugins].lua  -- Plugin-specific groups
```

## Troubleshooting

### Colors appear wrong

Make sure `termguicolors` is enabled (it's enabled by default with Aether):

```lua
vim.opt.termguicolors = true
```

### Cache Issues

If you experience issues after updates, clear the cache:

```lua
require("aether.util").cache.clear()
```

Or manually delete: `~/.cache/nvim/aether-*.json`

## Contributing

Contributions are welcome! Focus on:

- Adding support for new plugins
- Improving color mappings
- Documentation improvements
- Bug fixes

## License

MIT License.

## Credits

- Inspired by [TokyoNight.nvim](https://github.com/folke/tokyonight.nvim) by @folke
- Architecture and utilities adapted from TokyoNight's excellent design

## Author

Created and maintained by Bjarne Øverli.  
Follow [@iamdothash](https://x.com/iamdothash) on X for updates and more projects.

## How It Works

### Base16 Color Mapping

Aether.nvim follows the base16 specification with these color assignments:

**Monotone Shades** (base00-base07):
- **base00**: Default background
- **base01**: Lighter background (status bars, line numbers)
- **base02**: Selection background
- **base03**: Comments, invisibles, line highlighting
- **base04**: Dark foreground (status bars)
- **base05**: Default foreground, caret, delimiters
- **base06**: Light foreground
- **base07**: Light background

**Accent Colors** (base08-base0F):
- **base08**: Variables, XML tags, markup link text, errors, functions
- **base09**: Integers, boolean, constants, attributes
- **base0A**: Classes, types, search highlights
- **base0B**: Strings, inherited class, markup code
- **base0C**: Support, regular expressions, special characters
- **base0D**: Functions, methods, headings, keywords
- **base0E**: Keywords, storage, selectors, markup italic
- **base0F**: Deprecated, embedded language tags

### Technical Implementation

The colorscheme works by:

1. **Enabling `termguicolors`**: Uses 24-bit true color support for accurate color rendering
2. **Using hex color values**: All highlight groups use hex color values from the base16 palette
3. **Semantic color mapping**: Colors are mapped based on their semantic meaning in the base16 spec
4. **Customizable palette**: You can override any base16 color with your own values

## Requirements

- **Neovim 0.5+** (Lua support required)
- Terminal emulator with ANSI color support

## Installation

### Using lazy.nvim

```lua
{
  "bjarneo/aether.nvim",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("aether")
  end,
}
```

### Using packer.nvim

```lua
use {
  "bjarneo/aether.nvim",
  config = function()
    vim.cmd.colorscheme("aether")
  end,
}
```

### Using vim-plug

```vim
Plug 'bjarneo/aether.nvim'
```

Then in your `init.lua`:

```lua
vim.cmd.colorscheme("aether")
```

### Using with LazyVim

To use Aether with LazyVim, create a colorscheme plugin file in your LazyVim config:

**File: `~/.config/nvim/lua/plugins/colorscheme.lua`**

```lua
return {
  {
    "bjarneo/aether.nvim",
    name = "aether",
    priority = 1000,
    opts = {
      disable_italics = false,
      -- Optionally override colors
      colors = {
        -- base08 = "#custom_red",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
```

This will:
1. Install the aether.nvim plugin
2. Configure LazyVim to use "aether" as the default colorscheme
3. Apply any custom configuration options you specify

## Usage

### Basic Usage

Simply set the colorscheme in your Neovim configuration:

```lua
-- init.lua
vim.cmd.colorscheme("aether")
```

### Configuration

Aether.nvim supports configuration options that can be passed to the `setup` function:

```lua
require("aether").setup({
  disable_italics = false,
  colors = {
    -- Override any base16 colors with your custom values
    base00 = "#1e1e2e",  -- Custom background
    base0D = "#89b4fa",  -- Custom blue
    -- ... other colors
  }
})
vim.cmd.colorscheme("aether")
```

#### Available Options

- `disable_italics` (boolean, default: `false`): When set to `true`, disables italic formatting for comments and other elements that use italics.
- `colors` (table, default: `{}`): Override any of the base16 colors (base00 through base0F) with your custom hex color values.

### Customizing Colors

You can customize the entire color palette by passing a colors table:

```lua
require("aether").setup({
  colors = {
    -- Monotone shades
    base00 = "#1e1e2e",  -- Background
    base01 = "#282828",  -- Lighter background
    base02 = "#383838",  -- Selection background
    base03 = "#585858",  -- Comments
    base04 = "#b8b8b8",  -- Dark foreground
    base05 = "#d8d8d8",  -- Default foreground
    base06 = "#e8e8e8",  -- Light foreground
    base07 = "#f8f8f8",  -- Light background
    
    -- Accent colors
    base08 = "#f92672",  -- Red
    base09 = "#fd971f",  -- Orange
    base0A = "#f4bf75",  -- Yellow
    base0B = "#a6e22e",  -- Green
    base0C = "#66d9ef",  -- Cyan
    base0D = "#66d9ef",  -- Blue
    base0E = "#ae81ff",  -- Magenta
    base0F = "#cc6633",  -- Brown
  }
})
```

## Supported Plugins

Aether.nvim includes highlight groups for popular Neovim plugins:

### Core Language Support
- **LSP**: Diagnostic colors, semantic highlighting, hover windows
- **Treesitter**: All `@` capture groups for syntax highlighting
- **Mason**: Package manager interface

### File Management & Navigation
- **Telescope**: Fuzzy finder interface, previews, selections
- **NvimTree**: File explorer with git integration
- **Neo-tree**: Modern file explorer with enhanced features

### Git Integration
- **GitSigns**: Git diff indicators in sign column
- **Git**: Core git highlighting and diff views
- **Diffview**: Side-by-side diff viewer

### Code Enhancement
- **Flash**: Jump/search highlighting
- **Trouble**: Diagnostics and quickfix lists
- **WhichKey**: Keybinding popup interface
- **Indent Blankline**: Indentation guides
- **Comment**: Comment highlighting enhancements

### UI & Notifications
- **Noice**: Enhanced UI components and notifications
- **Snacks**: UI utilities and components
- **Fidget**: LSP progress notifications
- **Lualine**: Status line theme included at `lua/lualine/themes/aether.lua`

### Development Tools
- **Blink**: Completion menu styling
- **nvim-dap**: Debugger interface
- **Conform**: Code formatting integration
- **Lint**: Linting integration
- **Mini**: Mini.nvim modules support
- **Markdown**: Enhanced markdown highlighting

## Comparison with Traditional Themes

| Feature | ANSI-based Themes | Aether.nvim (Base16) |
|---------|-------------------|---------------------|
| Color Definition | Terminal ANSI colors | Hex values (base16) |
| Customization | Change terminal config | Pass colors to setup() |
| True Color | No (8/16 colors) | Yes (24-bit) |
| Color Accuracy | Depends on terminal | Consistent everywhere |
| Portability | Terminal-dependent | Works same everywhere |

## Examples

## Philosophy: Why Base16?

1. **Standardization**: Base16 is a widely-adopted specification used across many tools
2. **Flexibility**: Define your palette once and use it everywhere
3. **Consistency**: Colors maintain semantic meaning across different contexts
4. **Customization**: Easy to create and share custom color schemes
5. **True Color**: Full 24-bit color support for accurate color rendering

## Troubleshooting

### Colors appear wrong

Make sure `termguicolors` is enabled:

```lua
-- In your init.lua, before setting colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme("aether")
```

### Want different colors

Pass your custom colors to the setup function:

```lua
require("aether").setup({
  colors = {
    base08 = "#ff0000",  -- Custom red
    base0B = "#00ff00",  -- Custom green
  }
})
```

## Contributing

Contributions are welcome! Focus on:

- Adding support for new plugins
- Improving base16 color mappings
- Documentation improvements
- Bug fixes
- Sharing custom color palettes

## License

MIT License.

## Author

Follow [@iamdothash](https://x.com/iamdothash) on X for updates and more projects.

