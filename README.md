# Aether.nvim

A Neovim colorscheme using the base16 color scheme specification for consistent, customizable theming across your entire development environment.

![Aether.nvim with Gruvbox Terminal Colors](theme.png)

## Philosophy

Aether.nvim uses the base16 color scheme specification, providing 16 carefully chosen colors that create a cohesive visual experience. Unlike ANSI-based colorschemes, base16 allows you to pass custom color palettes while maintaining consistent relationships between colors.

## Features

- **Base16 Color Scheme**: Uses the widely-adopted base16 specification
- **Customizable Colors**: Pass your own color palette or use the defaults
- **True Color Support**: Full 24-bit color support with `termguicolors`
- **Consistent Design**: All colors follow base16 semantic meaning
- **Extensible**: Easy to override specific colors for personalization

## State
This project is currently in the preliminary stage, and adjustments are expected to be made.

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

