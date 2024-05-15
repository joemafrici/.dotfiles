-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
local M = {}
function M.setup()
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
		desc = "Indent 8 spaces for Go files",
		pattern = "go",
		callback = function()
			vim.opt_local.shiftwidth = 8
			vim.opt_local.tabstop = 8
		end,
	})
end

return M
