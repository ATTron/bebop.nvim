-- lua/bebop/presets.lua
-- Preset configurations for bebop.nvim

local palette = require("bebop.palette")

local M = {}

-- Default preset - balanced, the original bebop look
-- Rusty keywords, aqua functions, yellow types
M.default = {
  name = "default",
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
M.spike = {
  name = "spike",
  -- Syntax colors
  keyword = palette.base.blue,          -- blue keywords
  func = palette.base.aqua,
  func_bold = true,
  type = palette.base.yellow,
  string = palette.base.green,
  number = palette.base.orange,
  constant = palette.base.orange,
  comment = palette.base.fg4,
  operator = palette.base.fg3,
  preproc = palette.base.blue,          -- blue preprocessor
  special = palette.base.purple,
  field = palette.base.aqua,            -- aqua fields
  namespace = palette.base.blue,        -- blue namespaces
  parameter = palette.base.fg1,
  variable = palette.base.fg1,
  builtin = palette.base.amber,
  -- UI colors
  cursor_line_nr = palette.base.blue,   -- blue line numbers
  search_bg = palette.base.blue,
  match = palette.base.aqua,
  title = palette.base.blue,
  directory = palette.base.blue,
}

-- Faye preset - more vibrant, feminine energy
-- Pinks and purples with warm accents, casino glamour
M.faye = {
  name = "faye",
  -- Syntax colors  
  keyword = palette.base.purple,        -- purple keywords
  func = palette.base.aqua,
  func_bold = true,
  type = palette.base.amber,            -- warm amber types
  string = palette.base.green,
  number = palette.base.coral,          -- coral numbers
  constant = palette.base.coral,
  comment = palette.base.fg4,
  operator = palette.base.fg2,
  preproc = "#d884a2",                  -- pink preprocessor
  special = "#e891b0",                  -- brighter pink
  field = "#d884a2",                    -- pink fields
  namespace = palette.base.fg1,
  parameter = palette.base.fg2,
  variable = palette.base.fg1,
  builtin = palette.base.amber,
  -- UI colors
  cursor_line_nr = palette.base.purple,
  search_bg = palette.base.purple,
  match = palette.base.amber,
  title = palette.base.purple,
  directory = "#d884a2",
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
