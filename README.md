<div align="center"><h1>bebop.nvim</h1></div>

<p align="center">*see you space cowboy...*</p>
<p align="center">A Neovim colorscheme inspired by the visual style of Cowboy Bebop.</p>

### Default

<img width="1127" height="746" alt="Screenshot from 2026-01-04 02-45-06" src="https://github.com/user-attachments/assets/327923c0-6b99-4a23-8d40-4f515eb6062f" />

### Spike

<img width="1127" height="746" alt="Screenshot from 2026-01-04 02-45-25" src="https://github.com/user-attachments/assets/b7253827-f608-4fea-b0c8-c32f367c2ecb" />

### Faye

<img width="1127" height="746" alt="Screenshot from 2026-01-04 02-50-22" src="https://github.com/user-attachments/assets/fd072b4e-9ca7-48b5-bad8-ff40af30682b" />

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
  -- Use transparent background
  -- Set to false to use the colorscheme's background color
  transparent = true,

  -- Set terminal colors
  terminal_colors = true,

  -- Preset: "default", "spike", or "faye" (default: "default")
  preset = "default",
})

vim.cmd([[colorscheme bebop]])
```

## Presets

### Default
The original bebop look. Balanced, warm, and versatile.

```lua
require("bebop").setup({ preset = "default" })
```

### Spike
Heavy use of the signature blue from Spike's suit. More melancholic, cooler feel.

```lua
require("bebop").setup({ preset = "spike" })
```

### Faye
Vibrant pinks and purples with warm accents. Casino glamour energy.

```lua
require("bebop").setup({ preset = "faye" })
```

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

## License

MIT
