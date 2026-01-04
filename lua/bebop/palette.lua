-- lua/bebop/palette.lua
-- Color definitions for bebop.nvim

local M = {}

-- Base palette - shared across all presets
M.base = {
  -- Foregrounds
  fg0 = "#e2d9c8",
  fg1 = "#d4cbb8",
  fg2 = "#b8aa94",
  fg3 = "#a09080",
  fg4 = "#887868",
  
  -- Backgrounds
  bg0 = "#1c1816",
  bg1 = "#282220",
  bg2 = "#3c3430",
  bg3 = "#504840",
  bg4 = "#665850",
  
  -- Core colors
  red = "#ef5350",
  orange = "#ff8c42",
  yellow = "#ffd54f",
  green = "#9ccc65",
  aqua = "#4dd0e1",
  blue = "#64b5f6",
  purple = "#ba68c8",
  
  -- Warm accents
  rust = "#e07850",
  copper = "#cd7f50",
  amber = "#ffb74d",
  coral = "#ff7070",
  
  -- Grays
  gray = "#908070",
  
  -- Functional
  selection = "#3d352e",
  line_highlight = "#262220",
  border = "#504840",
  
  none = "NONE",
}

-- Bright versions for virtual text
M.bright = {
  red = "#ff8a80",
  orange = "#ffcc80",
  yellow = "#ffe082",
  green = "#c5e1a5",
  aqua = "#80deea",
  blue = "#90caf9",
  purple = "#ce93d8",
}

-- Terminal colors (for terminal_colors option)
M.terminal = {
  terminal_color_0 = M.base.bg1,      -- black
  terminal_color_1 = M.base.red,      -- red
  terminal_color_2 = M.base.green,    -- green
  terminal_color_3 = M.base.yellow,   -- yellow
  terminal_color_4 = M.base.blue,     -- blue
  terminal_color_5 = M.base.purple,   -- magenta
  terminal_color_6 = M.base.aqua,     -- cyan
  terminal_color_7 = M.base.fg1,      -- white
  terminal_color_8 = M.base.bg4,      -- bright black
  terminal_color_9 = M.base.coral,    -- bright red
  terminal_color_10 = "#b2df8a",      -- bright green
  terminal_color_11 = M.base.amber,   -- bright yellow
  terminal_color_12 = M.bright.blue,  -- bright blue
  terminal_color_13 = M.bright.purple, -- bright magenta
  terminal_color_14 = M.bright.aqua,  -- bright cyan
  terminal_color_15 = M.base.fg0,     -- bright white
}

return M
