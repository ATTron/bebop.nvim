-- lua/bebop/init.lua
-- bebop.nvim - A Cowboy Bebop inspired colorscheme
-- Designed for transparent terminal backgrounds

local M = {}

-- Default configuration
M.config = {
  transparent = true,     -- Use transparent background (default: true)
  terminal_colors = true, -- Set terminal colors (default: true)
  preset = "default",     -- Preset: "default", "spike", or "faye"
}

-- Store resolved colors for external access
M.colors = {}
M.bright = {}

function M.setup(opts)
  -- Merge user options with defaults
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})

  -- Load palette and preset
  local palette = require("bebop.palette")
  local presets = require("bebop.presets")
  local preset = presets.get(M.config.preset)

  -- Store colors for external access
  M.colors = palette.base
  M.bright = palette.bright
  M.preset = preset

  -- Clear existing highlights
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "bebop"

  -- Determine background color based on transparency and preset
  local bg = M.config.transparent and palette.base.none or preset.bg
  local bg_float = M.config.transparent and palette.base.none or preset.bg_float

  -- Set terminal colors if enabled
  if M.config.terminal_colors then
    for k, v in pairs(palette.terminal) do
      vim.g[k] = v
    end
  end

  -- Build highlights
  local c = palette.base
  local bright = palette.bright
  local p = preset

  local highlights = {
    ---------------------------------------------------------
    -- EDITOR UI
    ---------------------------------------------------------
    Normal = { fg = c.fg1, bg = bg },
    NormalNC = { fg = c.fg1, bg = bg },
    NormalFloat = { fg = c.fg1, bg = bg_float },
    FloatBorder = { fg = c.border, bg = bg_float },
    FloatTitle = { fg = p.func, bg = bg_float, bold = true },

    Cursor = { fg = c.bg0, bg = c.fg1 },
    lCursor = { fg = c.bg0, bg = c.fg1 },
    CursorIM = { fg = c.bg0, bg = c.fg1 },
    CursorLine = { bg = M.config.transparent and preset.line_highlight or preset.line_highlight },
    CursorColumn = { bg = M.config.transparent and preset.line_highlight or preset.line_highlight },

    ColorColumn = { bg = c.bg1 },
    Conceal = { fg = c.fg4 },

    Directory = { fg = p.directory, bold = true },

    DiffAdd = { fg = c.green, bg = "#2a3a2a" },
    DiffChange = { fg = c.amber, bg = "#3a3020" },
    DiffDelete = { fg = c.red, bg = "#3a2020" },
    DiffText = { fg = c.bg0, bg = c.amber, bold = true },

    EndOfBuffer = { fg = c.bg3 },

    ErrorMsg = { fg = c.red, bold = true },
    WarningMsg = { fg = c.orange, bold = true },
    ModeMsg = { fg = c.fg0, bold = true },
    MoreMsg = { fg = c.green, bold = true },
    MsgArea = { fg = c.fg1 },
    MsgSeparator = { fg = c.border },

    VertSplit = { fg = c.bg3, bg = bg },
    WinSeparator = { fg = c.bg3, bg = bg },

    Folded = { fg = c.fg4, bg = bg, italic = true },
    FoldColumn = { fg = c.fg4, bg = bg },
    SignColumn = { fg = c.fg4, bg = bg },

    IncSearch = { fg = c.bg0, bg = c.orange, bold = true },
    CurSearch = { fg = c.bg0, bg = c.orange, bold = true },
    Search = { fg = c.bg0, bg = p.search_bg },
    Substitute = { fg = c.bg0, bg = c.coral },

    LineNr = { fg = c.bg4 },
    LineNrAbove = { fg = c.bg4 },
    LineNrBelow = { fg = c.bg4 },
    CursorLineNr = { fg = p.cursor_line_nr, bold = true },
    CursorLineFold = { fg = p.cursor_line_nr },
    CursorLineSign = { fg = p.cursor_line_nr },

    MatchParen = { fg = p.match, bg = c.none, bold = true, underline = true },

    NonText = { fg = c.bg3 },
    SpecialKey = { fg = c.bg4 },
    Whitespace = { fg = c.bg3 },

    Pmenu = { fg = c.fg1, bg = bg_float },
    PmenuSel = { fg = c.bg0, bg = p.func, bold = true },
    PmenuSbar = { bg = c.bg3 },
    PmenuThumb = { bg = p.func },
    PmenuKind = { fg = p.keyword },
    PmenuKindSel = { fg = c.bg0, bg = p.func },
    PmenuExtra = { fg = c.fg3 },
    PmenuExtraSel = { fg = c.bg0, bg = p.func },

    Question = { fg = p.func, bold = true },
    QuickFixLine = { bg = c.selection, bold = true },

    SpellBad = { sp = c.red, undercurl = true },
    SpellCap = { sp = c.yellow, undercurl = true },
    SpellLocal = { sp = c.aqua, undercurl = true },
    SpellRare = { sp = c.purple, undercurl = true },

    StatusLine = { fg = c.fg1, bg = bg },
    StatusLineNC = { fg = c.fg4, bg = bg },

    TabLine = { fg = c.fg4, bg = bg },
    TabLineFill = { bg = bg },
    TabLineSel = { fg = p.func, bg = bg, bold = true },

    Title = { fg = p.title, bold = true },

    Visual = { bg = c.selection },
    VisualNOS = { bg = c.selection },

    WildMenu = { fg = c.bg0, bg = p.func, bold = true },

    WinBar = { fg = c.fg1, bg = bg, bold = true },
    WinBarNC = { fg = c.fg4, bg = bg },

    TermCursor = { fg = c.bg0, bg = c.fg1 },
    TermCursorNC = { fg = c.bg0, bg = c.fg4 },

    ---------------------------------------------------------
    -- SYNTAX
    ---------------------------------------------------------
    Comment = { fg = p.comment, italic = true },

    Constant = { fg = p.constant },
    String = { fg = p.string },
    Character = { fg = p.string },
    Number = { fg = p.number },
    Boolean = { fg = p.number },
    Float = { fg = p.number },

    Identifier = { fg = p.variable },
    Function = { fg = p.func, bold = p.func_bold },

    Statement = { fg = p.keyword },
    Conditional = { fg = p.keyword },
    Repeat = { fg = p.keyword },
    Label = { fg = c.coral },
    Operator = { fg = p.operator },
    Keyword = { fg = p.keyword },
    Exception = { fg = c.red },

    PreProc = { fg = p.preproc },
    Include = { fg = p.preproc },
    Define = { fg = p.preproc },
    Macro = { fg = p.preproc },
    PreCondit = { fg = p.preproc },

    Type = { fg = p.type },
    StorageClass = { fg = p.keyword },
    Structure = { fg = p.type },
    Typedef = { fg = p.type },

    Special = { fg = p.special },
    SpecialChar = { fg = p.special },
    Tag = { fg = p.func },
    Delimiter = { fg = c.fg3 },
    SpecialComment = { fg = c.fg4, bold = true },
    Debug = { fg = c.red },

    Underlined = { fg = c.blue, underline = true },
    Ignore = { fg = c.bg4 },
    Error = { fg = c.red, bold = true },
    Todo = { fg = c.bg0, bg = c.yellow, bold = true },

    ---------------------------------------------------------
    -- DIAGNOSTICS
    ---------------------------------------------------------
    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.orange },
    DiagnosticInfo = { fg = c.blue },
    DiagnosticHint = { fg = c.aqua },
    DiagnosticOk = { fg = c.green },

    DiagnosticVirtualTextError = { fg = bright.red, bg = "#3d2020", bold = true },
    DiagnosticVirtualTextWarn = { fg = bright.orange, bg = "#3d3020", bold = true },
    DiagnosticVirtualTextInfo = { fg = bright.blue, bg = "#202830", bold = true },
    DiagnosticVirtualTextHint = { fg = bright.aqua, bg = "#203030", bold = true },
    DiagnosticVirtualTextOk = { fg = bright.green, bg = "#203020", bold = true },

    DiagnosticUnderlineError = { sp = c.red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = c.orange, undercurl = true },
    DiagnosticUnderlineInfo = { sp = c.blue, undercurl = true },
    DiagnosticUnderlineHint = { sp = c.aqua, undercurl = true },
    DiagnosticUnderlineOk = { sp = c.green, undercurl = true },

    DiagnosticFloatingError = { fg = c.red },
    DiagnosticFloatingWarn = { fg = c.orange },
    DiagnosticFloatingInfo = { fg = c.blue },
    DiagnosticFloatingHint = { fg = c.aqua },
    DiagnosticFloatingOk = { fg = c.green },

    DiagnosticSignError = { fg = c.red },
    DiagnosticSignWarn = { fg = c.orange },
    DiagnosticSignInfo = { fg = c.blue },
    DiagnosticSignHint = { fg = c.aqua },
    DiagnosticSignOk = { fg = c.green },

    ---------------------------------------------------------
    -- TREESITTER
    ---------------------------------------------------------
    ["@text"] = { fg = c.fg1 },
    ["@text.literal"] = { fg = p.string },
    ["@text.reference"] = { fg = p.func },
    ["@text.title"] = { fg = p.title, bold = true },
    ["@text.uri"] = { fg = c.blue, underline = true },
    ["@text.underline"] = { underline = true },
    ["@text.todo"] = { fg = c.bg0, bg = c.yellow, bold = true },
    ["@text.note"] = { fg = c.bg0, bg = c.blue, bold = true },
    ["@text.warning"] = { fg = c.bg0, bg = c.orange, bold = true },
    ["@text.danger"] = { fg = c.bg0, bg = c.red, bold = true },
    ["@text.diff.add"] = { fg = c.green },
    ["@text.diff.delete"] = { fg = c.red },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.strike"] = { strikethrough = true },

    ["@comment"] = { fg = p.comment, italic = true },
    ["@comment.documentation"] = { fg = c.fg3, italic = true },

    ["@punctuation"] = { fg = c.fg3 },
    ["@punctuation.bracket"] = { fg = c.fg2 },
    ["@punctuation.delimiter"] = { fg = c.fg3 },
    ["@punctuation.special"] = { fg = p.special },

    ["@constant"] = { fg = p.constant },
    ["@constant.builtin"] = { fg = p.constant, italic = true },
    ["@constant.macro"] = { fg = p.preproc },

    ["@define"] = { fg = p.preproc },
    ["@macro"] = { fg = p.preproc },

    ["@string"] = { fg = p.string },
    ["@string.escape"] = { fg = p.special },
    ["@string.special"] = { fg = p.special },
    ["@string.regex"] = { fg = p.special },

    ["@character"] = { fg = p.string },
    ["@character.special"] = { fg = p.special },

    ["@number"] = { fg = p.number },
    ["@boolean"] = { fg = p.number },
    ["@float"] = { fg = p.number },

    ["@function"] = { fg = p.func, bold = p.func_bold },
    ["@function.builtin"] = { fg = p.func, italic = true },
    ["@function.call"] = { fg = p.func },
    ["@function.macro"] = { fg = p.preproc },

    ["@parameter"] = { fg = p.parameter, italic = true },
    ["@parameter.reference"] = { fg = p.parameter, italic = true },

    ["@method"] = { fg = p.func },
    ["@method.call"] = { fg = p.func },

    ["@field"] = { fg = p.field },
    ["@property"] = { fg = p.field },

    ["@constructor"] = { fg = p.type },

    ["@conditional"] = { fg = p.keyword },
    ["@conditional.ternary"] = { fg = p.keyword },

    ["@repeat"] = { fg = p.keyword },
    ["@label"] = { fg = c.coral },

    ["@operator"] = { fg = p.operator },

    ["@keyword"] = { fg = p.keyword },
    ["@keyword.function"] = { fg = p.keyword },
    ["@keyword.operator"] = { fg = p.keyword },
    ["@keyword.return"] = { fg = p.keyword },
    ["@keyword.coroutine"] = { fg = p.keyword },
    ["@keyword.import"] = { fg = p.preproc },

    ["@exception"] = { fg = c.red },

    ["@variable"] = { fg = p.variable },
    ["@variable.builtin"] = { fg = p.builtin, bold = true },
    ["@variable.parameter"] = { fg = p.parameter, italic = true },
    ["@variable.member"] = { fg = c.fg1 },

    ["@type"] = { fg = p.type },
    ["@type.builtin"] = { fg = p.type, italic = true },
    ["@type.definition"] = { fg = p.type },
    ["@type.qualifier"] = { fg = p.keyword },

    ["@storageclass"] = { fg = p.keyword },
    ["@attribute"] = { fg = p.preproc },
    ["@namespace"] = { fg = p.namespace },
    ["@module"] = { fg = p.namespace },

    ["@include"] = { fg = p.keyword },
    ["@preproc"] = { fg = p.preproc },

    ["@debug"] = { fg = c.red },

    ["@tag"] = { fg = p.keyword },
    ["@tag.attribute"] = { fg = p.func },
    ["@tag.delimiter"] = { fg = c.fg3 },
    ["@tag.builtin"] = { fg = p.keyword },

    ---------------------------------------------------------
    -- LSP SEMANTIC TOKENS
    ---------------------------------------------------------
    ["@lsp.type.class"] = { fg = p.type },
    ["@lsp.type.comment"] = { fg = p.comment, italic = true },
    ["@lsp.type.decorator"] = { fg = p.preproc },
    ["@lsp.type.enum"] = { fg = p.type },
    ["@lsp.type.enumMember"] = { fg = p.constant },
    ["@lsp.type.function"] = { fg = p.func },
    ["@lsp.type.interface"] = { fg = p.type },
    ["@lsp.type.keyword"] = { fg = p.keyword },
    ["@lsp.type.macro"] = { fg = p.preproc },
    ["@lsp.type.method"] = { fg = p.func },
    ["@lsp.type.namespace"] = { fg = p.namespace },
    ["@lsp.type.number"] = { fg = p.number },
    ["@lsp.type.operator"] = { fg = p.operator },
    ["@lsp.type.parameter"] = { fg = p.parameter, italic = true },
    ["@lsp.type.property"] = { fg = p.field },
    ["@lsp.type.regexp"] = { fg = p.special },
    ["@lsp.type.string"] = { fg = p.string },
    ["@lsp.type.struct"] = { fg = p.type },
    ["@lsp.type.type"] = { fg = p.type },
    ["@lsp.type.typeParameter"] = { fg = p.type, italic = true },
    ["@lsp.type.variable"] = { fg = p.variable },

    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.readonly"] = { italic = true },
    ["@lsp.mod.defaultLibrary"] = { italic = true },

    ---------------------------------------------------------
    -- GIT
    ---------------------------------------------------------
    GitSignsAdd = { fg = c.green },
    GitSignsChange = { fg = c.amber },
    GitSignsDelete = { fg = c.red },
    GitSignsChangedelete = { fg = c.orange },
    GitSignsTopdelete = { fg = c.red },
    GitSignsUntracked = { fg = c.blue },

    GitSignsAddNr = { fg = c.green },
    GitSignsChangeNr = { fg = c.amber },
    GitSignsDeleteNr = { fg = c.red },

    GitSignsAddLn = { bg = "#2a3a2a" },
    GitSignsChangeLn = { bg = "#3a3020" },
    GitSignsDeleteLn = { bg = "#3a2020" },

    GitSignsCurrentLineBlame = { fg = c.fg4, italic = true },

    diffAdded = { fg = c.green, bg = "#2a3a2a" },
    diffRemoved = { fg = c.red, bg = "#3a2020" },
    diffChanged = { fg = c.amber, bg = "#3a3020" },
    diffFile = { fg = p.func },
    diffNewFile = { fg = c.green },
    diffOldFile = { fg = c.red },
    diffLine = { fg = c.fg4 },
    diffIndexLine = { fg = p.special },

    ---------------------------------------------------------
    -- TELESCOPE
    ---------------------------------------------------------
    TelescopeNormal = { fg = c.fg1, bg = bg_float },
    TelescopeBorder = { fg = c.border, bg = bg_float },
    TelescopeTitle = { fg = p.func, bold = true },

    TelescopePromptNormal = { fg = c.fg1, bg = bg_float },
    TelescopePromptBorder = { fg = p.func, bg = bg_float },
    TelescopePromptTitle = { fg = c.bg0, bg = p.func, bold = true },
    TelescopePromptPrefix = { fg = p.func },
    TelescopePromptCounter = { fg = c.fg4 },

    TelescopeResultsNormal = { fg = c.fg1, bg = bg_float },
    TelescopeResultsBorder = { fg = c.border, bg = bg_float },
    TelescopeResultsTitle = { fg = c.bg0, bg = c.green, bold = true },

    TelescopePreviewNormal = { fg = c.fg1, bg = bg_float },
    TelescopePreviewBorder = { fg = c.border, bg = bg_float },
    TelescopePreviewTitle = { fg = c.bg0, bg = p.keyword, bold = true },

    TelescopeSelection = { fg = p.func, bg = c.selection, bold = true },
    TelescopeSelectionCaret = { fg = p.func },
    TelescopeMultiSelection = { fg = p.special, bg = c.selection },
    TelescopeMultiIcon = { fg = p.special },

    TelescopeMatching = { fg = p.match, bold = true },

    ---------------------------------------------------------
    -- NVIM-TREE / NEO-TREE
    ---------------------------------------------------------
    NvimTreeNormal = { fg = c.fg1, bg = bg },
    NvimTreeNormalNC = { fg = c.fg1, bg = bg },
    NvimTreeRootFolder = { fg = p.title, bold = true },
    NvimTreeFolderIcon = { fg = c.amber },
    NvimTreeFolderName = { fg = p.func },
    NvimTreeOpenedFolderName = { fg = p.func, bold = true },
    NvimTreeEmptyFolderName = { fg = c.fg4 },
    NvimTreeSymlink = { fg = p.special },
    NvimTreeSpecialFile = { fg = p.special, bold = true },
    NvimTreeImageFile = { fg = c.fg1 },
    NvimTreeIndentMarker = { fg = c.bg4 },

    NvimTreeGitDirty = { fg = c.orange },
    NvimTreeGitStaged = { fg = c.green },
    NvimTreeGitMerge = { fg = p.special },
    NvimTreeGitRenamed = { fg = c.amber },
    NvimTreeGitNew = { fg = c.green },
    NvimTreeGitDeleted = { fg = c.red },
    NvimTreeGitIgnored = { fg = c.fg4 },

    NeoTreeNormal = { fg = c.fg1, bg = bg },
    NeoTreeNormalNC = { fg = c.fg1, bg = bg },
    NeoTreeRootName = { fg = p.title, bold = true },
    NeoTreeDirectoryIcon = { fg = c.amber },
    NeoTreeDirectoryName = { fg = p.func },
    NeoTreeFileName = { fg = c.fg1 },
    NeoTreeFileIcon = { fg = c.fg1 },
    NeoTreeGitAdded = { fg = c.green },
    NeoTreeGitModified = { fg = c.amber },
    NeoTreeGitDeleted = { fg = c.red },
    NeoTreeGitConflict = { fg = c.coral, bold = true },
    NeoTreeGitUntracked = { fg = p.special },
    NeoTreeGitIgnored = { fg = c.fg4 },

    ---------------------------------------------------------
    -- WHICH-KEY
    ---------------------------------------------------------
    WhichKey = { fg = p.func },
    WhichKeyGroup = { fg = p.keyword },
    WhichKeyDesc = { fg = c.fg1 },
    WhichKeySeparator = { fg = c.fg4 },
    WhichKeyFloat = { bg = bg_float },
    WhichKeyBorder = { fg = c.border },
    WhichKeyValue = { fg = c.fg3 },

    ---------------------------------------------------------
    -- INDENT BLANKLINE
    ---------------------------------------------------------
    IndentBlanklineChar = { fg = c.bg3 },
    IndentBlanklineContextChar = { fg = p.keyword },
    IndentBlanklineContextStart = { sp = p.keyword, underline = true },
    IndentBlanklineSpaceChar = { fg = c.bg3 },
    IndentBlanklineSpaceCharBlankline = { fg = c.bg3 },

    IblIndent = { fg = c.bg3 },
    IblScope = { fg = p.keyword },
    IblWhitespace = { fg = c.bg3 },

    ---------------------------------------------------------
    -- NVIM-CMP
    ---------------------------------------------------------
    CmpItemAbbr = { fg = c.fg1 },
    CmpItemAbbrDeprecated = { fg = c.fg4, strikethrough = true },
    CmpItemAbbrMatch = { fg = p.func, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = p.func, bold = true },
    CmpItemKind = { fg = p.keyword },
    CmpItemMenu = { fg = c.fg4 },

    CmpItemKindText = { fg = c.fg1 },
    CmpItemKindMethod = { fg = p.func },
    CmpItemKindFunction = { fg = p.func },
    CmpItemKindConstructor = { fg = p.type },
    CmpItemKindField = { fg = p.field },
    CmpItemKindVariable = { fg = c.fg1 },
    CmpItemKindClass = { fg = p.type },
    CmpItemKindInterface = { fg = p.type },
    CmpItemKindModule = { fg = p.namespace },
    CmpItemKindProperty = { fg = p.field },
    CmpItemKindUnit = { fg = p.number },
    CmpItemKindValue = { fg = p.number },
    CmpItemKindEnum = { fg = p.type },
    CmpItemKindKeyword = { fg = p.keyword },
    CmpItemKindSnippet = { fg = p.special },
    CmpItemKindColor = { fg = p.special },
    CmpItemKindFile = { fg = c.fg1 },
    CmpItemKindReference = { fg = p.func },
    CmpItemKindFolder = { fg = c.amber },
    CmpItemKindEnumMember = { fg = p.constant },
    CmpItemKindConstant = { fg = p.constant },
    CmpItemKindStruct = { fg = p.type },
    CmpItemKindEvent = { fg = p.special },
    CmpItemKindOperator = { fg = p.operator },
    CmpItemKindTypeParameter = { fg = p.type },
    CmpItemKindCopilot = { fg = p.func },

    ---------------------------------------------------------
    -- NVIM-NOTIFY
    ---------------------------------------------------------
    NotifyERRORBorder = { fg = c.red },
    NotifyERRORIcon = { fg = c.red },
    NotifyERRORTitle = { fg = c.red, bold = true },
    NotifyWARNBorder = { fg = c.orange },
    NotifyWARNIcon = { fg = c.orange },
    NotifyWARNTitle = { fg = c.orange, bold = true },
    NotifyINFOBorder = { fg = p.func },
    NotifyINFOIcon = { fg = p.func },
    NotifyINFOTitle = { fg = p.func, bold = true },
    NotifyDEBUGBorder = { fg = c.fg4 },
    NotifyDEBUGIcon = { fg = c.fg4 },
    NotifyDEBUGTitle = { fg = c.fg4, bold = true },
    NotifyTRACEBorder = { fg = p.special },
    NotifyTRACEIcon = { fg = p.special },
    NotifyTRACETitle = { fg = p.special, bold = true },
    NotifyBackground = { bg = c.bg0 },

    ---------------------------------------------------------
    -- NOICE
    ---------------------------------------------------------
    NoiceCmdline = { fg = c.fg1 },
    NoiceCmdlineIcon = { fg = p.func },
    NoiceCmdlineIconSearch = { fg = c.yellow },
    NoiceCmdlinePopup = { fg = c.fg1, bg = bg_float },
    NoiceCmdlinePopupBorder = { fg = c.border },
    NoiceConfirm = { fg = c.fg1, bg = bg_float },
    NoiceConfirmBorder = { fg = p.func },
    NoiceFormatConfirm = { fg = c.fg1 },
    NoiceFormatConfirmDefault = { fg = p.func, bold = true },

    ---------------------------------------------------------
    -- LAZY
    ---------------------------------------------------------
    LazyH1 = { fg = c.bg0, bg = p.func, bold = true },
    LazyH2 = { fg = p.keyword, bold = true },
    LazyButton = { fg = c.fg1, bg = bg },
    LazyButtonActive = { fg = c.bg0, bg = p.keyword },
    LazySpecial = { fg = c.amber },
    LazyProgressDone = { fg = p.func },
    LazyProgressTodo = { fg = c.bg4 },
    LazyReasonPlugin = { fg = p.special },
    LazyReasonCmd = { fg = p.func },
    LazyReasonEvent = { fg = c.yellow },
    LazyReasonFt = { fg = c.green },
    LazyReasonKeys = { fg = p.keyword },
    LazyReasonRequire = { fg = p.preproc },
    LazyReasonSource = { fg = c.orange },
    LazyReasonStart = { fg = c.coral },

    ---------------------------------------------------------
    -- MASON
    ---------------------------------------------------------
    MasonHeader = { fg = c.bg0, bg = p.func, bold = true },
    MasonHighlight = { fg = p.func },
    MasonHighlightBlock = { fg = c.bg0, bg = p.func },
    MasonHighlightBlockBold = { fg = c.bg0, bg = p.func, bold = true },
    MasonHighlightSecondary = { fg = c.amber },
    MasonMuted = { fg = c.fg4 },
    MasonMutedBlock = { fg = c.fg4, bg = c.bg2 },

    ---------------------------------------------------------
    -- DASHBOARD / ALPHA
    ---------------------------------------------------------
    DashboardHeader = { fg = p.func },
    DashboardCenter = { fg = p.keyword },
    DashboardFooter = { fg = c.fg4, italic = true },
    DashboardShortCut = { fg = c.amber },
    DashboardKey = { fg = p.func },
    DashboardDesc = { fg = c.fg1 },
    DashboardIcon = { fg = p.keyword },

    AlphaHeader = { fg = p.func },
    AlphaButtons = { fg = p.keyword },
    AlphaShortcut = { fg = c.amber },
    AlphaFooter = { fg = c.fg4, italic = true },

    ---------------------------------------------------------
    -- BUFFERLINE / BARBAR
    ---------------------------------------------------------
    BufferLineFill = { bg = bg },
    BufferLineBackground = { fg = c.fg4, bg = bg },
    BufferLineBuffer = { fg = c.fg4, bg = bg },
    BufferLineBufferSelected = { fg = c.fg0, bg = bg, bold = true },
    BufferLineBufferVisible = { fg = c.fg2, bg = bg },
    BufferLineModified = { fg = c.amber, bg = bg },
    BufferLineModifiedSelected = { fg = c.amber, bg = bg },
    BufferLineModifiedVisible = { fg = c.amber, bg = bg },
    BufferLineSeparator = { fg = c.bg3, bg = bg },
    BufferLineIndicatorSelected = { fg = p.func, bg = bg },

    ---------------------------------------------------------
    -- MARKDOWN
    ---------------------------------------------------------
    markdownH1 = { fg = p.title, bold = true },
    markdownH2 = { fg = p.title, bold = true },
    markdownH3 = { fg = p.title, bold = true },
    markdownH4 = { fg = p.title },
    markdownH5 = { fg = p.title },
    markdownH6 = { fg = p.title },
    markdownHeadingDelimiter = { fg = c.coral },
    markdownCode = { fg = p.string },
    markdownCodeBlock = { fg = p.string },
    markdownCodeDelimiter = { fg = c.fg4 },
    markdownBlockquote = { fg = c.fg3, italic = true },
    markdownListMarker = { fg = c.orange },
    markdownOrderedListMarker = { fg = c.orange },
    markdownRule = { fg = c.fg4 },
    markdownHeadingRule = { fg = c.fg4 },
    markdownUrlDelimiter = { fg = c.fg3 },
    markdownLinkDelimiter = { fg = c.fg3 },
    markdownLinkTextDelimiter = { fg = c.fg3 },
    markdownUrl = { fg = c.blue, underline = true },
    markdownUrlTitleDelimiter = { fg = p.string },
    markdownLinkText = { fg = p.func },
    markdownIdDeclaration = { fg = p.func },
    markdownBold = { bold = true },
    markdownItalic = { italic = true },
    markdownBoldItalic = { bold = true, italic = true },

    ---------------------------------------------------------
    -- MINI.NVIM
    ---------------------------------------------------------
    MiniStatuslineModeNormal = { fg = c.bg0, bg = p.func, bold = true },
    MiniStatuslineModeInsert = { fg = c.bg0, bg = c.green, bold = true },
    MiniStatuslineModeVisual = { fg = c.bg0, bg = p.special, bold = true },
    MiniStatuslineModeReplace = { fg = c.bg0, bg = c.red, bold = true },
    MiniStatuslineModeCommand = { fg = c.bg0, bg = c.yellow, bold = true },
    MiniStatuslineModeOther = { fg = c.bg0, bg = p.keyword, bold = true },
    MiniStatuslineDevinfo = { fg = c.fg1, bg = c.bg3 },
    MiniStatuslineFilename = { fg = c.fg1, bg = c.bg2 },
    MiniStatuslineFileinfo = { fg = c.fg1, bg = c.bg3 },
    MiniStatuslineInactive = { fg = c.fg4, bg = c.bg1 },

    MiniCursorword = { underline = true },
    MiniCursorwordCurrent = { underline = true },

    MiniIndentscopeSymbol = { fg = p.keyword },
    MiniIndentscopePrefix = { nocombine = true },

    MiniJump = { fg = c.bg0, bg = c.yellow },
    MiniJump2dSpot = { fg = c.coral, bold = true },

    MiniSurround = { fg = c.bg0, bg = c.amber },

    ---------------------------------------------------------
    -- TROUBLE
    ---------------------------------------------------------
    TroubleNormal = { fg = c.fg1, bg = bg },
    TroubleCount = { fg = p.special, bold = true },
    TroubleError = { fg = c.red },
    TroubleWarning = { fg = c.orange },
    TroubleInformation = { fg = c.blue },
    TroubleHint = { fg = c.aqua },
    TroubleTextError = { fg = c.red },
    TroubleTextWarning = { fg = c.orange },
    TroubleTextInformation = { fg = c.blue },
    TroubleTextHint = { fg = c.aqua },

    ---------------------------------------------------------
    -- NETRW
    ---------------------------------------------------------
    netrwDir = { fg = p.func },
    netrwClassify = { fg = p.func },
    netrwLink = { fg = c.fg4 },
    netrwSymLink = { fg = p.special },
    netrwExe = { fg = c.green },
    netrwComment = { fg = c.fg4 },
    netrwList = { fg = c.blue },
    netrwHelpCmd = { fg = p.func },
    netrwVersion = { fg = c.green },

    ---------------------------------------------------------
    -- HEALTH
    ---------------------------------------------------------
    healthError = { fg = c.red },
    healthWarning = { fg = c.orange },
    healthSuccess = { fg = c.green },

    ---------------------------------------------------------
    -- QUICKFIX
    ---------------------------------------------------------
    qfFileName = { fg = p.func },
    qfLineNr = { fg = c.fg4 },

    ---------------------------------------------------------
    -- LANGUAGE SPECIFIC
    ---------------------------------------------------------
    -- Rust
    ["@keyword.import.rust"] = { fg = p.keyword },
    ["@namespace.rust"] = { fg = c.fg1 },
    ["@module.rust"] = { fg = c.fg1 },
    ["@type.rust"] = { fg = p.type },
    ["@type.builtin.rust"] = { fg = p.type, italic = true },
    ["@constructor.rust"] = { fg = p.type },
    ["@constant.rust"] = { fg = p.constant },
    ["@punctuation.delimiter.rust"] = { fg = c.fg3 },
    ["@punctuation.bracket.rust"] = { fg = c.fg2 },
    ["@variable.builtin.rust"] = { fg = p.builtin, bold = true },
    ["@type.qualifier.rust"] = { fg = p.keyword },
    ["@storageclass.lifetime.rust"] = { fg = p.special, italic = true },
    ["@label.rust"] = { fg = p.special, italic = true },
    ["@function.rust"] = { fg = p.func, bold = p.func_bold },
    ["@function.call.rust"] = { fg = p.func },
    ["@method.rust"] = { fg = p.func },
    ["@method.call.rust"] = { fg = p.func },
    ["@lsp.type.type.rust"] = { fg = p.type },
    ["@lsp.type.struct.rust"] = { fg = p.type },
    ["@lsp.type.enum.rust"] = { fg = p.type },
    ["@lsp.type.interface.rust"] = { fg = p.type },
    ["@lsp.type.typeAlias.rust"] = { fg = p.type },

    -- Zig
    ["@variable.builtin.zig"] = { fg = p.builtin, bold = true },
    ["@keyword.modifier.zig"] = { fg = p.keyword },
    ["@namespace.zig"] = { fg = c.fg1 },
    ["@module.zig"] = { fg = c.fg1 },
    ["@function.builtin.zig"] = { fg = p.func, italic = true },
    ["@constant.builtin.zig"] = { fg = p.constant },

    -- Python
    ["@variable.builtin.python"] = { fg = p.builtin, bold = true },
    ["@attribute.python"] = { fg = p.preproc },

    -- Go
    ["@variable.builtin.go"] = { fg = p.builtin, bold = true },
    ["@namespace.go"] = { fg = c.fg1 },

    -- Lua
    ["@variable.builtin.lua"] = { fg = p.builtin, bold = true },

    -- JavaScript/TypeScript
    ["@variable.builtin.javascript"] = { fg = p.builtin, bold = true },
    ["@variable.builtin.typescript"] = { fg = p.builtin, bold = true },
    ["@tag.javascript"] = { fg = p.keyword },
    ["@tag.tsx"] = { fg = p.keyword },
    ["@namespace.typescript"] = { fg = c.fg1 },
    ["@module.typescript"] = { fg = c.fg1 },
  }

  -- Apply highlights
  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
