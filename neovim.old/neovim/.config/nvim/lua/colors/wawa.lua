-- so $VIMRUNTIME/syntax/hitest.vim
-- :highlight
-- :redir @a | silent highlight | redir END | new | put a
local ok, colorbuddy = pcall(require, "colorbuddy.init")
if not ok then
	print("failed to load colorbuddy")
end
colorbuddy.colorscheme("wawa")

local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

-- colors
Color.new("background", "#1b1b1b")
Color.new("black", "#000000")
Color.new("gray", "#808080")
Color.new("dark_gray", "#1e1e1e")
Color.new("light_gray", "#828282")
Color.new("white", "#cccccc")

Color.new("red", "#db4851")
Color.new("purple", "#a36a81")
Color.new("green", "#93C37C")
--Color.new("blue", "#40BDFF")
Color.new("brown", "#c7835c")
Color.new("blue", "#77b5fe")
Color.new("comment", "#9292ec")
-- white
Group.new("Normal", colors.white, colors.none)
Group.new("Constant", colors.white, colors.none) -- Use special color for literals
Group.new("Function", colors.brown, colors.none)
Group.new("Character", colors.white, colors.none)
Group.new("SpecialChar", colors.white, colors.none)
Group.new("Number", colors.white, colors.none)
Group.new("Float", colors.white, colors.none)
Group.new("FloatBorder", colors.white, colors.none)
Group.new("Structure", colors.white, colors.none)
Group.new("Identifier", colors.white, colors.none)
Group.new("Statement", colors.white, colors.none)
Group.new("Special", colors.white, colors.none)
Group.new("SignColumn", colors.white, colors.none)
Group.new("FoldColumn", colors.white, colors.none)
Group.new("Operator", colors.white, colors.none)
Group.new("Whitespace", colors.white, colors.none)
Group.new("Tag", colors.white, colors.none)

Group.new("Todo", colors.black, colors.none)

-- gray
Group.new("Special", colors.gray, colors.none)
Group.new("LineNr", colors.gray, colors.none)
-- Group.new("Statement", colors.dark_gray, colors.none)
Group.new("Module", colors.dark_gray, colors.none)
Group.new("PreProc", colors.light_gray, colors.none)
Group.new("Type", colors.light_gray, colors.none)
Group.new("@type.builtin", colors.light_gray, colors.none)
Group.new("Underlined", colors.light_gray, colors.none, styles.underline)
Group.new("StatusLine", colors.light_gray, colors.none)

Group.new("Visual", colors.red, colors.none)

Group.new("String", colors.red, colors.none)

Group.new("Keyword", colors.purple, colors.none)
Group.new("MatchParen", colors.purple, colors.none)
Group.new("Search", colors.purple, colors.none)
Group.new("lCursor", colors.purple, colors.literal_blue)
Group.new("Cursor", colors.purple, colors.none)
Group.new("CursorIM", colors.purple, colors.none)
Group.new("CursorLineNr", colors.purple, colors.none)

Group.new("Comment", colors.comment, colors.none, styles.italic)

-- diagnostics
Group.new("Diagnostic", nil, colors.none)
Group.new("DiagnosticError", nil, colors.none)
Group.new("DiagnosticWarn", nil, colors.none)
Group.new("DiagnosticInfo", nil, colors.none)
Group.new("DiagnosticHint", nil, colors.none)
Group.new("DiagnosticOk", nil, colors.none)
Group.new("NormalFloat", nil, colors.none)

Group.new("CursorLine", nil, nil)

vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])
