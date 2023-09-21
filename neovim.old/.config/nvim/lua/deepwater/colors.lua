function ColorMyPencils(color)
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

--[[
vim.cmd = "colorscheme default"
local colorscheme = "kanagawa"
local status_ok, _ = pcall(vim.cmd, "colorscheme" .. colorscheme)
ihttps://youtu.be/gd_wapDL0V0?t=1626f not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
--]]

ColorMyPencils()
