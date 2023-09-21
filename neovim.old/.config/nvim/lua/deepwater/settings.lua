local o = vim.o
local wo = vim.wo
local bo = vim.bo
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- global options
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

o.termguicolors = true

o.scrolloff = 8
o.mouse = "a"
o.updatetime = 50

-- window-local options
wo.number = true
wo.relativenumber = true

wo.colorcolumn = "80"

-- buffer-local options
bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
bo.expandtab = true

bo.smartindent = true

bo.swapfile = false

vim.cmd [[set iskeyword+=-]]
