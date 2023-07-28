-- not working
function AutoIndent()
    local col = vim.fn.col('.') - 1
    if col == 80 then
        vim.cmd('normal! >>')
    end
end

vim.cmd([[
    augroup AutoIndent
        autocmd!
        autocmd InsertEnter * call v:lua.AutoIndent()
    augroup END
]])
