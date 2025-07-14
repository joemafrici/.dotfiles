-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
local M = {}
function M.setup()
	-- Triger `autoread` when files changes on disk
	-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
	-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
	--[[
	vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
		pattern = "*",
		command = "if !empty(bufname('')) && mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | | redraw! | endif",
	})
	--]]

	-- Highlight when yanking (copying) text
	--  Try it with `yap` in normal mode
	--  See `:help vim.highlight.on_yank()`
	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
		callback = function()
			vim.highlight.on_yank()
		end,
	})

	-- Set indent for html, css, js files
	vim.api.nvim_create_autocmd("FileType", {
		desc = "Indent 2 spaces for html, css, javascript, typescript files",
		pattern = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
		callback = function()
			vim.opt_local.shiftwidth = 2
			vim.opt_local.tabstop = 2
		end,
	})
	-- Set indent for Lua files
	vim.api.nvim_create_autocmd("FileType", {
		desc = "Indent 2 spaces for Lua files",
		pattern = "lua",
		callback = function()
			vim.opt_local.shiftwidth = 2
			vim.opt_local.tabstop = 2
		end,
	})
	-- Set indent for Go files
	vim.api.nvim_create_autocmd("FileType", {
		desc = "Indent 4 spaces for Go files",
		pattern = "go",
		callback = function()
			vim.opt_local.shiftwidth = 4
			vim.opt_local.tabstop = 4
		end,
	})
end

return M
