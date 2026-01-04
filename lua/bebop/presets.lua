-- lua/bebop/presets.lua
-- Preset configurations for bebop.nvim

local palette = require("bebop.palette")

local M = {}

-- Default preset - balanced, the original bebop look
-- Rusty keywords, aqua functions, yellow types
-- The Bebop ship interior - warm, lived-in
M.default = {
  name = "default",
  -- Background - warm brown, like the ship interior
  bg = "#1f1814", -- warm reddish-brown
  bg_float = "#2a211c",
  line_highlight = "#2a221c",
  -- Syntax colors
  keyword = palette.base.rust,
  func = palette.base.aqua,
  func_bold = true,
  type = palette.base.yellow,
  string = palette.base.green,
  number = palette.base.orange,
  constant = palette.base.orange,
  comment = palette.base.fg4,
  operator = palette.base.fg2,
  preproc = palette.base.copper,
  special = palette.base.purple,
  field = palette.base.blue,
  namespace = palette.base.fg1,
  parameter = palette.base.fg1,
  variable = palette.base.fg1,
  builtin = palette.base.orange,
  -- UI colors
  cursor_line_nr = palette.base.yellow,
  search_bg = palette.base.yellow,
  match = palette.base.yellow,
  title = palette.base.rust,
  directory = palette.base.aqua,
}

-- Spike preset - heavy use of the signature blue
-- Spike's suit blue dominates, more melancholic feel
-- Cool, moody, like rainy nights on Mars
M.spike = {
  name = "spike",
  -- Background - distinctly cool/blue
  bg = "#141820", -- dark blue
  bg_float = "#1a2028",
  line_highlight = "#1c2230",
  -- Syntax colors
  keyword = palette.base.blue, -- blue keywords
  func = palette.base.aqua,
  func_bold = true,
  type = palette.base.yellow,
  string = palette.base.green,
  number = palette.base.orange,
  constant = palette.base.orange,
  comment = palette.base.fg4,
  operator = palette.base.fg3,
  preproc = palette.base.blue,   -- blue preprocessor
  special = palette.base.purple,
  field = palette.base.aqua,     -- aqua fields
  namespace = palette.base.blue, -- blue namespaces
  parameter = palette.base.fg1,
  variable = palette.base.fg1,
  builtin = palette.base.amber,
  -- UI colors
  cursor_line_nr = palette.base.blue, -- blue line numbers
  search_bg = palette.base.blue,
  match = palette.base.aqua,
  title = palette.base.blue,
  directory = palette.base.blue,
}

-- Faye preset - yellow dominant with red and purple accents
-- Matching her iconic outfit: gold/yellow outfit, red jacket, purple hair
-- Bold, confident, high contrast
M.faye = {
  name = "faye",
  -- Background - deep plum/purple like her hair
  bg = "#1a1420", -- deep plum
  bg_float = "#221a28",
  line_highlight = "#2a2030",
  -- Syntax colors - yellow dominant, red/purple accents
  keyword = "#e0a050", -- golden yellow keywords (main color)
  func = palette.base.aqua,
  func_bold = true,
  type = "#e0a050",     -- golden yellow types
  string = palette.base.green,
  number = "#c45050",   -- dark red numbers (jacket color)
  constant = "#c45050", -- dark red constants
  comment = palette.base.fg4,
  operator = palette.base.fg2,
  preproc = palette.base.purple, -- purple preprocessor (hair)
  special = palette.base.purple, -- purple special
  field = "#c45050",             -- dark red fields
  namespace = palette.base.fg1,
  parameter = palette.base.fg2,
  variable = palette.base.fg1,
  builtin = "#e0a050",        -- golden yellow builtins
  -- UI colors
  cursor_line_nr = "#e0a050", -- golden yellow
  search_bg = "#e0a050",
  match = palette.base.purple,
  title = "#e0a050",
  directory = "#c45050",
}

function M.get(preset_name)
  local presets = {
    default = M.default,
    spike = M.spike,
    faye = M.faye,
  }
  return presets[preset_name] or M.default
end

return M
