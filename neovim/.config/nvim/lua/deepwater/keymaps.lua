-- shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--]]
-- remap space as leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- get to NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- better window navigation
keymap("n", "<C-h>", "<C-W>h", opts)
keymap("n", "<C-j>", "<C-W>j", opts)
keymap("n", "<C-k>", "<C-W>k", opts)
keymap("n", "<C-l>", "<C-W>l", opts)

-- resize window
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- press jk fast to leave insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
-- https://vi.stackexchange.com/questions/2674/how-can-i-easily-move-a-line
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m .-2<CR>gv", opts)

-- keep whatever was in paste register when you
-- paste over a highlighted section of code
-- from Neovim - ~25 Custom Keymaps set with Lua
-- https://youtu.be/435-amtVYJ8?t=686
keymap("v", "p", '"_dP', opts)

-- Telescope
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = true }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
