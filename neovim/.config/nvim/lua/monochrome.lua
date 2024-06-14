-- lua/monochrome.lua
local colorbuddy = require('colorbuddy')

colorbuddy.colorscheme("monochrome")

local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

-- Define your colors
Color.new('black', '#000000')
Color.new('white', '#FFFFFF')
Color.new('gray', '#808080')
Color.new('dark_gray', '#404040')
Color.new('light_gray', '#C0C0C0')

-- Define the special color for literals
Color.new('literal_blue', '#40BDFF')

-- Set the groups with these colors
Group.new('Normal', colors.white, colors.black)
Group.new('Comment', colors.gray, colors.black, styles.italic)
Group.new('Constant', colors.literal_blue, colors.black)  -- Use special color for literals
Group.new('String', colors.light_gray, colors.black)
Group.new('Function', colors.dark_gray, colors.black)
Group.new('Keyword', colors.gray, colors.black)

-- Add more groups as needed
Group.new('Identifier', colors.gray, colors.black)
Group.new('Statement', colors.dark_gray, colors.black)
Group.new('PreProc', colors.light_gray, colors.black)
Group.new('Type', colors.white, colors.black)
Group.new('Special', colors.gray, colors.black)
Group.new('Underlined', colors.light_gray, colors.black, styles.underline)
Group.new('Todo', colors.black, colors.gray)
