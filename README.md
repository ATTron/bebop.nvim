# bebop.nvim

A Neovim colorscheme inspired by the visual style of Cowboy Bebop. Bright, defined colors with rusty warmth — space western noir meets retro computing.

Designed for **transparent terminal backgrounds** by default.

## Features

- Bright, saturated colors with gruvbox-level definition
- Transparent background support (enabled by default)
- Three presets: **default**, **spike**, and **faye**
- Terminal colors support
- Full Treesitter support
- LSP semantic token support
- Plugin support (Telescope, NvimTree, Neo-tree, nvim-cmp, and more)
- Language-specific highlights (Rust, Zig, TypeScript, Python, Go, Lua)

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "ATTron/bebop.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("bebop").setup()
    vim.cmd([[colorscheme bebop]])
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "ATTron/bebop.nvim",
  config = function()
    require("bebop").setup()
    vim.cmd([[colorscheme bebop]])
  end,
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'ATTron/bebop.nvim'

" In your init.vim after plug#end()
colorscheme bebop
```

## Configuration

```lua
require("bebop").setup({
  -- Use transparent background (default: true)
  -- Set to false to use the colorscheme's background color
  transparent = true,

  -- Set terminal colors (default: true)
  terminal_colors = true,

  -- Preset: "default", "spike", or "faye" (default: "default")
  preset = "default",
})

vim.cmd([[colorscheme bebop]])
```

## Presets

### Default
The original bebop look. Balanced, warm, and versatile.
- **Keywords**: Rust orange (`#e07850`)
- **Functions**: Aqua (`#4dd0e1`)
- **Types**: Yellow (`#ffd54f`)

```lua
require("bebop").setup({ preset = "default" })
```

### Spike
Heavy use of the signature blue from Spike's suit. More melancholic, cooler feel.
- **Keywords**: Blue (`#64b5f6`)
- **Functions**: Aqua (`#4dd0e1`)
- **Types**: Yellow (`#ffd54f`)
- **Namespaces**: Blue (`#64b5f6`)

```lua
require("bebop").setup({ preset = "spike" })
```

### Faye
Vibrant pinks and purples with warm accents. Casino glamour energy.
- **Keywords**: Purple (`#ba68c8`)
- **Functions**: Aqua (`#4dd0e1`)
- **Types**: Amber (`#ffb74d`)
- **Fields**: Pink (`#d884a2`)

```lua
require("bebop").setup({ preset = "faye" })
```

## Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| Aqua | `#4dd0e1` | Functions, methods |
| Yellow | `#ffd54f` | Types, classes, structs |
| Rust | `#e07850` | Keywords (default preset) |
| Orange | `#ff8c42` | Numbers, constants, booleans |
| Green | `#9ccc65` | Strings |
| Purple | `#ba68c8` | Special characters, lifetimes |
| Blue | `#64b5f6` | Fields, properties |
| Copper | `#cd7f50` | Preprocessor, includes |
| Coral | `#ff7070` | Labels, important highlights |
| Amber | `#ffb74d` | Warnings, modified files |

## Accessing Colors

You can access the color palette for your own customizations:

```lua
local bebop = require("bebop")
local colors = bebop.colors
local preset = bebop.preset

-- Example: custom highlight using base colors
vim.api.nvim_set_hl(0, "MyCustomGroup", { fg = colors.aqua, bold = true })

-- Example: use preset colors for consistency
vim.api.nvim_set_hl(0, "MyKeywordGroup", { fg = preset.keyword })
```

## Disabling Transparency

If you prefer a solid background:

```lua
require("bebop").setup({
  transparent = false,
})
```

This will use `#1c1816` as the background color.

## Supported Plugins

- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/nvim-tree/nvim-tree.lua)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Which-key](https://github.com/folke/which-key.nvim)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [Noice](https://github.com/folke/noice.nvim)
- [Lazy](https://github.com/folke/lazy.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Trouble](https://github.com/folke/trouble.nvim)
- [Bufferline](https://github.com/akinsho/bufferline.nvim)
- [Mini.nvim](https://github.com/echasnovski/mini.nvim)
- [Dashboard](https://github.com/glepnir/dashboard-nvim) / [Alpha](https://github.com/goolord/alpha-nvim)

## Inspiration

Named after the Bebop from Cowboy Bebop. The palette draws from the show's visual style:
- Rusty ship interiors
- Neon-lit rain scenes  
- Space western noir atmosphere
- That specific desaturated-but-rich warmth of late 90s cel animation

The presets are inspired by the main characters:
- **Default**: The Bebop itself — warm, lived-in, versatile
- **Spike**: Cool blues, melancholic, like his suit and demeanor
- **Faye**: Vibrant, glamorous, with casino energy

*See you space cowboy...*

## License

MIT
