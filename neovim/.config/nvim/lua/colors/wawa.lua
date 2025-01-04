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
Color.new("background", "#181818")
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
Group.new("Normal", colors.white, colors.background)
Group.new("Constant", colors.white, colors.background) -- Use special color for literals
Group.new("Function", colors.brown, colors.background)
Group.new("Character", colors.white, colors.background)
Group.new("SpecialChar", colors.white, colors.background)
Group.new("Number", colors.white, colors.background)
Group.new("Float", colors.white, colors.background)
Group.new("FloatBorder", colors.white, colors.background)
Group.new("Structure", colors.white, colors.background)
Group.new("Identifier", colors.white, colors.background)
Group.new("Statement", colors.white, colors.background)
Group.new("Special", colors.white, colors.background)
Group.new("SignColumn", colors.white, colors.background)
Group.new("FoldColumn", colors.white, colors.background)
Group.new("Operator", colors.white, colors.background)
Group.new("Whitespace", colors.white, colors.background)
Group.new("Tag", colors.white, colors.background)

Group.new("Todo", colors.black, colors.gray)

-- gray
Group.new("Special", colors.gray, colors.background)
Group.new("LineNr", colors.gray, colors.background)
-- Group.new("Statement", colors.dark_gray, colors.background)
Group.new("Module", colors.dark_gray, colors.background)
Group.new("PreProc", colors.light_gray, colors.background)
Group.new("Type", colors.light_gray, colors.background)
Group.new("@type.builtin", colors.light_gray, colors.background)
Group.new("Underlined", colors.light_gray, colors.background, styles.underline)
Group.new("StatusLine", colors.light_gray, colors.background)

Group.new("Visual", colors.red, colors.background)

Group.new("String", colors.red, colors.background)

Group.new("Keyword", colors.purple, colors.background)
Group.new("MatchParen", colors.purple, colors.background)
Group.new("Search", colors.purple, colors.background)
Group.new("lCursor", colors.purple, colors.literal_blue)
Group.new("Cursor", colors.purple, colors.background)
Group.new("CursorIM", colors.purple, colors.background)
Group.new("CursorLineNr", colors.purple, colors.background)

Group.new("Comment", colors.comment, colors.background, styles.italic)

-- diagnostics
Group.new("Diagnostic", nil, colors.background)
Group.new("DiagnosticError", nil, colors.background)
Group.new("DiagnosticWarn", nil, colors.background)
Group.new("DiagnosticInfo", nil, colors.background)
Group.new("DiagnosticHint", nil, colors.background)
Group.new("DiagnosticOk", nil, colors.background)
Group.new("NormalFloat", nil, colors.background)

Group.new("CursorLine", nil, nil)

vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])
