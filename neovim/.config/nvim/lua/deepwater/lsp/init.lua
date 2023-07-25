local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require "deepwater.lsp.mason"
require("deepwater.lsp.handlers").setup()
require "deepwater.lsp.null-ls"
--require "deepwater.lsp.gopls"
