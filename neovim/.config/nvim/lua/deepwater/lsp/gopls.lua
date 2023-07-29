local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    print("lspconfig not installed")
    return
end
local util_status_ok, util = pcall(require, "lspconfig/util")
if not util_status_ok then
    print("lspconfig/util not isntalled")
    return
end

lspconfig.gopls.setup {
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

local configs = require 'lspconfig/configs'

if not configs.golangcilsp then
    configs.golangcilsp = {
        default_config = {
            cmd = { 'golangci-lint-langserver' },
            root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
            init_options = {
                command = { "golangci-lint", "run", "--enable-all",
                    "--disable", "lll", "--out-format", "json",
                    "--issues-exit-code=1" },
            }
        },
    }
end
lspconfig.golangci_lint_ls.setup {
    filetypes = { 'go', 'gomod' }
}

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function()
        vim.lsp.buf.code_action(
            { context = { only = { 'source.organizeImports' } },
                apply = true })
    end
})
